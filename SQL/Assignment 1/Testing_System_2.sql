use `Testing_System_1`

-- Thêm dữ liệu vào bảng Department
insert into Department(DepartmentID, DepartmentName)
values 
(1, N'Sale'         );
(2, N'Marketing'    );
(3, N'Bảo vệ'       );
(4, N'Tài chính'    );
(5, N'Trưởng phòng' );
-- Thêm dữ liệu vào bảng Position
insert into Position1(PositionID, PositionName)
values
(1, N'Dev'          );
(2, N'Test'         );
(3, N'Scrum Master' );
(4, N'PM'           );
-- Thêm dữ liệu vào bảng Account
insert into Account(AccountID, Email, User_name, Full_name, DepartmentID, PositionID, CreateDate)
values
(1, abc@gmail.com, Nam0102, Nguyen Van Nam, 3, 1, 01/02/2021);
(2, bcd@gmail.com, Linh0203, Nguyen Thi Khanh Linh, 1, 1, 02/03/2021);
(3, cde@gmail.com, Minh0304, Nguyen Tien Minh, 3, 4, 03/04/2021);
(4, def@gmail.com, Hang0405, Nguyen Minh Hang, 4, 2, 04/05/2021);
(5, efg@gmail.com, Thang0506, Nguyen Viet Thang, 5, 2, 05/06/2021);
-- Thêm dữ liệu vào bảng Group
insert into Group(GroupID, GroupName, CreatorID, CreateDate)
values
(1, Group1, 11, 11/02/2021);
(2, Group2, 12, 12/02/2021);
(3, Group3, 13, 13/02/2021);
(4, Group4, 14, 14/02/2021);
(5, Group5, 15, 15/02/2021);
-- Thêm dữ liệu vào bảng Group Account
insert into GroupAccount(GroupID, AccountID, JoinDate)
values
(1, 1, 02/05/2021);
(2, 2, 03/04/2021);
(3, 3, 04/05/2021);
(4, 4, 05/06/2021);
(5, 5, 06/07/2021);
-- Thêm dữ liệu vào bảng Type Question
insert into TypeQuestion(TypeID, TypeName)
values 
(1, Essay);
(2, Multiple Choices);
(3, Multiple Choices);
(4, Essay);
(5, Essay);
-- Thêm dữ liệu vào bảng Category Question
insert into CategoryQuestion(CategoryID, CategoryName)
values
(12, Category1);
(13, Category2);
(14, Category3);
(15, Category4);
(16, Category5);
-- Thêm dữ liệu vào bảng Question
insert into Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
values
(1, Câu hỏi thứ nhất, 12, 11, 30/04/2021);
(2, Câu hỏi thứ hai, 13, 12, 21/05/2021);
(3, Câu hỏi thứ ba, 14, 13, 22/06/2021);
(4, Câu hỏi thứ tư, 15, 14, 24/08/2021);
(5, Câu hỏi thứ năm, 16, 15, 25/10/2021);
-- Thêm dữ liệu vào bảng Answer
insert into Answer(Answer ID, Content, QuestionID, isCorrect)
values
(1, Câu trả lời thứ nhất, 1, 1);
(2, Câu trả lời thứ hai, 2, 0);
(3, Câu trả lời thứ ba, 3, 1);
(4, Câu trả lời thứ tư, 4, 1);
(5, Câu trả lời thứ năm, 5, 0);
-- Thêm dữ liệu vào bảng Exam
insert into Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate)
values
(1, 39210, Title1, 12, 3600, 11, 10/07/2021);
(2, 42914, Title2, 13, 3600, 12, 11/07/2021);
(3, 52023, Title3, 14, 3600, 13, 12/07/2021);
(4, 49423, Title4, 15, 3600, 14, 20/07/2021);
(5, 95302, Title5, 16, 3600, 15, 22/07/2021);
-- Thêm dữ liệu vào bảng Exam Question
insert into ExamQuestion(ExamID, QuestionID)
values
(01, 1);
(02, 2);
(03, 3);
(04, 4);
(05, 5);
