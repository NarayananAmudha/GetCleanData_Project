### Introduction

This file describes the data, the Originnal Dataset and the Output Tidy Dataset variables, and the work that has been performed to clean up the data.

### Data Set Description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

#### For each record it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

#### The dataset includes the following files:

* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### Original Dataset Variables

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

### Work/Transformations
#### Download test and training sets and the activities
The data set has been stored in the `data/UCI HAR Dataset/` directory

#### Merge the training and the test sets to create one data set.
-Read all the test and training files: y_test.txt, subject_test.txt and X_test.txt
-Combine the files to a data frame in the form of subjects, activitylabels, the rest of the data

#### Extracts only the measurements on the mean and standard deviation for each measurement.
-Read the features from features.txt and filter out the means(mean()) or standard deviations (std())

#### Uses descriptive activity names to name the activities in the data set
-Read the activity labels from activity_labels.txt and replace with description

#### Appropriately labels the data set with descriptive variable names
-Converted all extracted variable to lower-case 
-Replaced `-` with `.` to make variables precise and readable
-Created new variables by Appending `avg` to existing dataset variables to differentiate that these variables values are calculated

#### Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
-Generated the tidy average dataset by calculating average of each mean and standard deviation feature for each activity and each subject
-Written the extracted data sets to `tidy-meas-extracted.txt` file
-Written the calculated data sets to t`tidy-avg-calculated.txt` file
 
###Extracted Output Variables
Tidy Data Set 1 `tidy-meas-extracted.txt`
-------------------------------------------

The features extracted from the original data set include the mean and standard deviation of the signals recorded for each activity performed by each particpant. For descriptions of these features, see the features_info.txt file in the original data set.

```
Label                          Type        Description
------------------------------------------------------------------------------------------------
subject                        integer     Number representing the subject participant in the experiment.
activity		               factor      Factor representing the activity performed by the subject. participant.
tbodyacc.mean.x                numeric     
tbodyacc.mean.y                numeric     
tbodyacc.mean.z                numeric     
tbodyacc.std.x                 numeric     
tbodyacc.std.y                 numeric     
tbodyacc.std.z                 numeric     
tgravityacc.mean.x             numeric     
tgravityacc.mean.y             numeric     
tgravityacc.mean.z             numeric     
tgravityacc.std.x              numeric     
tgravityacc.std.y              numeric     
tgravityacc.std.z              numeric     
tbodyaccjerk.mean.x            numeric     
tbodyaccjerk.mean.y            numeric     
tbodyaccjerk.mean.z            numeric     
tbodyaccjerk.std.x             numeric     
tbodyaccjerk.std.y             numeric     
tbodyaccjerk.std.z             numeric     
tbodygyro.mean.x               numeric     
tbodygyro.mean.y               numeric     
tbodygyro.mean.z               numeric     
tbodygyro.std.x                numeric     
tbodygyro.std.y                numeric     
tbodygyro.std.z                numeric     
tbodygyrojerk.mean.x           numeric     
tbodygyrojerk.mean.y           numeric     
tbodygyrojerk.mean.z           numeric     
tbodygyrojerk.std.x            numeric     
tbodygyrojerk.std.y            numeric     
tbodygyrojerk.std.z            numeric     
tbodyaccmag.mean               numeric     
tbodyaccmag.std                numeric     
tgravityaccmag.mean            numeric     
tgravityaccmag.std             numeric     
tbodyaccjerkmag.mean           numeric     
tbodyaccjerkmag.std            numeric     
tbodygyromag.mean              numeric     
tbodygyromag.std               numeric     
tbodygyrojerkmag.mean          numeric     
tbodygyrojerkmag.std           numeric     
fbodyacc.mean.x                numeric     
fbodyacc.mean.y                numeric     
fbodyacc.mean.z                numeric     
fbodyacc.std.x                 numeric     
fbodyacc.std.y                 numeric     
fbodyacc.std.z                 numeric     
fbodyaccjerk.mean.x            numeric     
fbodyaccjerk.mean.y            numeric     
fbodyaccjerk.mean.z            numeric     
fbodyaccjerk.std.x             numeric     
fbodyaccjerk.std.y             numeric     
fbodyaccjerk.std.z             numeric     
fbodygyro.mean.x               numeric     
fbodygyro.mean.y               numeric     
fbodygyro.mean.z               numeric     
fbodygyro.std.x                numeric     
fbodygyro.std.y                numeric     
fbodygyro.std.z                numeric     
fbodyaccmag.mean               numeric     
fbodyaccmag.std                numeric     
fbodybodyaccjerkmag.mean       numeric     
fbodybodyaccjerkmag.std        numeric     
fbodybodygyromag.mean          numeric     
fbodybodygyromag.std           numeric     
fbodybodygyrojerkmag.mean      numeric     
fbodybodygyrojerkmag.std       numeric     
```

