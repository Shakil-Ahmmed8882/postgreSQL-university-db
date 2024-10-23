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



------------------------ READ TABLE DATA ----------------------

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollment;