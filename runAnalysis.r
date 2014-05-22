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
    
    # Combine test subjects, results, and labels
    testDat <- fread(files[3])
    testDat <- cbind(testDat, fread(files[5]))
    testDat <- cbind(testDat, read.table(files[4])) # fread cannot handle fixed-width files
    
    # Combine training subjects, results, and labels
    trainDat <- fread(files[6])
    trainDat <- cbind(trainDat, fread(files[8]))
    trainDat <- cbind(trainDat, read.table(files[7])) # fread cannot handle fixed-width files
    
    # Bind rows from test and training results
    dat <- rbindlist(list(testDat, trainDat))
    
    # Cleanup variables
    rm(testDat, trainDat)
    
    # Add column headings
    setnames(dat, c("SubjectID", "ActivityID", read.table(files[2], colClasses = c("numeric", "character"))[[2]]))
    
    dat
    
    # Add activity name column
}