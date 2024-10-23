-- Active: 1729654607095@@127.0.0.1@5432@university_db

---------------------- TABLE CREATION ----------------------

-- Creating -students- table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    age INTEGER NOT NULL,
    email VARCHAR(100) NOT NULL,
    frontend_mark INTEGER,
    backend_mark INTEGER,
    status VARCHAR(20)
);


-- Creating -courses- table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INTEGER NOT NULL
);


-- Creating -enrollment- table
CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(student_id),
    course_id INTEGER REFERENCES courses(course_id)
);




-- ---------------------- DATA INSERTION ----------------------

-- inserting students data
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status) 
VALUES
('Sameer Hossain', 21, 'sameer.hossain@example.com', 48, 60, NULL),
('Nabila Akhter', 22, 'nabila.akhter@gmail.com', 50, 45, NULL),
('Rafiq Uddin', 23, 'rafiq.uddin@example.com', 55, 49, NULL),
('Ayesha Rahman', 21, 'ayesha.rahman@hotmail.com', 60, 55, NULL),
('Zahin Karim', 24, 'zahin.karim@yahoo.com', 43, 52, NULL),
('Tania Begum', 22, 'tania.begum@example.com', 47, 50, NULL),
('Hasan Mahmud', 23, 'hasan.mahmud@gmail.com', 41, 39, NULL),
('Shamim Islam', 25, 'shamim.islam@example.com', 49, 40, NULL),
('Fatema Akter', 21, 'fatema.akter@gmail.com', 55, 60, NULL),
('Rahim Chowdhury', 22, 'rahim.chowdhury@example.com', 46, 52, NULL),
('Maliha Khan', 24, 'maliha.khan@gmail.com', 42, 48, NULL),
('Ashraf Hossain', 23, 'ashraf.hossain@example.com', 51, 55, NULL),
('Farzana Nasrin', 22, 'farzana.nasrin@yahoo.com', 45, 44, NULL),
('Saiful Islam', 21, 'saiful.islam@example.com', 53, 49, NULL),
('Anika Sultana', 23, 'anika.sultana@example.com', 39, 42, NULL);


-- inserting course data
INSERT INTO courses (course_name, credits) 
VALUES
('Next.js', 3),
('React.js', 4),
('Databases', 3),
('Prisma', 3),
('Node.js', 4),
('JavaScript Fundamentals', 3),
('Web Development', 4),
('Data Structures', 3),
('Algorithms', 3),
('Software Engineering', 4);


-- inserting enrollment data
INSERT INTO enrollment (student_id, course_id) 
VALUES
(1, 1), 
(1, 2), 
(2, 1), 
(3, 2), 
(4, 3), 
(5, 4), 
(6, 1), 
(7, 2), 
(8, 3), 
(9, 4);



------------------------ DATABASE QUERY ----------------------

--Query 1:
--Insert a new student record with the following details:
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status)
    VALUES ('Shakil Ahmmed', 22, 'shakil.ahmmed@example.com', 80, 85, NULL);




--Query 2:
--Retrieve the names of all students who are enrolled in the course titled 'Next.js'.
SELECT s.student_name FROM enrollment as e
    JOIN students as s on e.student_id = s.student_id
    JOIN courses as c on e.course_id = c.course_id
    WHERE c.course_name  LIKE 'Next.js';

    -- here i use lik for case-insensitive matching 
    -- and name alias for ease



--Query 3:
--Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.
UPDATE students 
    set status = 'Awarded'
    WHERE (frontend_mark + backend_mark)  = (
        SELECT max(frontend_mark + backend_mark) FROM students
    );

    -- her i tried to use subquery to place highest number by summing frontend and backdnd mark of a student and the first where clause to match that from all students. Finally found student is set = awared 




--Query 4:
--Delete all courses that have no students enrolled.
DELETE FROM courses 
    WHERE course_id not in(
        SELECT course_id from enrollment
    );

-- here i compare the course_id from the courses table 
-- and checking which course_id is not referenced in enrollment table
-- finally found courses are deleted. 




--Query 5:
--Retrieve the names of students using a limit of 2, starting from the 3rd stud
SELECT student_name FROM students LIMIT 2 OFFSET 2;

    -- here I understand this as the concept the pagination
    -- I analyse it like -> well in each page 2 student name visible 
    -- when navigate second page 3 and 4 number student are visible 
    -- skipping first 1 and 2 
    -- I use limit 2 for each page
    -- and I use offset ot skip first 2 students





--Query 6:
--Retrieve the course names and the number of students enrolled in each course.
SELECT course_name, count(*) as students_enrolled FROM (SELECT * FROM enrollment 
    JOIN courses on enrollment.course_id = courses.course_id) GROUP BY course_name;

    -- here I first combine courses and enrollment table 
    -- found one single table combining both. 
    -- from this table i group them by course_name for distict courses as group. 
    -- then I display the respective course_name and number of enrollments found in that. 



--Query 7:
--Calculate and display the average age of all students
SELECT avg(age) as average_age
FROM students;




--Query 8:
--Retrieve the names of students whose email addresses contain 'example.com'.
SELECT student_name from students
    where email like '%example.com%' ;

    --here i I use this % pattern matching wildcard character 
    -- to find students whose email contain 'example.com'







------------------------ READ TABLE DATA ----------------------

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollment;