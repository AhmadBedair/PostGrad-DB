insert into postgraduser values('mahmoud@gmail.com','123456')
select * from Admin
insert into Admin values(34)
--checks using the student Id whether he is Gucian nonGucian or Supervisor
select *from Defense
go
declare @tmp int
exec checkID 34, @tmp output
print @tmp

create proc checkId
@id int ,@output int output
AS
if exists(select 1 from GucianStudent
          where GucianStudent.id=@id)
       
set @output=0
else if exists(select 1
          from NonGucianStudent
          where NonGucianStudent.id=@id)
set @output=1
else if exists(select 1 
               from Supervisor
               where Supervisor.id=@id)
set @output=2
else if exists (select 1 from Admin where id=@id)
set @output=3
else if exists (select 1 from Examiner where id=@id)
set @output=4
else set @output=5
-------------------------------------
GO
select * from Payment
create proc checkProgressReport
@ThesisSerialNo int,@out int output
As
begin
if exists(select 1 from GUCianProgressReport where GUCianProgressReport.thesisSerialNumber=@ThesisSerialNo)
   begin
       declare @Guciangrade int
       select @Guciangrade= GUCianProgressReport.eval
       from GUCianProgressReport
       where GUCianProgressReport.thesisSerialNumber=@ThesisSerialNo and GUCianProgressReport.no in (select Max(GUCianProgressReport.no) from GUCianProgressReport where GUCianProgressReport.thesisSerialNumber=@ThesisSerialNo)
       if (@Guciangrade=0)
            set @out=0;
        else 
            set @out=1
   end

        
else if exists(select 1 from NonGUCianProgressReport where NonGUCianProgressReport.thesisSerialNumber=@ThesisSerialNo)
        begin
            declare @NonGuciangrade int
            select @NonGuciangrade= NonGUCianProgressReport.eval from NonGUCianProgressReport where NonGUCianProgressReport.thesisSerialNumber=@ThesisSerialNo and NonGUCianProgressReport.no in (select Max(NonGUCianProgressReport.no) from NonGUCianProgressReport where NonGUCianProgressReport.thesisSerialNumber=@ThesisSerialNo)
            if (@NonGuciangrade=0)
                set @out=0

            else
                set @out=1
         end
    
end
------------------------------------------------------------------------
go
create proc checkReportAndItsNo
@serialNO int,@ProgressReportNo int,@OUt int output
AS
if exists(select 1 from GUCianProgressReport where GUCianProgressReport.thesisSerialNumber=@serialNO and GUCianProgressReport.no=@ProgressReportNo)
begin
set @out =0
end
else 
if exists(select 1 from NonGUCianProgressReport where NonGUCianProgressReport.thesisSerialNumber=@serialNO and NonGUCianProgressReport.no=@ProgressReportNo)
begin
set @out=0
end 
else
set @out=1;
------------------------------------------------------
go 

create proc CheckThesisExistance
@SerialNO int ,@Existance int output 
As
if Exists(select 1 from Thesis where Thesis.serialNumber=@SerialNO)
set @Existance=0
else
Set @Existance=1;
----------------------------------------------
go
create proc checkMyStudentUsingSerial
@SerialNO int ,@supid int ,@myStudent int output
as
if exists(select 1 from GUCianStudentRegisterThesis where GUCianStudentRegisterThesis.serial_no=@SerialNO and GUCianStudentRegisterThesis.supid=@supid)
begin
set @myStudent=0
end


else if exists(select 1 from NonGUCianStudentRegisterThesis where NonGUCianStudentRegisterThesis.serial_no=@SerialNO and NonGUCianStudentRegisterThesis.supid=@supid)
begin
set @myStudent=0
end
else
set @myStudent=1;
-----------------------------------------------------------------------------------

go
create proc checkMyStudentUsingId
@sid int ,@supid int ,@myStudent int output
as
if exists(select 1 from GUCianStudentRegisterThesis where GUCianStudentRegisterThesis.sid=@Sid and GUCianStudentRegisterThesis.supid=@supid)
begin
set @myStudent=0
end


else if exists(select 1 from NonGUCianStudentRegisterThesis where NonGUCianStudentRegisterThesis.sid=@sid and NonGUCianStudentRegisterThesis.supid=@supid)
begin
set @myStudent=0
end
else
set @myStudent=1;
-----------------------------------
go
create proc selectMaxId
@output int output
as
select @output = max(PostGradUser.id)
from PostGradUser;




