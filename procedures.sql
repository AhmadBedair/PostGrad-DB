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
                        insert into GucStudentPhoneNumber (phone_number) values (@mobile_number);
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

