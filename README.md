Peer Assignment for Coursera Class
==================================

Getting and Cleaning Data
=========================

run_analysis.R contains all the functions necessary to complete the 
peer assignment 

               merge_datasets(data_set1 = "UCI HAR Dataset/train/X_train.txt",
               data_set2 = "UCI HAR Dataset/test/X_test.txt") 

First step is to merge both data sets.
Defaults assume that the current path contains the directory UCI HAR Dataset 
and the data sets are named X_train.txt and X_test.txt

__reduce_dataset(data_frame, features =  "UCI HAR Dataset/features.txt")__

Per assignment only columns that contains means and standard deviation
should be considered. Names columns are assigned  as per features.txt

__simpleCap(string, split = "_")__


__create_cleanset(data_set1 = "UCI HAR Dataset/train/X_train.txt",__
                __data_set2 = "UCI HAR Dataset/test/X_test.txt",__
                __subject_set1 = "UCI HAR Dataset/train/subject_train.txt",__
                __ subject_set2 = "UCI HAR Dataset/test/subject_test.txt",__
                __activity_set1 = "UCI HAR Dataset/train/y_train.txt",__
                __activity_set2 = "UCI HAR Dataset/test/y_test.txt",__
                __labels = "UCI HAR Dataset/activity_labels.txt",__
                __features =  "UCI HAR Dataset/features.txt")__
