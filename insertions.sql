declare @user1 int
INSERT INTO PostGradUser Values('mohamed.khaled@student.guc.edu.eg','Mohamed@1')
set @user1= scope_identity();
INSERT INTO GucianStudent Values(@user1,'Mohamed','Khaled','Master','Engineering','south 90 street,NewCairo',2.8,1024)
INSERT INTO GucStudentPhoneNumber Values(@user1,'01111073465')

declare @user2 int
INSERT INTO PostGradUser Values('amir.magdy@student.guc.edu.eg','Amir+2345')
set @user2= scope_identity();
INSERT INTO GucianStudent Values(@user2,'Amir','Magdy','PHD','Engineering','2 Al-sobky street,MasrElGedida',1.5,1025)
INSERT INTO GucStudentPhoneNumber Values(@user2,'01121044465')

declare @user3 int 
INSERT INTO PostGradUser Values('ahmed.bedair@student.guc.edu.eg','Ahmed$267')
set @user3= scope_identity();
INSERT INTO GucianStudent Values(@user3,'Ahmed','Bedair','PHD','Management','12 Ahmed Aly Street,NasrCity',1.9,1027)
INSERT INTO GucStudentPhoneNumber Values(@user3,'01152073490')

declare @user4 int 
INSERT INTO PostGradUser Values('mahmoud.abdelghaffar@student.guc.edu.eg','Mahmoud#456')
set @user4= scope_identity();
INSERT INTO GucianStudent Values(@user4,'Mahmoud','Khaled','Master','Management','8 Mohamed Hamed street,Giza',2.4,1028)
INSERT INTO GucStudentPhoneNumber Values(@user4,'01011043415')

declare @user5 int 
INSERT INTO PostGradUser Values('Mahmoud.kased@student.guc.edu.eg','Mahmoud!675')
set @user5= scope_identity();
INSERT INTO GucianStudent Values(@user5,'Mahmoud','Kased','PHD','Law','ElRehabCity,NewCairo',1.3,1030)
INSERT INTO GucStudentPhoneNumber Values(@user5,'01141173473')

declare @user6 int
INSERT INTO PostGradUser Values('john.nabil@hotmail.com','John%275')
set @user6= scope_identity();
INSERT INTO NonGucianStudent Values(@user6,'John','Nabil','Master','Law','8 Mohamed Ibrahim Street,Maadi',2.6,1032)
INSERT INTO NonGucStudentPhoneNumber Values(@user6,'01129175465')

declare @user7 int 
INSERT INTO PostGradUser Values('yasser.fahmy@gmail.com','Yasser&890')
set @user7= scope_identity();
INSERT INTO NonGucianStudent Values(@user7,'Yasser','Fahmy','PHD','Engineering','9 Nakhla elmotyaey Street,MasrElGedida',1.0)
INSERT INTO NonGucStudentPhoneNumber Values(@user7,'01111190465')

declare @user8 int 
INSERT INTO PostGradUser Values('Nader.Ahmed@gmail.com','Nader45%71')
set @user8= scope_identity();
INSERT INTO NonGucianStudent Values(@user8,'Nader','Ahmed','Master','Management','17 Morad Ahmed Street,6thOctober',3.0)
INSERT INTO NonGucStudentPhoneNumber Values(@user8,'01149575465')

declare @user9 int 
INSERT INTO PostGradUser Values('ismail.hamdy@outlook.com','Ismail78$90')
set @user9= scope_identity();
INSERT INTO NonGucianStudent Values(@user9,'Ismail','Hamdy','PHD','Pharmacy','19 Ahmed Khalil Street,6thOctober',1.3)
INSERT INTO NonGucStudentPhoneNumber Values(@user9,'01129995465')

declare @user10 int 
INSERT INTO PostGradUser Values('Mohamed.Hamed@hotmail.com','Hamed56@390')
set @user10= scope_identity();
INSERT INTO NonGucianStudent Values(@user10,'Mohamed','Hamed','Master','Pharmacy','5 AbbasAlAkkad Street,NasrCity',2.2)
INSERT INTO NonGucStudentPhoneNumber Values(@user10,'01145084075')

declare @user11 int 
INSERT INTO PostGradUser Values('omar.mohamed@hotmail.com','Omar45^781')
set @user11= scope_identity();
INSERT INTO Admin Values(@user11)

declare @user12 int 
INSERT INTO PostGradUser Values('walid.marmoush@hotmail.com','Walid45#00')
set @user12= scope_identity();
INSERT INTO Admin Values(@user11)

