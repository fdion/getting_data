---
title: "CodeBook.md"
author: "Francois Dion"
date: "April 23, 2015"
---

Codebook for R assignment
=========================

This codebook documents the original data source and format, and describes the steps taken by the run_analysis.R script in this folder.

Original data set source
========================

The original dataset [1] of Samsung Galaxy S5 accelerometer readings was downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

It was downloaded in the directory where run_analysis.R is situated, using the command:

```sh
wget https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
```

and extracted using:

```sh
unzip getdata*.zip
```

This will create the following directory structure:

```sh
$ls -R UCI\ HAR\ Dataset/

README.txt  	activity_labels.txt	features.txt		features_info.txt	test			train

UCI HAR Dataset//test:
Inertial Signals	X_test.txt		subject_test.txt	y_test.txt

UCI HAR Dataset//test/Inertial Signals:
body_acc_x_test.txt	body_acc_z_test.txt	body_gyro_y_test.txt	total_acc_x_test.txt	total_acc_z_test.txt
body_acc_y_test.txt	body_gyro_x_test.txt	body_gyro_z_test.txt	total_acc_y_test.txt

UCI HAR Dataset//train:
Inertial Signals	X_train.txt		subject_train.txt	y_train.txt

UCI HAR Dataset//train/Inertial Signals:
body_acc_x_train.txt	body_acc_z_train.txt	body_gyro_y_train.txt	total_acc_x_train.txt	total_acc_z_train.txt
body_acc_y_train.txt	body_gyro_x_train.txt	body_gyro_z_train.txt	total_acc_y_train.txt
```

See also:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Steps of the run_analysis.R script
==================================

1 - Merges the training set:
```sh
UCI HAR Dataset/train/X_train.txt
UCI HAR Dataset/train/subject_train.txt
UCI HAR Dataset/train/y_train.txt
```

and the test set:
```sh
UCI HAR Dataset/test/X_test.txt
UCI HAR Dataset/train/subject_test.txt
UCI HAR Dataset/train/y_test.txt
```

to create one data set.

2 - Extracts only the measurements on the mean and standard deviation for each measurement.
They are as follow:
```sh
 [1] tBodyAcc-mean()-X           tBodyAcc-mean()-Y           tBodyAcc-mean()-Z          
 [4] tBodyAcc-std()-X            tBodyAcc-std()-Y            tBodyAcc-std()-Z           
 [7] tGravityAcc-mean()-X        tGravityAcc-mean()-Y        tGravityAcc-mean()-Z       
[10] tGravityAcc-std()-X         tGravityAcc-std()-Y         tGravityAcc-std()-Z        
[13] tBodyAccJerk-mean()-X       tBodyAccJerk-mean()-Y       tBodyAccJerk-mean()-Z      
[16] tBodyAccJerk-std()-X        tBodyAccJerk-std()-Y        tBodyAccJerk-std()-Z       
[19] tBodyGyro-mean()-X          tBodyGyro-mean()-Y          tBodyGyro-mean()-Z         
[22] tBodyGyro-std()-X           tBodyGyro-std()-Y           tBodyGyro-std()-Z          
[25] tBodyGyroJerk-mean()-X      tBodyGyroJerk-mean()-Y      tBodyGyroJerk-mean()-Z     
[28] tBodyGyroJerk-std()-X       tBodyGyroJerk-std()-Y       tBodyGyroJerk-std()-Z      
[31] tBodyAccMag-mean()          tBodyAccMag-std()           tGravityAccMag-mean()      
[34] tGravityAccMag-std()        tBodyAccJerkMag-mean()      tBodyAccJerkMag-std()      
[37] tBodyGyroMag-mean()         tBodyGyroMag-std()          tBodyGyroJerkMag-mean()    
[40] tBodyGyroJerkMag-std()      fBodyAcc-mean()-X           fBodyAcc-mean()-Y          
[43] fBodyAcc-mean()-Z           fBodyAcc-std()-X            fBodyAcc-std()-Y           
[46] fBodyAcc-std()-Z            fBodyAccJerk-mean()-X       fBodyAccJerk-mean()-Y      
[49] fBodyAccJerk-mean()-Z       fBodyAccJerk-std()-X        fBodyAccJerk-std()-Y       
[52] fBodyAccJerk-std()-Z        fBodyGyro-mean()-X          fBodyGyro-mean()-Y         
[55] fBodyGyro-mean()-Z          fBodyGyro-std()-X           fBodyGyro-std()-Y          
[58] fBodyGyro-std()-Z           fBodyAccMag-mean()          fBodyAccMag-std()          
[61] fBodyBodyAccJerkMag-mean()  fBodyBodyAccJerkMag-std()   fBodyBodyGyroMag-mean()    
[64] fBodyBodyGyroMag-std()      fBodyBodyGyroJerkMag-mean() fBodyBodyGyroJerkMag-std() 
```

