# Pewlett Hackard Analysis

## Overview of the analysis
The new analysis is conducted to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. The purpose is to screen those employees for mentorship for the “silver tsunami” as many current employees reach retirement age.

## Results
- We first summarized the full records for all employees including the personal information as well as working period at the company. The analysis screened all the titles of employees who were born between January 1, 1952 and December 31, 1955. The result table (retirement_titles) including 133,776 rows of records indicate that some employees may have multiple titles in the database.
![retirement_titles](https://github.com/hankai26/Pewlett-Hackard-Analysis/blob/main/Data/retirement_titles.png)

- Considering the multiple titles for one employee in the database, we would use DISTINCT ON statement to keep the most recent title for each employee and remove other duplicate records. To exclude those employees that have already left the company the analysis created the table (retiring_titles) by filtering on the 'to_date' column to keep only current date information rows. The record row number in the table (unique_titles) dropped from 133,776 to 72,458, which is the total retiring employee number on record.
![unique_titles](https://github.com/hankai26/Pewlett-Hackard-Analysis/blob/main/Data/unique_titles.png)

- Based on the retiring_titles table, we would like to summarize the counts for retiring employee in each title. The result table (retiring_titles) indicates that the title with largest number as much as 25,916 retiring employees as Senior Engineers. While, there are only two managers will retire soon.
![retiring_titles](https://github.com/hankai26/Pewlett-Hackard-Analysis/blob/main/Data/retiring_titles.png)

- We created a mentorship-eligibility table (mentorship_eligibilty) to hold the current employees who were born between January 1, 1965 and December 31, 1965. There're 1,549 employees who are eligible to participate in the mentorship program. 
![mentorship_eligibilty](https://github.com/hankai26/Pewlett-Hackard-Analysis/blob/main/Data/mentorship_eligibilty.png)

## Summary
To give more insight into the upcoming "silver tsunami", we need to consider the following two questions.
- How many roles will need to be filled as the "silver tsunami" begins to make an impact?

The study analyzed that there would be 72,458 employees retiring soon, within seven titles as listed below. We did additional queries to count the mentor eligible people and to combine the mentor count table and retiring count. Employees need to be filled in for those seven titles. Additionally, there are two managers who would leave soon but with no eligible people for the mentorship program.

![T1_retiring_titles](https://github.com/hankai26/Pewlett-Hackard-Analysis/blob/main/Data/F1_retiring_mentor_count.png)

- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

Now we found 72,458 retiring employees. While the number of eligible employees for mentorship is only 1,549, based the current criteria with 
those who were born between January 1, 1965 and December 31, 1965. The ratio of qualified employees to retiring people is about 1:47. That means there would probably be inadequate retirement-ready employees to mentor all new employees. Especially no employee's eligible for manager-mentorship positions. It would be important to find experienced people outside for the manager position.