declare @user13 int 
INSERT INTO PostGradUser Values('belal.ahmed@hotmail.com','Belalf35&8')
set @user13= scope_identity();
INSERT INTO Admin Values(@user13)

declare @user14 int
INSERT INTO PostGradUser Values('Hany.ElSharkawy@hotmail.com','Hany45&8Gj')
set @user14=scope_identity();
INSERT INTO Supervisor Values(@user14,'Hany ElSharkawy','Engineering')

declare @user15 INT
INSERT INTO PostGradUser Values('mohamed.magdy45@hotmail.com','Magdyy56$')
set @user15=scope_identity();
INSERT INTO Supervisor Values(@user15,'Mohamed Magdy','Engineering')

declare @user16 INT
INSERT INTO PostGradUser Values('mohamed.salahino@hotmail.com','Mosalah@#10')
set @user16=scope_identity();
INSERT INTO Supervisor Values(@user16,'Mohamed Salah','Management')

declare @user17 INT
INSERT INTO PostGradUser Values('Adham_salehh@hotmail.com','ADhoumm56$$')
set @user17=scope_identity();
INSERT INTO Supervisor Values(@user17,'Adham Saleh','Management')

declare @user18 INT
INSERT INTO PostGradUser Values('Hatem_aly78@hotmail.com','Hatemm87&&')
set @user18=scope_identity();
INSERT INTO Supervisor Values(@user18,'Hatem Ali','Law')

declare @user19 INT
INSERT INTO PostGradUser Values('Haytham.Raouf35@hotmail.com','Haythamm45%%')
set @user19=scope_identity();
INSERT INTO Supervisor Values(@user19,'Haytham Raouf','Law')

declare @user20 INT
INSERT INTO PostGradUser Values('Hazem_waleedd@hotmail.com','Haze,m45*')
set @user20=scope_identity();
INSERT INTO Supervisor Values(@user20,'Hazem Walid','Engineering')

declare @user21 INT
INSERT INTO PostGradUser Values('Adel.sleem@hotmail.com','ADoull89$')
set @user21=scope_identity();
INSERT INTO Supervisor Values(@user21,'Adel Sleem','Management')

declare @user22 INT
INSERT INTO PostGradUser Values('Ahmed.waleedd@hotmail.com','Ahmedfh$%67')
set @user22=scope_identity();
INSERT INTO Supervisor Values(@user22,'Ahmed Walid','Pharmacy')

declare @user23 INT
INSERT INTO PostGradUser Values('Ramy.malek76@hotmail.com','Ramyyty^56')
set @user23=scope_identity();
INSERT INTO Supervisor Values(@user23,'Ramy Malek','Pharmacy')

DECLARE @user24 INT
INSERT INTO PostGradUser Values('John.mikel@gmail.com','John**2435')
set @user24=scope_identity();
INSERT INTO Examiner Values(@user24,'John Mikel','Computer Science',0)

Declare @user25 INT
INSERT INTO PostGradUser Values('Ahmed.Amin@gmail.com','Ahmedfg^&*')
set @user25=scope_identity();
INSERT INTO Examiner Values(@user25,'Ahmed Amin','Cryptography',1)

declare @user26 INT
INSERT INTO PostGradUser Values('Christian.Schubert@hotmail.com','CHristian67$$')
set @user26=scope_identity();
INSERT INTO Examiner Values(@user26,'Christian Schubert','Digital Marketing',0)

declare @user27 INT
INSERT INTO PostGradUser Values('seif.gamal@gmail.com','Seif56$$')
set @user27=scope_identity();
INSERT INTO Examiner Values(@user27,'Seif Gamal','Finance',1)

declare @user28 INT
INSERT INTO PostGradUser Values('karl.jimenez@gmail.com','karlyy78%')
set @user28=scope_identity();
INSERT INTO Examiner Values(@user28,'Karl Jimenez','Arbitration',0)

declare @user29 INT
INSERT INTO PostGradUser Values('Amer.lotfy@hotmail.com','Amir456**')
set @user29=scope_identity();
INSERT INTO Examiner Values(@user29,'Amer Lotfy','International Law',1)

declare @user30 INT
INSERT INTO PostGradUser Values('rodolf.armando@hotmail.com','Rodolf%4fg')
set @user30=scope_identity();
INSERT INTO Examiner Values(@user30,'Rodolf Armando','Software Engineering',0)

declare @user31 INT
INSERT INTO PostGradUser Values('Hazem.amin@gmail.com','Hazem456+')
set @user31=scope_identity();
INSERT INTO Examiner Values(@user31,'Hazem Amin','Accounting',1)