----------------------------------------------------------------------------------------------------------

go

create proc listGoingThesis
@id int 
as
begin
    if exists (select * from GucianStudent where id=@id)
        begin
            select t.*, gpr.no from Thesis t, GUCianProgressReport gpr where t.serialNumber=gpr.thesisSerialNumber and 
            getDate()>=t.startDate and getDate()<t.endDate and gpr.sid = @id
        end
    else if exists(select * from NonGucianStudent where id = @id)
        begin
            select t.*, ngpr.no from Thesis t, NonGUCianProgressReport ngpr where t.serialNumber=ngpr.thesisSerialNumber and 
            getDate()>=t.startDate and getDate()<t.endDate and ngpr.sid = @id
        end 
    else print 'ID Not Found'
end

------------------------------------------------------------------------
--using the serial No checks Gucian or NonGucian
go
create proc CheckGucianUsingThesis
@SerialNO int,@out int output
AS
if exists(select 1 from GUCianStudentRegisterThesis where GUCianStudentRegisterThesis.serial_no=@SerialNO)
set @out=0
else
if exists(select 1 from NonGUCianStudentRegisterThesis where NonGUCianStudentRegisterThesis.serial_no=@SerialNO)
set @out=1


go

-- List all student Thesis in the System 
create proc listMyThesis
@id int
as
if exists (select * from GUCianProgressReport where sid=@id) 
    select t.* from GUCianProgressReport gpr, Thesis t where gpr.thesisSerialNumber=t.serialNumber and gpr.sid=@id
else if exists(select * from NonGUCianProgressReport where sid=@id) 
    select t.* from NonGUCianProgressReport ngpr, Thesis t where ngpr.thesisSerialNumber=t.serialNumber and ngpr.sid=@id
else 
    print 'Not Found'

go

-- StudentRegister
create proc StudentRegister 
@first_name varchar(20), @last_name varchar(20), @password varchar(20), @faculty varchar(20),
@Gucian bit, @email varchar(50), @address varchar(10), @GPA decimal(3,2), @type varchar(20), @undergradID varchar(10), @output int output

as

    if not exists(select email from PostGradUser where email=@email)
        BEGIN

            
            insert into PostGradUser (email, password)
            values (@email, @password);

            declare @sid int;
            Select @sid=max(id) from PostGradUser;
             set @output = 0;
            if @Gucian = 1
                insert into GucianStudent (id, firstName, lastName, type,faculty, address, GPA, undergradID) values (@sid, @first_name, @last_name, @type,@faculty, @address, @GPA, @undergradID);
            else 
                insert into NonGucianStudent(id, firstName, lastName, type,faculty, address, GPA) values (@sid, @first_name, @last_name, @type,@faculty, @address, @GPA);
           
        end
    else 
        begin
            set @output = 1;
        end

go


-- SupervisorRegister
create proc SupervisorRegister
@name varchar(20), @password varchar(20), @faculty varchar(20),
@email varchar(50), @output int output
as
    begin
        if not exists(select email from PostGradUser where email = @email)
            BEGIN

                insert into PostGradUser (email, password) values (@email, @password);
                
                declare @supid int;
                Select @supid=max(id) from PostGradUser;

                insert into Supervisor(id,name, faculty)
                values(@supid, @name, @faculty);
                set @output = 0;

            end
        else
            begin
                set @output = 1;
            end
    end
go

--Examiner Register
go
create proc ExaminerRegister
@email varchar(50), @password varchar(20),@name varchar(20),@fieldOfWork varchar(50),@isNational bit
 
AS
begin
insert into PostGradUser  values(@email,@password)
declare @id int
select @id=max(PostGradUser.id) from PostGradUser
insert into Examiner values(@id,@name,@fieldOfWork,@isNational)
end;
  



go
-- userLogin
create proc userLogin
@id int, @password varchar(20), @Success bit output
as 
    if exists (select * from PostGradUser where id=@id and password=@password)
        BEGIN
            set @Success = 1;
        end
    else 
        begin
            set @Success = 0;
        end

go


-- addMobile
create proc addMobile


