-- Q1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó
-- drop procedure printAc;
DELIMITER $$
create procedure printAc(in DName varchar(50))
begin
	declare idD int;
    select DName;
    select DepartmentID into idD from department where DepartmentName like DName;
    select * from `account` where departmentid = idD;
end$$
DELIMITER ;
--

DELIMITER $$
create procedure getPositionName (in idP tinyint, out nameP varchar(50))
begin
	select PositionName into nameP from `Position` where PositionID = idP;
    end $$
DELIMITER ;

set @NA = '';
call getPositionName(4, @NA);
select @NA;
