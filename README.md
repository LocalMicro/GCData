<h2>README file </br>
Coursera Getting and Cleaning Data class September 2015</br>
GitHub Repo: GCData in LocalMicro
</h2>

<p>The course project is to make a tidy data (sub)set from the 
Human Activity Recognition Using Smartphones Dataset.</p>

The requirements for the Coursera class project are to:</br>
- upload the tidy data set "TidyData.txt" to Coursera</br>
- make a repository on GitHub that contains</br>
  -- a README file</br>
  -- the R code that produces the tidy dataset: "run_Analysis.r"</br>
  -- a CODEBOOK.md "that describes the variables, data, and any transformations
     or work that you performed to clean up the data." </br>
     </br>
The instructions for the R code have 5 steps:</br>
1. Merge the HAR training and test datasets into one dataset</br>
2. Make a subset of only Mean and Standard Deviation measurements</br>
3. Name the activities performed by each volunteer using text (walking, sitting, etc.) instead of numerals</br>
4. Label the data with 'descriptive' variable (column) names. This means making the column titles more easily understood/readable</br>
5. Output a tidy dataset with the average of each variable for each subject and activity performed by the subject.</br>
</br>
The URL for the HAR data is:</br>
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip </br>
</br>
Information about the HAR dataset is here:</br>
https://sites.google.com/site/harsmartlab/</br>
</br>
The unzipped files include a 'train' and 'test' folder plus these files:</br>
- activity_labels.txt</br>
- features.txt</br>
- features_info.txt</br>
- README.txt</br>
</br>
Inside each of the 'train' and the 'test' folders are subfolders 'inertial signals.' </br>
The inertial signals data is not used in making the tidy dataset.</br>
</br>
Within the 'train' folder are these files:</br>
- subject_train.txt</br>
- X_train.txt</br>
- y_train.txt</br>
</br>
Within the 'test' folder are these files:</br>
- subject_test.txt</br>
- X_test.txt</br>
- y_test.txt</br>

<h2>Units of Measurement</strong></h2>
<p>Time variables are measured in seconds. Specifically, accelerometer and gyroscope time measurements are "sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz."</p>

<p>The gravitational and body motion components are electrical signals and gravitational force is assumed to have "low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used."</p>

<p>The magnitude of the 3-dimensional signals (XYZ) "were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally, a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)."</p>

<p>The 'time domain signals' (tAcc-XYZ and tGyro-XYZ) from the smartphones'accelerometers and gyroscopes were captured at a constant rate of 50 Hz and then filtered to remove noise. The accelerometer signals were filtered into separate body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ). Also, Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ) were calculated from the body linear acceleration and angular velocity.</p>

<p>See the HAR Readme file (below) for more details.</p>

<p>The Readme file from the HAR data is quoted below. This dataset is a collection of
observations of human subjects wearing smartphones that have accelerometers and gyroscopes.
The measurements are of the volunteers performing simple movements such as walking, 
sitting, standing, or laying down. Measurements include time and frequency of motions.</p>

<p>The abstract for this dataset says:</br>
Activity recognition data set built from the recordings of 30 subjects performing basic 
activities and postural transitions while carrying a waist-mounted smartphone with embedded inertial sensors.</p>

<h3>HAR README</h3>
==========================================================</br>
Human Activity Recognition Using Smartphones Dataset</br>
Version 1.0</br>
=========================================================</br>
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.</br>
Smartlab - Non Linear Complex Systems Laboratory</br>
DITEN - Università degli Studi di Genova.</br>
Via Opera Pia 11A, I-16145, Genoa, Italy.</br>
activityrecognition@smartlab.ws</br>
www.smartlab.ws</br>
========================================================</br>
</br>
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. </br>
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. </br>
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity 
at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. </br>
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for 
generating the training data and 30% the test data. </br>

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in 
fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). </br>
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth 
low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only 
low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, 
a vector of features was obtained by calculating variables from the time and frequency domain. </br>
</br>
See 'features_info.txt' for more details. </br>
</br>
For each record it is provided:</br>
======================================</br>
</br>
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.</br>
- Triaxial Angular velocity from the gyroscope. </br>
- A 561-feature vector with time and frequency domain variables. </br>
- Its activity label. </br>
- An identifier of the subject who carried out the experiment.</br>
</br>
The dataset includes the following files:</br>
=========================================</br>
</br>
- 'README.txt'</br>
- 'features_info.txt': Shows information about the variables used on the feature vector.</br>
- 'features.txt': List of all features.</br>
- 'activity_labels.txt': Links the class labels with their activity name.</br>
- 'train/X_train.txt': Training set.</br>
- 'train/y_train.txt': Training labels.</br>
- 'test/X_test.txt': Test set.</br>
- 'test/y_test.txt': Test labels.</br>

The following files are available for the train and test data. Their descriptions are equivalent. </br>

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. </br>
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. </br>
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. </br>
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. </br>
</br>
Notes:</br> 
======</br>
- Features are normalized and bounded within [-1,1].</br>
- Each feature vector is a row on the text file.</br>
</br>
For more information about this dataset contact: activityrecognition@smartlab.ws</br>
</br>
License:</br>
========</br>
Use of this dataset in publications must be acknowledged by referencing the following publication [1] </br>
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012</br>
</br>
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.</br>
</br>
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.</br>
</br>