as

    if not exists(select id from PostGradUser where id=@id)
        BEGIN
            print 'ID IS NOT FOUND';
        end
    else
        BEGIN

            if exists (select * from GucianStudent where id=@id)
                BEGIN
                    if not exists (select * from GucStudentPhoneNumber where phone=@mobile_number)
                        BEGIN
                            if not exists (select * from NonGucStudentPhoneNumber where phone=@mobile_number)
                            begin
                                insert into GucStudentPhoneNumber (id, phone) values (@id, @mobile_number);
                                set @output = 1;
                            end
                            ELSE
                                set @output = 0;
                        END
                        
                    else
                        set @output = 0;
                end
            else 
                if exists (select * from NonGucianStudent where id=@id)
                    BEGIN
                        if not exists (select * from NonGucStudentPhoneNumber where phone=@mobile_number)
                            BEGIN
                            if not exists (select * from GucStudentPhoneNumber where phone=@mobile_number)
                            begin
                                insert into NonGucStudentPhoneNumber (id, phone) values (@id, @mobile_number);
                                set @output = 1;
                            end
                            else 
                                set @output = 0;
                            END
                        else
                            set @output = 0;
                    end
                else
                    print 'ID IS NOT FOUND';
        end    
    

go



--                           ***************************Supervisor views and procedures*************************

--4)a)(Evaluate a student’s progress report, and give evaluation value 0 to 3)
--checks first whether the evaluation value between 0 and 3 if not it will just print an Error saying that the value isnt between 0 and 3
--if it is then i check if the progress report belongs to gucian student or a non gucian student using simple if exists
--and then update the progress report eval on the progress report attributes satisfying the inputs of the proc
create proc EvaluateProgressReport
@supervisorID int, @thesisSerialNo int, @progressReportNo int, @evaluation int
AS
if(@evaluation not between 0 and 3)
  print('ERROR :The evaluation value should be between 0 and 3')
else
  begin
  if exists(select 1 from GUCianProgressReport where GUCianProgressReport.thesisSerialNumber=@thesisSerialNo)
   begin
   update GUCianProgressReport
   set GUCianProgressReport.eval=@evaluation
   where GUCianProgressReport.supid=@supervisorID and GUCianProgressReport.thesisSerialNumber=@thesisSerialNo and GUCianProgressReport.no=@progressReportNo
   end
  else
    if exists(select 1 from NonGUCianProgressReport where NonGUCianProgressReport.thesisSerialNumber=@thesisSerialNo)
    begin
    update NonGUCianProgressReport
    set NonGUCianProgressReport.eval=@evaluation
    where NonGUCianProgressReport.supid=@supervisorID and NonGUCianProgressReport.thesisSerialNumber=@thesisSerialNo and NonGUCianProgressReport.no=@progressReportNo
    end
    end;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--4)b)(View all my students’s names and years spent in the thesis.)
--creates aproc that gives two tables, one for all the gucian students registered with that supervisor
-- and the other table gives info about the non gucian students  all by:inner joining student  with student registered thesis on sid
--inner joing with supervisor on supid inner joining with thesis on serial no
go
create proc ViewSupStudentsYears
@supervisorID int
AS
Begin
select GucianStudent.firstName,GucianStudent.lastName,Thesis.years
from GucianStudent
inner join GUCianStudentRegisterThesis on GucianStudent.id=GUCianStudentRegisterThesis.sid
inner join Supervisor on Supervisor.id=GUCianStudentRegisterThesis.supid
inner join Thesis on Thesis.serialNumber=GUCianStudentRegisterThesis.serial_no
where Supervisor.id=@supervisorID
union
select NonGucianStudent.firstName,NonGucianStudent.lastName,Thesis.years
from NonGucianStudent
inner join NonGUCianStudentRegisterThesis on NonGucianStudent.id=NonGUCianStudentRegisterThesis.sid
inner join Supervisor on Supervisor.id=NonGUCianStudentRegisterThesis.supid
inner join Thesis on Thesis.serialNumber=NonGUCianStudentRegisterThesis.serial_no
where Supervisor.id=@supervisorID
end;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--4)c)(View my profile and update my personal information)
--Two proc first to view the supervisor's all info using his id on the other proc to make the supervisor able update his name and faculty
--using his id
go

create proc SupViewProfile
@supervisorID int
AS
select Supervisor.*
from Supervisor
where Supervisor.id=@supervisorID;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--4)d)(View all publications of a student.)
--will post the student first and last names and all the publication attributes by:cheking whether the student is a gucian or nongucian
--then inner joining the student with the registeredThesis table on student id then inner joining with thesis has publication on serila no
--then inner joining with publication on pubid.


