-- SQLBook: Code
-- Welcome to the University Course Management System Final Project

SHOW DATABASES;

CREATE DATABASE university_course_management;

USE university_course_management;





-- Table Creation

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);




CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    BirthDate DATE,
    EnrollmentDate DATE NOT NULL
);




CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL,
    Credits INT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);




CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    DepartmentID INT NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);




CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE NOT NULL,
    UNIQUE (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE
);















-- Data Insertion

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Information Technology');




INSERT INTO Students (StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01'),
(3, 'Michael', 'Brown', 'michael.brown@email.com', '2001-03-10', '2023-08-01'),
(4, 'Emily', 'Davis', 'emily.davis@email.com', '2002-06-18', '2023-08-01'),
(5, 'David', 'Wilson', 'david.wilson@email.com', '2001-11-08', '2024-01-15'),
(6, 'Sophia', 'Taylor', 'sophia.taylor@email.com', '1998-09-12', '2020-08-01'),
(7, 'Liam', 'Anderson', 'liam.anderson@email.com', '2002-02-14', '2024-08-01'),
(8, 'Olivia', 'Thomas', 'olivia.thomas@email.com', '2001-07-20', '2022-08-01'),
(9, 'Ethan', 'Martin', 'ethan.martin@email.com', '2002-04-05', '2023-01-15'),
(10, 'Ava', 'White', 'ava.white@email.com', '1999-12-30', '2021-01-15'),
(11, 'Noah', 'Harris', 'noah.harris@email.com', '2003-08-22', '2025-01-15'),
(12, 'Mia', 'Clark', 'mia.clark@email.com', '2002-10-09', '2024-08-01');





INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits) VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 1, 4),
(103, 'Calculus', 2, 4),
(104, 'Statistics', 2, 3),
(105, 'Web Development', 3, 3);




INSERT INTO Instructors (InstructorID, FirstName, LastName, Email, DepartmentID, Salary) VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1, 75000.00),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2, 65000.00),
(3, 'Carol', 'Miller', 'carol.miller@univ.com', 1, 88000.00);





INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES
(1, 1, 101, '2022-08-01'),
(2, 1, 102, '2022-08-01'),
(3, 2, 101, '2021-08-01'),
(4, 2, 102, '2021-08-01'),
(5, 3, 101, '2023-08-01'),
(6, 4, 101, '2023-08-01'),
(7, 5, 101, '2024-01-15'),
(8, 5, 103, '2024-01-15'),
(9, 6, 101, '2020-08-01'),
(10, 7, 101, '2024-08-01'),
(11, 8, 101, '2022-08-01'),
(12, 9, 101, '2023-01-15'),
(13, 10, 101, '2021-01-15'),
(14, 11, 101, '2025-01-15'),
(15, 12, 101, '2024-08-01');
















-- 1 :- CRUD OPERATIONS ON ALL TABLES


-- 1.1 CREATE: Insert one record into every table
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (4, 'Physics');



INSERT INTO Students (StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate)
VALUES (13, 'Riya', 'Patel', 'riya.patel@email.com', '2003-05-10', '2026-01-10');



INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits)
VALUES (106, 'Physics Basics', 4, 3);



INSERT INTO Instructors (InstructorID, FirstName, LastName, Email, DepartmentID, Salary)
VALUES (4, 'Emma', 'Wilson', 'emma.wilson@univ.com', 4, 60000.00);



INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES (16, 13, 106, '2026-01-10');




-- 1.2 READ: Display data from all tables
SELECT * FROM Departments;

SELECT * FROM Students;

SELECT * FROM Courses;

SELECT * FROM Instructors;

SELECT * FROM Enrollments;



-- 1.3 UPDATE: Update one record in every table
UPDATE Departments
SET DepartmentName = 'Physics and Astronomy'
WHERE DepartmentID = 4;



UPDATE Students
SET Email = 'riya.patel.new@email.com'
WHERE StudentID = 13;



UPDATE Courses
SET Credits = 4
WHERE CourseID = 106;



UPDATE Instructors
SET Salary = 62000.00
WHERE InstructorID = 4;



