#1
X_test <- read.table('UCI HAR Dataset/test/X_test.txt')
X_train <- read.table('UCI HAR Dataset/train/X_train.txt')
X_combined <- rbind(X_test, X_train)

subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt')
subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt')
subject_combined <- rbind(subject_test, subject_train)

y_test <- read.table('UCI HAR Dataset/test/y_test.txt')
y_train <- read.table('UCI HAR Dataset/train/y_train.txt')
y_combined <- rbind(y_test, y_train)

all_combined <- cbind(X_combined, subject_combined, y_combined)

#2 Get only columns ending with mean() or std() and subject and activity
features <- read.table('UCI HAR Dataset/features.txt')
columns_of_interest <- subset(features, grepl("mean\\(\\)|std\\(\\)", features[,2]))
reduced_set <- all_combined[,c(columns_of_interest$V1, 562, 563)]

#3 Replace id with descriptive activity name
activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt')
reduced_set[, 68] <- activity_labels[as.character(reduced_set[,68]), 2]

#4 Label the columns (and save the cleaned up set)
colnames(reduced_set) <- c(as.character(columns_of_interest$V2), "Subject", "Activity")
write.table(reduced_set, 'reduced_set.txt')

#5 Now we create a new independent tidy data set with the average of each variable for each activity and each subject.
tidy_set = aggregate(reduced_set, by=list(Activity = reduced_set$Activity, Subject=reduced_set$Subject), mean)
tidy_set[, 70] = NULL  # remove activity "mean", NA
tidy_set[, 69] = NULL  # remove subject mean, redundant
write.table(tidy_set, 'tidy_set.txt', sep = '\t', row.name=FALSE)
