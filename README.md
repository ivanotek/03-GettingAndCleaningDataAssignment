
# 03-GettingAndCleaningDataAssignment

## Getting and Cleaning Data Course Project

### Description

Script for getting and cleaning up the Human Activity Recognition Using Smartphones dataset, data collected from the accelerometers and gyroscopes from Samsung Galaxy S smartphones. 

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the source data URL for the assignment:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script run_analysis.R downloads the HCI HAR dataset and processes it to achieve a number of aims:

1. Merge the training and the test sets to create one data set. 
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set 
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, create a second, independent tidy dataset with the average of each variable for each activity/subject.

### Usage


1. Download the script with:
```
# git clone https://github.com/ivanotek/03-GettingAndCleaningDataAssignment.git assignment
# cd assignment
# R
```

2. Run it with
```
> source("run_analysis.R")
```

this script gerates the following outputs in R

* An in-memory cleaned up dataframe of train and test merged data, named *merged*
* An in-memory cleaned up pruned dataframe from *merged*, named *pruned*, which contains only mean and standard deviations metrics. 
* An in-memory cleaned up dataframe, called *avgsBySubjectActivity*, which contais the means of all metrics contained in *pruned* dataframe (mean/std), grouped by SubjectId and Activity.

and additionally

* An exported file avgsBySubjectActivity.txt, which contains the result of the *avgsBySubjectActivity* dataframe

### Code book

The code book file that describes the variables, the data, and all transformations or work performed to clean up the data is called CodeBook.md.

