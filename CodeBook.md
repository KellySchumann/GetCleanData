---
title: "CodeBook for Getting and Cleaning Data - Assignment 1"
author: "Kelly Schumann"
date: "5/16/2019"
output: html_document
---

This project creates 2 tidy data sets, the first containing all of the raw columns containing the terms Mean or Standard Deviation which is titled <b>means.std</b>. The second breaks down all of the averages of the variables by the different types of activities being monitored in the study <b>ave.activity</b>;

The data has come from <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">Human Activity Recognition Using Smartphones Data Set</a>. This data consists of Tri-axial Accelerometer and Velocity and estimated body acceleration. 

The main routine run_analysis can be broken down into 2 sections described below:
    1) Make One DataSet (Build1DF)
    2) Analysis the DataSet (SummarizeThis)


<b>Section 1 - Building a single Data Set</b>
 To create a single data set this are the steps that are taken...
1) Make Columns Headers that are clean and understandable
2) Create a single data set from the 4 files (2 test and 2 training files). <font color="red"><b>(Goals #1 and #4)</b></font>

    A) Each group has 3 data files, 
        i)  The first contain all of the data points
        ii) The second file details the activity preformed creating the data points
        iii)The subject doing the excerise
    B) Each Group 
        Reading the data file and using rbind to combine the Activity file and Subject File 
        to complete the test results into a single file
    C) The next step of this section joins the two group (data sets) together using cbind
3) Create a single Dataset - including variables containing Mean or Standard Dev. <font color="red"><b>(Goal #2)</b></font>
    A) Create a filter using grep
    B) Apply filter creating <b>"means.std"</b> data frame.
