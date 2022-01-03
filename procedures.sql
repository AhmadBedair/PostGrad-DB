use postgradDB

go

-- StudentRegister
create proc StudentRegister 
@first_name varchar(20), @last_name varchar(20), @password varchar(20), @faculty varchar(20),
@Gucian bit, @email varchar(50), @address varchar(10), @GPA decimal(3,2), @type varchar(20), @undergradID varchar(10)

as

    if not exists(select email from PostGradUser where email=@email)
        BEGIN

            
            insert into PostGradUser (email, password)
            values (@email, @password);

            declare @sid int;
            Select @sid=max(id) from PostGradUser;

            if @Gucian = 1
                insert into GucianStudent (id, firstName, lastName, type,faculty, address, GPA, undergradID) values (@sid, @first_name, @last_name, @type,@faculty, @address, @GPA, @undergradID);
            else 
                insert into NonGucianStudent(id, firstName, lastName, type,faculty, address, GPA) values (@sid, @first_name, @last_name, @type,@faculty, @address, @GPA);

        end
    else 
        begin
            print 'Email already exists';
        end

go


-- SupervisorRegister
create proc SupervisorRegister
@name varchar(20), @password varchar(20), @faculty varchar(20),
@email varchar(50)
as
    begin
        if not exists(select email from PostGradUser where email = @email)
            BEGIN

                insert into PostGradUser (email, password) values (@email, @password);
                
                declare @supid int;
                Select @supid=max(id) from PostGradUser;

                insert into Supervisor(id,name, faculty)
                values(@supid, @name, @faculty);

            end
        else
            begin
                print 'Email already exists';
            end
    end
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
@id int, @mobile_number varchar(20)
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
                                insert into GucStudentPhoneNumber (id, phone) values (@id, @mobile_number);
                            ELSE
                                print 'Mobile number already exists';
                        END
                        
                    else
                        print 'phone number already exists';
                end
            else 
                if exists (select * from NonGucianStudent where id=@id)
                    BEGIN
                        if not exists (select * from NonGucStudentPhoneNumber where phone=@mobile_number)
                            BEGIN
                            if not exists (select * from GucStudentPhoneNumber where phone=@mobile_number)
                                insert into NonGucStudentPhoneNumber (id, phone) values (@id, @mobile_number);
                            else 
                                print 'phone number already exists';
                            END
                        else
                            print 'phone number already exists';
                    end
                else
                    print 'ID IS NOT FOUND';
        end    
    

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

-- AdminViewStudentThesisBySupervisor
create proc AdminViewStudentThesisBySupervisor
as
    begin
        select sup.name, Thesis.title, s.first_name, s.last_name
        from Supervisor sup inner join GUCianProgressReport gpr on (sup.id=gpr.supid)
        inner join Thesis on (gpr.thesisSerialNumber=Thesis.serialNumber) 
        inner join GucianStudent s on (gpr.sid=s.id)
        
        union

        select sup.name, Thesis.title, s.first_name, s.last_name
        from Supervisor sup inner join NonGUCianProgressReport ngpr on (sup.id=ngpr.supid)
        inner join Thesis on (ngpr.thesisSerialNumber=Thesis.serialNumber) 
        inner join NonGucianStudent s on (ngpr.sid=s.id);
    end


go

-- AdminListNonGucianCourse
create proc AdminListNonGucianCourse
@courseID int
as
    BEGIN
        select ngs.first_name, ngs.last_name, c.code, rel.grade
        from Course c inner join NonGucianStudentTakeCourse rel on(rel.cid=c.id)
        inner join NonGucianStudent ngs on (rel.sid=ngs.id)
        where c.id=@courseID;
    end

go

-- AdminUpdateExtension
create proc AdminUpdateExtension
@ThesisSerialNo int
as
    BEGIN
        if exists (select * from Thesis where serialNumber=@ThesisSerialNo)
            BEGIN
                declare @old int
                select @old=noExtension from Thesis where serialNumber=@ThesisSerialNo
                update Thesis set noExtension=@old+1 where serialNumber=@ThesisSerialNo
            end
        else
            print 'Not found';
    end

go

-- AdminIssueThesisPayment
create proc AdminIssueThesisPayment
@ThesisSerialNo int, @amount decimal, @noOfInstallments int, @fundPercentage decimal,
@Success bit output

