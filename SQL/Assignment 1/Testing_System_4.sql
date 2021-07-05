use `testing_system_1`;
-- Bài 1: Join
-- Q1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ 

##Noi bang => `account` A join `department` D ON A.DepartmentID = D.DepartmentID
select A.*, D.* from `account` A join `department` D ON A.DepartmentID = D.DepartmentID;

-- Q2: Viết lệnh để lấy ra các thông tin các account được tạo sau ngày 20/12/2010
select * from `account` where CreateDate < '2010-12-20';

-- Q3: Viết lệnh để lấy ra tất cả các Dev
select A.Full_name, A.Email, P.PositionName
from `account`A
join `Position` P on A.PositionID = P.PositionID
where P.PositionName = 'Dev';
-- Q4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
select D.DepartmentName, count(a.DepartmentID) as SL from account A
join department D on a.DepartmentID = D.DepartmentID
group by a.DepartmentID
having count(A.DepartmentID) > 3;
-- Q5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
select E.QuestionID, Q.Content from examquestion E
join question Q on Q.QuestionID = E.QuestionID
group by E.QuestionID
having count(E.QuestionID) = (select max(countQues) as maxcountQues from (select count(E.QuestionID) as countQues from examquestion E 
group by E.QuestionID) as countTable);
-- Q6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question?
select cq.CategoryID, cq.CategoryName, count(q.CategoryID) from CategoryQuestion cq
join question q on cq.CategoryID = q.CategoryID
group by q.CategoryID;
-- Q7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam?
select q.QuestionID, q.Content, count(eq.QuestionID) from ExamQuestion eq
right join question q on q.QuestionID = eq.QuestionID
group by q.QuestionID;
-- Q8: Lấy ra Question có nhiều câu trả lời nhất
select Q.QuestionID, Q.Content, count(A.QuestionID) from Answer A
join question Q on Q.QuestionID = A.QuestionID
group by A.QuestionID
having count(A.QuestionID) = (select max(countQues) from (select count(B.questionID) as countQues from Answer B
group by B.QuestionID) as countAnsw);
-- Q9: Thống kê số lượng account trong mỗi group
select G.GroupID, count(GA.AccountID) as 'So Luong'
from GroupAccount GA
join `Group`G on GA.GroupID = G.GroupID
group by G.GroupID
order by G.GroupID ASC; 
-- Q10: Tìm chức vụ có ít người nhất
select P.PositionID, P.PositionName, count(A.PositionID) as SL from account A
join `Position` P on A.PositionID = P.PositionID
group by A.PositionID
having count(A.PositionID) = (select min(minP) from (select count(B.PositionID) as minP from account B
group by B.PositionID) as minPA);
-- Q11: Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
select D.DepartmentName, P.PositionName, count(*) as 'SoLuong'
from account A 
join Department D on A.DepartmentID = D.DepartmentID
join `Position` P on A.PositionID = P.PositionID
group by D.DepartmentID, P.PositionID;
-- Q12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì,...
select Q.QuestionID, Q.Content, A.Full_name, TQ.TypeName as Author, ANS.Content from question Q
join categoryquestion CQ on Q.CategoryID = CQ.CategoryID
join typequestion TQ on Q.TypeID = TQ.TypeID
join account A on A.AccountID = Q.CreatorID
join Answer as ANS on Q.QuestionID = ANS.QuestionID
order by Q.QuestionID ASC;
-- Q13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
select * from `group` g
left join groupaccount ga on g.groupID = ga.GroupID
where ga.accountID is null;
-- Q14: Lấy ra group không có account nào
	select * from `group` g
    left join groupaccount ga on g.GroupID = ga.GroupID
    where ga.AccountID is null;
-- Q15: Lấy ra group không có account nào
	select * from `groupaccount`ga
    right join `group`g on ga.GroupID = g.GroupID
    where ga.AccountID is null;
-- Q16: Lấy ra question không có answer nào
select * from question where QuestionID not in (select QuestionID from Answer);

select q.QuestionID from answer a 
right join question q on a.QuestionID = q.QuestionID
where a.AnswerID is null;
-- Bài 2: Union
-- Q17: 
-- a. Lấy các account thuộc nhóm thứ nhất
select a.Full_name from `account`a 
join groupaccount ga on a.AccountID = ga.AccountID
where ga.GroupID = 1;
-- b. Lấy các account thuộc nhóm thứ hai
select a.Full_name from `account`a
join groupaccount ga on a.AccountID = ga.AccountID
where ga.GroupID = 2;
-- c. Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
select a.Full_name from `account`a 
join groupaccount ga on a.AccountID = ga.AccountID
where ga.GroupID = 1
union
select a.Full_name from `account`a
join groupaccount ga on a.AccountID = ga.AccountID
where ga.GroupID = 2;
-- Q18: 
-- a. Lấy các group có lớn hơn 5 thành viên
select 	g.GroupName, count(ga.GroupID) as SL
from groupaccount ga
join `Group`g on ga.GroupID = g.GroupID
group by g.GroupID
having count(ga.GroupID) >= 5;
-- b. Lấy các group có nhỏ hơn 7 thành viên
select 	g.GroupName, count(ga.GroupID) as SL
from groupaccount ga
join `Group`g on ga.GroupID = g.GroupID
group by g.GroupID
having count(ga.GroupID) <= 7;
-- c. Ghép 2 kết quả từ câu a) và câu b)
select 	g.GroupName, count(ga.GroupID) as SL
from groupaccount ga
join `Group`g on ga.GroupID = g.GroupID
group by g.GroupID
having count(ga.GroupID) >= 5
union
select 	g.GroupName, count(ga.GroupID) as SL
from groupaccount ga
join `Group`g on ga.GroupID = g.GroupID
group by g.GroupID
having count(ga.GroupID) <= 7;
