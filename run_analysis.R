library(stringr)
library(dplyr)
##
## This is the actual assignment
##
Build1DF <- function(myn = -100){
  #ptm <- proc.time()
  setwd("C:\\Kelly\\Coursera\\Course 3 - Getting and Cleaning Data\\Assignment\\GetCleanData\\data")
  dir <- getwd()
  
    
  ## Goal here - to create the Single Complete Data Set

  ## Section 1 - Get the Labels & Clean them up
  labels <- read.csv(paste(dir,"features.txt", sep="\\"), sep=" ", header = FALSE)
  valid_names <- make.names(names=labels[,2], unique=TRUE, allow_ = TRUE)
  # Additional Cleanup here to remove ..
  valid_names <- gsub("\\.\\.", "\\.", valid_names)
  valid_names <- gsub("\\.\\.\\.", "\\.", valid_names)

  valid_names <- gsub(".X", " X", valid_names)
  valid_names <- gsub(".Y", " Y", valid_names)
  valid_names <- gsub(".Z", " Z", valid_names)

  valid_names <- gsub(".mean.", " Mean", valid_names)
  valid_names <- gsub(".std.", " Std Dev.", valid_names)
  
  
  valid_names <- gsub("Body", " Body", valid_names)
  valid_names <- gsub("Acc", " Acceleration", valid_names)
  valid_names <- gsub("Gravity", " Gravity", valid_names)
  valid_names <- gsub("Jerk", " Jerk", valid_names)
  valid_names <- gsub("Mag", " Magnitude", valid_names)
  valid_names <- gsub("Gyro", " Gyroscope", valid_names)
  
  valid_names <- gsub("freq.", " Frequency", valid_names)
  valid_names <- gsub(".min.", " Minimum", valid_names)
  valid_names <- gsub(".max.", " Maximum", valid_names)
  valid_names <- gsub("Coeff.", " Coefficent", valid_names)
  #valid_names <- gsub(".mad.", " ", valid_names)
  #valid_names <- gsub(".sma.", " ", valid_names)
  #valid_names <- gsub(".iqr.", " ", valid_names)
  valid_names <- gsub(".energy.", " Energy", valid_names)
  valid_names <- gsub(".entropy.", " Entropy", valid_names)
  valid_names <- gsub(".correlation.", " Correlation", valid_names)
  #valid_names <- gsub(".kurtosis.", " ", valid_names)
  valid_names <- gsub("t ", "", valid_names)
  valid_names <- gsub("f ", "", valid_names)
  
  
  ## Section 2 - Read the Group files - Training Dataset
  trainX <- read.fwf(paste(dir,"train","X_train.txt", sep="\\"), widths = rep(16,561), n = myn, col.names = valid_names, blank.lines.skip=TRUE)
  names(trainX) <- valid_names
  #print (paste("TrainX: (",ncol(trainX),",",nrow(trainX),")"))
  ## Add the Activity to the DataSet
  trainAct <- read.csv2(paste(dir,"train","y_train.txt", sep="\\"), col.names = c("Activity"), nrows = myn, header=FALSE, blank.lines.skip=TRUE)
  #print (paste("trainAct: (",ncol(trainAct),",",nrow(trainAct),")"))
  
  ## Read the Test Dataset
  testX <- read.fwf(paste(dir,"test","X_test.txt", sep="\\"), widths = rep(16,561), n = myn, col.names = valid_names, blank.lines.skip=TRUE)
  names(testX) <- valid_names
  #print (paste("testX: (",ncol(testX),",",nrow(testX),")"))
  
  ## Add the Activity to the DataSet
  testAct <- read.csv2(paste(dir,"test","y_test.txt", sep="\\"), col.names = c("Activity"), nrows = myn, header=FALSE, blank.lines.skip=TRUE)
  #print (paste("testAct: (",ncol(testAct),",",nrow(testAct),")"))
  
  
  #Merge the Test and Train DataSets together
  completeDS <- rbind(testX, trainX)
  #print (paste("completeDS: (",ncol(completeDS),",",nrow(completeDS),")"))
  completeAct <- rbind(testAct, trainAct)
  #print (paste("completeAct: (",ncol(completeAct),",",nrow(completeAct),")"))
  
  ##
  ##                                   Question 1 - One Data set
  ##
  completeDS <- cbind(completeDS, completeAct, deparse.level = 1)   #Question 4 dataset with descriptive name

  
  ## Remove the un-needed
  rm("trainX")
  rm("trainAct")
  rm("testX")
  rm("testAct")
  rm("completeAct")
  rm("valid_names")
  

  
  
  ## Get the indices (column) of the dataset containing the mean or Standard Deviation
  indx <- grep("mean|std", labels[,2])
  indx[length(indx)+1] <- length(labels$V2)+1 ## Add the Activity Column Also
  rm("labels")
  
  
  ##
  ##                                    Question 2  Only have Men & Std Dev.
  ##
  ##  added activity to understand the activity involved
  means.std <- completeDS[,indx]
  rm("completeDS")
  
  ## Add the Activity to the means.std DataSet
  ActivityName <- read.csv(paste(dir,"activity_labels.txt", sep="\\"), header=FALSE, sep=" ", col.names = c("Activity","ActivityName"))
  

  ##  
  ##                                    Question 3  Add The Activity Name 
  ##
  ## for readability to means.std
  means.std <- inner_join(means.std, ActivityName, by= c("Activity","Activity"))
  

  ##  
  ##                                    Question 4  Done in line 15-40 and applied on line 80
  ##
  
  
  
  ## Cleanup here remove the   
  rm("ActivityName")
  rm("indx")
  rm("dir")
  rm("myn")
  #print(proc.time() - ptm)
  return (means.std)
}

SummarizeThis <- function(mns) {
  ##  
  ##                                    Question 5  Second Dataset with Average of each variable for each Activity 
  ##
  ave.activity <- aggregate(means.std[,1:(length(means.std)-2)], list(means.std$ActivityName), mean)
  
}

run_analysis <- function(myn) {

  means.std <- Build1DF(myn)
  ave.activities <- SummarizeThis(means.std)
  
}

