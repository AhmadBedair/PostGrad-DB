-- StudentRegister
create proc StudentRegister 
@first_name varchar(20), @last_name varchar(20), @password varchar(20), @faculty varchar(20),
@Gucian bit, @email varchar(50), @address varchar(10)

as

    if not exists(select email from Users where email=@email)
        BEGIN

            
            insert into Users (email, password)
            values (@email, @password);

            declare @sid int;
            Select @sid=max(id) from Users;

            insert into Student (id, first_name, last_name, faculty, address)
            values (@sid, @first_name, @last_name, @faculty, @address);

            if @Gucian = 1
                insert into GucianStudent (id) values (@sid);
            else 
                insert into NonGucianStudent(id) values (@sid);

        end
    else 
        begin
            print 'Email already exists';
        end

go;


-- SupervisorRegister
create proc SupervisorRegister
@first_name varchar(20), @last_name varchar(20), @password varchar(20), @faculty varchar(20),
@email varchar(50), @address varchar(10)

as
    begin
        if not exists(select email from Users where email = @email)
            BEGIN

                insert into Users (email, password) values (@email, @password);
                
                declare @sid int;
                Select @sid=max(id) from Users;

                insert into Supervisor(id, first_name, last_name, faculty, address)
                values(@sid, @first_name, @last_name, @faculty, @address);

            end
        else
            begin
                print 'Email already exists';
            end
    end
go;



-- userLogin
create proc userLogin
@id int, @password varchar(20), @Success bit output
as 
    if exists (select * from Users where id=@id and password=@password)
        BEGIN
            set @Success = 1;
        end
    else 
        begin
            set @Success = 0;
        end

go;



-- addMobile
create proc addMobile
@id int, @mobile_number varchar(20)
as

    if not exists(select id from Users where id=@id)
        BEGIN
            print 'ID IS NOT FOUND';
        end
    else
        BEGIN

            if exists (select * from GucianStudent where id=@id)
                BEGIN
                    if not exists (select * from GucStudentPhoneNumber where phone_number=@mobile_number)
                        insert into GucStudentPhoneNumber (id, phone_number) values (@id, @mobile_number);
                    else
                        print 'phone number already exists';
                end
            else if exists (select * from NonGucianStudent where id=@id)
                BEGIN
                    if not exists (select * from NonGucStudentPhoneNumber where phone_number=@mobile_number)
                        insert into NonGucStudentPhoneNumber (phone_number) values (@mobile_number);
                    else
                        print 'phone number already exists';
                end
        end    


go;


-- AdminListSup
create proc AdminListSup
as
    BEGIN
        select * from Supervisor;
    end

go;



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

go;


-- AdminViewAllTheses
create proc AdminViewAllTheses
as
    BEGIN
        select * from Thesis;
    end

go;

-- AdminViewOnGoingTheses
create proc AdminViewOnGoingTheses
@thesesCount int output
as
    BEGIN
        declare @date datetime;
        set @date = getdate();
        select @thesesCount=count(*) from Thesis where @date >= startDate and @date < endDate;
    end

go;

-- AdminViewStudentThesisBySupervisor
create proc AdminViewStudentThesisBySupervisor
as
    begin
        select sup.name, Thesis.title, s.first_name, s.last_name
        from Supervisor sup inner join GUCianProgressReport gpr on (sup.id=gpr.supid)
        inner join Thesis on (gpr.thesis_serial_number=Thesis.serial_Number) 
        inner join GucianStudent s on (gpr.sid=s.id)
        
        union

        select sup.name, Thesis.title, s.first_name, s.last_name
        from Supervisor sup inner join NonGUCianProgressReport ngpr on (sup.id=ngpr.supid)
        inner join Thesis on (ngpr.thesis_serial_number=Thesis.serial_Number) 
        inner join NonGucianStudent s on (ngpr.sid=s.id);
    end


go;

-- AdminListNonGucianCourse
create proc AdminListNonGucianCourse
@courseID int
as
    BEGIN
        select s.first_name, s.last_name, c.code, rel.grade
        from Course c inner join NonGucianStudentTakeCourse rel on(rel.cid=c.id)
        inner join NonGucianStudent ngs on (rel.sid=ngs.id)
        inner join Student s on (ngs.id=s.id)
        where c.id=@courseID;
    end

go;

-- AdminUpdateExtension
create proc AdminUpdateExtension
@thesis_serial_number int
as
    BEGIN
        if exists (select * from Thesis where serial_Number=@thesis_serial_number)
            BEGIN
                update Thesis set Number_OF_Extensions=1 where serial_Number=@thesis_serial_number;
            end
        else
            print 'Not found';
    end

go;

-- AdminIssueThesisPayment
create proc AdminIssueThesisPayment
@ThesisSerialNo int, @amount decimal, @noOfInstallments int, @fundPercentage decimal,
@Success bit output