UPDATE Enrollments
SET EnrollmentDate = '2026-01-15'
WHERE EnrollmentID = 16;



-- 1.4 DELETE: Delete the test records from all tables
DELETE FROM Enrollments
WHERE EnrollmentID = 16;



DELETE FROM Students
WHERE StudentID = 13;



DELETE FROM Courses
WHERE CourseID = 106;



DELETE FROM Instructors
WHERE InstructorID = 4;



DELETE FROM Departments
WHERE DepartmentID = 4;















-- 2 :- STUDENTS ENROLLED AFTER 2022


SELECT StudentID, FirstName, LastName, EnrollmentDate
FROM Students
WHERE EnrollmentDate > '2022-12-31';








-- 3 :- MATHEMATICS COURSES (LIMIT 5)


SELECT c.CourseID, c.CourseName, c.Credits
FROM Courses c
JOIN Departments d ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
LIMIT 5;








-- 4 :- COURSES WITH MORE THAN 5 STUDENTS


SELECT c.CourseID,
       c.CourseName,
       COUNT(e.StudentID) AS TotalStudents
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
HAVING COUNT(e.StudentID) > 5;








-- 5 :- STUDENTS ENROLLED IN BOTH SQL AND DATA STRUCTURES


SELECT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures')
GROUP BY s.StudentID, s.FirstName, s.LastName
HAVING COUNT(DISTINCT c.CourseName) = 2;







-- 6 :- STUDENTS ENROLLED IN SQL OR DATA STRUCTURES


SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures');







-- 7 :- AVERAGE CREDITS OF ALL COURSES


SELECT ROUND(AVG(Credits), 2) AS AverageCredits
FROM Courses;







-- 8 :- MAXIMUM SALARY IN COMPUTER SCIENCE DEPARTMENT


SELECT MAX(i.Salary) AS MaximumSalary
FROM Instructors i
JOIN Departments d ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';







 
-- 9 :- NUMBER OF STUDENTS ENROLLED IN EACH DEPARTMENT


SELECT d.DepartmentID,
       d.DepartmentName,
       COUNT(DISTINCT e.StudentID) AS TotalStudents
FROM Departments d
LEFT JOIN Courses c ON d.DepartmentID = c.DepartmentID
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY d.DepartmentID, d.DepartmentName;







-- 10 :- INNER JOIN - STUDENTS AND THEIR COURSES


SELECT s.StudentID,
       s.FirstName,
       s.LastName,
       c.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;










-- 11 :- LEFT JOIN - ALL STUDENTS AND THEIR COURSES


SELECT s.StudentID,
       s.FirstName,
       s.LastName,
       c.CourseName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses c ON e.CourseID = c.CourseID;







-- 12 :- SUBQUERY - STUDENTS IN COURSES WITH MORE THAN 10 STUDENTS


SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.CourseID IN (
    SELECT CourseID
    FROM Enrollments
    GROUP BY CourseID
    HAVING COUNT(StudentID) > 10
);







-- 13 :- EXTRACT YEAR FROM STUDENT ENROLLMENT DATE


SELECT StudentID,
       FirstName,
       LastName,
       EnrollmentDate,
       YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students;








-- 14 :- CONCATENATE INSTRUCTOR FIRST AND LAST NAME


SELECT InstructorID,
       CONCAT(FirstName, ' ', LastName) AS InstructorName,
       Email
FROM Instructors;







-- 15 :- RUNNING TOTAL OF STUDENT-COURSE ENROLLMENTS


SELECT EnrollmentID,
       StudentID,
       CourseID,
       EnrollmentDate,
       COUNT(*) OVER (ORDER BY EnrollmentID) AS RunningTotalEnrollments
FROM Enrollments;







-- 16 :- SENIOR OR JUNIOR STUDENT LABEL


SELECT StudentID,
       FirstName,
       LastName,
       EnrollmentDate,
       CASE
           WHEN TIMESTAMPDIFF(YEAR, EnrollmentDate, CURDATE()) > 4 THEN 'Senior'
           ELSE 'Junior'
       END AS StudentLevel
FROM Students;
