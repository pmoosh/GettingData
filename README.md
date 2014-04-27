Peer Assignment for Coursera Class
==================================

Getting and Cleaning Data
=========================

run_analysis.R contains all the functions necessary to complete the 
peer assignment 


__merge_datasets(data_set1 = "UCI HAR Dataset/train/X_train.txt",__
                __data_set2 = "UCI HAR Dataset/test/X_test.txt")__ 

First step is to merge both data sets.
Defaults assume that the current path contains the directory UCI HAR Dataset 
and the data sets are named X_train.txt and X_test.txt

__reduce_dataset(data_frame, features =  "UCI HAR Dataset/features.txt")__

Per assignment only columns that contains means and standard deviation
should be considered. Names columns are assigned  as per features.txt
