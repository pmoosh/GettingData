Peer Assignment for Coursera Class
==================================

Getting and Cleaning Data
=========================

run_analysis.R contains all the functions necessary to complete the 
peer assignment. Clone this Github repository and add the zipped data file
from the [Coursera website](https://class.coursera.org/getdata-002/human_grading/view/courses/972080/assessments/3/submissions). Unzipping the file generates
directory called __UCI HAR Dataset__. Use setwd() in R or R-Studio to navigate
the directory generated by __git clone__.

__Functions in run_analysis.R:__ 

               merge_datasets(data_set1 = "UCI HAR Dataset/train/X_train.txt",
                              data_set2 = "UCI HAR Dataset/test/X_test.txt") 

First step is to merge both data sets.
Defaults assume that the current path contains the directory UCI HAR Dataset 
and the data sets are named X_train.txt and X_test.txt

               reduce_dataset(data_frame, 
                              features =  "UCI HAR Dataset/features.txt")

Per assignment only columns that contains means and standard deviation
should be considered. Names columns are assigned  as per features.txt

               simpleCap(string, split = "_")

Adapted from [ETH R lanuage website](http://stat.ethz.ch/R-manual/R-devel/library/base/html/chartr.html).
Makes sure only 1st letter in word is capitalized

               create_cleanset(data_set1 = "UCI HAR Dataset/train/X_train.txt",
                               data_set2 = "UCI HAR Dataset/test/X_test.txt",
                               subject_set1 = "UCI HAR Dataset/train/subject_train.txt",
                               subject_set2 = "UCI HAR Dataset/test/subject_test.txt",
                               activity_set1 = "UCI HAR Dataset/train/y_train.txt",
                               activity_set2 = "UCI HAR Dataset/test/y_test.txt",
                               labels = "UCI HAR Dataset/activity_labels.txt",
                               features =  "UCI HAR Dataset/features.txt")

create_cleanset() generates automatically the required tipy dataset.
