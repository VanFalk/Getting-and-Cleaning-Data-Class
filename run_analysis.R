################################################################################

# Peer Programming Assignment
# Coursera and Johns Hopkins: Getting and Cleaning Data class

# Jon Rogers
# GitHub ID = "VanFalk"


################################################################################
# Prepare R Work Environment
################################################################################

### Set working directory ###
setwd("~/Google Drive/JHU Data Science/3 Getting and Cleaning Data/Programming Assignment/")

### Load necessary libraries ###
library(reshape2)


################################################################################
# Import Raw Data
################################################################################

trainsub <- read.table("UCI HAR Dataset/train/subject_train.txt", comment.char = "", colClasses = "numeric")
testsub  <- read.table("UCI HAR Dataset/test/subject_test.txt",   comment.char = "", colClasses = "numeric")

trainact <- read.table("UCI HAR Dataset/train/y_train.txt")
testact  <- read.table("UCI HAR Dataset/test/y_test.txt")

trainx <- read.table("UCI HAR Dataset/train/x_train.txt")
testx  <- read.table("UCI HAR Dataset/test/x_test.txt")

# Merge Variables from the Training and Test Data Sets
subjects <- rbind(trainsub,testsub)
actions  <- rbind(trainact,testact)
vars     <- rbind(trainx,testx)

# Attach Raw Coded Variable Names for Each Column
names(subjects)  <- c("volunteer")
names(actions)   <- c("activity")
variables   <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = F)
names(vars) <- variables$V2


################################################################################
# 1. Merge the Training and the Test Sets to Create One Uber Data Set
################################################################################

data <- cbind(subjects, actions, vars)


################################################################################
# 2. Extract Measures on the Mean and Standard Deviation for Each Measurement
################################################################################

extracted <- data[ ,c(1, 2, 
                      3, 4, 5, 6, 7, 8, 
                      43, 44, 45, 46, 47, 48, 
                      83, 84, 85, 86, 87, 88, 
                      123, 124, 125, 126, 127, 128, 
                      163, 164, 165, 166, 167, 168, 
                      203, 204, 
                      216, 217, 
                      229, 230, 
                      242, 243, 
                      255, 256, 
                      268, 269, 270, 271, 272, 273, 
                      347, 348, 349, 350, 351, 352, 
                      426, 427, 428, 429, 430, 431, 
                      505, 506, 
                      518, 519, 
                      531, 532, 
                      544, 545)]

### Alternate Work... Directions not clear what extracted means!!!
# below is code to calculte the standard deviation and mean for each variable

sdeviation <- apply(data[ , 3:563], 2, sd)
mmean <- colMeans(data[ , 3:563])


################################################################################
# 3. Modify Activities Variable to Use Descriptive Names
################################################################################
### note: moving forward with the extracted data of means and sd rather than the uber data

activities <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = F)

extracted$activity[extracted$activity == 1] <- activities[1, 2]
extracted$activity[extracted$activity == 2] <- activities[2, 2]
extracted$activity[extracted$activity == 3] <- activities[3, 2]
extracted$activity[extracted$activity == 4] <- activities[4, 2]
extracted$activity[extracted$activity == 5] <- activities[5, 2]
extracted$activity[extracted$activity == 6] <- activities[6, 2]


################################################################################
# 4. Label Data Set with Descriptive Activity Names
################################################################################
# Brute force approach - not the most efficient way to do this, but it works. 

colnames(extracted) <- tolower(gsub('\\(|\\)', "", names(extracted), perl = TRUE))
colnames(extracted) <- gsub('\\-', "", names(extracted), perl = TRUE)
colnames(extracted) <- gsub('\\,', "", names(extracted), perl = TRUE)

colnames(extracted) <- gsub('meanx', "mean.x", names(extracted), perl = TRUE)
colnames(extracted) <- gsub('meany', "mean.y", names(extracted), perl = TRUE)
colnames(extracted) <- gsub('meanz', "mean.z", names(extracted), perl = TRUE)
colnames(extracted) <- gsub('stdx', "sd.x", names(extracted), perl = TRUE)
colnames(extracted) <- gsub('stdy', "sd.y", names(extracted), perl = TRUE)
colnames(extracted) <- gsub('stdz', "sd.z", names(extracted), perl = TRUE)
colnames(extracted) <- gsub('tgravityacc', "t.gravity.acc.", names(extracted), perl = TRUE)
colnames(extracted) <- gsub('tbodyacc', "t.body.acc.", names(extracted), perl = TRUE)
colnames(extracted) <- gsub('fbodyacc', "f.body.acc.", names(extracted), perl = TRUE)
colnames(extracted) <- gsub('tbodygyro', "t.body.gyro.", names(extracted), perl = TRUE)
colnames(extracted) <- gsub('fbodygyro', "f.body.gyro.", names(extracted), perl = TRUE)
colnames(extracted) <- gsub('fbodybodyacc', "f.body.body.acc.", names(extracted), perl = TRUE)
colnames(extracted) <- gsub('fbodybodygyro', "f.body.body.gyro.", names(extracted), perl = TRUE)
colnames(extracted) <- gsub('jerk', "jerk.", names(extracted), perl = TRUE)
colnames(extracted) <- gsub('mag', "mag.", names(extracted), perl = TRUE)
colnames(extracted) <- gsub('.std', ".sd", names(extracted), perl = TRUE)

################################################################################
# 5. Reshape Data and Export an Independent Data Set
################################################################################

### Melt and recast the data ###
meltdata <- melt(extracted, id = c("volunteer", "activity"))
castdata <- dcast(meltdata, volunteer + activity ~ variable, mean)

### Save and export the clean data ###
filename <- file.path("UCI HAR Dataset/", "Cleaned_Data.txt")
write.table(castdata, filename, row.names = F, quote = F, col.names = T)
