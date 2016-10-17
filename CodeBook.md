
# 03-GettingAndCleaningDataAssignment

## Codebook

### Raw Data Source and Project Background

The raw data for the project was downloaded at Oct 17, 2016 from the Human Activity Recognition Using Smartphones Data Set, Version 1.0, from the following URL: 

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

4. Appropriately labels the data set features with descriptive variable names,therefore, we applied the following renaming rules to variables (A complete description of the transformed variable names can be found on the fields description section)

  * Remove parentheses from feature names
  * Replace initial prefixes "t" and "f" (denoting  Time & Frequency) by more descriptive ones, "Time." and  "Freq."
  * Replace Body duplicates
  * Replace prefixes "t" in angle subfields
  * Replace occurences of "angle(" with "Angle." 
  * Replace subfield separator commas with underscore
  * Replace minus for dot character


5.  From the data set in step 4, creates a second, independent tidy data set, named **avgsBySubjectActiviy.txt** with the average of each variable for each activity and each subjectId.


### Variable description

**Id** | **Name** | **class** | **Raw Field Source**
---|------|-------|---------------
1|SubjectId| numeric(1:30) | |
2|Activity| factor(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) | |
3|Freq.BodyAccJerkMag.mean| numeric | fBodyAccJerkMag-mean()
4|Freq.BodyAccJerkMag.meanFreq| numeric | fBodyAccJerkMag-meanFreq()
5|Freq.BodyAccJerkMag.std| numeric | fBodyAccJerkMag-std()
6|Freq.BodyAccJerk.meanFreq.X| numeric | fBodyAccJerk-meanFreq()-X
7|Freq.BodyAccJerk.meanFreq.Y| numeric | fBodyAccJerk-meanFreq()-Y
8|Freq.BodyAccJerk.meanFreq.Z| numeric | fBodyAccJerk-meanFreq()-Z
9|Freq.BodyAccJerk.mean.X| numeric | fBodyAccJerk-meanFreq()-X
10|Freq.BodyAccJerk.mean.Y| numeric | fBodyAccJerk-meanFreq()-Y
11|Freq.BodyAccJerk.mean.Z| numeric | fBodyAccJerk-meanFreq()-Z
12|Freq.BodyAccJerk.std.X| numeric | fBodyAccJerk-std()-X
13|Freq.BodyAccJerk.std.Y| numeric | fBodyAccJerk-std()-Y
14|Freq.BodyAccJerk.std.Z| numeric | fBodyAccJerk-std()-Z
15|Freq.BodyAccMag.mean| numeric | fBodyAccMag-mean()
16|Freq.BodyAccMag.meanFreq| numeric | fBodyAccMag-meanFreq()
17|Freq.BodyAccMag.std| numeric | fBodyAccMag-std()
18|Freq.BodyAcc.meanFreq.X| numeric | fBodyAcc-meanFreq()-X
19|Freq.BodyAcc.meanFreq.Y| numeric | fBodyAcc-meanFreq()-Y
20|Freq.BodyAcc.meanFreq.Z| numeric | fBodyAcc-meanFreq()-Z
21|Freq.BodyAcc.mean.X| numeric | fBodyAcc-mean()-X
22|Freq.BodyAcc.mean.Y| numeric | fBodyAcc-mean()-Y
23|Freq.BodyAcc.mean.Z| numeric | fBodyAcc-mean()-Z
24|Freq.BodyAcc.std.X| numeric | fBodyAcc-std()-X
25|Freq.BodyAcc.std.Y| numeric | fBodyAcc-std()-Y
26|Freq.BodyAcc.std.Z| numeric | fBodyAcc-std()-Z
27|Freq.BodyGyroJerkMag.mean| numeric | fBodyGyroJerkMag-mean()
28|Freq.BodyGyroJerkMag.meanFreq| numeric | fBodyGyroJerkMag-meanFreq()
29|Freq.BodyGyroJerkMag.std| numeric | fBodyGyroJerkMag-std()
30|Freq.BodyGyroMag.mean| numeric | fBodyGyroMag-mean()
31|Freq.BodyGyroMag.meanFreq| numeric |fBodyGyroMag-meanFreq()
32|Freq.BodyGyroMag.std| numeric | fBodyGyroMag-std()
33|Freq.BodyGyro.meanFreq.X| numeric | fBodyGyro-meanFreq()-X
34|Freq.BodyGyro.meanFreq.Y| numeric | fBodyGyro-meanFreq()-Y
35|Freq.BodyGyro.meanFreq.Z| numeric | fBodyGyro-meanFreq()-Z
36|Freq.BodyGyro.mean.X| numeric | fBodyGyro-mean()-X
37|Freq.BodyGyro.mean.Y| numeric | fBodyGyro-mean()-Y
38|Freq.BodyGyro.mean.Z| numeric | fBodyGyro-mean()-Z
39|Freq.BodyGyro.std.X| numeric | fBodyGyro-std()-X
40|Freq.BodyGyro.std.Y| numeric | fBodyGyro-std()-Y
41|Freq.BodyGyro.std.Z| numeric | fBodyGyro-std()-Z
42|Time.BodyAccJerkMag.mean| numeric | tBodyAccJerkMag-mean()
43|Time.BodyAccJerkMag.std| numeric | tBodyAccJerkMag-std()
44|Time.BodyAccJerk.mean.X| numeric | tBodyAccJerk-mean()-X
45|Time.BodyAccJerk.mean.Y| numeric | tBodyAccJerk-mean()-Y
46|Time.BodyAccJerk.mean.Z| numeric | tBodyAccJerk-mean()-Z
47|Time.BodyAccJerk.std.X| numeric | tBodyAccJerk-std()-X
48|Time.BodyAccJerk.std.Y| numeric | tBodyAccJerk-std()-Y
49|Time.BodyAccJerk.std.Z| numeric | tBodyAccJerk-std()-Z
50|Time.BodyAccMag.mean| numeric | tBodyAccMag-mean()
51|Time.BodyAccMag.std| numeric | tBodyAccMag-std()
52|Time.BodyAcc.mean.X| numeric | tBodyAcc-mean()-X
53|Time.BodyAcc.mean.Y| numeric | tBodyAcc-mean()-Y
54|Time.BodyAcc.mean.Z| numeric | tBodyAcc-mean()-Z
55|Time.BodyAcc.std.X| numeric | tBodyAcc-std()-X
56|Time.BodyAcc.std.Y| numeric | tBodyAcc-std()-Y
57|Time.BodyAcc.std.Z| numeric | tBodyAcc-std()-Z
58|Time.BodyGyroJerkMag.mean| numeric | tBodyGyroJerkMag-mean()
59|Time.BodyGyroJerkMag.std| numeric | tBodyGyroJerkMag-std()
60|Time.BodyGyroJerk.mean.X| numeric | tBodyGyroJerk-mean()-X
61|Time.BodyGyroJerk.mean.Y| numeric | tBodyGyroJerk-mean()-Y
62|Time.BodyGyroJerk.mean.Z| numeric | tBodyGyroJerk-mean()-Z
63|Time.BodyGyroJerk.std.X| numeric | tBodyGyroJerk-std()-X
64|Time.BodyGyroJerk.std.Y| numeric | tBodyGyroJerk-std()-Y
65|Time.BodyGyroJerk.std.Z| numeric | tBodyGyroJerk-std()-Z
66|Time.BodyGyroMag.mean| numeric | tBodyGyroMag-mean()
67|Time.BodyGyroMag.std| numeric | tBodyGyroMag-std()
68|Time.BodyGyro.mean.X| numeric | tBodyGyro-mean()-X
69|Time.BodyGyro.mean.Y| numeric | tBodyGyro-mean()-Y
70|Time.BodyGyro.mean.Z| numeric | tBodyGyro-mean()-Z
71|Time.BodyGyro.std.X| numeric | tBodyGyro-std()-X
72|Time.BodyGyro.std.Y| numeric | tBodyGyro-std()-Y
73|Time.BodyGyro.std.Z| numeric | tBodyGyro-std()-Z
74|Time.GravityAccMag.mean| numeric | tGravityAccMag-mean()
75|Time.GravityAccMag.std| numeric | tGravityAccMag-std()
76|Time.GravityAcc.mean.X| numeric | tGravityAcc-mean()-X
77|Time.GravityAcc.mean.Y| numeric | tGravityAcc-mean()-Y
78|Time.GravityAcc.mean.Z| numeric | tGravityAcc-mean()-Z
79|Time.GravityAcc.std.X| numeric | tGravityAcc-std()-X
80|Time.GravityAcc.std.Y| numeric | tGravityAcc-std()-Y
81|Time.GravityAcc.std.Z| numeric | tGravityAcc-std()-Z
