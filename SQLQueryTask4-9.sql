CREATE DATABASE School2
GO 
USE School2
GO

CREATE TABLE Groups
(
Id INT PRIMARY KEY IDENTITY,
GroupNo NVARCHAR(20) NOT NULL
)
INSERT INTO Groups
VALUES 
('P302'),
('S150'),
('P113')


CREATE TABLE ExamResults
(
Id INT PRIMARY KEY IDENTITY,
ExamPoint INT NOT NULL,
ExamTime DATETIME2 NOT NULL
)



DROP  TABLE Subjects
CREATE TABLE Subjects
(
Id INT PRIMARY KEY IDENTITY,
ExamResultId INT FOREIGN KEY REFERENCES ExamResults (Id),
Name NVARCHAR(40) NOT NULL
)

INSERT INTO Exams
VALUES
(1,'Front-end'),
(2,'Back-end'),
(2,'Server'),
(3,'Server'),
(1,'Back-end')


CREATE TABLE Exams
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(20) NOT NULL,
SubjectId INT FOREIGN KEY REFERENCES Subjects(Id)
)

INSERT INTO Subjects
VALUES
('Programming',4),
('Design',5),
('Server',5),
('Server',6),
('Programming',3)


CREATE TABLE Students
(
Id INT PRIMARY KEY IDENTITY,
FullName NVARCHAR(40) NOT NULL,
GroupId INT FOREIGN KEY REFERENCES Groups(Id),
ExamId INT FOREIGN KEY REFERENCES Subjects(Id)
)
INSERT INTO Students
VALUES
('Elvin Bilalov',1,4),
('Amin Israfilzade',2,4),
('Rashad Abbasov',3,5),
('Tural Ispatov',1,6),
('Maqsud Muslumzade',2,5)

ALTER TABLE Students
ADD SubjectId  INT FOREIGN KEY REFERENCES Subjects(Id)

SELECT * FROM Students
LEFT JOIN Groups
ON GroupId=Groups.Id

SELECT *,(SELECT COUNT(Id) FROM Exams WHERE Students.Id=Subjects.ExamId) AS EXAMCOUNT FROM Students