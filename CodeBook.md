<h1>Code Book for Coursera class Getting and Cleaning Data - September 2015</h1>
Instructor: Jeffrey Leek (http://jtleek.com/)

This code book "describes the variables, the data, and any transformations or work"
done on the Human Activity Recognition Using Smartphones Dataset. 

HAR Dataset Authors: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The HAR dataset can be downloaded at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Information about the HAR dataset is here:
https://sites.google.com/site/harsmartlab/

This dataset was "built from the recordings of 30 subjects performing basic activities and postural transitions while carrying a waist-mounted smartphone with embedded inertial sensors." 
(from the Abstract)

<h2>Variables</h2>
<strong>Units of measurement</strong>
Time variables are measured in seconds. Specifically, accelerometer and gyroscope time measurements are "sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window)."
"These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz."

The gravitational and body motion components are electrical signals and gravitational force is assumed to have "low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used."

The magnitude of the 3-dimensional signals (XYZ) "were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)."


<p>The 'time domain signals' (tAcc-XYZ and tGyro-XYZ) from the smartphones'accelerometers and gyroscopes were captured at a constant rate of 50 Hz and then filtered to remove noise.</p>
<p>The accelerometer signals were filtered into separate body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ).</p>
<p>Also, Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ) were calculated from the body linear acceleration and angular velocity.</p>

<strong> Variable Labels</strong>
Below is a list of the variable types. Note that XYZ refers to the X, Y, and Z directions; Acc is acceleration; Gyro is gyroscope velocity; Mag is magnitude; Jerk is rapid (jerk) motion; t is time; f is frequency or FFT (Fast Fourier Transform)

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The dataset includes several variables that were estimated from these signals, but this project only uses a subset of Mean and Standard Deviation values. 

mean(): Mean value
std(): Standard deviation

Additional vectors were obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is in the dataset file 'features.txt'

<h2>Data</h2>
The experiments were carried out with a group of 30 volunteers between 19-48 years of age. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

The measurements include:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- An Activity label
- A Subject identifier 

The HAR dataset includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The dataset also has Inertial Signals folders, but that data was not used for this class project.

<h2>Transformation into Tidy Data</h3>

<h3>Preliminary Steps</h3>
The dataset zip file was downloaded and unzipped; 
the path and working directory were set; 
the dplyr, tidyr, and data.table libraries were called.
The next task is to read Subject, Activity, and Measurement data files into separate data frame tables.
These tables are subjectTrain, subjectTest, activityTrain, activityTest, measureTrain, measureTest.

<h3>Step 1 - Merge training and test sets into one data set</h3>
- Concatenate (merge) the training and test tables for Subject and Activity into one data table each (e.g. concatSubject contains the test and training elements for Subject, and concatActivity contains test and training elements for Activity)
- Do the same to combine the training and test tables of measurement data (concatMeasure).
- Use row binding for long form. Set variable names in concatSubject to 'Subject' and in concatActivity to 'ActivityIndex'
- Set variable names in concatMeasure (the measurements data):
    - Read the HAR dataset file 'features.txt' into a data frame and use it to set the column header (variable) names of concatMeasure.
- Set variable (column) names for activity labels 
    - Read the HAR dataset file 'activity_labels.txt' into an 'activityLabels' dataframe and set the column variable names 'activityIndex' and 'activityName'
- Concatenate (merge) Subject and Activity variables together with Measurements data 
    - Use cbind() to bring the concatSubject and concatActivity files into an intermediary allSubjectActiv data frame
    - Add allSubjectActiv to concatMeasure.
    
<h3>Step 2 - Extract only mean and standard deviation for each measurement</h3>
- Use grep() to fnd and subset all mean and standard deviation data 
  grep("mean\\(\\)|std\\(\\)"
  - Put subset of mean and standard deviation data in the intermediate file measureFeaturesMeanStd.
- Use union() to add the subject and activityIndex columns to measureFeaturesMeanStd.
- Use subset() to select only the mean and standard deviation measurements from concatMeasure according to measureFeaturesMeanStd
- Replace concatMeasure with the subset that contains only mean and standard deviation measurements.
  > concatMeasure <- subset(concatMeasure, select=measureFeaturesMeanStd)

<h3>Step 3 - Name the activities in the dataset in a descriptive way (use text)/h3>
- Add activityLabels to concatMeasure, sorting by the activityIndex 
- Make the activityName variable a character type
- Arrange the data so that the 'subject' variable is the first column and 'activityName' is the 2nd column (using aggregate() and then arrange())
  > concatMeasure <- tbl_df(arrange(AggregOut, subject, activityName))

<h3>Step 4 - Label the vmeasurement data with descriptive variable names </h3>
- Use gsub() to change 't' to 'time' and 'f' to 'frequency' (when these letters occur at the beginning of the measurement label); 
- also change acc, gyro, and mag to more descriptive labels.

<h3>Step 5 - Create a second tidy data set </h3>
- Write text file to be uploaded to Coursera
  > write.table(concatMeasure, "TidyData.txt", row.name=FALSE)
























