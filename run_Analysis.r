# This is the project for Coursera Getting and Cleaning Data class, September 2015
# The data is a series of accelerometer and gyroscope measurements of 30 human subjects
# made while they were wearing a smartphone attached to their waist.
# Measurement data includes mean and standard deviation of various body movements
#
# Data url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 
# Set local directory path and get dataset from website
 fiPath <- "D:/RGCD/GCDproject"
# fiPath <- "C:/RGCD/GCDproject"

# Set working directory for R and download via URL
setwd(fiPath)
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./data/Dataset.zip",method="libcurl")

# Unzip and place in the 'data' local directory 
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# Reset path to the dataset subdirectory
fiPath <- "D:/RGCD/GCDproject/data/UCI HAR Dataset"

# libraries for project
library(dplyr)
library(data.table)
library(tidyr)

# =================
# Preliminary: Read Subject, Activity, and Measurement data files.
# Read training and test data for SUBJECT
subjectTrain <- tbl_df(read.table(file.path(fiPath, "train", "subject_train.txt")))
subjectTest <- tbl_df(read.table(file.path(fiPath, "test" , "subject_test.txt" )))

# Read training and test data for ACTIVITY (the Y data)
activityTrain <- tbl_df(read.table(file.path(fiPath, "train", "Y_train.txt")))
activityTest  <- tbl_df(read.table(file.path(fiPath, "test" , "Y_test.txt" )))

#Read training and test data for MEASUREMENTS (the X data)
measureTrain <- tbl_df(read.table(file.path(fiPath, "train", "X_train.txt" )))
measureTest  <- tbl_df(read.table(file.path(fiPath, "test" , "X_test.txt" ))) 

# ====================
# Step 1.  Concatenate (merge) training and test datasets for Subject and Activity, then Measurements
# Use row binding for long form. Set variable names for Subject and ActivityIndex
concatSubject <- rbind(subjectTrain, subjectTest)
setnames(concatSubject, "V1", "subject") 

concatActivity<- rbind(activityTrain, activityTest)
setnames(concatActivity, "V1", "activityIndex")

# Concatenate (merge) training and test datasets for Measurements
concatMeasure <- rbind(measureTrain, measureTest)

# Set feature names of measurements data according to file 'features.txt' 
# Read features.txt
measureFeatures <- tbl_df(read.table(file.path(fiPath, "features.txt")))

# Obtain column data for featureNum and featureName in the features file
setnames(measureFeatures, names(measureFeatures), c("featureNum", "featureName"))
colnames(concatMeasure) <- measureFeatures$featureName

# column names for activity labels
activityLabels <- tbl_df(read.table(file.path(fiPath, "activity_labels.txt")))
setnames(activityLabels, names(activityLabels), c("activityIndex", "activityName"))

# Concatenate (merge) Subject and Activity columns 
allSubjectActiv <- cbind(concatSubject, concatActivity)
concatMeasure <- cbind(allSubjectActiv, concatMeasure) 

# ====================
# Step 2 - Use grep to fnd and subset all mean and standard deviation data. 
# example: grep("stringofinterest",names(dataframeofinterest),ignore.case=TRUE,value=TRUE)
measureFeaturesMeanStd <- grep("mean\\(\\)|std\\(\\)",measureFeatures$featureName,ignore.case=TRUE,value=TRUE)

# Make subset of mean and standard deviation data that has Subject and ActivityIndex columns
measureFeaturesMeanStd <- union(c("subject", "activityIndex"), measureFeaturesMeanStd)
concatMeasure <- subset(concatMeasure, select=measureFeaturesMeanStd)

# ====================
# Step 3 - Add activityLabels sorted by activityIndex
concatMeasure <- merge(activityLabels, concatMeasure , by="activityIndex", all.x=TRUE)
# concatMeasure$activityName <- as.character(concatMeasure$activityName)

# ActivityName type character
concatMeasure$activityName <- as.character(concatMeasure$activityName)

# Gather together the mean of each subject's activities
AggregOut <- aggregate(. ~ subject - activityName, data = concatMeasure, mean) 

# Arrange the data so that Subject is in first column and activityName is in 2nd column
concatMeasure <- tbl_df(arrange(AggregOut, subject, activityName))

# ====================
# Step 4 - Make variable names more descriptive
# Remove parentheses ()
names(concatMeasure)<-gsub("\\(\\)", "", names(concatMeasure))

# Remove non-alphanumeric chars 
names(concatMeasure)<-gsub("[^[:alnum:]]", "", names(concatMeasure))

# Change t to 'time' and f to 'frequency'
names(concatMeasure)<-gsub("^t", "time", names(concatMeasure))
names(concatMeasure)<-gsub("^f", "frequency", names(concatMeasure))

# Change std and mean
names(concatMeasure)<-gsub("std", "StandDev", names(concatMeasure))
names(concatMeasure)<-gsub("mean", "Mean", names(concatMeasure))

# Change other names
names(concatMeasure)<-gsub("Acc", "Acceleration", names(concatMeasure))
names(concatMeasure)<-gsub("Gyro", "Gyroscope", names(concatMeasure))
names(concatMeasure)<-gsub("Mag", "Magnitude", names(concatMeasure))

# Step 5 - Make a tidy data set with averages of each subject's activity measurements
# Write text file to be uploaded to Coursera
write.table(concatMeasure, "TidyData.txt", row.name=FALSE)

# The tidy data has 10299 instances in 180 groups (30 subjects performing 6 activities each).
# Row 1 contains column header names. 
# There are a total of 66 mean and standard deviation measurements each (columns) for every subject's activities. 
# The final table has 180 rows and 69 columns, including
# Subject column, ActivityName column, ActivityIndex column
# 33 Mean variables, 33 Standard deviation variables

# head(str(concatMeasure),6)