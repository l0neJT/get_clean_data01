##

runAnalysis <- function(dir = "./data/UCI HAR Dataset") {
    # Load libraries
    library(data.table)
    
    # Create vector with required file names
    reqFiles <- c("activity_labels.txt",
                  "features.txt",
                  "test/subject_test.txt",
                  "test/X_test.txt",
                  "test/Y_test.txt",
                  "train/subject_train.txt",
                  "train/X_train.txt",
                  "train/Y_train.txt")
    
    # Check directory for required files
    # Add found to 'files' and missing to 'misFiles'
    files <- NULL
    misFiles <- NULL
    for(f in reqFiles) {
        file <- paste(dir, f, sep = "/")
        if(file.exists(file)) {
            files <- c(files, file)
        } else misFiles <- c(misFiles, file)
    }

    # Return error if files missing
    if(!is.null(misFiles)) stop(paste("Missing File:", misFiles, collapse = "\t"))
    
    # Cleanup variables
    rm(reqFiles, misFiles)
    
    # Create vector of columns to read (numeric) and skip (NULL)
    # Limits data to mean and standard deviation
    # Simultaneously creates vector of activity labels
    colNum <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215,
                  227:228, 240:241, 253:254, 266:277, 345:350, 424:429,
                  503:504, 516:517, 529:530, 542:543, 555:561)
    colRead <- NULL
    actRead <- read.table(files[2], colClasse = c("numeric", "character"))
    actLabels <- NULL
    for(i in 1:561) {
        if(i %in% colNum) {
            colRead[i] <- "numeric"
            actLabels <- c(actLabels, actRead[i, 2])
        } else colRead[i] <- NULL
    }
    
    # Creates list, but not read appropriately by read.table
    
    # Combine test subjects, results, and labels
    testDat <- fread(files[3])
    testDat <- cbind(testDat, fread(files[5]))
    testDat <- cbind(testDat, read.table(files[4]), colClasses = colRead) # fread cannot handle fixed-width files
    
    # Combine training subjects, results, and labels
    trainDat <- fread(files[6])
    trainDat <- cbind(trainDat, fread(files[8]))
    trainDat <- cbind(trainDat, read.table(files[7]), colClasses = colRead) # fread cannot handle fixed-width files
    
    # Bind rows from test and training results
    dat <- rbindlist(list(testDat, trainDat))
    
    # Cleanup variables
    rm(testDat, trainDat)
    
    # Add column headings
    setnames(dat, c("SubjectID", "ActivityID", actLabels))
    
    # Read activity labels then add column heading in prep for merge
    activities <- fread(files[1])
    setnames(activities, c("ActivityID", "Activity"))
    
    # Merge activity labels
    dat <- merge(dat, activities, all.y = FALSE)
    
    # Return data
    dat
}