###Calculated Output Variables
Tidy Data Set 2 `tidy-avg-calculated.txt`
-----------------------------------------

The second data set consists of the average of each mean and standard deviation feature for each activity and each subject. The feature names are the same as the first data set with 'avg' appended to the name to differentiate it as the calculated average. The final output consists of six rows for each participant, one for each activity.


```
Label                          Type      Description
------------------------------------------------------------------------------------------------
subject                        integer     Number representing the subject participant in the experiment.
activity	                   factor      Factor representing the activity performed by the subject.
avg.tbodyacc.mean.x            numeric     
avg.tbodyacc.mean.y            numeric     
avg.tbodyacc.mean.z            numeric     
avg.tbodyacc.std.x             numeric     
avg.tbodyacc.std.y             numeric     
avg.tbodyacc.std.z             numeric     
avg.tgravityacc.mean.x         numeric     
avg.tgravityacc.mean.y         numeric     
avg.tgravityacc.mean.z         numeric     
avg.tgravityacc.std.x          numeric     
avg.tgravityacc.std.y          numeric     
avg.tgravityacc.std.z          numeric     
avg.tbodyaccjerk.mean.x        numeric     
avg.tbodyaccjerk.mean.y        numeric     
avg.tbodyaccjerk.mean.z        numeric     
avg.tbodyaccjerk.std.x         numeric     
avg.tbodyaccjerk.std.y         numeric     
avg.tbodyaccjerk.std.z         numeric     
avg.tbodygyro.mean.x           numeric     
avg.tbodygyro.mean.y           numeric     
avg.tbodygyro.mean.z           numeric     
avg.tbodygyro.std.x            numeric     
avg.tbodygyro.std.y            numeric     
avg.tbodygyro.std.z            numeric     
avg.tbodygyrojerk.mean.x       numeric     
avg.tbodygyrojerk.mean.y       numeric     
avg.tbodygyrojerk.mean.z       numeric     
avg.tbodygyrojerk.std.x        numeric     
avg.tbodygyrojerk.std.y        numeric     
avg.tbodygyrojerk.std.z        numeric     
avg.tbodyaccmag.mean           numeric     
avg.tbodyaccmag.std            numeric     
avg.tgravityaccmag.mean        numeric     
avg.tgravityaccmag.std         numeric     
avg.tbodyaccjerkmag.mean       numeric     
avg.tbodyaccjerkmag.std        numeric     
avg.tbodygyromag.mean          numeric     
avg.tbodygyromag.std           numeric     
avg.tbodygyrojerkmag.mean      numeric     
avg.tbodygyrojerkmag.std       numeric     
avg.fbodyacc.mean.x            numeric     
avg.fbodyacc.mean.y            numeric     
avg.fbodyacc.mean.z            numeric     
avg.fbodyacc.std.x             numeric     
avg.fbodyacc.std.y             numeric     
avg.fbodyacc.std.z             numeric     
avg.fbodyaccjerk.mean.x        numeric     
avg.fbodyaccjerk.mean.y        numeric     
avg.fbodyaccjerk.mean.z        numeric     
avg.fbodyaccjerk.std.x         numeric     
avg.fbodyaccjerk.std.y         numeric     
avg.fbodyaccjerk.std.z         numeric     
avg.fbodygyro.mean.x           numeric     
avg.fbodygyro.mean.y           numeric     
avg.fbodygyro.mean.z           numeric     
avg.fbodygyro.std.x            numeric     
avg.fbodygyro.std.y            numeric     
avg.fbodygyro.std.z            numeric     
avg.fbodyaccmag.mean           numeric     
avg.fbodyaccmag.std            numeric     
avg.fbodybodyaccjerkmag.mean   numeric     
avg.fbodybodyaccjerkmag.std    numeric     
avg.fbodybodygyromag.mean      numeric     
avg.fbodybodygyromag.std       numeric     
avg.fbodybodygyrojerkmag.mean  numeric     
avg.fbodybodygyrojerkmag.std   numeric     
```