declare @user32 INT
INSERT INTO PostGradUser Values('Ricardo.pina@gmail.com','Ricardo987+')
set @user32=scope_identity();
INSERT INTO Examiner Values(@user32,'Ricardo Pina','Pharmacuetical Industry',0)

declare @user33 INT
INSERT INTO PostGradUser Values('Yasser.gamal@gmail.com','Yasser67#@i')
set @user33=scope_identity();
INSERT INTO Examiner Values(@user33,'Yasser Gamal','Medical Research',1)


INSERT INTO Course Values(100,8000,4,501)
INSERT INTO NonGucianStudentTakeCourse Values(@user6,501,90)

INSERT INTO Course Values(101,10000,5,504)
INSERT INTO NonGucianStudentTakeCourse Values(@user7,504,75)

INSERT INTO Course Values(102,15000,8,101)
INSERT INTO NonGucianStudentTakeCourse Values(@user8,101,83)

INSERT INTO Course Values(103,14000,8,502)
INSERT INTO NonGucianStudentTakeCourse Values(@user9,502,68)

INSERT INTO Course Values(104,6000,4,503)
INSERT INTO NonGucianStudentTakeCourse Values(@user10,503,59)




DECLARE @payment1 INT
INSERT INTO Payment Values(20350,2,10.5)
set @payment1=scope_identity();
INSERT INTO Thesis Values(1,'Artificial Intelligence','Master','20/12/2021','3/8/2022','8/8/2022',80.5,@payment1,3)
INSERT INTO Installment Values('20/1/2022',@payment1,6000,0)
INSERT INTO GUCianStudentRegisterThesis Values(@user1,@user14,1)
INSERT INTO Defense Values(1,'8/8/2022','GUC Campus',80.5)
INSERT INTO GUCianProgressReport Values(@user1,1,'1/2/2022',80.5,'in progress',1,@user1)
INSERT INTO ExaminerEvaluateDefense Values('8/8/2022',1,@user24,'Accepted')

DECLARE @payment2 INT
INSERT Into Payment Values(30000,3,12.5)
set @payment2=scope_identity();
INSERT Into Thesis Values(2,'Cryptography','PHD','30/12/2021','4/4/2023','8/4/2023',67.8,@payment2,2)
INSERT INTO Installment Values('3/3/2022',@payment2,15000,0)
INSERT INTO GUCianStudentRegisterThesis Values(@user2,@user15,2)
INSERT INTO Defense Values(2,'8/4/2023','GUC Campus',67.8)
INSERT INTO GUCianProgressReport Values(@user2,2,'1/8/2022',67.8,'in progress',2,@user2)
INSERT INTO ExaminerEvaluateDefense Values('8/4/2023',2,@user25,'Accepted')

DECLARE @payment3 INT 
INSERT INTO Payment Values(25000,4,15.7)
set @payment3=scope_identity();
INSERT INTO Thesis Values(3,'Digital Marketing','PHD','19/12/2021','19/8/2023','25/8/2023',89.5,@payment3,4)
INSERT INTO Installment Values('4/4/2022',@payment3,4000,0)
INSERT INTO GUCianStudentRegisterThesis Values(@user3,@user16,3)
INSERT INTO Defense Values(3,'25/8/2023','Conrad Hotel',89.5)
INSERT INTO GUCianProgressReport Values(@user3,1,'1/5/2022',89.5,'in progress',3,@user3)
INSERT INTO ExaminerEvaluateDefense Values('25/8/2023',3,@user25,'Accepted')

DECLARE @payment4 INT
INSERT INTO Payment Values(22000,3,21)
set @payment4=scope_identity();
INSERT INTO Thesis Values(4,'MBA','Master','25/12/2021','25/12/2022','30/12/2022',70.5,@payment4,2)
INSERT INTO Installment Values('3/4/2022',@payment4,11000,0)
INSERT INTO GUCianStudentRegisterThesis Values(@user4,@user17,4)
INSERT INTO Defense Values(4,'30/12/2022','Conrad Hotel',70.5)
INSERT INTO GUCianProgressReport Values(@user4,4,'1/3/2022',70.5,'in progress',4,@user4)
INSERT INTO ExaminerEvaluateDefense Values('30/12/2022',4,@user26,'Accepted')

DECLARE @payment5 INT
INSERT INTO Payment Values(32000,5,32.7)
set @payment5=scope_identity();
INSERT INTO Thesis Values(5,'Arbitration','PHD','1/1/2022','1/1/2024','5/1/2024',92.4,@payment5,1)
INSERT INTO Installment Values('8/8/2022',@payment5,32000,0)
INSERT INTO GUCianStudentRegisterThesis Values(@user5,@user18,5)
INSERT INTO Defense Values(5,'5/1/2024','Fairmont Hotel',92.4)
INSERT INTO GUCianProgressReport Values(@user5,5,'18/1/2023',92.4,'in progress',5,@user5)
INSERT INTO ExaminerEvaluateDefense Values('5/1/2024',5,@user27,'Accepted')

