# Define path to directory containing data set

DATADIR <- 'UCI-HAR-dataset'

# Load file with numeric code for activities

activity <- read.table(paste(DATADIR, 'activity_labels.txt', sep='/'))
colnames(activity) <- c('label','desc')
activity$desc <- tolower(gsub('_', '', activity$desc))

# Load file with labels for measurements

features <- read.table(paste(DATADIR, 'features.txt', sep='/'))
colnames(features) <- c('label', 'desc')

# Take only measurements for mean and std. dev.

filter <- c(grep('mean', features$desc), grep('std', features$desc))

# Define function to read in either training or test data set

getdata <- function(dataset){
    
    # Load files
    dir <- paste(DATADIR, dataset, '', sep='/')
    data <- read.table(paste0(dir, 'X_', dataset, '.txt'), 
                       colClasses='numeric')
    subject <- read.table(paste0(dir, 'subject_', dataset, '.txt'),
                          colClasses='numeric')
    activities <- read.table(paste0(dir, 'y_', dataset, '.txt'),
                             colClasses='numeric')
    
    # Label columns of data set
    colnames(data) <- features$desc
    
    # Filter data for mean and std. dev. only
    filtereddata <- data[, filter]
    
    # Add columns for activity, subject, and original dataset type
    filtereddata$activity <- sapply(activities, function(x) {
        activity$desc[x]
    })
    filtereddata$subject <- subject[,1]
    filtereddata$dataset <- dataset
    
    rownames(filtereddata)
    
    return(filtereddata)
}

# Read in both training and test data sets and combine into one data frame

alldata <- rbind(getdata('test'), getdata('train'))

# Tidy up column labels

colnames(alldata) <- gsub('^t', 'time', colnames(alldata))
colnames(alldata) <- gsub('^f', 'freq', colnames(alldata))
colnames(alldata) <- gsub('mean', 'Mean', colnames(alldata))
colnames(alldata) <- gsub('std', 'Std', colnames(alldata))
colnames(alldata) <- gsub('[-()]', '', colnames(alldata))

# Write tidied table to file

write.table(alldata, file='samsung-alldata-tidy.txt', quote=F,
            sep='\t', col.names=colnames(alldata), row.names=F)

# Determine mean for each activity and subject

measures <- colnames(alldata)[1:(ncol(alldata)-3)]
meandata <- as.data.frame(sapply(measures, function(x){
    as.numeric(tapply(alldata[,x], list(alldata$subject, alldata$activity), 
                      mean))
}))
meandata$subject <- rep(1:30, each=6)
meandata$activity <- rep(unique(alldata$activity), times=30)

# Write tidied table of means to file

write.table(meandata, file='samsung-meandata-tidy.txt', quote=F,
            sep='\t', col.names=colnames(meandata), row.names=F)