SELECT * FROM testing_system_1.account;
-- Question 1
insert into Account( Email, User_name, Full_name, DepartmentID, PositionID, CreateDate)
values
-- (6, 'ghi@gmail.com', 'Khanh0607', 'Nguyen Minh Khanh', 2, 4, '2021-07-06'),
-- (7, 'hij@gmail.com', 'Dang0708', 'Nguyen Hai Dang', 5, 2, '2021-08-07'),
-- (8, 'jkl@gmail.com', 'Vinh0809', 'Vu Khanh Vinh', 4, 3, '2021-09-08'),
-- (9, 'lmn@gmail.com', 'Quynh0910', 'Nguyen Nhu Quynh', 2, 5, '2021-10-09'),
-- (10, 'mno@gmail.com', 'Dung1011', 'Nguyen Tuan Dung', 5, 2, '2021-11-10'),
('opq@gmail.com', 'Long1112', 'Nguyen Hoang Long', 2, 1, '2021-12-11'),
('prs@gmail.com', 'Bac1201', 'Nguyen Van Bac', 4, 1, '2021-12-01'),
('srt@gmail.com', 'Sang1202', 'Tran Tan Sang', 5, 4, '2021-12-02'),
('rtu@gmail.com', 'Viet1203', 'Nguyen Tien Viet', 3, 5, '2021-12-03'),
('tuv@gmail.com', 'Ngan1204', 'Nguyen Thi Kim Ngan', 4, 2, '2021-12-04');

insert into Department(DepartmentName)
values
('Phòng sale'),
('Kĩ thuật'),
('Tài chính'),
('Thư kí'),
('Giám đốc');
insert into Position1(PositionName)
values
('Dev A'),
('Dev B'),
('Scrum Master 1'),
('Scrum Master 2'),
('Test 1');
insert into Group(GroupName, CreatorID, CreateDate)
values
(Group6, 16, '2019-02-11'),
(Group7, 17, '2019-02-12'),
(Group8, 18, '2019-02-13'),
(Group9, 19, '2019-02-14'),
(Group10, 20, '2019-02-15');
insert into GroupAccount(JoinDate)
values
('2019-05-23'),
('2019-07-14'),
('2019-08-22'),
('2019-01-18'),
('2021-09-12');
insert into TypeQuestion(TypeName)
values 
('Multiple Choices'),
('Essay'),
('Essay'),
('Multiple Choices'),
('Essay');
insert into CategoryQuestion(CategoryID, CategoryName)
values
('Category6'),
('Category7'),
('Category8'),
('Category9'),
('Category10');
insert into Question(Content, CategoryID, TypeID, CreatorID, CreateDate)
values
(Câu hỏi thứ sáu, 17, 22, '2019-03-23'),
(Câu hỏi thứ bảy, 18, 23, '2019-07-29'),
(Câu hỏi thứ tám, 19, 24, '2019-02-12'),
(Câu hỏi thứ chín, 20, 25, '2019-05-1'),
(Câu hỏi thứ mười,  21, 26, '2019-10-30');
insert into Answer(Content, QuestionID, isCorrect)
values
(Câu trả lời thứ sáu, 6, 0),
(Câu trả lời thứ bảy, 7, 1),
(Câu trả lời thứ tám, 8, 0),
(Câu trả lời thứ chín, 9, 0),
(Câu trả lời thứ mười, 10, 1);
insert into Exam(Code, Title, CategoryID, Duration, CreatorID, CreateDate)
values
(69342, Title6, 17, 3600, 16, '2019-08-18'),
(34320, Title7, 18, 3600, 17, '2019-07-19'),
(94013, Title8, 19, 3600, 18, '2019-07-20'),
(52994, Title9, 20, 3600, 19, '2019-07-21'),
(50319, Title10, 21, 3600, 20, '2019-07-22');
insert into ExamQuestion(QuestionID)
values
(6),
(7),
(8),
(9),
(10);
-- Question 2
select * from Department;
-- Question 3
select DepartmentID from `Department` where DepartmentName = 'Sale'
-- Question 4
select * from `Account` where character_length(Full_name) = (Select max(character_length(Full_name)) from `Account`);
-- Question 5
select Full_name, AccountID, character_length(Full_name) as 'Name Length' from `Account` where `DepartmentID` = 3 order by `Name Length` desc;
-- Question 6
select GroupName, date(CreateDate) from `Group` where CreateDate <= '2019-12-20';
-- Question 7
select QuestionID, COUNT(QuestionID) as 'So cau tra loi' from `Answer` group by QuestionID having `So cau tra loi` >= 4;
-- Question 8
select Code, Title, Duration, date(`CreateDate`) as 'Ngay Tao' from `Exam` where Duration >= 60 and date(CreateDate)< '2019-12-20';
-- Question 9
select * from `Group` order by CreateDate desc limit 5;
-- Question 10
select DepartmentID, COUNT(DepartmentID) AS `So nhan vien` from `Account` group by `DepartmentID` having `DepartmentID` = 2;
-- Question 11
select * from Account where FullName like 'D%o';
-- Question 12
delete from `Exam` where CreateDate < '2019-12-20';
-- Question 13
delete from `Question` where `Content` LIKE 'câu hỏi%';
-- Question 14
update `Account`set `FullName` = 'Nguyễn Bá Lộc', `Email`    = 'loc.nguyenba@vti.com.vn' where `AccountID` = 5;
-- Question 15
update `GroupAccount` set `GroupID` = 4 where `AccountID` = 5;



