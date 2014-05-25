Instruction for run_analysis.R scripts
========================================================
Jon Rogers: Coursera/JHU Getting and Cleaning Data Class
----

### 0. Prepare R Work Environment

Nothing exciting here...just setting the working directory and pre-loading the libraries I know will be needed. 
I intend to use reshape2 for most of the heavy lifting. My appraoch is rather brute force and prbably could have written more elegant code utilizing plyr/dplyr but found this approach was easy enough.

### 0. Import Raw Data

Using read.table to bring in all of the raw data sets that will be the basis for the merged uber data frame. 
I first merge the files together by unique variable using rbind, so all the subjects come together, then the activities and finally the measures. This results in three data frames to move forward with. I then name the variable columns for activity and volunteer ID (subjects) and import bring the raw coded variable names for the measures, and add those to the relevant file.


### 1. Merge the Training and the Test Sets to Create One Uber Data Set

I use cbind to bring the three data frames for activity, volunteer and measures together in an uber data set called "data."

### 2. Extract Measures on the Mean and Standard Deviation for Each Measurement

I extract from the uber data set the 66 variables that are a measure of mean or standard deviation as well as the retain the volunteer and activity variables as well for a total of 68 variables. Identification of the mean and sd variables was done manually by eye. There is probably a functional way to extract those, but I was unable to identify the fucntion - something I need ot follow-up and lear. The new data set of 68 variables is called "extracted.

Please Note: The instructions for this assignment were poorly written. I first wrote code to calculate the mean and sd for every variable. I believe this is wrong, but I left that old code in the file just in case it is not to get as much credit as possible. Moving forward the remainder of the code will utilize the "extracted" data of 68 variables.

### 3. Modify Activities Variable to Use Descriptive Names

I recode the activities variable to use descriptive names rather than numeric. To do this I import the file of descriptive names and rename each one individually. I am sure there is a functional way to have done this at once. That will be another follow-up for additional learning.

### 4. Label Data Set with Descriptive Activity Names

I rename the 66 varibales of measures utilizing gsub and a one-by-one brute force approach. Another area where I beleive there is a mroe functional and efficient way to have solved the problem. Please see the code book for my approach on renaming. There seems to be some controversy as recognized best practices are at odds with classroom instruction in this area. I went with the approach using "." for naming.

### 5. Reshape Data and Export an Independent Data Set

For the final step, I utilize "melt" and "cast" to reshape the data by volunteer and then activity. This step gnerates two new data frames "meltdata" and "castdata". I finally use "write.table" to export the clean/tidy data as a txt file called "Cleaned_Data.txt" into my working directory.
