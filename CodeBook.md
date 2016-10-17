
# 03-GettingAndCleaningDataAssignment

## Codebook

### Raw Data Source and Project Background

The raw data for the project was downloaded at Oct 17, 2016 from the Human Activity Recognition Using Smartphones Data Set - Version 1.0 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

From the uncompressed source dataset at ./data/UCI HAR Dataset/, the following files were used:

* **README.txt**, which provides an overall description of the files available and describes the how variables were acquired and features extracted.
* **features.txt**, which contains the features labels for the data columns
* **features-info.txt**, which describes how features were acquired, and the label syntax
* **activity_labels.txt**, which contains the map between activity numeric IDs and meaninful activity labels.
* **train/subject_train.txt**, which contains the subject ID doint the corresponding activity and evaluated metrics for the training dataset
* **train/X_train.txt**, which contains variables for the training dataset
* **train/y_train.txt**, which contains the activity ID for the training dataset
* **test/subject_test.txt**, which contains the subject ID doint the corresponding activity and evaluated metrics for the test dataset
* **test/X_test.txt**, which contains variables for the test dataset
* **test/y_test.txt**, which contains the activity ID for the test dataset


### Experiment design and Feature Selection 

The original experiment describes the raw data variables in features.txt and README.txt files, so won't be repeated here. For the purpose of generating a simplified and tidy view of the data, we proceed to create one R script called run_analysis.R that does the following

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Processing steps

The R script called run_analysis.R that does the following.

0. Downloads, if required, the UCI HAR dataset from the URL and unzips its content on ./data/UCI HAR Dataset

1. Merges the training and test data sets to create one single data set. 

2. Prunes from the original dataset only measurements on the mean and standard deviation for each measurement, that is, we selected only the subset of features containing 'std()' or 'mean()' in the feature label.

3. Uses descriptive activity names to name the activities in the data set, replacing the numeric activity ID with a more meaningful string label.    

4. Appropriately labels the data set features with descriptive variable names,therefore, we applied the following renaming rules
  * Remove parentheses from feature names
  * Replace initial prefixes "t" and "f" (denoting  Time & Frequency) by more descriptive ones, "Time." and  "Freq."
  * Replace Body duplicates
  * Replace prefixes "t" in angle subfields
  * Replace occurences of "angle(" with "Angle." 
  * Replace subfield separator commas with underscore
  * Replace minus for dot character

5.  From the data set in step 4, creates a second, independent tidy data set, named **avgsBySubjectActiviy.txt** with the average of each variable for each activity and each subjectId.


### Field description

