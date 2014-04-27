# run_analysis.R contains all the functions necessary to complete the 
# peer assignment 

# first step merge both data sets.
# defaults assume that the current path contains the directory UCI HAR Dataset
# and the data sets are named X_train.txt and X_test.txt
# However the function is not flexible when it comes to the format of the data sets

merge_datasets <- function (data_set1 = "UCI HAR Dataset/train/X_train.txt", data_set2 = "UCI HAR Dataset/test/X_test.txt") {
    
    
    table1 <- read.table(data_set1, sep="")
    table2 <- read.table(data_set2, sep="")
    
    full_table <- rbind(table1, table2)
   
}

# per assignment only columns that contains means and standard deviation
# should be considered

reduce_dataset <- function(data_frame, features =  "UCI HAR Dataset/features.txt") {
    
    feat <- read.table(features, sep="")
    
    # consider only values of mean() and std()
    feat <- feat[grepl("\\-mean\\(\\)",feat$V2) | grepl("\\-std\\(\\)",feat$V2),]
    data_frame <- data_frame[c(feat$V1)]
    colnames(data_frame) <- c(as.character(feat$V2))
    return(data_frame)
}

# adapted from http://stat.ethz.ch/R-manual/R-devel/library/base/html/chartr.html
# Make sure only 1st letter in word is capitalized
simpleCap <- function (string, split = "_") {
    s <- strsplit(tolower(string), split)[[1]]
    paste(toupper(substring(s,1,1)), substring(s,2),
          sep = "", collapse = " ")
}

create_cleanset <- function (data_set1 = "UCI HAR Dataset/train/X_train.txt", 
                             data_set2 = "UCI HAR Dataset/test/X_test.txt",
                             subject_set1 = "UCI HAR Dataset/train/subject_train.txt",
                             subject_set2 = "UCI HAR Dataset/test/subject_test.txt",
                             activity_set1 = "UCI HAR Dataset/train/y_train.txt",
                             activity_set2 = "UCI HAR Dataset/test/y_test.txt",
                             labels = "UCI HAR Dataset/activity_labels.txt",
                             features =  "UCI HAR Dataset/features.txt") {

    # Read the label information
    lb <- read.table(labels, sep="", colClasses = c("integer","character"))
    
    # and beautify them
    lb[[2]] <- sapply(lb[[2]], FUN = simpleCap)
    
    # read the subject list and the activity list 
    all_sub <- merge_datasets(subject_set1, subject_set2)
    all_act <- merge_datasets(activity_set1, activity_set2)

    # read all the dataset and reduce them
    xtc <- merge_datasets(data_set1, data_set2)
    xtc <- reduce_dataset(xtc, features)
    
    # add the subjects and the activities to the data set
    xtc <- cbind(as.data.frame(all_act),xtc)
    xtc <- cbind(as.data.frame(all_sub),xtc)
    colnames(xtc)[1:2] <- c("Subjects","Activities")
    
    
    agg <- aggregate(. ~ Subjects + Activities, data = xtc, mean)
    
    # replace activity numbers with real descriptions
    for (i in 1:nrow(lb)) {
        agg[agg[,2] == i,2] <- lb[i,2]
    }
    # sort by Subject
    agg[with(agg,order(Subjects)),]
    
}



