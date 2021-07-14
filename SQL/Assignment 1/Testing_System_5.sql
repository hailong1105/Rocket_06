-- Q1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
create view PMT as (
select accountID, Full_name, DepartmentName 
from Account A
join Department D on A.PositionID = D.DepartmentID
group by AccountID
having DepartmentName = 'Sale');

select * from PMT;

-- Q2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
with CTE_PMT2 as (
select A.AccountID, A.Full_name, count(groupID)
from `account`A
join `groupaccount`B
using(AccountID)
group by AccountID)
select * from CTE_PMT2;

-- Q3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
create view v_long_content as
select * from question
where character_length(Content) > 10;

drop view v_long_content;

begin work;
delete from v_long_content;
select * from v_long_content;
select * from question;
rollback ;

select * from v_account_join_most_group;

-- Q4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
create view v_department_has_most_member as
with CTE_department_count as (
	select count(AccountID) as numOfMem, A.DepartmentID, DepartmentName
    from Department D 
    left join `Account`A on D.DepartmentID = A.DepartmentID
    group by D.DepartmentID
)

select * from CTE_department_count where numOfMem = (select max(numOfMem) from CTE_department_count);

select * from v_department_has_most_member;

-- Q5: Tạo view có chứa tất cả các câu hỏi do user họ Nguyễn tạo
create view v_all_Nguyen_questions as
select A.Full_name as creator, Q.QuestionID, Q.Content, Q.CategoryID, Q.TypeID, Q.CreatorID, Q.CreateDate
from question Q
join `Account`A on Q.CreatorID = A.AccountID
where A.Full_name like 'Nguyen%';

select * from v_all_Nguyen_questions;