# get_clean_data

## assignment 01 - Code Book

John's Hopkins University Getting and Cleaning Data on Coursera

### Source Data
Downloaded 2014-05-21 from the link below. Description from [assignment](https://class.coursera.org/getdata-003/human_grading/view/courses/972136/assessments/3/submissions "Coursera - Getting and Cleaning Data Course Project"):
> One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/ "Data Science - Activiy Tracking and the Battle for the Workdl's Top Sports Brand") . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

> [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

> Here are the data for the project: 

> [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Code Book
#### Goal
To read the UCI dataset on Human Activity Recognition, limit measurements to only mean and standard deviation, and summarize by activity-subject.

#### Reading Source Data
The function runAnalysis.r reads from the unzipped source data linked above. The default directory is set to "./data/UCI HAR Dataset" but any directory can be used by passing the 'dir' variable. **Please Note:** runAnalysis.r assumes an un-altered folder structure; the unzipped folders and files should not be moved or re-named. Check performed for required files will return error returned if any of the follow missing:

* activity_labels.txt
* features.txt
* test/subject_test.txt
* test/x_test.txt
* test/y_test.txt
* train/subject_train.txt
* train/x_train.txt
* train/y_train.txt

Data from x_test.txt and y_train.txt restricted to 79 variables (noted below) measuring mean and standard deviation.

#### Tidying Data
runAnalysis.r labels columns with mesurement names from features.txt. It then merges activity names from activity_labels.txt with the activity IDs in x_test.txt and y_train.txt. The final data includes *mean* values by activity and subject formatted as a data.table (or written to CSV by specifying 'destfile'; returns TRUE if file written successfully) with the following variables:
* ActivityID
* Activity
* Subject
* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* fBodyAcc-mad()-X
* fBodyAcc-mad()-Y
* fBodyAcc-mad()-Z
* fBodyAcc-max()-X
* fBodyAcc-max()-Y
* fBodyAcc-max()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()
* angle(tBodyAccMean,gravity)
* angle(tBodyAccJerkMean),gravityMean)
* angle(tBodyGyroMean,gravityMean)
* angle(tBodyGyroJerkMean,gravityMean)
* angle(X,gravityMean)
* angle(Y,gravityMean)
* angle(Z,gravityMean)