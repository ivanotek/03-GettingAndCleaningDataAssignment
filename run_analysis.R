#################################################################################################
## Course Assignment for Getting and Cleaning Data course of the Data Science specialisation
##
## run_analysis.R that does the following.
##
## (0) Downloads the UCI HAR Dataset and unzips it if necessary
## (1) Merges the training and the test sets to create one data set.
## (2) Extracts only the measurements on the mean and standard deviation for each measurement.
## (3) Uses descriptive activity names to name the activities in the data set
## (4) Appropriately labels the data set with descriptive variable names.
## (5) Creates a second independent tidy data set with the average of each variable for each
##     activity and each subject.
##
##
#################################################################################################

#define target directory for dataset download
targetDir <- './data'               
#define dataset download URL
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!file.exists(targetDir) ) {
    dir.create(targetDir)
}
if(!file.exists("./data/UCI HAR Dataset")) {
    datasetZipFile <-file.path(targetDir, basename(fileURL))
    download.file(fileUrl,destfile=datasetZipFile)
    # Unzip dataset to target directory
    unzip(zipfile=datasetZipFile,exdir=targetDir)
}


library(dplyr)

# Function to merge train and test
mergeTrainTestData <- function() {
    # Reading training tables
    train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", colClasses = "numeric")
    trainActivity <- read.table("./data/UCI HAR Dataset/train/y_train.txt", colClasses = "integer", col.names = "ActivityId")
    trainSubjects <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", colClasses = "integer", col.names="SubjectId")

    # Reading testing tables
    test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", colClasses = "numeric")
    testActivity <- read.table("./data/UCI HAR Dataset/test/y_test.txt", colClasses = "integer", col.names = "ActivityId")
    testSubjects <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", colClasses = "integer", col.names="SubjectId")

    # Read descriptive names for activity labels and features
    activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt',colClasses="character")
    featureLabels <- read.table('./data/UCI HAR Dataset/features.txt',colClasses="character")

    # Assign column names with meaningful labels
    featureLabels[,2]<-gsub("\\(\\)", "", featureLabels[,2])           # Remove parentheses from feature names
    featureLabels[,2]<-gsub("^t", "Time.", featureLabels[,2])          # Replace initial prefixes "t" and "f" (denoting Time&Frequency)
    featureLabels[,2]<-gsub("^f", "Freq.", featureLabels[,2])          #   by more descriptive ones => "Time." and "Freq."
    featureLabels[,2]<-gsub("BodyBody", "Body", featureLabels[,2])     # Replace Body duplicates
    featureLabels[,2]<-gsub("\\(t", "\\(Time.", featureLabels[,2])     # Replace prefixes "t" in angle subfields
    featureLabels[,2]<-gsub("^angle\\(", "Angle.", featureLabels[,2])  # Replace occurences of "angle(" with "Angle." 
    featureLabels[,2]<-gsub(",", "_", featureLabels[,2])               # Replace subfield separator commas with underscore
    featureLabels[,2]<-gsub("-", ".", featureLabels[,2])               # Replace minus for dot
    featureLabels[,2]<-gsub(")", "", featureLabels[,2])                # Replace closing parentheses in angles
    
    colnames(train) <- featureLabels[,2]
    colnames(test) <- featureLabels[,2]

    #Add Activity factor column 
    train$Activity <- factor(trainActivity[,1], levels=activityLabels[,1], labels=activityLabels[,2])
    test$Activity <- factor(testActivity[,1], levels=activityLabels[,1], labels=activityLabels[,2])

    #Add SubjectId and Activity columns 
    train$SubjectId <- trainSubjects[,1]
    test$SubjectId <- testSubjects[,1]

    #Return merged train & test datasets
    rbind(train, test)
}

merged <- mergeTrainTestData()
names_merged <- sort(names(merged))

# Keep only metrics with "std()" or "mean()" in their variable names, together with Activity and SubjectId, 
# and store them in a pruned dataframe
colsToKeep <- c("SubjectId", "Activity", sort(grep("std|mean", names_merged, value = TRUE)))
pruned <- merged[,colsToKeep]

# creates a second tidy data set with the average of each variable for each activity and each subject
avgsBySubjectActivity <- pruned %>% 
                         group_by(SubjectId, Activity) %>%
                         summarise_each(funs(mean), -(SubjectId:Activity))

write.table(avgsBySubjectActivity, 'avgsBySubjectActivity.txt', row.name = F)

