drop database if exists `Testing_System_1`;
create database `Testing_System_1`;
use `Testing_System_1`;

-- Tạo table Department
drop table if exists `Department`;
create table `Department` (
	DepartmentID TINYINT unsigned primary key auto_increment,
    DepartmentName VARCHAR(50)
);

-- Tạo table Position
drop table if exists `Position`;
create table `Position` (
	PositionID TINYINT unsigned primary key auto_increment,
    PositionName ENUM('Dev', 'Test', 'Scrum Master', 'PM')
);

-- Tạo table Account
drop table if exists `Account`;
create table `Account` (
	AccountID TINYINT unsigned primary key auto_increment,
    Email VARCHAR(50) unique key,
    User_name VARCHAR(50) unique key,
    Full_name VARCHAR(50),
    DepartmentID TINYINT unsigned,
    PositionID TINYINT unsigned,
    CreateDate DATE
);

-- Tạo table Group
drop table if exists `Group`;
create table `Group` (
	GroupID TINYINT unsigned primary key auto_increment,
    GroupName VARCHAR(50),
    CreatorID TINYINT unsigned,
    CreateDate DATE
);
-- Tạo table Group Account
drop table if exists `GroupAccount`;
create table `GroupAccount` (
	GroupID TINYINT unsigned primary key,
    AccountID TINYINT unsigned,
    JoinDate DATE
);

-- Tạo table Type Question
drop table if exists `TypeQuestion`;
create table `TypeQuestion` (
	TypeID TINYINT unsigned primary key auto_increment,
	TypeName ENUM('Essay', 'Multiple Choices')
);

-- Tạo table Category Question
drop table if exists `CategoryQuestion`;
create table `CategoryQuestion` (
	CategoryID TINYINT unsigned primary key auto_increment,
    CategoryName VARCHAR(50)
);

-- Tạo table Question
drop table if exists `Question`;
create table `Question` (
	QuestionID TINYINT unsigned primary key,
    Content VARCHAR(100),
    CategoryID TINYINT unsigned,
    TypeID TINYINT unsigned,
    CreatorID TINYINT unsigned,
    CreateDate DATE
);

-- Tạo table Answer
drop table if exists `Answer`;
create table `Answer` (
	AnswerID TINYINT unsigned primary key auto_increment,
    Content VARCHAR(100),
    QuestionID TINYINT unsigned,
    isCorrect BIT
);

-- Tạo table Exam
drop table if exists `Exam`;
create table `Exam` (
	ExamID TINYINT unsigned primary key auto_increment,
    Code VARCHAR(10),
	Title VARCHAR(50),
    CategoryID TINYINT unsigned,
    Duration time,
    CreatorID TINYINT unsigned,
    CreateDate DATE
);

-- Tạo table Exam Question
drop table if exists `ExamQuestion`;
create table `ExamQuestion` (
	ExamID TINYINT unsigned primary key,
    QuestionID TINYINT unsigned
);
