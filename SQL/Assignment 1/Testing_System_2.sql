use `Testing_System_1`;

-- Thêm dữ liệu vào bảng Department
alter table `Department` auto_increment = 1;
insert into Department(DepartmentID, DepartmentName)
values 
(1, 'Sale'),
(2, 'Marketing'),
(3, 'Bảo vệ'),
(4, 'Tài chính'),
(5, 'Trưởng phòng');
-- Thêm dữ liệu vào bảng Position
insert into `Position`(PositionID, PositionName)
values
(1, 'Dev'),
(2, 'Test'),
(3, 'Scrum Master'),
(4, 'PM');
-- Thêm dữ liệu vào bảng Account
insert into Account(Email, User_name, Full_name, DepartmentID, PositionID, CreateDate)
values
('abc@gmail.com', 'Nam0102', 'Nguyen Van Nam', 3, 1, '2008-02-01'),
('bcd@gmail.com', 'Linh0203', 'Nguyen Thi Khanh Linh', 1, 1, '2011-03-02'),
('cde@gmail.com', 'Minh0304', 'Nguyen Tien Minh', 3, 4, '2007-04-03'),
('def@gmail.com', 'Hang0405', 'Nguyen Minh Hang', 4, 2, '2009-05-04'),
('efg@gmail.com', 'Thang0506', 'Nguyen Viet Thang', 5, 2, '2013-06-05');
-- Thêm dữ liệu vào bảng Group
insert into Group(GroupID, GroupName, CreatorID, CreateDate)
values
(1, 'Group1', 11, '2019-02-11'),
(2, 'Group2', 12, '2019-02-12'),
(3, 'Group3', 13, '2019-02-13'),
(4, 'Group4', 14, '2019-02-14'),
(5, 'Group5', 15, '2019-02-15');
-- Thêm dữ liệu vào bảng Group Account
insert into GroupAccount(GroupID, AccountID, JoinDate)
values
(1, 1, '2019-05-02'),
(2, 2, '2019-04-03'),
(3, 3, '2019-05-04'),
(4, 4, '2019-06-05'),
(5, 5, '2021-07-06');
-- Thêm dữ liệu vào bảng Type Question
insert into TypeQuestion(TypeID, TypeName)
values 
(1, 'Essay'),
(2, 'Multiple Choices'),
(3, 'Multiple Choices'),
(4, 'Essay'),
(5, 'Essay');
-- Thêm dữ liệu vào bảng Category Question
insert into CategoryQuestion(CategoryID, CategoryName)
values
(12, 'Category1'),
(13, 'Category2'),
(14, 'Category3'),
(15, 'Category4'),
(16, 'Category5');
-- Thêm dữ liệu vào bảng Question
drop table if exists Question;
insert into Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
values
(1, 'Câu hỏi thứ nhất', 12, 11, '2019-04-30'),
(2, 'Câu hỏi thứ hai', 13, 12, '2019-05-21'),
(3, 'Câu hỏi thứ ba', 14, 13, '2019-06-22'),
(4, 'Câu hỏi thứ tư', 15, 14, '2019-07-23'),
(5, 'Câu hỏi thứ năm', 16, 15, '2019-10-25');
-- Thêm dữ liệu vào bảng Answer
insert into Answer(Answer ID, Content, QuestionID, isCorrect)
values
(1, Câu trả lời thứ nhất, 1, 1),
(2, Câu trả lời thứ hai, 2, 0),
(3, Câu trả lời thứ ba, 3, 1),
(4, Câu trả lời thứ tư, 4, 1),
(5, Câu trả lời thứ năm, 5, 0);
-- Thêm dữ liệu vào bảng Exam
insert into Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate)
values
(1, 39210, Title1, 12, 3600, 11, '2019-07-10'),
(2, 42914, Title2, 13, 3600, 12, '2019-07-11'),
(3, 52023, Title3, 14, 3600, 13, '2019-07-12'),
(4, 49423, Title4, 15, 3600, 14, '2019-07-13'),
(5, 95302, Title5, 16, 3600, 15, '2019-07-14');
-- Thêm dữ liệu vào bảng Exam Question
insert into ExamQuestion(ExamID, QuestionID)
values
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6);
