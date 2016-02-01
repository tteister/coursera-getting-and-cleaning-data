#Getting and Cleaning Data Assignment
This file describes how to execute the run_analysis.R script:
<ol>
<li><p>First step we will take is setting our working directory to where our script is located</p></li>
<li><p>The second thing we will do is unzip the data from the source link. https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. We want to make sure we unzip this data to our working directory.</p></li>
<li><p>The third step will be to run the script.The script performs the following:</p></li>
	<ul><li><p>Merges the training and the test sets to create one data set.</p></li>
		<li><p>Extracts only the measurements on the mean and standard deviation of each measurement.</p></li>
		<li><p>Uses descriptive activity names to name the activities in the data set</p></li>
		<li><p>Appropriately labels the data set with descriptive variable names.</p></li>
		<li><p>From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject</p></li></ul>
<li><p>After that,  an output file will be created in the working directory.  This will be the cleaned data set Tidy.txt</p></li>
<li><p>Commit both of these files to the github repository.</p></li>
</ol>
