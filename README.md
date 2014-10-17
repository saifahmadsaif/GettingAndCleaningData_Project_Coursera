# Tidy DataSet Creation from the original Samsung Smartphones Dataset for Human Activity Recognition #
----------

This repo contains the artifacts which are required to trim and clean the Samsung Smartphones Dataset for Human Activity Recognition.The original Samsung Smartphones Dataset is obtained by downloading and extracting the compressed zip file from the link [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  "Samsung Smartphones Dataset") 

The end result is a clean and tidy dataset obtained by executing a few processing steps.

##  The repo contains the following files: ##

**1. 'run_analysis.R' :** This R script does the following:

  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set.
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
	
To execute *run_analysis.R* file the following assumptions must hold true:
						
- The orginal Samsung data i.e. ‘*UCI HAR Dataset*’ folder which is obtained by unzipping ‘*getdata-projectfiles-UCI HAR Dataset.zip*’ file downloaded from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "Samsung Smartphones Dataset") link **must be present in the working directory**.

- *feature\_names_mapping.txt* file (details is given below) **must be present in the working directory**.


**2. 'README.md' :** The current file which describes the functionality of the analysis files present in the repo.

**3. 'CodeBook.md' :** It describes the variables, the data, and any transformations or work that have been performed to clean up the data.

**4. 'feature\_names_mapping.txt' :** It contains the mapping between the original variable names and the descriptive variable names for the dataset. The descriptive variable names are created from the original variable names present in the dataset so that the the variable names become human readable.This text file must be present in the working directory in order to execute *run\_analysis.R* script successfully.

**5. 'tidy\_data_set.txt' :** The final output tidy data set as obtained after the execution of *run\_analysis.R* script successfully.Each column (except ‘activity’ and ‘subject’) of the tidy data set represents the average values.