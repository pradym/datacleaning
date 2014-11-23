
# Assume that UCI HAR Dataset directory is in the current working directory
# I did following on my machine to make sure setwd("C:/Users/Pradyumna/Documents/Coursera/DataCleaning")

# Read the feature list it should have 561 entries (561 x 2) 
# All the features are listed in the column labeled V2
# Make sure any duplicate names are made unique

features <- read.table("UCI HAR Dataset/features.txt")	# str (features)
features_uniqued <- make.names (features$V2, unique=TRUE)

# Read in the activity labels
activity_label <- read.table("UCI HAR Dataset/activity_labels.txt")

#
# Read in the subject (7351x1), activity (7351x1), and measurement(7351x561) for Training set
#               
Xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")		# dim(Xtrain)	7351 561
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")		# dim(ytrain)	7351  1
strain <- read.table("UCI HAR Dataset/train/subject_train.txt")	# dim(strain)	7351  1

#
# Read in the subject(2946x1), activity(2946x1), and measurement(2946x561)for Test set
#
Xtest <- read.table("UCI HAR Dataset/test/X_test.txt")		# dim(Xtest)	2961	561
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")		# dim(ytest)	2961	1
stest <- read.table("UCI HAR Dataset/test/subject_test.txt")	# dim(stest)	2961	1

# Assign feature names to all the measurement columns
colnames(Xtrain) <- features_uniqued
colnames(Xtest)  <- features_uniqued

# Assign columns names to subjects and activities columns
colnames (ytrain) <- c("Activity")
colnames (strain) <- c("Subject")
colnames (ytest) <- c("Activity")
colnames (stest) <- c("Subject")

#
# Combine all test and training data (cbind) and then add them both (rbind)
#

all_train <- cbind(cbind(strain, ytrain), Xtrain)		# dim(all_train) 	7352	563
all_test  <- cbind(cbind(stest, ytest), Xtest)			# dim(all_test)  	7352	563
all_data  <- rbind(all_test, all_train)				# dim(all_data) 	10299	563

# head(all_data)
# Subject Activity tBodyAcc.mean...X tBodyAcc.mean...Y tBodyAcc.mean...Z tBodyAcc.std...X tBodyAcc.std...Y tBodyAcc.std...Z
# 1       2        5         0.2571778       -0.02328523       -0.01465376       -0.9384040       -0.9200908       -0.6676833
# 2       2        5         0.2860267       -0.01316336       -0.11908252       -0.9754147       -0.9674579       -0.9449582
# 3       2        5         0.2754848       -0.02605042       -0.11815167       -0.9938190       -0.9699255       -0.9627480
# 4       2        5         0.2702982       -0.03261387       -0.11752018       -0.9947428       -0.9732676       -0.9670907
# 5       2        5         0.2748330       -0.02784779       -0.12952716       -0.9938525       -0.9674455       -0.9782950
# 6       2        5         0.2792199       -0.01862040       -0.11390197       -0.9944552       -0.9704169       -0.9653163

#
# Select the columns to keep - Subject, Activity, and all columns with "mean" and "std"
# To use select() etc. need to load dplyr and plyr packages

library(plyr)
library(dplyr)
my_data <- select (all_data, 1:2, contains("mean"), contains("std"))	# dim(my_data) 10299    88

# Remove all column names that contain "Freq" (meanFreq). Order it by Subject and then Activity
 
my_data <- select (my_data, -contains("Freq"))					# dim(my_data) 10299    75


# my_data$Activity <- factor(my_data$Activity,labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

# Arrange it by "Subject" and then "Activity". Replace activity numbers by descriptive activity labels
# Convert mydata data frame into a data table. ***Needs data.table package.***
library(tidyr)
library(data.table)
mydata <- my_data
setDT(mydata)
mydata <- arrange(mydata, mydata$Subject, mydata$Activity)
mydata$Activity <- factor(mydata$Activity, 
			 labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

										# dim(mydata) 10299    75

# Calculate the mean for each column grouped by a subject and an activity. It will return 6 rows for 
# each subject and each of those correspond to 1 of 6 activities like WALKING etc. There will be 180 rows

tmean <- mydata[, lapply(.SD, mean), by=c ("Subject", "Activity")]	# dim(tmean) 180  75

# Load library(reshape2)to use melt() etc.

library(reshape2)
tm_molten <- melt(tmean, id.vars=c("Subject", "Activity"), 
				variable.name = "Measured Variable", 
				value.name = "Computed Mean")
# head(tm_molten)
#   Subject           Activity Measured Variable Computed Mean
#1:       1            WALKING tBodyAcc.mean...X     0.2773308
#2:       1   WALKING_UPSTAIRS tBodyAcc.mean...X     0.2554617
#3:       1 WALKING_DOWNSTAIRS tBodyAcc.mean...X     0.2891883
#4:       1            SITTING tBodyAcc.mean...X     0.2612376
#5:       1           STANDING tBodyAcc.mean...X     0.2789176
#6:       1             LAYING tBodyAcc.mean...X     0.2215982

# Save the resulting table to a text file "pradymtbl.txt" for upload
write.table(tm_molten, "pradymtbl.txt", row.names=FALSE)


# End of run_analysis