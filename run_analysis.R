
###############################################################################
# 1. Merge the training and test sets and create one data set
###############################################################################

data_x_train <- read.table("./data/train/X_train.txt")
data_y_train <- read.table("./data/train/y_train.txt")
data_subject_train <- read.table("./data/train/subject_train.txt")

data_x_test <- read.table("./data/test/X_test.txt")
data_y_test <- read.table("./data/test/y_test.txt")
data_subject_test <- read.table("./data/test/subject_test.txt")

# Data set for 'x' 
data_x <- rbind(data_x_train, data_x_test)

# Data Set for 'y'
data_y <- rbind(data_y_train, data_y_test)

# Data Set for 'subject'
data_subject <- rbind(data_subject_train, data_subject_test)

##################################################################################
# 2. Extracts measurements on the mean and standard deviation for each measurement. 
##################################################################################

features <- read.table("./data/features.txt")
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
data_x <- data_x[, meanStdIndices]
names(data_x) <- features[meanStdIndices, 2]

###############################################################################
# 3. In this step use the descriptive activity names to name the activities in the data set
###############################################################################

activities <- read.table("./data/activity_labels.txt")

data_y[, 1] <- activities[data_y[, 1], 2]

names(data_y) <- "activity"

###############################################################################
# 4. Label the data set with descriptive variable names
###############################################################################

names(data_subject) <- "subject"

all_data <- cbind(data_x, data_y,data_subject)

##############################################################################
# 5. Finally Create a independent tidy data set with the average of each variable
# for each activity and each subject
###############################################################################

library(plyr)
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages_data, "averages_data.txt", row.name=FALSE)
