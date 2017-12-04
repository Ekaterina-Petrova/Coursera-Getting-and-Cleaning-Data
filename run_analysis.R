setwd('C:/Users/Mitoxondria/Desktop/R')
# Reading the data
subject_test <- read.table('C:/Users/Mitoxondria/Desktop/R/UCI HAR Dataset/test/subject_test.txt')
X_test <- read.table('C:/Users/Mitoxondria/Desktop/R/UCI HAR Dataset/test/X_test.txt')
Y_test <- read.table('C:/Users/Mitoxondria/Desktop/R/UCI HAR Dataset/test/Y_test.txt')
subject_train <- read.table('C:/Users/Mitoxondria/Desktop/R/UCI HAR Dataset/train/subject_train.txt')
X_train <- read.table('C:/Users/Mitoxondria/Desktop/R/UCI HAR Dataset/train/X_train.txt')
Y_train <- read.table('C:/Users/Mitoxondria/Desktop/R/UCI HAR Dataset/train/Y_train.txt')
activity_labels <- read.table('C:/Users/Mitoxondria/Desktop/R/UCI HAR Dataset/activity_labels.txt')
features <- read.table('C:/Users/Mitoxondria/Desktop/R/UCI HAR Dataset/features.txt')
# Naming the data
names(X_test) <- features[,2]
names(X_train) <- features[,2]
names(Y_test) <- 'Activity_ID'
names(Y_train) <- 'Activity_ID'
names(subject_test) <- 'Person_number'
names(subject_train) <- 'Person_number'
names(activity_labels) <- c('Activity_ID','Activity_Name')
# Joining the data
Result <- rbind(data.frame(X_test, Y_test, subject_test),data.frame(X_train, Y_train, subject_train))
Result <- merge(x = Result, y=activity_labels, by='Activity_ID')
Result$Activity_ID <- NULL
# write.csv(Result, 'Tidy Dataset.csv')
# Extracting only mean and st. dev
Result_mean_std <- cbind(Result[,grep('mean.|std.',names(Result))], Result[,c('Person_number','Activity_Name')])
# write.csv(Result_mean_std, 'Tidy Dataset.csv')
# Calculating avg vor each variable for each activity & person
ResultTable <- aggregate(. ~ Person_number+Activity_Name, Result_mean_std, mean, na.rm = TRUE, na.action="na.pass")
write.table(ResultTable, 'Tidy Grouped Dataset.csv', row.name=FALSE)