DECLARE @payment6 INT
INSERT INTO Payment Values(27000,2,26.8)
set @payment6=scope_identity();
INSERT INTO Thesis Values(6,'International Law','Master','15/12/2021','5/5/2022','10/5/2022',52.5,@payment6,3)
INSERT INTO Installment Values('20/1/2022',@payment6,9000,0)
INSERT INTO NonGUCianStudentRegisterThesis Values(@user6,@user19,6)
INSERT INTO Defense Values(6,'10/5/2022','GUC Campus',52.5)
INSERT INTO NonGUCianProgressReport Values(@user6,1,'23/1/2022',52.5,'in progress',6,@user6)
INSERT INTO NonGucianStudentPayForCourse Values(@user6,@payment6,501)
INSERT INTO ExaminerEvaluateDefense Values('10/5/2022',6,@user28,'Accepted')

DECLARE @payment7 INT
INSERT INTO Payment Values(19700,2,12.5)
set @payment7=scope_identity();
INSERT INTO Thesis Values(7,'Software Engineering','PHD','18/11/2021','23/4/2023','30/11/2023',85.8,@payment7,2)
INSERT INTO Installment Values('5/5/2022',@payment7,9650,0)
INSERT INTO NonGUCianStudentRegisterThesis Values(@user7,@user20,7)
INSERT INTO Defense Values(7,'30/11/2023','Fairmont Hotel',85.8)
INSERT INTO NonGUCianProgressReport Values(@user7,2,'23/4/2022',85.8,'in progress',7,@user7)
INSERT INTO NonGucianStudentPayForCourse Values(@user7,@payment7,504)
INSERT INTO ExaminerEvaluateDefense Values('30/11/2023',7,@user29,'Accepted')

DECLARE @payment8 INT
INSERT INTO Payment Values(35000,4,8.7)
set @payment8=scope_identity();
INSERT INTO Thesis Values(8,'Accounting','Master','4/10/2021','19/6/2022','29/6/2022',77.8,@payment8,5)
INSERT INTO Installment Values('2/11/2021',@payment8,7000,0)
INSERT INTO NonGUCianStudentRegisterThesis Values(@user8,@user21,8)
INSERT INTO Defense Values(8,'29/6/2022','ALAzhar Confrenece Center',77.8)
INSERT INTO NonGUCianProgressReport Values(@user8,3,'29/2/2022',77.8,'in progress',8,@user8)
INSERT INTO NonGucianStudentPayForCourse Values(@user8,@payment8,101)
INSERT INTO ExaminerEvaluateDefense Values('29/6/2022',8,@user30,'Accepted')

DECLARE @payment9 INT
INSERT INTO Payment Values(44750,5,29.7)
set @payment9=scope_identity();
INSERT INTO Thesis Values(9,'Pharmacuetical Industry','PHD','8/8/2021','15/12/2023','25/12/2023',88.3,@payment9,4)
INSERT INTO Installment Values('20/10/2021',@payment9,11185,0)
INSERT INTO NonGUCianStudentRegisterThesis Values(@user9,@user22,9)
INSERT INTO Defense Values(9,'25/12/2023','ALAzhar Conference Center',88.3)
INSERT INTO NonGUCianProgressReport Values(@user9,4,'23/12/2022',88.3,'in progress',9,@user9)
INSERT INTO NonGucianStudentPayForCourse Values(@user9,@payment9,502)
INSERT INTO ExaminerEvaluateDefense Values('25/12/2023',9,@user31,'Accepted')

DECLARE @payment10 INT
INSERT INTO Payment Values(24750,3,23.4)
set @payment10=scope_identity();
INSERT INTO Thesis Values(10,'viruses','Master','23/9/2021','1/8/2022','10/8/2022',74.8,@payment10,3)
INSERT INTO Installment Values('1/12/2021',@payment10,8250,0)
INSERT INTO NonGUCianStudentRegisterThesis Values(@user10,@user23,10)
INSERT INTO Defense Values(10,'10/8/2022','GUC Campus',74.8)
INSERT INTO NonGUCianProgressReport Values(@user10,5,'18/2/2022',74.8,'in progress',10,@user10)
INSERT INTO NonGucianStudentPayForCourse Values(@user10,@payment10,503)
INSERT INTO ExaminerEvaluateDefense Values('10/8/2022',10,@user32,'Accepted')