AS
    BEGIN

        if exists (select * from Thesis where serial_Number=@ThesisSerialNo)
            BEGIN
                insert into Payment (amount, no_installments, fund_percentage)
                values (@amount, @noOfInstallments, @fundPercentage);

                declare @pid int;
                Select @pid=max(id) from Payment;

                UPDATE Thesis SET payment_id=@pid where serial_Number=@ThesisSerialNo;

            end
        else
            print 'Thesis not found';
    end


go;

-- AdminViewStudentProfile
create proc AdminViewStudentProfile
@sid int
as
    begin
        if exists (select * from Student where id=@sid)
            BEGIN
                select * from Student where id=@sid;
            end
        else
            BEGIN
                print 'ID NOT FOUND';
            end
    end
go;


-- AdminIssueInstallPayment
create proc AdminIssueInstallPayment
as

go;

-- AdminListAcceptPublication
create proc AdminListAcceptPublication
as 
    BEGIN
        select p.title
        from Publication p inner join ThesisHasPublication rel on(p.id=rel.subid)
        inner join Thesis t on (rel.serial_number=t.serial_Number)
        where p.accepted=1
        group by t.serial_Number;
    end

go;

-- AddCourse
create proc AddCourse
@courseCode varchar(20), @creditHours int, @fee decimal
as
    begin
        if not exists (select * from Course where code=@courseCode)
            BEGIN
                insert into Course (code, creditHours, fee) values (@courseCode, @creditHours, @fee);
            end
        else
            print 'Course already exists';
    
    end

go;

-- linkCourseStudent
create proc linkCourseStudent
@courseID int, @studentID INT
as

go;

-- addStudentCourseGrade
create proc addStudentCourseGrade
as


go;

-- ViewExamSupDefense
create proc ViewExamSupDefense
@defenseDate datetime
as
    begin
        select sup.first_name, sup.last_name, e.name
        from ExaminerEvaluateDefense eed inner join NonGUCianProgressReport ngpr
        on(eed.serial_number=ngpr.thesis_serial_number)
        inner join Supervisor sup on(ngpr.supid=sup.id)
        inner join Examiner e on (e.id=eed.examinerid)
        where eed.date = @defenseDate

        union

        select sup.first_name, sup.last_name, e.name
        from ExaminerEvaluateDefense eed inner join GUCianProgressReport gpr
        on(eed.serial_number=gpr.thesis_serial_number)
        inner join Supervisor sup on(gpr.supid=sup.id)
        inner join Examiner e on (e.id=eed.examinerid)
        where eed.date = @defenseDate;

    end

go;


-- Add grade for a defense
CREATE PROC AddDefenseGrade
@ThesisSerialNo int,
@DefenseDate Datetime,
@grade decimal
AS
if exists(select * from Thesis where serialNumber=@ThesisSerialNo)
    Insert into Defence(SerialNumber,date,grade)Values(@ThesisSerialNo,@DefenseDate,@grade);
else
    print 'Thesis is not found';

