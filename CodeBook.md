# Introduction

The script has five steps

1. Merge the training and test sets and create one data set
2. Extracts measurements on the mean and standard deviation for each measurement. 
3. In this step use the descriptive activity names to name the activities in the data set
4. Label the data set with descriptive variable names
5. Finally Create a independent tidy data set with the average of each variable for each activity and each subject

# Variables

* `data_x_train`, `data_y_train`, `data_x_test`, `data_y_test`, `data_subject_train` and `data_subject_test` contain the raw data downloaded from url.
* `data_x`, `data_y` and `data_subject` has the merged data from above variables.
* `features` contains the correct names for the `data_x` dataset, which are applied to the column names stored in `meanStdIndices`.
* The above approach is followed for activity names through the `activities` variable.
* `all_data` merges `data_`, `data_y` and `data_subject` in a big dataset.
* Finally, `averages_data` contains the relevant averages which is stored in a `averages_data.txt` file. 