DECLARE @payment11 INT
INSERT INTO Payment Values(55867,6,50)
set @payment11=scope_identity();
INSERT INTO Thesis Values(11,'Robotics','PHD','4/9/2021','26/8/2023','2/9/2023',66.7,@payment11,1)
INSERT INTO Installment Values('20/6/2022',@payment11,55867,0)
INSERT INTO Defense Values(11,'2/9/2023','Marriot Hotel',66.7)


DECLARE @payment12 INT
INSERT INTO Payment Values(39750,2,67)
set @payment12=scope_identity();
INSERT INTO Thesis Values(12,'Machine Learning','Master','3/3/2021','1/2/2022','7/2/2022',95.2,@payment12,1)
INSERT INTO Installment Values('20/12/2021',@payment12,39750,0)
INSERT INTO Defense Values(12,'7/2/2022','Marriot Hotel',95.2)


DECLARE @payment13 INT
INSERT INTO Payment Values(34850,1,67.9)
set @payment13=scope_identity();
INSERT INTO Thesis Values(13,'Data Science','Master','28/3/2021','1/1/2022','15/1/2022',79.8,@payment13,3)
INSERT INTO Installment Values('20/5/2021',@payment13,11280,0)
INSERT INTO Defense Values(13,'15/1/2022','ALSalam Conference Center',79.8)


DECLARE @Payment14 INT
INSERT INTO Payment Values(40850,4,44.8)
set @payment14=scope_identity();
INSERT INTO Thesis Values(14,'Networks','PHD','7/7/2021','7/7/2022','20/7/2022',95.2,@payment14,4)
INSERT INTO Installment Values('20/8/2021',@payment14,10212.5,0)
INSERT INTO Defense Values(14,'20/7/2022','ALSalam Conference Center',95.2)


DECLARE @payment15 INT
INSERT INTO Payment Values(60500,6,33.7)
set @payment15=scope_identity();
INSERT INTO Thesis Values(15,'Cyber Security','PHD','7/7/2021','7/7/2023','25/7/2023',82.2,@payment15,2)
INSERT INTO Installment Values('20/1/2022',@payment15,30250,0)
INSERT INTO Defense Values(15,'25/7/2023','GUC Campus',82.2)


DECLARE @pub1 INT
INSERT INTO Publication Values('Artificial Intelligence','8/10/2022','GUC Campus',0)
set @pub1=scope_identity();
INSERT INTO ThesisHasPublication Values(1,@pub1)


DECLARE @pub2 INT
INSERT INTO Publication Values('Cryptography','20/4/2023','GUC Campus',0)
set @pub2=scope_identity();
INSERT INTO ThesisHasPublication Values(2,@pub2)

Declare @pub3 INT
INSERT INTO Publication Values('Digital Marketing','25/9/2023','Conrad Hotel',0)
set @pub3=scope_identity();
INSERT INTO ThesisHasPublication Values(3,@pub3)

DECLARE @pub4 INT
INSERT INTO Publication Values('MBA','8/1/2023','Conrad Hotel',0)
set @pub4=scope_identity();
INSERT INTO ThesisHasPublication Values(4,@pub4)

DECLARE @pub5 INT
INSERT INTO Publication Values('Arbitration','20/1/2024','Fairmont Hotel',0)
set @pub5=scope_identity();
INSERT INTO ThesisHasPublication Values(5,@pub5)

DECLARE @pub6 INT
INSERT INTO Publication Values('International Law','20/6/2023','GUC Campus',0)
set @pub6=scope_identity();
INSERT INTO ThesisHasPublication Values(6,@pub6)

DECLARE @pub7 INT
INSERT INTO Publication Values('Software Engineering','20/12/2023','Fairmont Hotel',0)
set @pub7=scope_identity();
INSERT INTO ThesisHasPublication Values(7,@pub7)

DECLARE @pub8 INT 
INSERT INTO Publication Values('Accounting','20/12/2022','AlAzhar Conference Center',0)
set @pub8=scope_identity();
INSERT INTO ThesisHasPublication Values(8,@pub8)

DECLARE @pub9 INT
INSERT INTO Publication Values('Pharmacuetical Industry','20/12/2022','AlAzhar Conference Center',0)
set @pub9=scope_identity();
INSERT INTO ThesisHasPublication Values(9,@pub9)

DECLARE @pub10 INT
INSERT INTO Publication Values('viruses','20/12/2022','GUC Campus',0)
set @pub10=scope_identity();
INSERT INTO ThesisHasPublication Values(10,@pub10)