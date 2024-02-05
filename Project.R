library(tidyverse)
library(ggplot2)
library(GGally)
library(car)
library(tidyr)

data <- read_csv("bank_full.csv")
data

head(data)
str(data)
summary(data)

#Research Question 1
#Which sector of customers (job-wise or education-wise) would most probably show interest in 
#the campaign?

#JOB CRITERIA

job_count <- data[data$job != "unknown", ]%>%
  group_by(job) %>%
  summarize(count = n()) %>%
  arrange(desc(count))
job_count             

#Plotting the JOB count

plt <- ggplot(data = job_count, aes(x = job, y = count)) +
  geom_bar(stat = "identity", fill = "blue", color="black") +
  geom_text(aes(label = count), vjust = -0.5, size = 2.5) +
  ggtitle("Count of each Job category") +
  xlab("Job Category") +
  ylab("Count") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

plt


#EDUCATION CRITERIA


#Finding the total education count

education_count <- data[data$education != "unknown", ]%>%
  group_by(education) %>%
  summarize(count = n())%>%
  arrange(desc(count))
education_count

#Plotting the EDUCATION count

plt <- ggplot(data = education_count, aes(x = education, y = count)) +
  geom_bar(stat = "identity", fill = "blue", color="black") +
  geom_text(aes(label = count), vjust = -0.5, size = 2.5) +
  ggtitle("Count of each Education category") +
  xlab("Education Category") +
  ylab("Count") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

plt

#AGE CRITERIA

#Differentiating based on age groups

age_group_count <- cut(data$age, breaks = seq(0, 100, by = 10))
age_count <- table(age_group_count)
age_count

# Plotting the bar chart
plt <- ggplot(data = as.data.frame(age_count),
       aes(x = factor(age_group_count), y = Freq)) + 
  geom_bar(stat = "identity", fill = "blue", color = "black") +
  geom_text(aes(label = Freq, y = Freq + 50), size = 2.5) +
  ggtitle("Count of Each AGe Group Category") +
  xlab("Age Group Category")+
  ylab("Count") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
plt

#MARITAL STATUS CRITERIA


marital_count <- data[data$marital != "unknown", ]%>%
  group_by(marital)%>%
  summarize(count = n())%>%
  arrange(desc(count))
marital_count 

# Plotting the bar chart

plt <- ggplot(data = marital_count, aes(x = marital, y = count)) +
  geom_bar(stat = "identity", fill = "blue", color="black") +
  geom_text(aes(label = count), vjust = -0.5, size = 2.5) +
  ggtitle("Count of each Marital category") +
  xlab("Marital Category") +
  ylab("Count") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

plt


#Research Question 2
#Does the mode of contact (cellular, mobile) play a role in marketing campaign success?

#CELLULAR DATA CRITERIA
#Finding the total count of cellular data


cellular_count <- data[data$contact != "unknown", ]%>%
  group_by(contact)%>%
  summarize(count = n())%>%
  arrange(desc(count))
cellular_count


# Plotting the bar chart

plt <- ggplot(data = cellular_count, aes(x = contact, y = count)) +
  geom_bar(stat = "identity", fill = "blue", color="black") +
  geom_text(aes(label = count), vjust = -0.5, size = 2.5) +
  ggtitle("Count of each Cellular category") +
  xlab("Cellular Category") +
  ylab("Count") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

plt


#Research Question 3
#Are day or month important aspects for marketing campaign success?

#DAY CRITERIA

day_count <- data%>%
  group_by(day) %>%
  summarize(count = n()) %>%
  arrange(desc(count))
day_count 
head(day_count,31)

# Plotting the bar chart

plt <- ggplot(data = day_count, aes(x = day, y = count)) +
  geom_bar(stat = "identity", fill = "blue", color = "black") +
  geom_text(aes(label = count), vjust = -0.5, size = 2.5) +
  ggtitle("Count of each Day category") +
  xlab("Day Category") +
  ylab("Count") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))+
  scale_x_continuous(breaks = 1:31)
plt


#MONTH CRITERIA

month_seq = c("Jan", "Feb","Mar","Apr","May","Jun","July","Aug","Sept","Oct","Nov","Dec")
month_seq

month_count <- data%>%
  group_by(month) %>%
  summarize(count = n()) %>%
  arrange(month_seq)
month_count 


# Plotting the bar chart

plt <- ggplot(data = month_count, aes(x = month, y = count)) +
  geom_bar(stat = "identity", fill = "blue", color = "black") +
  geom_text(aes(label = count), vjust = -0.5, size = 2.5) +
  ggtitle("Count of each Month category") +
  xlab("Month Category") +
  ylab("Count") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

plt

#######################################################################################

#Summary  Statistics

#AGE STATS
age_summary <- summary(data$age)
age_summary

#JOB STATS
job_summary <- summary(data$job)
job_summary

#MARITAL STATS
marital_summary <- summary(data$marital) 
marital_summary


#EDUCATION STATS
edu_summary <- summary(data$education)
edu_summary


#DEFAULT STATS
default_summary <- summary(data$default)
default_summary


#BALANCE STATS
balance_summary <- summary(data$balance)
balance_summary


#HOUSING STATS
housing_summary <- summary(data$housing)
housing_summary


#LOAN STATS
loan_summary <- summary(data$loan)
loan_summary


#CONTACT STATS
contact_summary <- summary(data$contact)
contact_summary


#DAY STATS
day_summary <- summary(data$day)
day_summary


#MONTH STATS
month_summary <- summary(data$month)
month_summary


#DURATION STATS
duration_summary <- summary(data$duration)
duration_summary


#CAMPAIGN STATS
campaign_summary <- summary(data$campaign)
campaign_summary


#PDAYS STATS
pdays_summary <- summary(data$pdays)
pdays_summary


#PREVIOUS STATS
previous_summary <- summary(data$previous)
previous_summary


#POUTCOME STATS
poutcome_summary <- summary(data$poutcome)
poutcome_summary

#Y STATS(Y-OUTCOME)
y_summary <- summary(data$y)
y_summary


#TOTAL STATS
total_summary <- summary(data)
total_summary


#################################################################################
#Mutiple Linear Regression

model <- lm(age ~ job, data=data)
model

summary(model)

residual_plot <- plot(model, which = 1)

normal_plot <- plot(model, which = 2)

scale_location_plot <- plot(model, which = 3)

cook_dist_plot <- plot(model, which = 4)