AS
    BEGIN

        if exists (select * from Thesis where serialNumber=@ThesisSerialNo)
            BEGIN
                insert into Payment (amount, no_Installments, fundPercentage)
                values (@amount, @noOfInstallments, @fundPercentage);

                declare @pid int;
                Select @pid=max(id) from Payment;

                UPDATE Thesis SET payment_id=@pid where serialNumber=@ThesisSerialNo;

            end
        else
            print 'Thesis not found';
    end


go

-- AdminViewStudentProfile
create proc AdminViewStudentProfile
@sid int
as
    begin
        if exists (select * from GucianStudent where id=@sid)
            BEGIN
                select * from GucianStudent where id=@sid;
            end
        else 
            if exists (select * from NonGucianStudent where id=@sid)
                BEGIN
                    select * from NonGucianStudent where id=@sid;
                end
            else
                print 'Student not found';
            
    end
go



-- AdminIssueInstallPayment
create proc AdminIssueInstallPayment
@paymentID int, @InstallStartDate date
as

    if exists (select * from Payment where id=@paymentID)
        BEGIN
            DECLARE @numOFInstallments int;
            select @numOFInstallments=no_Installments from Payment where id=@paymentID;

            DECLARE @Counter INT
            DECLARE @CurrentDate datetime
            SET @Counter=0
            while(@Counter<@numOFInstallments)
                BEGIN
                    set @CurrentDate=dateadd(month, (@Counter)*6, @InstallStartDate);
                    insert into Installment (date, paymentId)
                    values (@CurrentDate, @paymentID);
                    SET @Counter=@Counter+1;
                END
        end
    else
        print 'Payment not found';

go

-- AdminListAcceptPublication
create proc AdminListAcceptPublication
as 
    BEGIN
        select p.title as PublicationTitle, t.title ThesisTitle, t.serialNumber
        from Publication p inner join ThesisHasPublication rel on(p.id=rel.pubid)
        inner join Thesis t on (rel.serialNo=t.serialNumber)
        where p.accepted=1
        group by t.serialNumber, p.title, t.title
    end

go

-- AddCourse
create proc AddCourse
@courseCode varchar(20), @creditHours int, @fee decimal
as
    begin
        if not exists (select * from Course where code=@courseCode)
            BEGIN
                insert into Course (code, creditHours, fees) values (@courseCode, @creditHours, @fee);
            end
        else
            print 'Course already exists';
    
    end

go

-- linkCourseStudent
create proc linkCourseStudent
@courseID int, @studentID INT
as
    BEGIN
        if exists (select * from NonGucianStudent where id=@studentID)
            if not exists (select * from NonGucianStudentTakeCourse where cid=@courseID and sid=@studentID)
                insert into NonGucianStudentTakeCourse (cid, sid) values (@courseID, @studentID);
            ELSE
                print 'The record already exists'
        else 
            print 'Stduent Not Exists'
    end

go

-- addStudentCourseGrade
create proc addStudentCourseGrade
@courseID int, @studentID int, @grade decimal
as
    BEGIN
        if exists(select * from NonGucianStudentTakeCourse where sid=@studentID and cid=@courseID)
            BEGIN
                update NonGucianStudentTakeCourse set grade=@grade where sid=@studentID and cid=@courseID;
            end
        else
            print 'Student not found';
    end

go

-- ViewExamSupDefense
create proc ViewExamSupDefense
@defenseDate datetime
as
    begin
        select sup.name as SuperVisorName, e.name as ExaminerName
        from ExaminerEvaluateDefense eed inner join NonGUCianProgressReport ngpr
        on(eed.serialNo=ngpr.thesisSerialNumber)
        inner join Supervisor sup on(ngpr.supid=sup.id)
        inner join Examiner e on (e.id=eed.examinerid)
        where eed.date = @defenseDate

        union

        select sup.name as SuperVisorName, e.name as ExaminerName
        from ExaminerEvaluateDefense eed inner join GUCianProgressReport gpr
        on(eed.serialNo=gpr.thesisSerialNumber)
        inner join Supervisor sup on(gpr.supid=sup.id)
        inner join Examiner e on (e.id=eed.examinerid)
        where eed.date = @defenseDate;

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
select GucianStudent.first_name,GucianStudent.last_name,Thesis.years
from GucianStudent
inner join GUCianStudentRegisterThesis on GucianStudent.id=GUCianStudentRegisterThesis.sid
inner join Supervisor on Supervisor.id=GUCianStudentRegisterThesis.supid
inner join Thesis on Thesis.serialNumber=GUCianStudentRegisterThesis.serial_no
where Supervisor.id=@supervisorID
select NonGucianStudent.first_name,NonGucianStudent.last_name,Thesis.years
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

