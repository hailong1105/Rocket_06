drop table if exists `School`;
create database `School`;
use `School`;

create table `Student` (
	StudentID TINYINT unsigned primary key,
    StudentName VARCHAR(50),
    Age VARCHAR(10),
    Gender BIT
);

create table `Subject` (
	SubjectID TINYINT unsigned primary key,
    SubjectName VARCHAR(50)
);

create table `StudentSubject` (
	StudentID TINYINT unsigned,
    SubjectID TINYINT unsigned,
    Mark VARCHAR(10),
    `Date` Date
);
-- Thêm dữ liệu vào bảng Student
insert into Student(StudentID, StudentName, Age, Gender) 
values 
(10, 'Nguyen Thu Trang', 20, 1),
(11, 'Nguyen Phuong Nam', 19, 0),
(12, 'Nguyen Khanh Linh', 20, 1),
(13, 'Nguyen Trong Dat', 19, 0),
(14, 'Nguyen Mai Linh', 20, 1);
-- Thêm dữ liệu vào bảng Subject
insert into `Subject`(SubjectID, SubjectName)
values
(110, 'Tư tưởng Hồ Chí Minh'),
(111, 'Kinh tế vi mô'),
(112, 'Kinh tế vĩ mô'),
(113, 'Vật Lý Đại Cương'),
(114, 'Cơ sở lập trình'),
(115, 'Cơ sở dữ liệu');
-- Thêm dữ liệu vào bảng StudentSubject
insert into StudentSubject(StudentID, SubjectID, Mark, `Date`)
values
(10, 111, 7.4, '2020-10-11'),
(11, 113, 6.6, '2020-05-10'),
(12, 115, 8.2, '2020-09-05'),
(13, 110, 5.8, '2020-08-02'),
(14, 114, 9.4, '2020-04-11');