5) Link the Activity file to the data sets so we have a more readable dataset not code but activity
    name <font color="red"><b>(Goal #3)</b></font>

<b>Section 2 - Creating the Summarization</b>
  Summarize it by activities for each of the 80 variables. <font color="red"><b>(Goal #5)</b></font>
    A) Using Aggreagate create the data frame named <b>"ave.activity"</b>


The means.std data.frame contains
<table>
<tr><td>Body Acceleration Mean X</td><td></td></tr>
<tr><td>Body Acceleration Mean Y</td><td></td></tr>
<tr><td>Body Acceleration Mean Z</td><td></td></tr>
<tr><td>Body Acceleration Std Dev. X</td><td></td></tr>
<tr><td>Body Acceleration Std Dev. Y</td><td></td></tr>
<tr><td>Body Acceleration Std Dev. Z</td><td></td></tr>
<tr><td>Gravity Acceleration Mean X</td><td></td></tr>
<tr><td>Gravity Acceleration Mean Y</td><td></td></tr>
<tr><td>Gravity Acceleration Mean Z</td><td></td></tr>
<tr><td>Gravity Acceleration Std Dev. X</td><td></td></tr>
<tr><td>Gravity Acceleration Std Dev. Y</td><td></td></tr>
<tr><td>Gravity Acceleration Std Dev. Z</td><td></td></tr>
<tr><td>Body Acceleration Jerk Mean X</td><td></td></tr>
<tr><td>Body Acceleration Jerk Mean Y</td><td></td></tr>
<tr><td>Body Acceleration Jerk Mean Z</td><td></td></tr>
<tr><td>Body Acceleration Jerk Std Dev. X</td><td></td></tr>
<tr><td>Body Acceleration Jerk Std Dev. Y</td><td></td></tr>
<tr><td>Body Acceleration Jerk Std Dev. Z</td><td></td></tr>
<tr><td>Body Gyroscope Mean X</td><td></td></tr>
<tr><td>Body Gyroscope Mean Y</td><td></td></tr>
<tr><td>Body Gyroscope Mean Z</td><td></td></tr>
<tr><td>Body Gyroscope Std Dev. X</td><td></td></tr>
<tr><td>Body Gyroscope Std Dev. Y</td><td></td></tr>
<tr><td>Body Gyroscope Std Dev. Z</td><td></td></tr>
<tr><td>Body Gyroscope Jerk Mean X</td><td></td></tr>
<tr><td>Body Gyroscope Jerk Mean Y</td><td></td></tr>
<tr><td>Body Gyroscope Jerk Mean Z</td><td></td></tr>
<tr><td>Body Gyroscope Jerk Std Dev. X</td><td></td></tr>
<tr><td>Body Gyroscope Jerk Std Dev. Y</td><td></td></tr>
<tr><td>Body Gyroscope Jerk Std Dev. Z</td><td></td></tr>
<tr><td>Body Acceleration Magnitude Mean</td><td></td></tr>
<tr><td>Body Acceleration Magnitude Std Dev.</td><td></td></tr>
<tr><td>Gravity Acceleration Magnitude Mean</td><td></td></tr>
<tr><td>Gravity Acceleration Magnitude Std Dev.</td><td></td></tr>
<tr><td>Body Acceleration Jerk Magnitude Mean</td><td></td></tr>
<tr><td>Body Acceleration Jerk Magnitude Std Dev.</td><td></td></tr>
<tr><td>Body Gyroscope Magnitude Mean</td><td></td></tr>
<tr><td>Body Gyroscope Magnitude Std Dev.</td><td></td></tr>
<tr><td>Body Gyroscope Jerk Magnitude Mean</td><td></td></tr>
<tr><td>Body Gyroscope Jerk Magnitude Std Dev.</td><td></td></tr>
<tr><td>Body Acceleration Mean X.1</td><td></td></tr>
<tr><td>Body Acceleration Mean Y.1</td><td></td></tr>
<tr><td>Body Acceleration Mean Z.1</td><td></td></tr>
<tr><td>Body Acceleration Std Dev. X.1</td><td></td></tr>
<tr><td>Body Acceleration Std Dev. Y.1</td><td></td></tr>
<tr><td>Body Acceleration Std Dev. Z.1</td><td></td></tr>
<tr><td>Body Acceleration Meanreq. X</td><td></td></tr>
<tr><td>Body Acceleration Meanreq. Y</td><td></td></tr>
<tr><td>Body Acceleration Meanreq. Z</td><td></td></tr>
<tr><td>Body Acceleration Jerk Mean X.1</td><td></td></tr>
<tr><td>Body Acceleration Jerk Mean Y.1</td><td></td></tr>
<tr><td>Body Acceleration Jerk Mean Z.1</td><td></td></tr>
<tr><td>Body Acceleration Jerk Std Dev. X.1</td><td></td></tr>
<tr><td>Body Acceleration Jerk Std Dev. Y.1</td><td></td></tr>
<tr><td>Body Acceleration Jerk Std Dev. Z.1</td><td></td></tr>
<tr><td>Body Acceleration Jerk Meanreq. X</td><td></td></tr>
<tr><td>Body Acceleration Jerk Meanreq. Y</td><td></td></tr>
<tr><td>Body Acceleration Jerk Meanreq. Z</td><td></td></tr>
<tr><td>Body Gyroscope Mean X.1</td><td></td></tr>
<tr><td>Body Gyroscope Mean Y.1</td><td></td></tr>
<tr><td>Body Gyroscope Mean Z.1</td><td></td></tr>
<tr><td>Body Gyroscope Std Dev. X.1</td><td></td></tr>
<tr><td>Body Gyroscope Std Dev. Y.1</td><td></td></tr>
<tr><td>Body Gyroscope Std Dev. Z.1</td><td></td></tr>
<tr><td>Body Gyroscope Meanreq. X</td><td></td></tr>
<tr><td>Body Gyroscope Meanreq. Y</td><td></td></tr>
<tr><td>Body Gyroscope Meanreq. Z</td><td></td></tr>
<tr><td>Body Acceleration Magnitude Mean.1</td><td></td></tr>
<tr><td>Body Acceleration Magnitude Std Dev..1</td><td></td></tr>
<tr><td>Body Acceleration Magnitude Meanreq.</td><td></td></tr>
<tr><td>Body Body Acceleration Jerk Magnitude Mean</td><td></td></tr>
<tr><td>Body Body Acceleration Jerk Magnitude Std Dev.</td><td></td></tr>
<tr><td>Body Body Acceleration Jerk Magnitude Meanreq.</td><td></td></tr>
<tr><td>Body Body Gyroscope Magnitude Mean</td><td></td></tr>
<tr><td>Body Body Gyroscope Magnitude Std Dev.</td><td></td></tr>
<tr><td>Body Body Gyroscope Magnitude Meanreq.</td><td></td></tr>
<tr><td><Body Body Gyroscope Jerk Magnitude Mean/td><td></td></tr>
<tr><td>Body Body Gyroscope Jerk Magnitude Std Dev.</td><td></td></tr>
<tr><td>Body Body Gyroscope Jerk Magnitude Meanreq.</td><td></td></tr>
<tr><td>Activity</td><td></td></tr>
<tr><td>ActivityName</td><td></td></tr>
</table>

