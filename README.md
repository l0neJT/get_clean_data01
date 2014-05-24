# get_clean_data

## assignment 01

John's Hopkins University Getting and Cleaning Data on Coursera
*Please see Code_Book.md for detail on data and processing*

### runAnalysis.r
Read into data.table mean and standard deviation from the [UCI dataset on Human Activity Recognition](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "UCI - Human Activity Recognition"). Appends activty names and label columns with features. Returns mean by activity and subject either as a data.table or by writting to file specified as a CSV (returns TRUE if write successful). Procedures:
* Load data.table package
* Check directory for required files (returns error if files missing)
* Create vector of columns to read limiting data to mean and standard deviation
* Read test data and bind subjects, activity ID (Y), and measurements (X)
* Read train data and bind subjects, activity IDs (Y), and measurements (X)
* Bind test and train rows into single data.table
* Add column headings 
* Merge activity labels
* Re-order columns by activity and subject as ascending
* Write to CSV if destination file specified; return data.table otherwise