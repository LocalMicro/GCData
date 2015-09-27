<h1>Code Book </br>
for Coursera class Getting and Cleaning Data - September 2015</h1>
Instructor: Jeffrey Leek (http://jtleek.com/)

<h2>Introduction</h2>
<p>This code book "describes the variables, the data, and any transformations or work"
done on the Human Activity Recognition Using Smartphones Dataset. 
</p?
HAR Dataset Authors: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.</br>
Smartlab - Non Linear Complex Systems Laboratory</br>
DITEN - Università degli Studi di Genova.</br>
Via Opera Pia 11A, I-16145, Genoa, Italy.</br>
activityrecognition@smartlab.ws</br>
<a href="http://www.smartlab.ws" target=_"blank">smartlab.ws</a>

<p>The HAR dataset can be downloaded at:</p>
<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</a>

<p>Information about the HAR dataset is here:</p>
<a href="https://sites.google.com/site/harsmartlab/"target=_"blank"> https://sites.google.com/site/harsmartlab/</a>

<p>This dataset was "built from the recordings of 30 subjects performing basic activities and postural transitions while carrying a waist-mounted smartphone with embedded inertial sensors." <em>(from the Abstract)</p></em>

The experiments were carried out with a group of 30 volunteers between 19-48 years of age. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

The measurements include:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- An Activity label
- A Subject identifier 

<h2>Variables</h2>
<strong>Units of measurement</strong></br>
<strong>Time</strong></br>
Time variables are measured in seconds. Specifically, accelerometer and gyroscope time measurements are "sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window)."

<p>The time domain signals (prefix 't' to denote time, e.g., tAcc-XYZ and tGyro-XYZ) from the smartphones'accelerometers and gyroscopes were captured at a constant rate of 50 Hz and then filtered to remove noise.</p>

<strong>Movement</strong>
<p>The gravitational and body motion components are electrical signals measured in Hz, and gravitational force is assumed to have "low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used."</p>

<p>The magnitude of the 3-dimensional signals (XYZ) "were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)."</p>

<p>The accelerometer signals were filtered into separate body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ).</p>
<p>Also, Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ) were calculated from the body linear acceleration and angular velocity.</p>

<strong> Variable Labels</strong>
<p>The Tidy Data script 'run_analysis.r' adds two variables to the HAR measurements: </br>
- subject </br>
- activityName </br>
The subject variable is a numerical identifier of each human volunteer in the study (there are 30 subjects). The activityName is one of the six movements (walking, walking upstairs, walking downstairs, sitting, standing, laying down) that the subjects perform.</p>

<p>Below is a list of the variable types. Note that XYZ refers to the X, Y, and Z directions; </br>
<div>
<td>Acc is acceleration</td> </br>
<td>Gyro is gyroscope velocity</td> </br>
Mag is magnitude </br>
Jerk is rapid (jerk) motion </br></div>
t is time </br>
f is frequency or FFT (Fast Fourier Transform)</p>

tBodyAcc-XYZ</br>
tGravityAcc-XYZ</br>
tBodyAccJerk-XYZ</br>
tBodyGyro-XYZ</br>
tBodyGyroJerk-XYZ</br>
tBodyAccMag</br>
tGravityAccMag</br>
tBodyAccJerkMag</br>
tBodyGyroMag</br>
tBodyGyroJerkMag</br>
fBodyAcc-XYZ</br>
fBodyAccJerk-XYZ</br>
fBodyGyro-XYZ</br>
fBodyAccMag</br>
fBodyAccJerkMag</br>
fBodyGyroMag</br>
fBodyGyroJerkMag</br>

<p>The dataset includes several variables that were estimated from these signals, but this project only uses a subset of Mean and Standard Deviation values.</p> 

mean(): Mean value</br>
std(): Standard deviation</br>

<p>Additional vectors were obtained by averaging the signals in a signal window sample. These are used on the angle() variable:</br>
gravityMean</br>
tBodyAccMean</br>
tBodyAccJerkMean</br>
tBodyGyroMean</br>
tBodyGyroJerkMean</br></p>

