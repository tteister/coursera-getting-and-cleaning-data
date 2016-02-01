
#download zip file into temporary folder and unzip files into directory.
file <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",file)
unzip(file, list = TRUE) #This provides the list of variables and I choose the ones that are applicable for this data set
Y_Test <- read.table(unzip(file, "UCI HAR Dataset/test/y_test.txt"))
X_Test <- read.table(unzip(file, "UCI HAR Dataset/test/X_test.txt"))
Subject_Test <- read.table(unzip(file, "UCI HAR Dataset/test/subject_test.txt"))
Y_Train <- read.table(unzip(file, "UCI HAR Dataset/train/y_train.txt"))
X_Train <- read.table(unzip(file, "UCI HAR Dataset/train/X_train.txt"))
Subject_Train <- read.table(unzip(file, "UCI HAR Dataset/train/subject_train.txt"))
Features <- read.table(unzip(file, "UCI HAR Dataset/features.txt"))
unlink(file)

#column names
colnames(X_Train) <- t(Features[2])
colnames(X_Test) <- t(Features[2])

#merging
X_Train$activities <- Y_Train[, 1]
X_Train$candidates <- Subject_Train[, 1]
X_Test$activities <- Y_Test[, 1]
X_Test$candidates <- Subject_Test[, 1]

#merging training and test to create one data set
data <- rbind(X_Train, X_Test)
duplicated(colnames(data))
data <- data[, !duplicated(colnames(data))]

#mean
Mean <- grep("mean()", names(data), value = FALSE, fixed = TRUE)
Mean <- append(Mean, 471:477)
MeanMatrix <- data[Mean]
#standard deviation
STD <- grep("std()", names(data), value = FALSE)
DevMatrix <- data[STD]

#activities
data$activities <- as.character(data$activities)
data$activities[data$activities == 1] <- "Walking"
data$activities[data$activities == 2] <- "Walking Upstairs"
data$activities[data$activities == 3] <- "Walking Downstairs"
data$activities[data$activities == 4] <- "Sitting"
data$activities[data$activities == 5] <- "Standing"
data$activities[data$activities == 6] <- "Laying"
data$activities <- as.factor(data$activities)

names(data)  #feature names

names(data) <- gsub("Acc", "Accelerator", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))
names(data) <- gsub("Gyro", "Gyroscope", names(data))
names(data) <- gsub("^t", "time", names(data))
names(data) <- gsub("^f", "frequency", names(data))

#candidates
data$candidates <- as.character(data$candidates)
data$candidates[data$candidates == 1] <- "Candidate 1"
data$candidates[data$candidates == 2] <- "Candidate 2"
data$candidates[data$candidates == 3] <- "Candidate 3"
data$candidates[data$candidates == 4] <- "Candidate 4"
data$candidates[data$candidates == 5] <- "Candidate 5"
data$candidates[data$candidates == 6] <- "Candidate 6"
data$candidates[data$candidates == 7] <- "Candidate 7"
data$candidates[data$candidates == 8] <- "Candidate 8"
data$candidates[data$candidates == 9] <- "Candidate 9"
data$candidates[data$candidates == 10] <- "Candidate 10"
data$candidates[data$candidates == 11] <- "Candidate 11"
data$candidates[data$candidates == 12] <- "Candidate 12"
data$candidates[data$candidates == 13] <- "Candidate 13"
data$candidates[data$candidates == 14] <- "Candidate 14"
data$candidates[data$candidates == 15] <- "Candidate 15"
data$candidates[data$candidates == 16] <- "Candidate 16"
data$candidates[data$candidates == 17] <- "Candidate 17"
data$candidates[data$candidates == 18] <- "Candidate 18"
data$candidates[data$candidates == 19] <- "Candidate 19"
data$candidates[data$candidates == 20] <- "Candidate 20"
data$candidates[data$candidates == 21] <- "Candidate 21"
data$candidates[data$candidates == 22] <- "Candidate 22"
data$candidates[data$candidates == 23] <- "Candidate 23"
data$candidates[data$candidates == 24] <- "Candidate 24"
data$candidates[data$candidates == 25] <- "Candidate 25"
data$candidates[data$candidates == 26] <- "Candidate 26"
data$candidates[data$candidates == 27] <- "Candidate 27"
data$candidates[data$candidates == 28] <- "Candidate 28"
data$candidates[data$candidates == 29] <- "Candidate 29"
data$candidates[data$candidates == 30] <- "Candidate 30"
data$candidates <- as.factor(data$candidates)

library(data.table)
data.dt <- data.table(data)
#This takes the mean of every column broken down by candidates and activities
TidyData <- data.dt[, lapply(.SD, mean), by = 'candidates,activities']
write.table(TidyData, file = "Tidy.txt", row.names = FALSE)
