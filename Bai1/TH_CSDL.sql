CREATE DATABASE TH_StudentTable
GO
CREATE TABLE Students(
	student_id INT PRIMARY KEY,
	student_name NVARCHAR(50),
	student_address NVARCHAR(255),
	student_age INT
)
GO
INSERT INTO Students(student_id,student_name,student_address,student_age) VALUES (1,'Mohamed Salah','Egypt',28)
INSERT INTO Students(student_id,student_name,student_address,student_age) VALUES (2,'Sadio Mane','Senegal',28)
INSERT INTO Students(student_id,student_name,student_address,student_age) VALUES (3,'Roberto Firmino','Brasil',29)
INSERT INTO Students(student_id,student_name,student_address,student_age) VALUES (4,'Jordan Henderson','England',29)
INSERT INTO Students(student_id,student_name,student_address,student_age) VALUES (5,'Virgil Van Dijk','Netherland',29)
INSERT INTO Students(student_id,student_name,student_address,student_age) VALUES (6,'Georginio Wijnaldum','Netherland',30)
GO
DELETE Students WHERE student_age>29 AND student_age<31
GO
UPDATE Students
SET student_age = 30
WHERE student_id = 4;
GO
SELECT * FROM Students