# -*- coding: utf-8 -*-
"""
Created on Sun Apr 23 16:07:28 2023

@author: DELL
"""

#Importing the required libraries
import pandas as pd
import matplotlib.pyplot as plt
import os

#Setting the working directory
os.getcwd()
os.chdir("C:\\Users\\DELL\\OneDrive\\Desktop\\George Mason\\Spring 23\\AIT580\\Assignments\\Submitted\\Project_Assignment\\Project_Assignment4")
os.getcwd()

#Importing the required csv file
data = pd.read_csv("bank_full.csv")
data

data.head(10)
data.columns
data.dtypes
data.describe()

#Research Question 1
#Which sector of customers (job-wise or education-wise) would most probably show interest in 
#the campaign?

#JOB CRITERIA


#Finding the total job count
job_count = data[data['job'] != 'unknown']['job'].value_counts()
job_count

#Plot for the job count
plt.bar(job_count.index, job_count)
plt.title("Count of each Job category")
plt.xlabel("Job Category")
plt.ylabel("Count")
plt.xticks(rotation=90)
plt.bar_label(plt.bar(job_count.index, job_count), labels=job_count.values, label_type='edge', fontsize=8)
plt.show()


#EDUCATION CRITERIA


#Finding the total education count
education_count = data[data['education'] != 'unknown']['education'].value_counts()
education_count

#Plot for the education count
plt.bar(education_count.index, education_count)
plt.title("Count of each Education category")
plt.xlabel("Education Category")
plt.ylabel("Count")
plt.xticks(rotation=90)
plt.bar_label(plt.bar(education_count.index, education_count), labels=education_count.values, label_type='edge', fontsize=8)
plt.show()


#AGE CRITERIA


#Differentiating the age groups
age_group_count = pd.cut(data['age'], range(0,101,10))
age_group_count
age_count = age_group_count.value_counts().sort_index()
age_count

#converting the data into string 
age_group_str = [str(interval) for interval in age_count.index]
                  
#Plot for the job count
plt.bar(age_group_str, age_count.values)
plt.title("Count of each Age group category")
plt.xlabel("Age group Category")
plt.ylabel("Count")
plt.xticks(rotation=90)
plt.bar_label(plt.bar(age_group_str, age_count.values), labels=age_count.values, label_type='edge', fontsize=8)
plt.show()


#MARITAL STATUS CRITERIA


#Finding the total marital status of married and unmarried
marital_count = data[data['marital'] != 'unknown']['marital'].value_counts()
marital_count

#Plot for the marriage count
plt.bar(marital_count.index, marital_count)
plt.title("Count of each Marital category")
plt.xlabel("Marital Category")
plt.ylabel("Count")
plt.xticks(rotation=90)
plt.bar_label(plt.bar(marital_count.index, marital_count), labels=marital_count.values, label_type='edge', fontsize=8)
plt.show()


#Research Question 2
#Does the mode of contact (cellular, mobile) play a role in marketing campaign success?

#CELLULAR DATA CRITERIA

#Finding the total count of cellular data
contact_count = data[data['contact'] != 'unknown']['contact'].value_counts()
#contact_count = data['contact'].value_counts()
contact_count

# Plot for the cellular and telephone count
plt.bar(contact_count.index, contact_count)
plt.title("Count of each Contact category")
plt.xlabel("Contact Category")
plt.ylabel("Count")
plt.xticks(rotation=90)
plt.bar_label(plt.bar(contact_count.index, contact_count), labels=contact_count.values, label_type='edge', fontsize=8)
plt.show()


#Research Question 3
#Are day or month important aspects for marketing campaign success?

#DAY CRITERIA

day_count = data['day'].value_counts()
day_count

#Plot for the day count

plt.bar(day_count.index, day_count.values)
plt.title("Count of each Day category")
plt.xlabel("Day Category")
plt.ylabel("Count")
plt.xticks(range(1,32), fontsize = 7)
plt.bar_label(plt.bar(day_count.index, day_count.values), labels=day_count.values, label_type='edge', fontsize=4.5)
plt.show()

#MONTH CRITERIA
month_count = data['month'].value_counts()
month_count

month_order = ['jan', 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aug', 'sep', 'oct', 'nov', 'dec']
month_order

# Sort the month count based on the desired order
month_count_sorted = month_count.loc[month_order]
month_count_sorted

#Plot for the month count
plt.bar(month_count_sorted.index, month_count_sorted)
plt.title("Count of each Month")
plt.xlabel("Month Category")
plt.ylabel("Count")
plt.xticks(month_count_sorted.index, month_order, rotation=90)
plt.bar_label(plt.bar(month_count_sorted.index, month_count_sorted.values), labels=month_count_sorted.values, label_type='edge', fontsize=8)
plt.show()

##################################################################################################

#Summary Stats
#AGE STATS
age_summary = data['age'].describe()
age_summary


#JOB STATS
job_summary = data['job'].describe()
job_summary


#MARITAL STATS
marital_summary = data['marital'].describe()
marital_summary


#EDUCATION STATS
edu_summary = data['education'].describe()
edu_summary


#DEFAULT STATS
default_summary = data['default'].describe()
default_summary


#BALANCE STATS
balance_summary = data['balance'].describe()
balance_summary


#HOUSING STATS
housing_summary = data['housing'].describe()
housing_summary


#LOAN STATS
loan_summary = data['loan'].describe()
loan_summary


#CONTACT STATS
contact_summary = data['contact'].describe()
contact_summary


#DAY STATS
day_summary = data['day'].describe()
day_summary


#MONTH STATS
month_summary = data['month'].describe()
month_summary


#DURATION STATS
duration_summary = data['duration'].describe()
duration_summary


#CAMPAIGN STATS
campaign_summary = data['campaign'].describe()
campaign_summary


#PDAYS STATS
pdays_summary = data['pdays'].describe()
pdays_summary


#PREVIOUS STATS
previous_summary = data['previous'].describe()
previous_summary


#POUTCOME STATS
poutcome_summary = data['poutcome'].describe()
poutcome_summary


#Y STATS(Y-OUTCOME)
y_summary = data['y'].describe()
y_summary


#TOTAL STATS
total_summary = data.describe()
total_summary
