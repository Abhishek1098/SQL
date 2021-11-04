drop table if exists Request;

drop table if exists Verification;

drop table if exists Response;

drop table if exists Student;

drop table if exists Circumstance;

drop table if exists Course;

CREATE TABLE Student (StudentID INTEGER PRIMARY KEY, Email STRING, StudentName STRING);

CREATE TABLE Course (CourseID STRING PRIMARY KEY NOT NULL, Instructor STRING NOT NULL, Email STRING NOT NULL);

CREATE TABLE Circumstance (CircumstanceID INTEGER PRIMARY KEY NOT NULL, CircumstanceDesc STRING NOT NULL);

CREATE TABLE Request (RequestID INTEGER PRIMARY KEY NOT NULL, StudentID INTEGER REFERENCES Student (StudentID) NOT NULL, CircumstanceID INTEGER REFERENCES Circumstance (CircumstanceID) NOT NULL, CircStartDate DATE NOT NULL, CircEndDate DATE NOT NULL, CourseID1 STRING, CourseID2 STRING, CourseID3 STRING, CourseID4 STRING);

INSERT INTO Student
VALUES (111223333, "student1@university.edu", "Stu One");

INSERT INTO Student
VALUES (222334444, "student2@university.edu", "Stu Two");

INSERT INTO Student
VALUES (333445555, "student3@university.edu", "Stu Three");

INSERT INTO Student
VALUES (444556666, "student4@university.edu", "Stu Four");

INSERT INTO Student
VALUES (555667777, "student5@university.edu", "Stu Five");

INSERT INTO Student
VALUES (666778888, "student6@university.edu", "Stu Six");

INSERT INTO Student
VALUES (777889999, "student7@university.edu", "Stu Seven");

INSERT INTO Student
VALUES (888990000, "student8@university.edu", "Stu Eight");

INSERT INTO COURSE
VALUES ("00:111:222:33", "Instructor One", "instructor1@university.edu");

INSERT INTO COURSE
VALUES ("11:222:333:44", "Instructor Two", "instructor2@university.edu");

INSERT INTO COURSE
VALUES ("22:333:444:55", "Instructor Three", "instructor3@university.edu");

INSERT INTO COURSE
VALUES ("33:444:555:66", "Instructor Four", "instructor4@university.edu");

INSERT INTO COURSE
VALUES ("44:555:666:77", "Instructor Five", "instructor5@university.edu");

INSERT INTO COURSE
VALUES ("55:666:777:88", "Instructor Six", "instructor6@university.edu");

INSERT INTO COURSE
VALUES ("66:777:888:99", "Instructor Seven", "instructor7@university.edu");

INSERT INTO COURSE
VALUES ("77:888:999:00", "Instructor Eight", "instructor8@university.edu");

INSERT INTO COURSE
VALUES ("88:999:000:11", "Instructor Nine", "instructor9@university.edu");


INSERT INTO Circumstance
VALUES("1", "Circumstance One");

INSERT INTO Circumstance
VALUES("2", "Circumstance Two");

INSERT INTO Circumstance
VALUES("3", "Circumstance Three");

INSERT INTO Circumstance
VALUES("4", "Circumstance Four");


INSERT INTO Request (RequestID, StudentID, CircumstanceID, CircStartDate, CircEndDate, CourseID1, CourseID2)
VALUES (1, 111223333, 4, 12/1/2020, 12/1/2020, "44:555:666:77", "77:888:999:00");

INSERT INTO Request (RequestID, StudentID, CircumstanceID, CircStartDate, CircEndDate, CourseID1, CourseID2)
VALUES (2, 222334444, 2, 12/2/2020, 12/3/2020, "33:444:555:66", "44:555:666:77");

INSERT INTO Request
VALUES (3, 333445555, 2, 12/3/2020, 12/3/2020, "55:666:777:88", "66:777:888:99", "77:888:999:00", "88:999:000:11");

INSERT INTO Request(RequestID, StudentID, CircumstanceID, CircStartDate, CircEndDate, CourseID1, CourseID2)
VALUES (4, 444556666, 1, 12/4/2020, 12/9/2020, "22:333:444:55", "55:666:777:88");

INSERT INTO Request
VALUES (5, 555667777, 3, 12/5/2020, 12/6/2020, "11:222:333:44", "33:444:555:66", "55:666:777:88", "77:888:999:00");

INSERT INTO Request (RequestID, StudentID, CircumstanceID, CircStartDate, CircEndDate, CourseID1)
VALUES (6, 666778888, 3, 12/6/2020, 12/8/2020, "33:444:555:66");

INSERT INTO Request (RequestID, StudentID, CircumstanceID, CircStartDate, CircEndDate, CourseID1, CourseID2)
VALUES (7, 777889999, 4, 12/7/2020, 12/7/2020, "00:111:222:33", "55:666:777:88");

INSERT INTO Request (RequestID, StudentID, CircumstanceID, CircStartDate, CircEndDate, CourseID1, CourseID2, CourseID3)
VALUES (8, 888990000, 1, 12/8/2020, 12/12/2020, "00:111:222:33", "33:444:555:66", "88:999:000:11");

create table Response (
    RequestID INTEGER,
    RecipientEmail VARCHAR(50),
    Subject VARCHAR(50),
    Message VARCHAR(1000)
);

create table Verification (
    RequestID INTEGER,
    Verified VARCHAR(1),
    primary key (RequestID)
);

INSERT INTO Verification
select distinct RequestID, 'N' from Request order by RequestID;

UPDATE Verification
SET Verified = 'Y' 
WHERE RequestID = 4;

UPDATE Verification
SET Verified = 'Y' 
WHERE RequestID = 5;

UPDATE Verification
SET Verified = 'Y' 
WHERE RequestID = 6;

UPDATE Verification
SET Verified = 'Y' 
WHERE RequestID = 7;

INSERT INTO Response
SELECT 
Verification.RequestID, 
Student.Email as recipientEmail, 
"Unverified Circumstance" as Subject,
"Dear " || Student.StudentName || ": We are writing to inform you that we cannot verify your circumstances and, thus, unable to write letters of accomodations" as Message
FROM Verification
JOIN Request ON Verification.RequestID = Request.RequestID AND Verification.Verified = 'N'
JOIN Student ON Request.StudentID = Student.StudentID;

INSERT INTO Response
SELECT 
Verification.RequestID, 
Course.Email as recipientEmail, 
"Request for Accomodations" as Subject, 
"Dear " || Course.Instructor || ": We are writing on behalf of " || Student.StudentName || ", who is in your " || Course.CourseID || " class, to request accommodations for his verified circumstance," || Circumstance.CircumstanceDesc as Message
FROM Verification
JOIN Request ON Verification.RequestID = Request.RequestID AND Verification.Verified = 'Y'
JOIN Student ON Request.StudentID = Student.StudentID
JOIN Circumstance ON Request.CircumstanceID = Circumstance.CircumstanceID
JOIN Course ON Course.CourseID = Request.CourseID1;

select * from Response;