go
create proc ViewAStudentPublications
@StudentID int
AS
begin
if exists(select 1 from GucianStudent where GucianStudent.id=@StudentID)
begin
select GucianStudent.firstName,GucianStudent.lastName,Publication.*
from GucianStudent
inner join GUCianStudentRegisterThesis on GucianStudent.id=GUCianStudentRegisterThesis.sid
inner join ThesisHasPublication on ThesisHasPublication.serialNo=GUCianStudentRegisterThesis.serial_no
inner join Publication on Publication.id=ThesisHasPublication.pubid
where GucianStudent.id=@StudentID
end
else
begin
select NonGucianStudent.firstName,NonGucianStudent.lastName,Publication.*
from NonGucianStudent
inner join NonGUCianStudentRegisterThesis on NonGucianStudent.id=NonGUCianStudentRegisterThesis.sid
inner join ThesisHasPublication on ThesisHasPublication.serialNo=NonGUCianStudentRegisterThesis.serial_no
inner join Publication on Publication.id=ThesisHasPublication.pubid
where NonGucianStudent.id=@StudentID
end
end;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--4)e)(Add defense for a thesis, for nonGucian students all courses’ grades should be greater than 50)
--2 proc as required for gucian and non gucian , for non gucian checks first if he has at least one course with grade <=50 and if found no insertion happens
go
create proc AddDefenseGucian
@ThesisSerialNo int , @DefenseDate Datetime , @DefenseLocation varchar(15)
AS
insert into Defense (serialNumber, date, location)
values(@ThesisSerialNo,@DefenseDate,@DefenseLocation);

go

create proc AddDefenseNonGucian
@ThesisSerialNo int , @DefenseDate Datetime , @DefenseLocation varchar(15)
AS
if exists(select 1
          from NonGucianStudent 
          inner join NonGUCianStudentRegisterThesis on NonGucianStudent.id=NonGUCianStudentRegisterThesis.sid
          inner join NonGucianStudentTakeCourse on NonGucianStudentTakeCourse.sid=NonGucianStudent.id
          where NonGUCianStudentRegisterThesis.serial_no=@ThesisSerialNo and NonGucianStudentTakeCourse.grade< =50)
          print ('The student has at least a course with grade <=50')
 else 
   insert into Defense (serialNumber, date, location)
   values(@ThesisSerialNo,@DefenseDate,@DefenseLocation);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--4)f)(add examiner(s) for a defense.)
-- adds a new postgard user (the examiner) then takes his id and adds this examiner to the examiner table and ExaminerEvaluateDefence table
go
create proc AddExaminer
@ThesisSerialNo int , @DefenseDate Datetime , @ExaminerName
varchar(20),@Password varchar(30),
@National bit, @fieldOfWork varchar(20)
as
insert into PostGradUser values(@ExaminerName,@Password)
declare @id int
set @id = SCOPE_IDENTITY()
insert into Examiner values(@id,@ExaminerName,@fieldOfWork,@National)
insert into ExaminerEvaluateDefense
values(@DefenseDate,@ThesisSerialNo,@id,null);


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--4)g)(Cancel a Thesis if the evaluation of the last progress report is zero.)
--checks first if the thesis belongs to a gucian student or a non gucian then checks if the report eval of the last report =0 
--(looks for the progress report with the heighst number the puts its eval into a vairable and checks if this variable is zero)if so this thesis is deleted
go
create proc CancelThesis
@ThesisSerialNo int 
AS
if exists(select 1
  from GUCianProgressReport
  where GUCianProgressReport.thesisSerialNumber=@ThesisSerialNo)
    begin
       declare @Guciangrade int
       select @Guciangrade= GUCianProgressReport.eval
       from GUCianProgressReport
       where GUCianProgressReport.thesisSerialNumber=@ThesisSerialNo and GUCianProgressReport.no in (select Max(GUCianProgressReport.no)
                                                                                                     from GUCianProgressReport
                                                                     where GUCianProgressReport.thesisSerialNumber=@ThesisSerialNo)
