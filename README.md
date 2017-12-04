# Creating tidy data

Following steps were performed in order to obtain tidy dataset:<br />

*
 Reading the data<br />
Only 8 files were needed, those in Inertial Signals folder weren't used<br />

* Naming the data
Files Y_test(train) represent the number of the person under observation.<br />
Files subject_test(train) represent Activity ID performed with the names of ID written in file activity_labels.<br />
File features represent names of variables used in files X_test(train)<br />

* Grouping the data<br />
For each set (test and train) all data was concatinated and unnecessary ActivityID removed combining all available data with corresponding variable names written in files.<br />
Subsequently, same-formatted test and train data were merged together amonthing to 10299 rows (from 2947 and 7352).<br />

* Extracting only mean and standard dev<br />
From all column names only those with mean or std in it were extracted (79)<br />

* Calculating avg vor each variable for each activity & person<br />
Data were grouped by the person (30 values) and activity (6 values) and for each of remaining 79 variable mean was calculated.<br />
Resulting data 'Tidy Grouped Dataset' dimention is 180 x 81.<br />
