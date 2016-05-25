setwd("C:/Users/U082771/Desktop/gettingAndCleaningData/project2")

# get the variable and activity names from the files
variableNames <- read.table("./UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)
activityNames <- read.table("./UCI HAR Dataset/activity_labels.txt")

# get the names and indices of mean() and std() variables
variableIndicesOfInterest <- grep("mean\\(\\)|std\\(\\)",variableNames$V2)
variableNamesOfInterest <- variableNames$V2[variableIndicesOfInterest]

# get the data from files
trainX <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainy <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
testX <- read.table("./UCI HAR Dataset/test/X_test.txt")
testy <- read.table("./UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# combine train and test variables 
allX <- rbind(trainX[,variableIndicesOfInterest],testX[,variableIndicesOfInterest])

# combine and fix factor levels train and test activity labels 
ally <- factor(c(trainy$V1,testy$V1))
levels(ally)<-activityNames$V2

# combine train and test subjects data
allSubject <- c(trainSubject$V1,testSubject$V1)

# combine variables and activity labels
tidyData <- cbind(allSubject,ally,allX)
# name the columns appropriately
names(tidyData) <- c("subjectID","activity",variableNamesOfInterest)


# second tidy data set with the average of each variable for each activity and each subject from the initial tidy dataset
tidyDataAggregated <- aggregate(tidyData[,c(3:ncol(tidyData))],by=list(tidyData$subjectID,tidyData$activity),FUN=mean)
names(tidyDataAggregated)[1:2] <- c("subjectID","activity")
# write the tidy data to file
write.csv(tidyData,"./tidyUCIHARdataset.txt",quote = FALSE,row.names = FALSE)
# write the aggregated tidy data to file
write.csv(tidyDataAggregated,"./aggregatedTidyUCIHARdataset.txt",quote = FALSE,row.names = FALSE)