if (@Guciangrade=0)
delete from Thesis
where Thesis.serialNumber=@ThesisSerialNo
end
else 
begin
declare @NonGuciangrade int
      select @NonGuciangrade= NonGUCianProgressReport.eval
       from NonGUCianProgressReport
       where NonGUCianProgressReport.thesisSerialNumber=@ThesisSerialNo and NonGUCianProgressReport.no in (select Max(NonGUCianProgressReport.no)
                                                                                                     from NonGUCianProgressReport
                                                                     where NonGUCianProgressReport.thesisSerialNumber=@ThesisSerialNo)
if (@NonGuciangrade=0)
delete from Thesis
where Thesis.serialNumber=@ThesisSerialNo
end;

 
go

-- Add grade for a defense
CREATE proc AddDefenseGrade
@ThesisSerialNo int,
@DefenseDate Datetime,
@grade decimal
AS
if exists(select * from Thesis where serialNumber=@ThesisSerialNo)
    update Defense set grade=@grade where serialNumber=@ThesisSerialNo and date=@DefenseDate
else
    print 'Thesis is not found'


go
select * from PostGradUser
CREATE PROC AddCommentsGrade
@Exid int,
@ThesisSerialNo int,
@DefenseDate Datetime,
@comments varchar(300)
AS
IF @ThesisSerialNo IN((select serial_no from GUCianStudentRegisterThesis) union (select serial_no from NonGUCianStudentRegisterThesis))
        update ExaminerEvaluateDefense set comment=@comments where examinerId=@Exid and serialNo=@ThesisSerialNo and date=@DefenseDate
else
print 'not found'

go

CREATE PROC viewMyProfile 
@studentId int
AS
if exists(select * from GucianStudent where @studentId = id)
    select * from GucianStudent where @studentId = id
else if exists(select * from NonGucianStudent where @studentId = id)
    select * from NonGucianStudent where @studentId = id
else 
    print 'This student does not exist'
go

--Edit my profile (change any of my personal information).
CREATE PROC editMyProfile 
@studentID int,
@firstName varchar(10),
@lastName varchar(10),
@password varchar(10),
@email varchar(10),
@address varchar(10),
@type varchar(10)
AS
if exists(select * from PostGradUser where @studentID = id)
begin
if exists (select * from PostGradUser where email=@email)
print 'used mail'
else
begin
    update PostGradUser 
    set email=@email, password = @password where @studentID=id
    if exists(select * from GucianStudent where @studentID = id)
    begin
        update GucianStudent
        set firstName = @firstName, lastName = @lastName, type = @type, 
        address = @address
        where id=@studentID
    end
    if exists(select * from NonGucianStudent where @studentID = id)
        begin
            update NonGucianStudent
            set firstName = @firstName, lastName = @lastName, type = @type, 
            address = @address
            where id=@studentID
        end
end
end
else 
    print'This Student Does not Exist'

go

--As a Gucian graduate, add my undergarduate ID.
CREATE proc addUndergradID 
@studentID int ,
@underGradID varchar(10)
AS
if exists(select * from GucianStudent where id = @studentID)
begin
    update GucianStudent
    set undergradID = @undergradID
    where id = @studentID
end
else
print'ID Does Not Exist'
go

-- As a nonGucian student, view my courses’ grades
CREATE PROC ViewCoursesGrades
@studentID int
AS
if exists(select * from NonGucianStudent where id = @studentID)
select ng.cid as courseID,c.code as courseCode,ng.grade as grade,ngs.firstName as firstName, ngs.lastName as lastName from NonGucianStudentTakeCourse ng inner join Course c on ng.cid=c.id  inner join NonGucianStudent ngs on ngs.id=ng.sid
where sid = @studentID
else print'ID Does Not Exist'

go

-- View all my payments and installments.
CREATE PROC ViewCoursePaymentsInstall
@studentID int 
AS
if exists(select * from NonGucianStudent where id = @studentID)
begin
select p.id , p.amount as payment_amount, p.no_Installments, p.fundPercentage, i.date, i.amount as installment_amount, i.done,c.code
from Payment p left outer join Installment i on p.id = i.paymentId inner join NonGucianStudentPayForCourse ng on ng.paymentNo=p.id inner join Course c on ng.cid=c.id
where @studentID = ng.sid
end
else print 'id not exist for non-Gucian'

go

