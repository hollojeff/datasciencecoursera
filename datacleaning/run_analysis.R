library(plyr)

# 1.Merges the training and the test sets to create one data set.

#Load data files
settrain <- read.table("train/X_train.txt")
settest <- read.table("test/X_test.txt")

labeltrain <- read.table("train/y_train.txt")
labeltest <- read.table("test/y_test.txt")

subjecttrain <- read.table("train/subject_train.txt")
subjecttest <- read.table("test/subject_test.txt")

#Merge test and training data
setdata <- rbind(settrain, settest)
labeldata <- rbind(labeltrain, labeltest)
subjectdata <- rbind(subjecttrain, subjecttest)

# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("features.txt")
meansd <- grep("-(mean|std)\\(\\)", features[, 2])
setdata <- setdata[, meansd]
names(setdata) <- features[meansd, 2]

# 3. Use descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")
labeldata[, 1] <- activities[labeldata[, 1], 2]
names(labeldata) <- "activity"

# 4. Appropriately label the data set with descriptive variable names

names(subjectdata) <- "subject"

# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
joineddata <- cbind(setdata, labeldata, subjectdata)
averagedata <- ddply(joineddata, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averagedata, "average_data.txt", row.name=FALSE)