use PostGradDB
exec StudentRegister @first_name='ammar', @last_name='ammar', @password='12345678999',@Gucian='0',@email='amma2141@gamil.com',
@type='Master', @faculty='Computer Science', @address='cairo', @GPA='3.5', @undergradID='123456789'


go

exec SupervisorRegister @name='gamal hazem', @password='12', @faculty='Engineering',
@email='gamHazem@yahoo.com'


GO


declare @out bit
exec userLogin @id='36', @password='12', @Success=@out output
print @out


go

exec addMobile @id='28', @mobile_number ='01111073467'

go

exec AdminListSup

go

exec AdminViewSupervisorProfile @supid='2'

go

exec AdminViewAllTheses

go

declare @out int
exec AdminViewOnGoingTheses @thesesCount=@out output
print @out

go

exec AdminViewStudentThesisBySupervisor

GO

exec AdminListNonGucianCourse @CourseID='1'

go


exec AdminUpdateExtension @ThesisSerialNo='1'

go

-- this insertion just for executing the AdminIssueThesisPayment proc 
INSERT INTO Thesis Values(20,'Artificial Intelligence','Master','AI Real Life Applications','2021/12/20','2022/8/3','2022/8/8',80.5,null,3)

go

declare @out bit
exec AdminIssueThesisPayment @ThesisSerialNo='20', @amount=1111, @noOfInstallments=4, @fundPercentage='55.5',
@Success=@out output

go

exec AdminViewStudentProfile @sid='1'

go



-- this insertion just for executing AdminIssueInstallPayment here we insert new payment without installment and let the proc do the jop
insert into Payment(amount, no_Installments, fundPercentage) values (1122, 4, 50.5)
go

exec AdminIssueInstallPayment @paymentID=16, @InstallStartDate='2021/1/1'

GO

exec AdminListAcceptPublication

go

exec AddCourse @courseCode='508', @creditHours='8', @fee='11000.500'

go

-- here we insert new non gucian and new course and link them with proc linkCourseStudent
declare @course INT
declare @ID int
INSERT INTO Course Values(8000,12,521)
set @course =scope_identity()
INSERT INTO PostGradUser Values('mohamed123@student.guc.edu.eg','Mohamed@1')
set @ID= scope_identity()
INSERT INTO NonGucianStudent Values(@ID,'Mohamed','ahmed','Master','Law','8 Mohamed Ibrahim Street,Maadi',2.6)

exec linkCourseStudent @courseID=@course , @studentID=@ID


go

exec addStudentCourseGrade @courseID='4' , @studentID='25' , @grade='90.00'

GO


exec ViewExamSupDefense1 @defenseDate='2022/08/10'

go