<p>The complete list of variables of each feature vector is in the dataset file 'features.txt'
</p>
<h2>Data</h2>
The HAR dataset includes the following files:</br>
- 'README.txt'</br>
- 'features_info.txt': Description of the variables used for the measurements</br>
- 'features.txt': List of all measurement variables (561)</br>
- 'activity_labels.txt': Lists the activity name (walking, sitting, etc.) with its numerical ID (1 through 6)</br>
- 'train/X_train.txt': Training set measurement data</br>
- 'train/y_train.txt': Activity ID (integer), training set</br>
- 'test/X_test.txt': Test set measurement data</br>
- 'test/y_test.txt': Activity ID (integer) test set</br>
</br>
The dataset also has Inertial Signals folders, but that data was not used for this class project.</br>

<h2>Transformation into Tidy Data</h3>

<h3>Preliminary Steps</h3>
<p>The dataset zip file was downloaded and unzipped; 
the path and working directory were set; 
the dplyr, tidyr, and data.table libraries were called.</p>
The next task is to read Subject, Activity, and Measurement .txt files into separate data frame tables.</br>
These tables are subjectTrain, subjectTest, activityTrain, activityTest, measureTrain, measureTest.</br>
<ul>> subjectTrain <- tbl_df(read.table(file.path(fiPath, "train", "subject_train.txt")))</br>
  > subjectTest <- tbl_df(read.table(file.path(fiPath, "test" , "subject_test.txt" )))</br>
  etc...</ul>

<h3>Step 1 - Merge training and test sets into one data set</h3>
- Concatenate (merge) the training and test tables for Subject and Activity into one data table each (e.g. concatSubject contains the test and training elements for Subject, and concatActivity contains test and training elements for Activity). Set variable names.</br>
<ul>> concatSubject <- rbind(subjectTrain, subjectTest)</br>
 > setnames(concatSubject, "V1", "subject") </br>
 etc...</ul>

- Combine the training and test tables of measurement data into table concatMeasure</br>
<ul>> concatMeasure <- rbind(measureTrain, measureTest)</ul>

- Set variable names </br>
<ul>> setnames(measureFeatures, names(measureFeatures), c("featureNum", "featureName"))</br>
> colnames(concatMeasure) <- measureFeatures$featureName</br>
> activityLabels <- tbl_df(read.table(file.path(fiPath, "activity_labels.txt")))</br>
> setnames(activityLabels, names(activityLabels), c("activityIndex", "activityName"))
</ul>

- Concatenate (merge) subject and activity variables together with measurements data. Use cbind() to bring the concatSubject and concatActivity tables into an intermediary allSubjectActiv data frame. Add allSubjectActiv to concatMeasure.</br>
    <ul>> allSubjectActiv <- cbind(concatSubject, concatActivity)<br>
> concatMeasure <- cbind(allSubjectActiv, concatMeasure)<br> 
</ul>
<p>END OF STEP 1: View of concatMeasure (Row 5037 of 10,299 rows, left side) showing Subject, ActivityIndex, and some measurements</br>
<a href="https://cloud.githubusercontent.com/assets/4791481/10124401/5f4555ba-6522-11e5-99f0-be3074de7b58.PNG" target=_"blank">End of Step 1, concatMeasure </a>
</p>
<p>END OF STEP 1:View of right side of concatMeasure (Row 5037 of 10,299 rows, left side) showing end column measurements</br>
<a href="https://cloud.githubusercontent.com/assets/4791481/10124403/65a09c3a-6522-11e5-9b9c-57d7f6e4832f.PNG" target=_"blank">End of Step 1, concatMeasure </a>
</p>
    
<h3>Step 2 - Extract only mean and standard deviation for each measurement</h3>
- Use grep() to fnd all mean and standard deviation data</br> 
  <ul>> measureFeaturesMeanStd <- grep("mean\\(\\)|std\\(\\)",measureFeatures$featureName, ignore.case=TRUE, value=TRUE)</ul>
<p>
STEP 2a: Screenshot of measureFeaturesMeanStd showing 66 variables containing mean or std</br>
<a href="https://cloud.githubusercontent.com/assets/4791481/10124405/698d2610-6522-11e5-99f7-0711eabcceb1.PNG" target=_"blank">Step 2, measureFeaturesMeanStd </a>

</p>