CREATE PROC ViewThesisPaymentsInstall 
@studentID int
AS
if exists(select * from GucianStudent where id = @studentID)
begin
select p.id , p.amount as payment_amount, p.no_Installments, p.fundPercentage, i.date, i.amount as installment_amount, i.done,t.serialNumber
from Payment p left outer join Installment i on p.id = i.paymentId inner join Thesis t on t.payment_id = p.id inner join GUCianProgressReport g on g.thesisSerialNumber = t.serialNumber 
where @studentID = g.sid
end
else
begin
if exists(select * from NonGucianStudent where id = @studentID)
begin
select p.id , p.amount as payment_amount, p.no_Installments, p.fundPercentage, i.date, i.amount as installment_amount, i.done,t.serialNumber
from Payment p left outer join Installment i on p.id = i.paymentId inner join Thesis t on t.payment_id = p.id inner join NonGUCianProgressReport g on g.thesisSerialNumber = t.serialNumber 
where @studentID = g.sid
end
end

go

CREATE PROC ViewUpcomingInstallments
@studentid int
as
if exists(select * from GucianStudent where id = @studentid)
begin
select p.id , p.amount as payment_amount, p.no_Installments, p.fundPercentage, i.date, i.amount as installment_amount, i.done,t.serialNumber
from Payment p left outer join Installment i on p.id = i.paymentId 
inner join Thesis t on t.payment_id = p.id 
inner join GUCianProgressReport g on g.thesisSerialNumber = t.serialNumber 
where @studentID = g.sid and i.date> GETDATE() and i.done=0
end
else
begin
if exists(select * from NonGucianStudent where id = @studentID)
begin
select p.id , p.amount as payment_amount, p.no_Installments, p.fundPercentage, i.date, i.amount as installment_amount, i.done,t.serialNumber
from Payment p left outer join Installment i on p.id = i.paymentId inner join Thesis t on t.payment_id = p.id inner join NonGUCianProgressReport g on g.thesisSerialNumber = t.serialNumber 
where @studentID = g.sid and i.date> GETDATE() and i.done=0

select p.id , p.amount as payment_amount, p.no_Installments, p.fundPercentage, i.date, i.amount as installment_amount, i.done,c.code
from Payment p left outer join Installment i on p.id = i.paymentId inner join NonGucianStudentPayForCourse ng on ng.paymentNo=p.id inner join Course c on ng.cid=c.id
where @studentID = ng.sid and i.date> GETDATE() and i.done=0
end
end
go
--drop proc ViewMissedInstallments

CREATE PROC ViewMissedInstallments 
@studentid int
as
if exists(select * from GucianStudent where id = @studentid)
begin
select p.id , p.amount as payment_amount, p.no_Installments, p.fundPercentage, i.date, i.amount as installment_amount, i.done,t.serialNumber
from Payment p left outer join Installment i on p.id = i.paymentId 
inner join Thesis t on t.payment_id = p.id 
inner join GUCianProgressReport g on g.thesisSerialNumber = t.serialNumber 
where @studentID = g.sid and i.date< GETDATE() and i.done=0
end
else
begin
if exists(select * from NonGucianStudent where id = @studentID)
begin
select p.id , p.amount as payment_amount, p.no_Installments, p.fundPercentage, i.date, i.amount as installment_amount, i.done,t.serialNumber
from Payment p left outer join Installment i on p.id = i.paymentId inner join Thesis t on t.payment_id = p.id inner join NonGUCianProgressReport g on g.thesisSerialNumber = t.serialNumber 
where @studentID = g.sid and i.date< GETDATE() and i.done=0

select p.id , p.amount as payment_amount, p.no_Installments, p.fundPercentage, i.date, i.amount as installment_amount, i.done,c.code
from Payment p left outer join Installment i on p.id = i.paymentId inner join NonGucianStudentPayForCourse ng on ng.paymentNo=p.id inner join Course c on ng.cid=c.id
where @studentID = ng.sid and i.date< GETDATE() and i.done=0
end
end

go


