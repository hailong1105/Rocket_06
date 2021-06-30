drop database if exists `Testing_System_1`;
create database `Testing_System_1`;
use `Testing_System_1`;

-- Tạo table Department
create table `Department` (
	DepartmentID TINYINT unsigned,
    DepartmentName VARCHAR(50)
);

-- Tạo table Position
create table `Position1` (
	PositionID TINYINT unsigned,
    PositionName ENUM('Dev', 'Test', 'Scrum Master', 'PM')
);

-- Tạo table Account
create table `Account` (
	AccountID TINYINT unsigned,
    Email VARCHAR(50),
    User_name VARCHAR(50),
    Full_name VARCHAR(50),
    DepartmentID TINYINT unsigned,
    PositionID TINYINT unsigned,
    CreateDate DATE
);

-- Tạo table Group
create table `Group` (
	GroupID TINYINT unsigned,
    GroupName VARCHAR(50),
    CreatorID TINYINT unsigned,
    CreateDate DATE
);

-- Tạo table Group Account
create table `GroupAccount` (
	GroupID TINYINT unsigned,
    AccountID TINYINT unsigned,
    JoinDate DATE
);

-- Tạo table Type Question
create table `TypeQuestion` (
	TypeID TINYINT unsigned,
	TypeName ENUM('Essay', 'Multiple Choices')
);

-- Tạo table Category Question
create table `CategoryQuestion` (
	CategoryID TINYINT unsigned,
    CategoryName VARCHAR(50)
);

-- Tạo table Question
create table `Question` (
	QuestionID TINYINT unsigned,
    Content VARCHAR(100),
    CategoryID TINYINT unsigned,
    TypeID TINYINT unsigned,
    CreatorID TINYINT unsigned,
    CreateDate DATE
);

-- Tạo table Answer
create table `Answer` (
	AnswerID TINYINT unsigned,
    Content VARCHAR(100),
    QuestionID TINYINT unsigned,
    isCorrect BIT
);

-- Tạo table Exam
create table `Exam` (
	ExamID TINYINT unsigned,
    Code VARCHAR(10),
	Title VARCHAR(50),
    CategoryID TINYINT unsigned,
    Duration time,
    CreatorID TINYINT unsigned,
    CreateDate DATE
);

-- Tạo table Exam Question
create table `ExamQuestion` (
	ExamID TINYINT unsigned,
    QuestionID TINYINT unsigned
);