go

create proc UpdateSupProfile
@supervisorID int, @name varchar(20), @faculty varchar(20)
AS
update Supervisor
set Supervisor.name=@name,Supervisor.faculty=@faculty
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
select GucianStudent.first_name,GucianStudent.last_name,Publication.*
from GucianStudent
inner join GUCianStudentRegisterThesis on GucianStudent.id=GUCianStudentRegisterThesis.sid
inner join ThesisHasPublication on ThesisHasPublication.serialNo=GUCianStudentRegisterThesis.serial_no
inner join Publication on Publication.id=ThesisHasPublication.pubid
where GucianStudent.id=@StudentID
end
else
begin
select NonGucianStudent.first_name,NonGucianStudent.last_name,Publication.*
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
@ThesisSerialNo int ,@DefenseDate Datetime ,@ExaminerName varchar(20),@National bit,@fieldOfWork varchar(20)
AS
begin
declare @examinerID int
insert into PostGradUser values(null,null);
select @examinerID=max(PostGradUser.id)
from PostGradUser;
insert into Examiner values(@examinerID,@ExaminerName,@fieldOfWork,@National);
insert into ExaminerEvaluateDefense values(@DefenseDate,@ThesisSerialNo,@examinerID,null);
end;
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
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--4)h)(add a grade for a thesis.)
--adds a grade to thesis giving as inputs the serial no of the thesis and the grade
go
create proc AddGrade
@ThesisSerialNo int,@Grade int
AS
update Thesis
set Thesis.grade=@Grade
where Thesis.serialNumber=@ThesisSerialNo;
-----------------------------------***********END of Supervisor proc***********-----------------------------------------
 
go
-- Add grade for a defense
CREATE PROC AddDefenseGrade
@ThesisSerialNo int,
@DefenseDate Datetime,
@grade decimal
AS
if exists(select * from Thesis where serialNumber=@ThesisSerialNo)
    update Defense set grade=@grade where serialNumber=@ThesisSerialNo and date=@DefenseDate
else
    print 'Thesis is not found'


go

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
select ng.cid,c.code,ng.grade from NonGucianStudentTakeCourse ng inner join Course c on ng.cid=c.id 
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
@progressReportDate date
AS
DECLARE @sid int
if exists(select * from GUCianStudentRegisterThesis g where g.serial_no= @thesisSerialNo)
begin
select @sid=g.sid from GUCianStudentRegisterThesis g where g.serial_no= @thesisSerialNo
insert into GUCianProgressReport(sid,date,thesisSerialNumber)
values(@sid,@progressReportDate,@thesisSerialNo)
end
else
begin
if exists(select * from NonGUCianStudentRegisterThesis ng where ng.serial_no= @thesisSerialNo)
begin
select @sid=ng.sid from NonGUCianStudentRegisterThesis ng where ng.serial_no= @thesisSerialNo
insert into NonGUCianProgressReport(sid,date,thesisSerialNumber)
values(@sid,@progressReportDate,@thesisSerialNo)
end
else
print 'wrong serial number'
end

go

CREATE PROC FillProgressReport
@thesisSerialNo int,
@progressReportNo int,
@state int,
@description varchar(200)
AS
if exists (select * from GUCianProgressReport g where g.no=@progressReportNo)
UPDATE GUCianProgressReport set thesisSerialNumber=@thesisSerialNo , state=@state, description=@description where no=@progressReportNo
else if exists (select * from NonGUCianProgressReport ng where ng.no=@progressReportNo)
UPDATE NonGUCianProgressReport set thesisSerialNumber=@thesisSerialNo , state=@state, description=@description where no=@progressReportNo
else print 'progress report not exist'

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
@accepted bit
AS
insert into Publication(title, date, place,accepted,host) values(@title,@pubDate,@place,@accepted,@host)

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

