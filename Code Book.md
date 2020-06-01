# getting-and-cleaning-data
In the repo, the run_analysis.R file shows the process of data cleaning, following the 5-step requirement in the course.

1. Achieve the dataset
Use the command line to download the dataset, and load the dataset into R. The dataset folder is callde UCI HAR Dataset

2. Assign the loaded data into dataframe, with the function read.table()
Dataframe features from file features.txt contains 561 rows and 2columns.
Dataframe activities from file activity_lables.txt contains 6 rows and 2 columns.
Dataframe subject_text from file test/subject_test.txt contains 2947 rows and 2 columns.
Datatframe x_test from test/X_test.txt contains 2947 rows and 561 columns.
Dataframe y_test from test/y_test.txt contains 2947 rows and 1 columns.
Dataframe subject_train from test/subject_train.txt contains 7352 rows and 1 column.
Dataframe x_train from test/X_train.txt contains 7352 rows and 561 columns.
Dataframe y_train from test/y_train.txt contains 7352 rows and 1 columns.


3. Merge the training and the test data to create data frame.(use the cbind)
1).Merging x-train and x_test into x, with function cbind.
2). Merging y_train and y_test into y
3). Merging subject_train and subject_test into Subject
4). Merging x, y and subject together into merged_data

4. Extract the measurement on the mean and stand deviation for each measurement
1). tidy_data is made by the chain function in the script.
2). The chain function is:
a. subsetting merged_data
b. selecting columns:subject,code and the measurements on mean & stand deviation for each measurement.

5. Change the activities in the dataframe with the descriptive names
Change the variables with the function (names)

6. lable the dataframe with descriptive names
1).code column in TidyData renamed into activities
2).All Acc in column’s name replaced by Accelerometer
3).All Gyro in column’s name replaced by Gyroscope
4).All BodyBody in column’s name replaced by Body
5).All Mag in column’s name replaced by Magnitude
6).All start with character f in column’s name replaced by Frequency
7). All start with character t in column’s name replaced by Time

