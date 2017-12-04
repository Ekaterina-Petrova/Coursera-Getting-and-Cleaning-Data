# Creating tidy data

Following steps were performed in order to obtain tidy dataset:

*
 Reading the data
Only 8 files were needed, those in Inertial Signals folder weren't used

* Naming the data
Files Y_test(train) represent the number of the person under observation.
Files subject_test(train) represent Activity ID performed with the names of ID written in file activity_labels
File features represent names of variables used in files X_test(train)

* Grouping the data
For each set (test and train) all data was concatinated and unnecessary ActivityID removed combining all available data with corresponding variable names written in files.
Subsequently, same-formatted test and train data were merged together amonthing to 10299 rows (from 2947 and 7352).

* Extracting only mean and standard dev
From all column names only those with mean or std in it were extracted (79)

* Calculating avg vor each variable for each activity & person
Data were grouped by the person (30 values) and activity (6 values) and for each of remaining 79 variable mean was calculated.
Resulting data 'Tidy Grouped Dataset' dimention is 180 x 81.
