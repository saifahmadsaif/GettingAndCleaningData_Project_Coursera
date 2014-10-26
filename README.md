# Tidy DataSet Creation from the original Samsung Smartphones Dataset for Human Activity Recognition #
----------

## Version 1.0 ##
## by Shubhrangshu Ghosh ##

This repo contains the artifacts which are required to trim and clean the Samsung Smartphones Dataset for Human Activity Recognition.The original Samsung Smartphones Dataset is obtained by downloading and extracting the compressed zip file from the link [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  "Samsung Smartphones Dataset").  

The end result is a clean and tidy dataset obtained by executing a few processing steps.

## A brief description of the original Experiment and the Dataset: ##
A full description is available at the following site:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "Human Activity Recognition Using Smartphones Data Set").

For more information about the "Human Activity Recognition Using Smartphones Dataset Version 1.0", please contact [activityrecognition@smartlab.ws](activityrecognition@smartlab.ws).

However, the synopsis is given below:
> **Experiment Setup**: The data in the "Human Activity Recognition Using Smartphones Dataset Version 1.0" have been taken from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz data were captured. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

>**Original Data Files:**:

> - 'features_info.txt': Shows information about the variables used on the feature vector.
> - 'features.txt': List of all features.
> - 'activity_labels.txt': Links the class labels with their activity name.
> - 'train/X_train.txt': Training set.
> - 'train/y_train.txt': Training labels.
> - 'train/subject_train.txt': Identifiers of the Subjects in the training data(Its range is from 1 to 30).
> - 'test/X_test.txt': Test set.
> - 'test/y_test.txt': Test labels.
> - 'test/subject_test.txt': Identifiers of the Subjects in the test data(Its range is from 1 to 30).

##  The repo contains the following files:

**1. 'run_analysis.R' :** This R script does the following:

  1. Merges the training and the test sets to create one data set using mainly `read.table()` and `rbind()`, `cbind()` functions. Also sets the appropriate column-names by reading *features.txt* file along with hard coding 'subject' and 'activity' column names.
  2. Extracts only the measurements on the mean and standard deviation for each measurement by using the `grep()` function. 
  3. Uses descriptive activity names to name the activities in the data set by reading all the activity names from *activity_labels.txt* file.
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject using `aggregate()` function. 
	
To execute *run_analysis.R* file the following assumptions must hold true:
						
- The orginal Samsung data i.e. ‘*UCI HAR Dataset*’ folder which is obtained by unzipping ‘*getdata-projectfiles-UCI HAR Dataset.zip*’ file downloaded from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "Samsung Smartphones Dataset") link **must be present in the working directory**.


**2. 'README.md' :** The current file which describes the functionality of the analysis files present in the repo.

**3. 'CodeBook.md' :** It describes the variables, the data, and any transformations or work that have been performed to clean up the data.

**4. 'tidy\_data_set.txt' :** The final output tidy data set as obtained after the execution of *run\_analysis.R* script successfully.Each column (except ‘activity’ and ‘subject’) of the tidy data set represents the average values.