##loading "dplyr" package
library(dplyr)

#Download the dataset from link in the Cousera instruction 
filename<-"Assignment for week4.zip"

#Check the archieve of the link file
if(!file.exists(filename)){
        fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl,filename,method = "curl")
}

#check whether the folder exists or not
if(!file.exists("UCI HAR Dataset")){
        unzip(filename)
}

#load data in dataframe 
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

##Start to follow the requirement in the instruction of the assignment
#first:Merges the training and the test sets to create one dataset
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
merged_data <- cbind(Subject, Y, X)

#second: extracts only the measurements on the mean and standard deviation for each measurement
tidy_data <- merged_data %>% select(subject, code, contains("mean"), contains("std"))


#third: changes the activities in the dataset with some descriptive activity names
tidy_data$code <- activities[tidy_data$code, 2]

#fourth: properly labels the dataset with descriptive names.

names(tidy_data)[2] = "activity"
names(tidy_data)<-gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data)<-gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data)<-gsub("BodyBody", "Body", names(tidy_data))
names(tidy_data)<-gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data)<-gsub("^t", "Time", names(tidy_data))
names(tidy_data)<-gsub("^f", "Frequency", names(tidy_data))
names(tidy_data)<-gsub("tBody", "TimeBody", names(tidy_data))
names(tidy_data)<-gsub("-mean()", "Mean", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("-std()", "STD", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("-freq()", "Frequency", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("angle", "Angle", names(tidy_data))
names(tidy_data)<-gsub("gravity", "Gravity", names(tidy_data))


#fifth: Based on the data in fourth, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
final_data <- tidy_data %>%
        group_by(subject, activity) %>%
        summarise_all(funs(mean))
write.table(final_data, "final_data.txt", row.name=FALSE)

#check the data name
str(final_data)
View(final_data)
