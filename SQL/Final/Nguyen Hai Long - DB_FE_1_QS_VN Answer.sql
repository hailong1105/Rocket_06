-- Q2: Viết lệnh để:
-- a. Lấy tất cả các môn học không có bất kì điểm nào 
select * from `Subject`
where SubjectID not in (
	select s.SubjectID from `Subject`s 
    join StudentSubject ss 
    on s.SubjectID = ss.SubjectID);
-- b. Lấy danh sách các môn học có ít nhất 2 điểm
select SubjectName, count(*) as So_Diem from `Subject`s 
join StudentSubject ss 
on s.SubjectID = ss.SubjectID
group by s.SubjectID
having So_Diem >= 2;
-- Q3: Tạo view có tên là "StudentInfo" lấy các thông tin về học sinh bao gồm: 
-- Student ID,Subject ID, Student Name, Student Age, Student Gender, Subject Name, Mark, Date
-- (Với cột Gender show 'Male' để thay thế cho 0, 'Female' thay thế cho 1 và 'Unknown' thay thế cho null)
DROP VIEW IF EXISTS `StudentInfo`;
CREATE OR REPLACE VIEW `StudentInfo` as
select 
s.StudentID as StudentID,
sbj.SubjectID as SubjectID,
s.StudentName as StudentName,
s.Age as Age,
case s.Gender
	when 0 then 'Male'
    when 1 then 'Female'
    else 'Unknown'
    end,
sbj.SubjectName as SubjectName, Mark, `Date` 
from `Student`s 
left join (`Subject`sbj join StudentSubject StSbj on sbj.SubjectID = StSbj.SubjectID)
on s.StudentID = StSbj.StudentID;
-- Hiển thị view StudentInfo
select * from StudentInfo;
-- Q4: Không sử dụng On Update Cascade & On Delete Cascade
-- a. Tạo trigger cho table Subject có tên là SubjectUpdateID:
-- Khi thay đổi data của cột ID của table Subject, thì giá trị tương ứng với cột SubjectID của table StudentSubject cũng thay đổi theo
delimiter $$
create trigger SubjectUpdateID
before update on `Subject` for each row
begin
	update StudentSubject set SubjectID = new.SubjectID where SubjectID = old.SubjectID;
end $$
delimiter ;

-- Thử nghiệm trigger
update `Subject` set SubjectID = 116 where SubjectID = 114;

-- b. Tạo trigger cho table Student có tên là StudentDeleteID: 
-- Khi xóa data của cột ID của table Student, thì giá trị tương ứng với cột SubjectID của table StudentSubject cũng bị xóa theo
delimiter $$
create trigger StudentDeleteID 
before delete on `Student` for each row
begin
	delete from StudentSubject where StudentID = old.StudentID;
end $$
delimiter ;

-- Thử trigger
begin work;
select * from StudentSubject;

delete from `StudentSubject` where StudentID = 12;

select * from StudentSubject;
rollback;
-- Q5: Viết 1 store procedure (có 2 parameters: student name) sẽ xóa tất cả các thông tin liên quan tới học sinh có cùng tên như parameter
-- Trong trường hợp nhập vào student name = "*" thì procedure sẽ xóa tất cả các học sinh
delimiter $$
create procedure Question5 (
in StName VARCHAR(50) )
begin
	declare NewStudentID tinyint unsigned;
    set NewStudentID = (
    select StudentID from `Student` where `StudentName` = StName);
    if StName = '*'
    then delete from `Student`;
    delete from StudentSubject;
    else delete from `Student` where `StudentName` like StName;
    delete from `StudentSubject` where `StudentID` = newStudentID;
    end if;
    
end $$
delimiter ;

-- Thử nghiệm procedure
call Question5('Nguyễn Đức Khôi');

call Question5('*');