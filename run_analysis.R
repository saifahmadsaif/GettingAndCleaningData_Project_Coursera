## This analysis code assumes that the Samsung data i.e.‘UCI HAR Dataset’ folder which is 
## obtained by unzipping ‘getdata-projectfiles-UCI HAR Dataset.zip’ file downloaded 
## from 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip' 
## link is present in the working directory.
## It does the following:
##      1.Merges the training and the test sets to create one data set.
##      2.Extracts only the measurements on the mean and standard deviation for each measurement. 
##      3.Uses descriptive activity names to name the activities in the data set
##      4.Appropriately labels the data set with descriptive variable names. 
##      5.From the data set in step 4, creates a second, independent tidy data set 
##        with the average of each variable for each activity and each subject.

#################### 1.Merges the training and the test sets to create one data set ####################
#reading all the feature names from 'features.txt' file
feature_names_df <- read.table("./UCI HAR Dataset/features.txt")
feature_names_vec <- feature_names_df[,2]

#reading and preparing the training data set
subject_train_df <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train_df <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train_df <- read.table("./UCI HAR Dataset/train/y_train.txt")

#adding column names to the training data set
colnames(subject_train_df) <- c("subject")
colnames(X_train_df) <- feature_names_vec
colnames(y_train_df) <- c("activity")

#combining the training data set in a single data frame
train_df <- cbind.data.frame(subject_train_df, X_train_df, y_train_df)

#reading and preparing the test data set
subject_test_df <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test_df <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test_df <- read.table("./UCI HAR Dataset/test/y_test.txt")

#adding column names to the test data set
colnames(subject_test_df) <- c("subject")
colnames(X_test_df) <- feature_names_vec
colnames(y_test_df) <- c("activity")

#combining the test data set in a single data frame
test_df <- cbind.data.frame(subject_test_df, X_test_df, y_test_df) 

# merging training and test data to create one data set
merged_df <- rbind.data.frame(train_df, test_df)

#################### 2.Extracts only the measurements on the mean and standard deviation for each measurement ####################
merged_filtered_df <- merged_df[,grep("mean\\(\\)|std\\(\\)|subject|activity", names(merged_df))]


#################### 3.Uses descriptive activity names to name the activities in the data set ####################
#reading all the activity names from 'activity_labels.txt' file
activity_names_df <- read.table("./UCI HAR Dataset/activity_labels.txt")

#replacing the activity codes with the descriptive activity names 
merged_filtered_df$activity <- factor(merged_filtered_df$activity, levels = activity_names_df[,1],
                                       labels= activity_names_df[,2])

#################### 4.Appropriately labels the data set with descriptive variable names.  ####################
## This task is already done as part of the Step-1 where all the feature names are read from
## the 'features.txt' file and datasets are labeled appropriately.    

#################### 5.From the data set in step 4, creates a second, independent tidy data set  ####################
####################    with the average of each variable for each activity and each subject.  ####################
#aggregating merged_filtered_df by 'activity' and 'subject' with applying mean on the other columns
tidy_data_frame <- aggregate(x=merged_filtered_df[,!names(merged_filtered_df) %in% c("activity","subject")], by=list(merged_filtered_df$activity, merged_filtered_df$subject), FUN=mean)
colnames(tidy_data_frame)[1:2] <- c("activity", "subject")

#ordering the tidy data by 'activity'
tidy_data_frame <- tidy_data_frame[order(tidy_data_frame$activity),]

#creating a text file from the tidy data set 
write.table(tidy_data_frame, file="./tidy_data_set.txt", row.names=FALSE, sep="\t")