- Use union() to add the subject and activityIndex columns to measureFeaturesMeanStd</br>
<ul>> measureFeaturesMeanStd <- union(c("subject", "activityIndex"), measureFeaturesMeanStd)</ul>
- Make a subset according to measureFeaturesMeanStd</br>
<ul>> concatMeasure <- subset(concatMeasure, select=measureFeaturesMeanStd)</ul>
<p>STEP 2b: View of concatMeasure after subsetting mean and std</br>
<a href="https://cloud.githubusercontent.com/assets/4791481/10124406/6d4a2dac-6522-11e5-8e2c-73f93bbd50d7.PNG" target=_"blank">Step 2b, concatMeasure with only mean and std variables </a>

</p>

<h3>Step 3 - Name the activities in the dataset in a descriptive way (use text)</h3>
- Add activityLabels to concatMeasure, sorting by the activityIndex. Make the activityName variable a character type. </br>
<ul>> concatMeasure <- merge(activityLabels, concatMeasure, by="activityIndex", all.x=TRUE) <br>
> concatMeasure$activityName <- as.character(concatMeasure$activityName)
</ul>
<p>STEP 3a: ADD ACTIVITY NAMES. View of concatMeasure after adding Activity names</br>
<a href="https://cloud.githubusercontent.com/assets/4791481/10124407/7409cfe4-6522-11e5-8628-7a48f4200e86.PNG" target=_"blank">Step 3a, concatMeasure with Activity Names </a>
</p>

- Calculate the mean for each subject and activity (Step 5)</br>
  <ul>> AggregOut <- aggregate(. ~ subject - activityName, data = concatMeasure, mean) <br>
  > concatMeasure <- tbl_df(arrange(AggregOut, subject, activityName))</ul>
  
<p>ARRANGE BY SUBJECT: View of concatMeasure after adding Activity names</br>
<a href="https://cloud.githubusercontent.com/assets/4791481/10124410/7d7091f8-6522-11e5-9eab-909e195d72e7.PNG" target=_"blank">Step 3a, concatMeasure ordered by Subject, then activityName </a>
</p>



<h3>Step 4 - Label the measurements with descriptive variable names </h3>
- Use gsub() to remove non-alphanumeric chars </br>
<ul>> names(concatMeasure)<-gsub("[^[:alnum:]]", "", names(concatMeasure))</br>
</ul>

- Use gsub() to change 't' to 'time' and 'f' to 'frequency' (when these letters occur at the beginning of the measurement label); </br>
<ul>> names(concatMeasure) <- gsub("^t", "time", names(concatMeasure))</br>
> names(concatMeasure) <- gsub("^f", "frequency", names(concatMeasure))
</ul>
- Change std to StandDev; mean to Mean. Remove parentheses in measurement variable names</br>
<ul>> names(concatMeasure) <- gsub("std\\(\\)", "StandDev", names(concatMeasure))</br>
> names(concatMeasure) <- gsub("mean\\(\\)", "Mean", names(concatMeasure))
</ul>
- Also change acc, gyro, and mag to more descriptive labels.</br>
<ul>> names(concatMeasure) <- gsub("Acc", "Acceleration", names(concatMeasure))</br>
 etc.
 </ul>
 
 <p>STEP 4: Edit variable names</br>
<a href="https://cloud.githubusercontent.com/assets/4791481/10124907/99a230b2-6530-11e5-971b-3713f9319b05.PNG" target=_"blank">concatMeasure with edited variable names</a>
</p>
 <p>STEP 4: std (Standard Deviation) variable names changed to "StandDev"</br>
<a href="https://cloud.githubusercontent.com/assets/4791481/10124908/9f6b0488-6530-11e5-975d-0ebe0f64be40.PNG" target=_"blank">concatMeasure showing StandDev variable names</a>
</p>
 
<h3>Step 5 - Create a second tidy data set with the average of each variable for each activity and each subject </h3>
- Average (mean) was calculated above as part of Step 3. Write text file to be uploaded to Coursera. </br>
<p>REDUCED DATASET: View of concatMeasure after calculating mean of the subject/activity data</br>
<a href="https://cloud.githubusercontent.com/assets/4791481/10124408/7735e388-6522-11e5-83d4-e24c4b9010aa.PNG" target=_"blank">concatMeasure reduced from 10,299 rows to 180 rows (30 subjects x 6 activities per subject)</a>
</p>
  <ul>> write.table(concatMeasure, "TidyData.txt", row.name=FALSE)</ul>
























