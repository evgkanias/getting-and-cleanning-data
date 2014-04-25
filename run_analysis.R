## This is an R script which handles the coursera course's project
## "Getting and Cleaning Data"
## 
## This script merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each
## measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive activity names. 
## Creates a second, independent tidy data set with the average of each variable
## for each activity and each subject.

# read the training and testing data
X_train <- read.table("UCI HAR Dataset\\train\\X_train.txt")
X_test <- read.table("UCI HAR Dataset\\test\\X_test.txt")

# read the subject data
subject_train <- read.table("UCI HAR Dataset\\train\\subject_train.txt")
subject_test <- read.table("UCI HAR Dataset\\test\\subject_test.txt")

# read the predictions
y_train <- read.table("UCI HAR Dataset\\train\\y_train.txt")
y_test <- read.table("UCI HAR Dataset\\test\\y_test.txt")

# Append the data
X <- rbind(X_train, X_test)
subject <- rbind(subject_train, subject_test)
y <- rbind(y_train, y_test)

# Add names
names(X) <- read.table("UCI HAR Dataset\\features.txt")$V2
names(subject) <- c("subject")
names(y) <- c("activity.Labels")
actLabels <- levels(read.table("UCI HAR Dataset\\activity_labels.txt")$V2)
y$activity.Labels <- actLabels[y$activity.Labels]

# Extracting the mean and the standard deviation for each measurement
extr_X <- X[ ,grep("(mean|std)\\(\\)", names(X))]

# Merge X and y to create one dataset
mean_std_data <- cbind(extr_X, subject, y)

# Create a second independent tidy data set
melted <- melt(mean_std_data, (is.vars=c("activity.Labels", "subject")))
tidy <- dcast(melted, activity.Labels + subject ~ variable, mean)

# Remove previus data from the environment
rm(X_train); rm(X_test);
rm(subject_train); rm(subject_test);
rm(y_train); rm(y_test);
rm(actLabels);
rm(X); rm(subject); rm(y);
rm(extr_X); rm(melted);

# Writing the tidy data to the disc
write.table(tidy, "tidy-dataset.txt")