CREATE PROC AddProgressReport
@thesisSerialNo int,
@progressReportDate date,
@output int output
AS
DECLARE @sid int
if exists(select * from GUCianStudentRegisterThesis g where g.serial_no= @thesisSerialNo)
begin
select @sid=g.sid from GUCianStudentRegisterThesis g where g.serial_no= @thesisSerialNo
insert into GUCianProgressReport(sid,date,thesisSerialNumber)
values(@sid,@progressReportDate,@thesisSerialNo)
set @output = 1
end
else
begin
if exists(select * from NonGUCianStudentRegisterThesis ng where ng.serial_no= @thesisSerialNo)
begin
select @sid=ng.sid from NonGUCianStudentRegisterThesis ng where ng.serial_no= @thesisSerialNo
insert into NonGUCianProgressReport(sid,date,thesisSerialNumber)
values(@sid,@progressReportDate,@thesisSerialNo)
set @output = 1
end
else
set @output = 0
end



go


CREATE PROC FillProgressReport
@thesisSerialNo int,
@progressReportNo int,
@state int,
@description varchar(200),
@output int output
AS
if exists (select * from GUCianProgressReport g where g.no=@progressReportNo and g.thesisSerialNumber=@thesisSerialNo)
UPDATE GUCianProgressReport set thesisSerialNumber=@thesisSerialNo , state=@state, description=@description where no=@progressReportNo
else if exists (select * from NonGUCianProgressReport ng where ng.no=@progressReportNo and ng.thesisSerialNumber=@thesisSerialNo)
UPDATE NonGUCianProgressReport set thesisSerialNumber=@thesisSerialNo , state=@state, description=@description where no=@progressReportNo
else set @output = 1;
select * from PostGradUser
go

--View my progress report(s) evaluations.
CREATE PROC ViewEvalProgressReport
@thesisSerialNo int,
@progressReportNo int
AS
if exists(select * from GUCianProgressReport where thesisSerialNumber=@thesisSerialNo and no=@progressReportNo)
select eval from GUCianProgressReport where thesisSerialNumber=@thesisSerialNo and no=@progressReportNo
else if exists(select * from NonGUCianProgressReport where thesisSerialNumber=@thesisSerialNo and no=@progressReportNo)
select eval from NonGUCianProgressReport where thesisSerialNumber=@thesisSerialNo and no=@progressReportNo
else print 'no such thesis with such report number'


go

-- add publication
CREATE PROC addPublication
@title varchar(50),
@pubDate datetime,
@host varchar(50),
@place varchar(50),
@accepted bit,
@pubID int output
AS
insert into Publication(title, date, place,accepted,host) values(@title,@pubDate,@place,@accepted,@host)
select @pubID=Max(id) from Publication 
go

--Link publication to my thesis
CREATE PROC linkPubThesis
@PubID int,
@thesisSerialNo int
AS
if exists(select * from ThesisHasPublication where pubid=@PubID and serialNo=@thesisSerialNo)
print 'record already exists'
else
insert into ThesisHasPublication (serialNo,pubid) values(@thesisSerialNo,@PubID)



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add grade for a defense
go
CREATE PROC AddDefenseGrade
@Exid int,
@ThesisSerialNo int,
@DefenseDate Datetime,
@grade decimal,
@success int output
AS
if exists(select * from ExaminerEvaluateDefense where serialNo=@ThesisSerialNo and date=@DefenseDate and @Exid=examinerId)
begin
    update Defense set grade=@grade where serialNumber=@ThesisSerialNo and date=@DefenseDate
    set @success=1
end
else
    set @success=0


go


CREATE PROC AddCommentsGrade
@Exid int,
@ThesisSerialNo int,
@DefenseDate Datetime,
@comments varchar(300),
@success int output
AS
if exists (select * from ExaminerEvaluateDefense where examinerId=@Exid and serialNo=@ThesisSerialNo and date=@DefenseDate)
    begin
        update ExaminerEvaluateDefense set comment=@comments where examinerId=@Exid and serialNo=@ThesisSerialNo and date=@DefenseDate
        set @success=1
    end
else
    set @success=0


go


CREATE PROC editExProfile
@Exid int,
@name varchar(20),
@fieldOfWork varchar(30),
@password varchar(10),
@email varchar(10),
@success int output
AS
if exists(select * from PostGradUser where @Exid = id)
begin
if exists (select * from PostGradUser where email=@email)
set @success=0
else
begin
    set @success=1
    update PostGradUser 
    set email=@email, password = @password where @Exid=id
    if exists(select * from Examiner where @Exid = id)
    begin
        update Examiner
        set name=@name, fieldOfWork=@fieldOfWork 
        where id=@Exid
    end
    
end
end
else 
    print'This Examiner Does not Exist'


go


