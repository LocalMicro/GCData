GitHub Repo: GCData in LocalMicro

Coursera Getting and Cleaning Data class September 2015

The course project is to make a tidy data (sub)set from the 
Human Activity Recognition Using Smartphones Dataset.

The requirements for the Coursera class project are to:
- upload the tidy data set "TidyData.txt" to Coursera
- make a repository on GitHub that contains
  -- a README file
  -- the R code that produces the tidy dataset: "run_Analysis.r"
  -- a CODEBOOK.md "that describes the variables, data, and any transformations
     or work that you performed to clean up the data." 
     
The instructions for the R code have 5 points:
1. Merge the HAR training and test datasets into one dataset
2. Make a subset of only Mean and Standard Deviation measurements
3. Name the activities performed by each volunteer using text (walking, sitting, etc.) instead of numerals
4. Label the data with 'descriptive' variable (column) names. This means making the column titles more easily understood/readable
5. Output a tidy dataset with the average of each variable for each subject and activity performed by the subject.

The URL for the HAR data is:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Informatin about the HAR dataset is here:
https://sites.google.com/site/harsmartlab/

The unzipped files include a 'train' and 'test' folder plus these files:
- activity_labels.txt
- features.txt
- features_info.txt
- README.txt

Inside the 'train' folder and the 'test' folder are subfolders 'inertial signals.' 
These is not used in making the tidy dataset.

The 'train' folder has these files:
- subject_train.txt
- X_train.txt
- y_train.txt

Within the 'test' folder are these files:
- subject_test.txt
- X_test.txt
- y_test.txt

<strong>Units of measurement</strong>
Time variables are measured in seconds. Specifically, accelerometer and gyroscope time measurements are "sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz."

The gravitational and body motion components are electrical signals and gravitational force is assumed to have "low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used."

The magnitude of the 3-dimensional signals (XYZ) "were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally, a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)."

The 'time domain signals' (tAcc-XYZ and tGyro-XYZ) from the smartphones'accelerometers and gyroscopes were captured at a constant rate of 50 Hz and then filtered to remove noise. The accelerometer signals were filtered into separate body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ). Also, Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ) were calculated from the body linear acceleration and angular velocity.

See the HAR Readme file (below) for more details.

-----------------------

The Readme file from the HAR data is quoted below. This dataset is a collection of
observations of human subjects wearing smartphones that have accelerometers and gyroscopes.
The measurements are of the volunteers performing simple movements such as walking, 
sitting, standing, or laying down. Measurements include time and frequency of motions.

The abstract for this dataset says:
Activity recognition data set built from the recordings of 30 subjects performing basic 
activities and postural transitions while carrying a waist-mounted smartphone with embedded inertial sensors.

README
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity 
at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for 
generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in 
fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth 
low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only 
low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, 
a vector of features was obtained by calculating variables from the time and frequency domain. 
See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