All mean() and std() values are floating points (num) between -1 and 1 (the maximum value the sensors can report)

3 - Uses descriptive activity names to name the activities in the data set:

Possible values are:
```sh
LAYING
SITTING
STANDING
WALKING
WALKING_DOWNSTAIRS
WALKING_UPSTAIRS
```

4 - Appropriately labels the data set with descriptive variable names. 

They are those enumerated at step 2, plus column 67 as "Subject" and 68 as "Activity"

5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

See results in file "tidy_set.txt" as a tab delimited text file

The columns are:

```sh
 [1] Activity                    Subject                     tBodyAcc-mean()-X          
 [4] tBodyAcc-mean()-Y           tBodyAcc-mean()-Z           tBodyAcc-std()-X           
 [7] tBodyAcc-std()-Y            tBodyAcc-std()-Z            tGravityAcc-mean()-X       
[10] tGravityAcc-mean()-Y        tGravityAcc-mean()-Z        tGravityAcc-std()-X        
[13] tGravityAcc-std()-Y         tGravityAcc-std()-Z         tBodyAccJerk-mean()-X      
[16] tBodyAccJerk-mean()-Y       tBodyAccJerk-mean()-Z       tBodyAccJerk-std()-X       
[19] tBodyAccJerk-std()-Y        tBodyAccJerk-std()-Z        tBodyGyro-mean()-X         
[22] tBodyGyro-mean()-Y          tBodyGyro-mean()-Z          tBodyGyro-std()-X          
[25] tBodyGyro-std()-Y           tBodyGyro-std()-Z           tBodyGyroJerk-mean()-X     
[28] tBodyGyroJerk-mean()-Y      tBodyGyroJerk-mean()-Z      tBodyGyroJerk-std()-X      
[31] tBodyGyroJerk-std()-Y       tBodyGyroJerk-std()-Z       tBodyAccMag-mean()         
[34] tBodyAccMag-std()           tGravityAccMag-mean()       tGravityAccMag-std()       
[37] tBodyAccJerkMag-mean()      tBodyAccJerkMag-std()       tBodyGyroMag-mean()        
[40] tBodyGyroMag-std()          tBodyGyroJerkMag-mean()     tBodyGyroJerkMag-std()     
[43] fBodyAcc-mean()-X           fBodyAcc-mean()-Y           fBodyAcc-mean()-Z          
[46] fBodyAcc-std()-X            fBodyAcc-std()-Y            fBodyAcc-std()-Z           
[49] fBodyAccJerk-mean()-X       fBodyAccJerk-mean()-Y       fBodyAccJerk-mean()-Z      
[52] fBodyAccJerk-std()-X        fBodyAccJerk-std()-Y        fBodyAccJerk-std()-Z       
[55] fBodyGyro-mean()-X          fBodyGyro-mean()-Y          fBodyGyro-mean()-Z         
[58] fBodyGyro-std()-X           fBodyGyro-std()-Y           fBodyGyro-std()-Z          
[61] fBodyAccMag-mean()          fBodyAccMag-std()           fBodyBodyAccJerkMag-mean() 
[64] fBodyBodyAccJerkMag-std()   fBodyBodyGyroMag-mean()     fBodyBodyGyroMag-std()     
[67] fBodyBodyGyroJerkMag-mean() fBodyBodyGyroJerkMag-std()
```

Column 1 is a text label described at point #3 above, column 2 is an integer representing a specific subject (individual) and columns 3 to 68 are floating point values within the -1, 1 range. X, Y and Z are the respective axis and std() represents standard deviation and finally mean(), the average value.