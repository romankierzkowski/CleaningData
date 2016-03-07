labels <- read.delim('UCI_HAR_Dataset/activity_labels.txt', sep=' ', header=FALSE, col.names=c('Id','Activity'))
names(labels) <- c('Id', 'ActivityName')

features <- read.delim('UCI_HAR_Dataset/features.txt', 
                       sep=' ', header=FALSE, col.names=c('Id','FeatureName'),
                       stringsAsFactors=FALSE)

test_subjects <- read.delim('UCI_HAR_Dataset/test/subject_test.txt', header=FALSE)
test_y <- read.delim('UCI_HAR_Dataset/test/y_test.txt', header=FALSE)
test_nrows <- dim(test_subjects)[1]
test <- read.fwf('UCI_HAR_Dataset/test/X_test.txt', buffersize=100, widths=rep(16,dim(features)[1]), header=FALSE, n = test_nrows)

names(test_subjects) <- c('Subject')
names(test) <- features$FeatureName
names(test_y)<- c('ActivityId')

test_all <- cbind(test, test_subjects, test_y)

train_subjects <- read.delim('UCI_HAR_Dataset/train/subject_train.txt', header=FALSE)
train_y <- read.delim('UCI_HAR_Dataset/train/y_train.txt', header=FALSE)
train_nrows <- dim(train_subjects)[1]
train <- read.fwf('UCI_HAR_Dataset/train/X_train.txt', buffersize=100, widths=rep(16,dim(features)[1]), header=FALSE, n = train_nrows)

names(train_subjects) <- c('Subject')
names(train) <- features$FeatureName
names(train_y)<- c('ActivityId')

train_all <- cbind(train, train_subjects, train_y)

merged <- rbind(test_all, train_all)

merge(merged, labels,  by.x = 'ActivityId', by.y = 'Id')

labeled <- merge(merged, labels,  by.x = 'ActivityId', by.y = 'Id')

columns <- features[grepl('mean\\(\\)|std\\(\\)', features$FeatureName), "FeatureName"]
columns <- c(columns, 'ActivityName', 'Subject')

selected <- labeled[,columns]

columns <- gsub('mean\\(\\)' , 'Mean', columns)
columns <- gsub('std\\(\\)' , 'Std', columns)
columns <- gsub('-' , '_', columns)

names(selected) <- columns

write.csv(selected, file='clean.csv', row.names = FALSE)

library(dplyr)
summarised <- group_by(selected, ActivityName, Subject) %>% summarise_each(funs(mean))

write.csv(selected, file='summarised.csv', row.names = FALSE)