CREATE PROC listExWorkData
@Exid int
AS
SELECT gst.firstName+gst.lastName AS "StudentName", th.title as "ThesisTitle",sup.name as "SupervisorName"
from ExaminerEvaluateDefense eed inner join GUCianProgressReport gpr on eed.serialNo=gpr.thesisSerialNumber
inner join GucianStudent gst on gst.id=gpr.sid inner join Supervisor sup on sup.id=gpr.supid 
inner join Thesis th on gpr.thesisSerialNumber=th.serialNumber where eed.examinerId=@Exid
union
SELECT ngst.firstName+ngst.lastName AS "Name", th.title,sup.name
from ExaminerEvaluateDefense eed inner join NonGUCianProgressReport ngpr on eed.serialNo=ngpr.thesisSerialNumber
inner join NonGucianStudent ngst on ngst.id=ngpr.sid inner join Supervisor sup on sup.id=ngpr.supid
inner join Thesis th on ngpr.thesisSerialNumber=th.serialNumber where eed.examinerId=@Exid


go




CREATE PROC searchforthesis
@exid int,
@word varchar(50)
as
declare @word2 varchar(50)
set @word2='%'+@word+'%'
select th.*
from thesis th inner join  examinerevaluatedefense eed on th.serialnumber=eed.serialno 
where eed.examinerid=@exid and th.title like @word2



go


-- AdminListSup
create proc AdminListSup
as
    BEGIN
        select * from Supervisor;
    end



go



-- AdminViewSupervisorProfile
create proc  AdminViewSupervisorProfile
@supid int
as
    
    if exists(select * from Supervisor where @supid=id)
        BEGIN
            select * from Supervisor where id=@supid;
        end
    else
        BEGIN
            print 'ID NOT FOUND';
        end

go


go

-- AdminViewAllTheses
create proc AdminViewAllTheses
as
    BEGIN
        select * from Thesis;
    end


go

-- AdminViewOnGoingTheses
create proc AdminViewOnGoingTheses
@thesesCount int output
as
    BEGIN
        declare @date datetime;
        set @date = getdate();
        select @thesesCount=count(*) from Thesis where @date >= startDate and @date < endDate;
    end


go



-- AdminUpdateExtension
go

create proc AdminUpdateExtension
@ThesisSerialNo int,
@success int output
as
    BEGIN
        if exists (select * from Thesis where serialNumber=@ThesisSerialNo)
            BEGIN
                set @success = 1
                declare @old int
                select @old=noExtension from Thesis where serialNumber=@ThesisSerialNo
                update Thesis set noExtension=@old+1 where serialNumber=@ThesisSerialNo
            end
        else
            set @success = 0
    end


go


create proc AdminIssueThesisPayment
@ThesisSerialNo int, @amount decimal, @noOfInstallments int, @fundPercentage decimal,
@success int output

AS
    BEGIN

        if exists (select * from Thesis where serialNumber=@ThesisSerialNo)
            BEGIN
                set @success = 1
                insert into Payment (amount, no_Installments, fundPercentage)
                values (@amount, @noOfInstallments, @fundPercentage);

                declare @pid int;
                Select @pid=max(id) from Payment;

                UPDATE Thesis SET payment_id=@pid where serialNumber=@ThesisSerialNo;

            end
        else
            set @success = 0
    end

go


CREATE Proc AdminIssueInstallPayment
@paymentID int,
@InstallStartDate date,
@success int output
As
if(exists(select * from Payment where id=@paymentID))
    begin
    set @success = 1
    declare @numOfInst int
    select @numOfInst=no_Installments
    from Payment
    where id=@paymentID
    declare @payAmount int
    select @payAmount=amount
    from Payment
    where id=@paymentID
    DECLARE @Counter INT
    SET @Counter=1
    WHILE (@counter<=@numOfInst)
        BEGIN
        declare @instdate date
        set @instdate=@InstallStartDate
        declare @instAmount int
        set @instAmount=@payAmount/@numOfInst
        if(@counter=1)
            insert into
            Installment(date,paymentId,amount,done)values(@InstallStartDate,@paymentID,@instAmount,0)
        else
            begin
            set @instdate=DATEADD(MM, 6, @instdate);
            insert into Installment(date,paymentId,amount,done)values(@instdate,@paymentID,@instAmount,0)
            end
        SET @counter=@counter+1
        END
end
else
set @success = 0


