##

runAnalysis <- function(dir = "./data/UCI HAR Dataset") {
    # Create vector with required file names
    reqFiles <- c("activity_labels.txt",
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

    # Return error if files missins
    if(!is.null(misFiles)) stop(paste("Missing File:", misFiles, collapse = "\t"))
    
    print(files)
    
    # Combine test results with labels
    
    # Combine training results with labels
    
    # Merge test and training results
    
    # Add activity name and subject name columns
}