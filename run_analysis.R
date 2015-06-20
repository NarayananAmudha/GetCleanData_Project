require("data.table")

#
# file: run_analysis.R
#Script to process the data set and creates following two tidy data sets as output.
#1."tidy-meas-extracted.txt" - Extracted mean and std measurement datas from train and test datasets
#2."tidy-avg-calculated.txt" - Calculated average of each extracted mean and std measurement datas for each activity and each subject

#Download the data
# If a data directory does not exist, create the directory and download the data set into it.
if(!file.exists("./data")){ 
  dir.create("./data") 
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                "data/dataset.zip", method = "curl") 
  data.downloaded = date()
  unzip("data/dataset.zip", exdir = "data")
  
  print(paste("New data set downloaded on:", data.downloaded))
}


# 1. Merges the training and the test sets to create one data set.
##################################################################

# Get the file containing the column names for the variables and use it to create a vector of column names.
features <- read.table("data/UCI HAR Dataset/features.txt")
cnames <- c("Subject", "Activity", as.character(features[,2]))


# Read in the test data
test.subjects <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
test.labels <- read.table("data/UCI HAR Dataset/test/y_test.txt")
test.data <- read.table("data/UCI HAR Dataset/test/X_test.txt")


# Merge labels and subject columns into the test data set
test.data <- cbind(test.subjects, test.labels, test.data)

# Name the columns of the test data set
colnames(test.data) <- cnames


# Read in the train data
train.subjects <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
train.labels <- read.table("data/UCI HAR Dataset/train/y_train.txt")
train.data <- read.table("data/UCI HAR Dataset/train/X_train.txt")


# Merge labels and subject columns into the train data set
train.data <- cbind(train.subjects, train.labels, train.data)

# Name the columns of the train data set
names(train.data) <- cnames


# Combine the test and train data sets into single complete data set
data.set <- rbind(test.data, train.data)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
############################################################################################

# This extracts the mean and standard deviation for each signal listed in features_info.txt.
# 8 variables with XYZ 3-axial signals (8 * 3 * 2 = 48) 
# and 9 magnitudes of these variables (9 * 2 = 18)
# for a total of 66 features extracted.

# Select only the features with mean() and std() in the name
meanstd.meas <- grep("(mean|std)\\(\\)", colnames(data.set), value = TRUE)

# Subset the merged data set to select only these features
data.meanstd <- data.set[, c("Subject", "Activity", meanstd.meas)]


# 3. Uses descriptive activity names to name the activities in the data set
##################################################################

# Read in the activity labels
activity.labels <- read.table("data/UCI HAR Dataset/activity_labels.txt")

# replace Activity labels in data with Activity label description
#data.meanstd$Activity <- activity.labels[data.meanstd$Activity, 2]
colnames(activity.labels) <- c("activity", "label")
data.meanstd$Activity <- factor(data.meanstd$Activity, levels = activity.labels$activity,
                                labels = activity.labels$label)


# 4. Appropriately labels the data set with descriptive variable names.
##################################################################

colnames(data.meanstd) <- gsub("\\(\\)", "", tolower(colnames(data.meanstd)))
colnames(data.meanstd) <- gsub("-", ".", colnames(data.meanstd))


# 5. Creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.
##################################################################

data.aggr <- aggregate(data.meanstd[, 3:ncol(data.meanstd)],
                       by=list(subject = data.meanstd$subject,
                       activity = data.meanstd$activity), mean)


# Collect the column names to rename to new column name for second tidy data set
colids <- colnames(data.meanstd)[1:2]
colvars <- colnames(data.meanstd)[3:length(colnames(data.meanstd))]


# Add 'avg' to the variable name to differentiate the data in the new data set.
colnames(data.aggr) <- c(colids, gsub("(.*)", "avg.\\1", colvars))


# Write data sets to a file
##################################################################

if(!file.exists("./output")){ 
  dir.create("./output") 
}
write.table(data.meanstd, file = "output/tidy-meas-extracted.txt", row.names = FALSE, quote = FALSE)
write.table(data.aggr, file = "output/tidy-avg-calculated.txt", row.names = FALSE, quote = FALSE)