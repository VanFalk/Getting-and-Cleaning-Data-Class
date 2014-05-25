Code Book for run_analysis.R scripts
========================================================
Jon Rogers: Coursera/JHU Getting and Cleaning Data Class
----

### 0. Import Raw Data

* trainsub: The subject data from the training set
2. testsub:  The subject data from the test set
3. trainact: The activity data from the training set
4. testact:  The activity data from the test set
5. trainx:   The measures from the training set
6. testx:    The measures from the test set 

#### Merge Variables from the Training and Test Data Sets
* subjects: The merged subjects data from the training and test sets
* actions:  The merged actions data from the training and test sets
* vars:     The merged measurements data from the training and test sets

### 1. Merge the Training and the Test Sets to Create One Uber Data Set

*data: the combined data for actions, subjects and measures

### 2. Extract Measures on the Mean and Standard Deviation for Each Measurement

* extracted: the data of all variables with mean or standard deviation plus activities and subject

### 3. Modify Activities Variable to Use Descriptive Names

* activities: the desscriptive names for the coded activity variable

### 4. Label Data Set with Descriptive Activity Names

* Activity names cleaned up using the R and Google style guides. 
* I dropped the case of each variable to all lower case letters and removed "-". I inserted dots "." in each name to break up the names per coded event for legibility.

The resulting code can be read as such:

* "f." or "t." - signifies if the data is from a time domain signal or filtered with a Fast Fourier Transform.
* ".x" or ".y" or ".z" - identifies if the measure is coming from the x, y or z axis
* ".sd" or ".mean" - identifies if the measure is a mean or standard deviation
* ".acc" or ".gyro" - identified is the measure is coming from the accelerometer or gyroscope
* ".body" or ".gravity" - identifies if the acceleration measure is from gravity or body movement
* ".mag" - a measure of the magnitude of the three dimensional signals

### 5. Reshape Data and Export an Independent Data Set

* meltdata: the extracted data melted for volunteer and activity
* castdata: the meltdata cast for the mean of each variable for each activty for each subject
* Cleaned_Data.txt: the name of the exported clean and tidy data set
