
/* 

1. What is PostgreSQL?
   ------------------------------------------------
    PostgreSQL is the world’s most advanced 
    open-source relational database management 
    system. It supports SQL for relational 
    querying and NOSQL for non-relational 
    querying. Well known for hadling complex 
    queries and reliablity. 






2. What is the purpose of a database schema in 
PostgreSQL?
---------------------------------------------------
A schema in PostgreSQL is like a folder that 
organizes and groups database objects such as 
tables, views, and indexes. It helps keep related 
objects together and controls access to them.




3. Explain the primary key and foreign key concepts in PostgreSQL. 
---------------------------------------------------
-Primary Key: A column (or set of columns) that 
uniquely identifies each row in a table. No two 
rows can have the same primary key value.

-Foreign Key: A column in one table that links to 
the primary key of another table, ensuring that 
the relationship between the two tables remains 
valid.








4. What is the difference between the VARCHAR and 
CHAR data types?
---------------------------------------------------
VArchar: VArchar is a variable-length character 
type. It is more flexible. It will allocate space 
as much as needed, not allocating a fixed length. 
You can restrict the max length like VARCHAR(30) → 
here it won’t take strings longer than 30.  

CHAR: CHAR is a fixed-length character type;
Storage: The length is fixed & specified when 
defining the column.  
if the actual string is shorter than the specified
length it is padded with space. 
Example: CHAR(10) Now if you provide 3 character
length string it still allocates the space for 10 
characters






5. Explain the purpose of the WHERE clause in a SELECT statement.
---------------------------------------------------
The `WHERE` clause filters rows based on 
acondition. It helps retrieve only those rows that 
meet the specified criteria.
for example: SELECT * FROM users WHERE age > 18;






6. What are the LIMIT and OFFSET clauses used for?
---------------------------------------------------
Limit restricts the number rows are returned
Offset skip the number rows. 






7. How can you perform data modification using 
UPDATE statements?
---------------------------------------------------
UPDATE users
SET user_name = 'shakil ahmmed'
WHERE user_email = 'shakilahmmed8882@gmail.com'






8. What is the significance of the JOIN operation
and how does it work in PostgreSQL?
---------------------------------------------------
The JOIN operation lets you combine data from two
or more tables by matching related columns, so you
can view and work with data from different tables
together in one table.

example: here are 3 table student , courses, enrollment. now if i wanna know how many students enrolled in "nextjs" course I won't get the desired result in stand alone course table or student as i keep their references in enrollment table. So as i have to show student name that doesn't exist in enrollment table i need to join them by refrence id to get desired result. 


SELECT student.student_name
FROM enrollment
JOIN courses ON enrollment.course_id = courses
course_id
JOIN student ON enrollment.student_id = student
student_id
WHERE courses.course_name = 'nextjs';






9. Explain the GROUP BY clause and its role in
aggregation operations.
---------------------------------------------------

The GROUP BY clause is used to group rows that 
have the same values in specified columns. It is 
typically used with aggregate functions example: 
COUNT, SUM, AVG to perform calculations on each 
group of rows, instead of the whole dataset.

Role in Aggregation:
The GROUP BY clause helps to break the data into 
groups based on one or more columns, and then 
aggregate functions are applied to each group 
separately.
Example: 
If you want to count how many students are
enrolled in each course:

SELECT courses.course_name, COUNT(enrollment
student_id) AS student_count
FROM enrollment
JOIN courses ON enrollment.course_id = courses
course_id
GROUP BY courses.course_name;






10. How can you calculate aggregate functions like
COUNT, SUM, and AVG in PostgreSQL?
---------------------------------------------------
SELECT COUNT(*) FROM students;
SELECT SUM(course_fee) FROM courses;
SELECT AVG(score) FROM exams WHERE exam_id = 1;






11. What is the purpose of an index in PostgreSQL,
and how does it optimize query performance?
---------------------------------------------------
The purpose of an index in PostgreSQL is to 
optimize the query perfomace. 

-Heap Files in Database:
    - All database files are stored as heap files
    on the hard disk.
    - Heap files are divided into blocks (e.g., 
    block 1, block 2, block 3).
    - When creating a table, data is distributed 
    across different blocks based on size.

- Query Execution (Sequential Scan):
    - When a query is executed, the database 
    engine transfers heap files into memory block 
    by block.
    - This process is called a sequential scan or 
    full table scan.
    - Sequential scans are time-consuming and 
    inefficient as they require scanning all 
    blocks.
    
- Indexing:
    - An index is an object created in the 
    database, storing references like the name, 
    block, and index of the data.
    - When querying, the database engine only 
    transfers the specific block where the data 
    exists, bypassing the need to scan the entire 
    table.
    - This improves performance by retrieving data 
    from indexed blocks.






12. Explain the concept of a PostgreSQL view and 
how it differs from a table.
---------------------------------------------------
A view is a virtual table in PostgreSQL that 
displays data from one or more tables based on a 
SELECT query. It does not store data itself but 
generates results dynamically.

-Virtual Table: Acts like a table but doesn’t 
store data.
-Simplifies Queries: Encapsulates complex queries 
for easier access.
-Security: Limits access to specific rows or
columns.


let's create view: 
CREATE VIEW user_contacts AS
SELECT name, email FROM users;








*/