--how to get ex id??
--CREATE PROC AddCommentsGrade
--@ThesisSerialNo int,
--@DefenseDate Datetime,
--@comments varchar(300)
--AS
--IF @ThesisSerialNo IN(select serial_no from GUCianStudentRegisterThesis)
--BEGIN
--    declare @Gid
--    select @Gid=sid from GUCianStudentRegisterThesis where serial_no=@ThesisSerialNo
--   insert into GUCianProgressReport (@Gid,date,

go;

CREATE PROC viewMyProfile 
@studentId int
AS
if exists(select * from GucianStudent where @studentId = id)
    select * from GucianStudent where @studentId = id;
else if exists(select * from NonGucianStudent where @studentId = id)
    select * from NonGucianStudent where @studentId = id;
else 
    print 'This student does not exist';
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
    update PostGradUser 
    set email=@email, password = @password where @studentID=id;
    if exists(select * from GucianStudent where @studentID = id)
    begin
        update GucianStudent
        set firstName = @firstName, lastName = @lastName, type = @type, 
        address = @address
        where id=@studentID;
    end
    if exists(select * from NonGucianStudent where @studentID = id)
        begin
            update GucianStudent
            set firstName = @firstName, lastName = @lastName, type = @type, 
            address = @address
            where id=@studentID;
        end

end
else 
    print'This Student Does not Exist'

go;

--As a Gucian graduate, add my undergarduate ID.
CREATE proc addUndergradID 
@studentID int ,
@underGradID varchar(10)
AS
if exists(select * from GucianStudent where id = @studentID)
begin
    update GucainStudent
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


CREATE PROC ViewCoursePaymentsInstall
@studentID int 
AS
if exists(select * from NonGucianStudent where id = @studentID)
begin
select p.id , p.amount as payment_amount, p.no_Installments, p.fundPercentage, i.date, i.amount as installment_amount, i.done,c.code
from Payment p inner join Installment i on p.id = i.paymentId inner join NonGucianStudentPayForCourse ng on ng.paymentNo=p.id inner join Course c on ng.cid=c.id
where @studentID = ng.sid
end
else print 'id not exist for non-Gucian'

go;


CREATE PROC ViewThesisPaymentsInstall 
@studentID int
AS
if exists(select * from GucianStudent where id = @studentID)
begin
select p.id , p.amount as payment_amount, p.no_Installments, p.fundPercentage, i.date, i.amount as installment_amount, i.done,t.serialNumber
from Payment p inner join Installment i on p.id = i.paymentId inner join Thesis t on t.payment_id = p.id inner join GUCianProgressReport g on g.thesisSerialNumber = t.serialNumber 
where @studentID = g.sid
end
else
begin
if exists(select * from NonGucianStudent where id = @studentID)
begin
select p.id , p.amount as payment_amount, p.no_Installments, p.fundPercentage, i.date, i.amount as installment_amount, i.done,t.serialNumber
from Payment p inner join Installment i on p.id = i.paymentId inner join Thesis t on t.payment_id = p.id inner join NonGUCianProgressReport g on g.thesisSerialNumber = t.serialNumber 
where @studentID = g.sid
end
end

go;


--NOTE the outer joins in NonGucians part!!!
CREATE PROC viewupcominginstallments 
@studentid int
as
if exists(select * from GucianStudent where id = @studentid)
begin
select p.id , p.amount as payment_amount, p.no_Installments, p.fundPercentage, i.date, i.amount as installment_amount, i.done,t.serialNumber
from Payment p inner join Installment i on p.id = i.paymentId inner join Thesis t on t.payment_id = p.id inner join GUCianProgressReport g on g.thesisSerialNumber = t.serialNumber 
where @studentID = g.sid and i.date> current_timeStamp
end
else
begin
if exists(select * from NonGucianStudent where id = @studentID)
begin
select p.id , p.amount as payment_amount, p.no_Installments, p.fundPercentage, i.date, i.amount as installment_amount, i.done,t.serialNumber, c.code
from Payment p inner join Installment i on p.id = i.paymentId left outer join Thesis t on t.payment_id = p.id inner join NonGUCianProgressReport g on g.thesisSerialNumber = t.serialNumber left outer join NonGucianStudentPayForCourse ng on p.id=ng.paymentNo inner join Cource c on ng.cid=c.id
where @studentID = ng.sid and i.date> current_timeStamp
end
end

go;

CREATE PROC ViewMissedInstallments 
@studentid int
as
if exists(select * from GucianStudent where id = @studentid)
begin
select p.id , p.amount as payment_amount, p.no_Installments, p.fundPercentage, i.date, i.amount as installment_amount, i.done,t.serialNumber
from Payment p inner join Installment i on p.id = i.paymentId inner join Thesis t on t.payment_id = p.id inner join GUCianProgressReport g on g.thesisSerialNumber = t.serialNumber 
where @studentID = g.sid and i.done=0 and i.date> CURRENT_TIMESTAMP
end
else
begin
if exists(select * from NonGucianStudent where id = @studentID)
begin
select p.id , p.amount as payment_amount, p.no_Installments, p.fundPercentage, i.date, i.amount as installment_amount, i.done,t.serialNumber, c.code
from Payment p inner join Installment i on p.id = i.paymentId inner join Thesis t on t.payment_id = p.id inner join NonGUCianProgressReport g on g.thesisSerialNumber = t.serialNumber inner join NonGucianStudentPayForCourse ng on p.id=ng.paymentNo inner join Cource c on ng.cid=c.id
where @studentID = ng.sid and i.done=0 and i.date> CURRENT_TIMESTAMP
end
end

go;


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
print 'wrong serial number';
end

go;

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

go;

--View my progress report(s) evaluations.
CREATE PROC ViewEvalProgressReport
@thesisSerialNo int,
@progressReportNo int
AS
-------------------------------tbc

go;

-- add publication
CREATE PROC addPublication
@title varchar(50),
@pubDate datetime,
@host varchar(50),
@place varchar(50),
@accepted bit
AS
insert into Publication(title, date, place,accepted,host) values(@title,@pubDate,@place,@accepted,@host)

go;


--Link publication to my thesis
CREATE PROC linkPubThesis
@PubID int,
@thesisSerialNo int
AS
insert into ThesisHasPublication (serialNo,pubid) values(@thesisSerialNo,@PubID)






--CREATE View ViewCoursePaymentsInstall (studentID)
--AS
--if exists(select * from GucianStudent where id = @studentID)
--begin
--select p.id , p.amount as payment_amount, p.no_Installments, p.fundPercentage, i.date, i.amount as installment_amount, i.done
--from Payment p inner join Installment i on p.id = i.paymentId inner join Thesis t on t.payment_id = p.id inner join GUCianProgressReport g on g.thesisSerialNumber = t.serialNumber 
--where @studentID = g.sid
--end
--else
--begin
--if exists(select * from GucianStudent where id = @studentID)
--begin
--select p.id , p.amount as payment_amount, p.no_Installments, p.fundPercentage, i.date, i.amount as installment_amount, i.done
--from Payment p inner join Installment i on p.id = i.paymentId inner join Thesis t on t.payment_id = p.id inner join GUCianProgressReport g on g.thesisSerialNumber = t.serialNumber 
--where @studentID = g.sid
--end
--end
















