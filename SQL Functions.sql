-- Question 1 : Create a ranking of students based on score (highest first). 

SELECT
   student_id,
   name,
   course,
   score,
   RANK() OVER (ORDER BY score DESC) AS rank_position
FROM Student_Performance;

-- Question 2 : Show each student's score and the previous student’s score (based on score order). 

SELECT
student_id,
name,
score,
LAG(score) OVER (ORDER BY score DESC) AS previous_score
FROM Student_Performance; 

-- Question 3 : Convert all student names to uppercase and extract the month name from join_date. 

SELECT
student_id,
UPPER(name) AS student_name,
score,
MONTHNAME(join_date) AS join_month
FROM Student_Performance; 

-- Question 4 : Show each student's name and the next student’s attendance (ordered by attendance). 

SELECT
name,
attendance,
LEAD(attendance) OVER (ORDER BY attendance DESC) AS next_attendance
FROM Student_Performance; 

-- Question 5 : Assign students into 4 performance groups using NTILE(). 

SELECT
student_id,
name,
score,
NTILE(4) OVER (ORDER BY score DESC) AS performance_group
FROM Student_Performance; 

-- Question 6 : For each course, assign a row number based on attendance (highest first). 

SELECT
student_id,
name,
course,
attendance,
ROW_NUMBER() OVER (PARTITION BY course ORDER BY attendance DESC) AS row_num
FROM Student_Performance; 

-- Question 7 : Calculate the number of days each student has been enrolled (from join_date to today). (Assume current date = '2025-01-01') 

SELECT
   student_id,
   name,
   join_date,
   DATEDIFF('2025-01-01', join_date) AS days_enrolled
FROM Student_Performance;

-- Question 8 : Format join_date as “Month Year” (e.g., “June 2023”). 

SELECT
student_id,
name,
DATE_FORMAT(join_date, '%M %Y') AS formatted_join_date
FROM Student_Performance; 

-- Question 9 : Replace the city ‘Mumbai’ with ‘MUM’ for display purposes. 

SELECT
student_id,
name,
course,
score,
attendance,
mentor,
join_date,
CASE
WHEN city = 'Mumbai' THEN 'MUM'
ELSE city
END AS city
FROM Student_Performance; 

-- Question 10 : For each course, find the highest score using FIRST_VALUE(). 

SELECT
student_id,
name,
course,
score,
FIRST_VALUE(score) OVER (PARTITION BY course ORDER BY score DESC) AS highest_score_in_course
FROM Student_Performance; 
