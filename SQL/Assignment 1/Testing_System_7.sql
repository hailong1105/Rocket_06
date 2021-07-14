delete from `department` where DepartmentID = 'Marketing';

drop trigger if exists trigger_delete_question;

delimiter $$

create trigger trigger_update_department
before delete on `department` for each row
begin
	
    update `account` set DepartmentID = 0 where DepartmentID = old.DepartmentID;
    
end $$

delimiter ;

-- Trigger 2
drop trigger if exists trigger_create_time;

delimiter $$
create trigger trigger_create_time
before insert on `question` for each row
begin

	if new.`CreateDate` > now() then 
		signal sqlstate '12345' 
        set message_text = 'Field create_time must be less than now';
	end if;

end $$
delimiter ;

insert into `question` (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) 
values ('3', 'Content no. 3', '3', '3', '3', '2019-07-16');

begin work;
rollback;
select * from `answer`;

-- Q4: Cấu hình 1 bài thi có nhiều nhất là 10 question

delimiter $$
create trigger trigger4
before insert on `examquestion` for each row
begin 
	declare num int;
    select count(QuestionID) into num from `examquestion` where QuestionID = new.QuestionID;
    if num > 10 then 
		signal sqlstate '12345'
        set message_text = 'một bài thi chỉ có nhiều nhất 10 câu hỏi';
	end if ;
end $$
delimiter ;

-- Q5: Tạo trigger không cho phép người dùng xóa tài khoản có email là admin@gmail.com (đây là tài khoản admin, không cho phép user xóa),
-- còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông tin liên quan tới user đó.
drop trigger if exists trigger5;

delimiter $$
create trigger trigger5
before delete on `account` for each row
begin
	declare a_email varchar(50);
    set a_email = 'admin@gmail.com';
	if OLD.Email = a_email then
		signal sqlstate '12345'
		set message_text = 'You cannot delete the admin account.';
	end if;
end $$

delimiter ;

-- Q6: Không sử dụng cấu hình default cho field DepartmentID của table Account, hãy tạo trigger cho phép người dùng khi tạo account không điền
-- vào departmentID thì sẽ được phân vào phòng ban "waiting Department".
drop trigger if exists Trigger6;

delimiter $$
create trigger trigger6
before insert on `account` for each row
begin
	declare num int;
    if new.DepartmentID is null then
		set new.DepartmentID = (select DepartmentID from department where DepartmentName = 'waiting Department');	
	end if;
end $$

delimiter ;

insert into `account` (`Email`, `User_name`, `Full_name`, `PositionID`) values ('vtilong1105@gmail.com', 'hailong1105', 'Nguyen Hai Long', '5');
-- Q7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi question, trong đó có tối đa 2 đáp án đúng.
drop trigger if exists Trigger7;

delimiter $$
create trigger Trigger7
before insert on `answer` for each row
begin
	declare v_q7 tinyint;
    declare v_countAnsIsCorr tinyint;
    select count(a.QuestionID) into v_q7 from answer a where a.QuestionID = new.QuestionID;
    select count(1) into v_countAnsIsCorr from answer a where a.QuestionID = new.QuestionID and a.isCorrect = new.isCorrect;
    if (v_q7 > 4 or v_countAnsIsCorre > 2) then
		signal sqlstate '12345'
        set message_text = 'Không chèn thêm được dữ liệu mời bạn kiểm tra lại';
	end if;
end $$

delimiter ; 

-- Q8: Viết trigger sửa lại dữ liệu cho đúng: Nếu người dùng nhập vào gender của account là nam, nữ, chưa xác định
-- thì sẽ đổi lại thành M, F, U cho giống với cấu hình ở database.
drop trigger if exists Trigger8;

delimiter $$
create trigger Trigger8 
before insert on `account` for each row
begin
case new.Gender
	when 'Nam' then set new.Gender = 'M';
    when 'Nu' then set new.Gender = 'F';
    when 'Khong xac dinh' then set new.Gender = 'U';
    else set new.Gender = 'U';
end case;
end $$
delimiter ;

INSERT INTO `account` (`AccountID`, `Email`, `User_name`, `Full_name`, `Gender`, `DepartmentID`, `PositionID`, `CreateDate`) 
VALUES ('18', 'vtiha1408@gmail.com', 'Thuha1408', 'Dao Thi Thu Ha', 'Nu', '6', '5', '2021-07-30');

select * from `account`;

-- Q9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày.alter