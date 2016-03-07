# Code Book

This repository contains two data sets:

* clean.csv - cleand up version of Human Activity Recognition Using Smartphones Data Set [1]  
* summarised.csv - summarized version of clean.csv containing averages of each column in original dataset.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

## Transformations

To build clean.csv file the following steps were performed:

1. Test set containing measurments, subject and activity were loaded.
2. Training set containing measurments, subject and activity were loaded.
3. Feature names were loaded and attached to set from points 1. and 2.
4. Data from point 1. was merged into one data frame.
5. Data from point 2. was merged into one data frame.
6. The data frames from point 4. and 5. were stacked together.
7. The activity labels were merged to the set from point 6.
8. Columns containing means and standard deviations plus subject and activity labels were extracted from the set from point 7.
9. Columns were renamed - functions in names were replaced with the capitalized names and dashes were replaced with the underscores.

To build summarised.csv:

1. Data set clean.csv data set was groupped according to activity and subject.
2. The mean of each reading column was calculated respectively to the groups.

## Features

Features representing measurments are normalized and bounded within [-1,1]. The sensor signals (accelerometer and gyroscope) were colected with the frequency 50Hz over three axis X, Y, Z.  The sammples were grouped with sliding window with 50% overlap and 128 readings per window. The rows represents means and standard deviations of readings in the window.

The time space features are prefixed with *t* and the frequency space features are prefixed with *f*.

The freatures:

* tBodyAcc_Mean_X           - mean of acceleration.
* tBodyAcc_Mean_Y 
* tBodyAcc_Mean_Z          
* tBodyAcc_Std_X            - standard deviation of acceleration.
* tBodyAcc_Std_Y
* tBodyAcc_Std_Z
* tGravityAcc_Mean_X        - mean of extracted gravity component of acceleration.
* tGravityAcc_Mean_Y
* tGravityAcc_Mean_Z
* tGravityAcc_Std_X         - standard deviation of extracted gravity component of acceleration.
* tGravityAcc_Std_Y
* tGravityAcc_Std_Z
* tBodyAccJerk_Mean_X       - mean of jerk caluculated from accelarations and torques.
* tBodyAccJerk_Mean_Y
* tBodyAccJerk_Mean_Z
* tBodyAccJerk_Std_X        - standard deviation of jerk.
* tBodyAccJerk_Std_Y
* tBodyAccJerk_Std_Z
* tBodyGyro_Mean_X          - mean of torques.
* tBodyGyro_Mean_Y
* tBodyGyro_Mean_Z
* tBodyGyro_Std_X           - standard deviation of torques.
* tBodyGyro_Std_Y
* tBodyGyro_Std_Z
* tBodyGyroJerk_Mean_X      - mean of gyro jerk.
* tBodyGyroJerk_Mean_Y
* tBodyGyroJerk_Mean_Z
* tBodyGyroJerk_Std_X       - standard deviation of gyro jerk.
* tBodyGyroJerk_Std_Y
* tBodyGyroJerk_Std_Z
* tBodyAccMag_Mean
* tBodyAccMag_Std
* tGravityAccMag_Mean
* tGravityAccMag_Std
* tBodyAccJerkMag_Mean
* tBodyAccJerkMag_Std
* tBodyGyroMag_Mean
* tBodyGyroMag_Std
* tBodyGyroJerkMag_Mean
* tBodyGyroJerkMag_Std
* fBodyAcc_Mean_X
* fBodyAcc_Mean_Y
* fBodyAcc_Mean_Z
* fBodyAcc_Std_X
* fBodyAcc_Std_Y
* fBodyAcc_Std_Z
* fBodyAccJerk_Mean_X
* fBodyAccJerk_Mean_Y
* fBodyAccJerk_Mean_Z
* fBodyAccJerk_Std_X
* fBodyAccJerk_Std_Y
* fBodyAccJerk_Std_Z
* fBodyGyro_Mean_X
* fBodyGyro_Mean_Y
* fBodyGyro_Mean_Z
* fBodyGyro_Std_X
* fBodyGyro_Std_Y
* fBodyGyro_Std_Z
* fBodyAccMag_Mean
* fBodyAccMag_Std
* fBodyBodyAccJerkMag_Mean
* fBodyBodyAccJerkMag_Std
* fBodyBodyGyroMag_Mean
* fBodyBodyGyroMag_Std
* fBodyBodyGyroJerkMag_Mean
* fBodyBodyGyroJerkMag_Std
* ActivityName                  - Name of activity: 
                                    LAYING 
                                    SITTING 
                                    STANDING 
                                    WALKING 
                                    WALKING_DOWNSTAIRS
                                    WALKING_UPSTAIRS
* Subject                       - The id of a subject of experiment - person who performed activity.