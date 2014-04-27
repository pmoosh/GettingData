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
    
}



