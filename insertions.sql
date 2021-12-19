create database mmm;
use mmm



create table PostGradUser
(
     id int primary key identity,
    email varchar(50) not null unique,
    password varchar(50) not null,
);


create table Admin
(
    id int primary key,
    foreign key(id) references PostGradUser  on delete cascade on update cascade  
);


create table GucianStudent
(
    id int primary key,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    type varchar(20) not null,
    faculty varchar(20) not null,
    address varchar(50) not null,
    GPA decimal(3,2) not null,
    undergradID int not null,
    foreign key(id) references PostGradUser on delete cascade on update cascade
);




create table NonGucianStudent
(
    id int primary key,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    type varchar(20) not null,
    faculty varchar(20) not null,
    address varchar(80) not null,
    GPA decimal(3,2) not null,
    foreign key(id) references PostGradUser on delete cascade on update cascade
);


create table GucStudentPhoneNumber
(
    id int,
    phone varchar(20),
    primary key(id, phone),
    foreign key (id) references GucianStudent on delete cascade on update cascade
);

create table NonGucStudentPhoneNumber
(
    id int,
    phone varchar(20),
    primary key(id, phone),
    foreign key (id) references NonGucianStudent on delete cascade on update cascade
);

create table Course
(
    id int primary key identity,
    fees decimal not null,
    creditHours int not null,
    code varchar(20) unique not null
);

create table Supervisor
(
    id int primary key,                              
    name varchar(20) not null,
    faculty varchar(20) not null,
    foreign key(id) references PostGradUser
);

create table Thesis
(
    serialNumber int primary key,
    field varchar(50) not null,
    type varchar(20) not null,
    title varchar(50) not null,
    startDate datetime not null,
    endDate datetime not null,
    defenseDate datetime not null,
    years as (endDate - startDate),
    grade decimal not null,
    payment_id int not null,
    noExtension int not null,
    foreign key (payment_id) references Payment on delete cascade on update cascade
);

create table Publication
(
    id int primary key identity,
    title varchar(50) not null,
    date datetime not null,
    place varchar(50) not null,
    accepted bit not null,
    host varchar(30) not null
);

create table Payment
(
    id int primary key identity,
    amount decimal not null,
    no_Installments int not null,
    fundPercentage decimal not null
);

create table Examiner
(
    id int primary key,
    name varchar(20) not null,
    fieldOfWork varchar(30) not null,
    isNational bit not null,
    foreign key(id) references PostGradUser  on delete cascade on update cascade
);


create table Defense
(
    serialNumber int,
    date datetime not null,
    location varchar(50) not null,
    grade decimal not null,
    primary key(serialNumber, date),
    foreign key(serialNumber) references Thesis on delete cascade on update cascade
);




create table GUCianProgressReport
(
    sid int,
    no int,
    date datetime not null,
    eval int not null,
    state varchar(20) not null,
    thesisSerialNumber int,
    supid int,
    primary key(sid,no),
    foreign key(thesisSerialNumber) references Thesis on delete cascade on update cascade,
    foreign key (sid) references GucianStudent on delete cascade on update cascade,
    foreign key (supid) references Supervisor on delete cascade on update cascade
);



create table NonGUCianProgressReport
(
    sid int,
    no int,
    date datetime not null,
    eval int not null,
    state varchar(20) not null,
    thesisSerialNumber int,
    supid int,
    primary key(sid,no),
    foreign key(thesisSerialNumber) references Thesis on delete cascade on update cascade,
    foreign key (sid) references NonGucianStudent on delete cascade on update cascade,
    foreign key (supid) references Supervisor on delete cascade on update cascade
);

create table Installment
(
    date datetime,
    paymentId int,
    amount decimal not null,
    done bit not null,
    primary key(date, paymentId),
    foreign key (paymentId) references Payment on delete cascade on update cascade
);

create table NonGucianStudentPayForCourse
(
    sid int,
    paymentNo int,
    cid int,
    primary key(sid, cid, paymentNo),
    foreign key(sid) references NonGucianStudent on delete cascade on update cascade,
    foreign key(cid) references Course on delete cascade on update cascade,
    foreign key(paymentNo) references Payment on delete cascade on update cascade
);

create table NonGucianStudentTakeCourse
(   
    sid int,
    cid int,
    grade decimal not null,
    primary key(sid, cid),
    foreign key(sid) references NonGucianStudent on delete cascade on update cascade,
    foreign key(cid) references Course on delete cascade on update cascade

);


create table GUCianStudentRegisterThesis
(
    sid int,
    supid int,
    serial_no int,
    primary key(sid, serial_no, supid),
    foreign key(sid) references GucianStudent on delete cascade on update cascade,
    foreign key(serial_no) references Thesis on delete cascade on update cascade,
    foreign key(supid) references Supervisor on delete cascade on update cascade
);

create table NonGUCianStudentRegisterThesis
(
    sid int,
    supid int,
    serial_no int,
    primary key(sid, serial_no, supid),
    foreign key(sid) references NonGucianStudent on delete cascade on update cascade,
    foreign key(serial_no) references Thesis on delete cascade on update cascade,
    foreign key(supid) references Supervisor on delete cascade on update cascade
);

create table ExaminerEvaluateDefense
(
    date datetime,
    serialNo int,
    examinerId int,
    comment varchar(255),
    primary key (date, serialNo, examinerId),
    foreign key(serialNo,date) references Defense on delete cascade on update cascade,
    foreign key(examinerId) references Examiner on delete cascade on update cascade,
   
);

create table ThesisHasPublication
(
    serialNo int,
    pubid int,
    primary key(serialNo, pubid),
    foreign key(serialNo) references Thesis on delete cascade on update cascade,
    foreign key(pubid) references Publication on delete cascade on update cascade

);
select * from Payment
select * from Thesis
select * from Defense
select * from PostGradUser
select * from NonGucianStudentTakeCourse
select * from ExaminerEvaluateDefense

--user1
declare @user1 int
INSERT INTO PostGradUser Values('mohamed.khaled@student.guc.edu.eg','Mohamed@1')
set @user1= scope_identity();
INSERT INTO GucianStudent Values(@user1,'Mohamed','Khaled','Master','Engineering','south 90 street,NewCairo',2.8,1024)
INSERT INTO GucStudentPhoneNumber Values(@user1,'01111073465')


declare @user14 int
INSERT INTO PostGradUser Values('Hany.ElSharkawy@hotmail.com','Hany45&8Gj')
set @user14=scope_identity();
INSERT INTO Supervisor Values(@user14,'Hany ElSharkawy','Engineering')
DECLARE @payment1 INT
INSERT INTO Payment Values(20350,2,10.5)
set @payment1=scope_identity();
INSERT INTO Thesis Values(1,'Artificial Intelligence','Master','AI Real Life Applications','2021/12/20','2022/8/3','2022/8/8',80.5,@payment1,3)
INSERT INTO GUCianStudentRegisterThesis Values(@user1,@user14,1)
INSERT INTO GUCianProgressReport Values(@user1,1,'2022/2/1',80,'in progress',1,@user14)
INSERT INTO Installment Values('2022/1/20',@payment1,6000,0)
INSERT INTO Defense Values(1,'2022/8/8','GUC Campus',80.5)
DECLARE @pub1 INT
INSERT INTO Publication Values('Artificial Intelligence','2022/10/8','GUC Campus',0,'GUC Campus')
set @pub1=scope_identity();
INSERT INTO ThesisHasPublication Values(1,@pub1)


DECLARE @user24 INT
INSERT INTO PostGradUser Values('John.mikel@gmail.com','John**2435')
set @user24=scope_identity();
INSERT INTO Examiner Values(@user24,'John Mikel','Computer Science',0)
INSERT INTO ExaminerEvaluateDefense Values('2022/8/8',1,@user24,'Accepted')


--user2
declare @user2 int
INSERT INTO PostGradUser Values('amir.magdy@student.guc.edu.eg','Amir+2345')
set @user2= scope_identity();
INSERT INTO GucianStudent Values(@user2,'Amir','Magdy','PHD','Engineering','2 Al-sobky street,MasrElGedida',1.5,1025)
INSERT INTO GucStudentPhoneNumber Values(@user2,'01121044465')


declare @user15 INT
INSERT INTO PostGradUser Values('mohamed.magdy45@hotmail.com','Magdyy56$')
set @user15=scope_identity();
INSERT INTO Supervisor Values(@user15,'Mohamed Magdy','Engineering')
DECLARE @payment2 INT
INSERT Into Payment Values(30000,3,12.5)
set @payment2=scope_identity();
INSERT Into Thesis Values(2,'Cryptography','PHD','Science Of Coding','2021/12/30','2023/4/4','2023/4/8',67.8,@payment2,2)
INSERT INTO Installment Values('2022/3/3',@payment2,15000,0)
INSERT INTO GUCianStudentRegisterThesis Values(@user2,@user15,2)
INSERT INTO Defense Values(2,'2023/4/8','GUC Campus',67.8)
INSERT INTO GUCianProgressReport Values(@user2,2,'2022/8/1',68,'in progress',2,@user15)
DECLARE @pub2 INT
INSERT INTO Publication Values('Cryptography','2023/4/20','GUC Campus',0,'GUC Campus')
set @pub2=scope_identity();
INSERT INTO ThesisHasPublication Values(2,@pub2)


Declare @user25 INT
INSERT INTO PostGradUser Values('Ahmed.Amin@gmail.com','Ahmedfg^&*')
set @user25=scope_identity();
INSERT INTO Examiner Values(@user25,'Ahmed Amin','Cryptography',1)
INSERT INTO ExaminerEvaluateDefense Values('2023/4/8',2,@user25,'Accepted')


--user3
declare @user3 int 
INSERT INTO PostGradUser Values('ahmed.bedair@student.guc.edu.eg','Ahmed$267')
set @user3= scope_identity();
INSERT INTO GucianStudent Values(@user3,'Ahmed','Bedair','PHD','Management','12 Ahmed Aly Street,NasrCity',1.9,1027)
INSERT INTO GucStudentPhoneNumber Values(@user3,'01152073490')


declare @user16 INT
INSERT INTO PostGradUser Values('mohamed.salahino@hotmail.com','Mosalah@#10')
set @user16=scope_identity();
INSERT INTO Supervisor Values(@user16,'Mohamed Salah','Management')
DECLARE @payment3 INT 
INSERT INTO Payment Values(25000,4,15.7)
set @payment3=scope_identity();
INSERT INTO Thesis Values(3,'Digital Marketing','PHD','Influence of digital marketing on start-ups','2021/12/19','2023/8/19','2023/8/25',89.5,@payment3,4)
INSERT INTO Installment Values('2022/4/4',@payment3,4000,0)
INSERT INTO GUCianStudentRegisterThesis Values(@user3,@user16,3)
INSERT INTO Defense Values(3,'2023/8/25','Conrad Hotel',89.5)
INSERT INTO GUCianProgressReport Values(@user3,1,'2022/5/1',90,'in progress',3,@user16)
Declare @pub3 INT
INSERT INTO Publication Values('Digital Marketing','2023/9/25','Conrad Hotel',0,'Conrad Hotel')
set @pub3=scope_identity();
INSERT INTO ThesisHasPublication Values(3,@pub3)


declare @user26 INT
INSERT INTO PostGradUser Values('Christian.Schubert@hotmail.com','CHristian67$$')
set @user26=scope_identity();
INSERT INTO Examiner Values(@user26,'Christian Schubert','Digital Marketing',0)
INSERT INTO ExaminerEvaluateDefense Values('2023/8/25',3,@user26,'Accepted')


--user4
declare @user4 int 
INSERT INTO PostGradUser Values('mahmoud.abdelghaffar@student.guc.edu.eg','Mahmoud#456')
set @user4= scope_identity();
INSERT INTO GucianStudent Values(@user4,'Mahmoud','Khaled','Master','Management','8 Mohamed Hamed street,Giza',2.4,1028)
INSERT INTO GucStudentPhoneNumber Values(@user4,'01011043415')


declare @user17 INT
INSERT INTO PostGradUser Values('Adham_salehh@hotmail.com','ADhoumm56$$')
set @user17=scope_identity();
INSERT INTO Supervisor Values(@user17,'Adham Saleh','Management')
DECLARE @payment4 INT
INSERT INTO Payment Values(22000,3,21)
set @payment4=scope_identity();
INSERT INTO Thesis Values(4,'MBA','Master','Master of Business Adminstration','2021/12/25','2022/12/25','2022/12/30',70.5,@payment4,2)
INSERT INTO Installment Values('2022/4/3',@payment4,11000,0)
INSERT INTO GUCianStudentRegisterThesis Values(@user4,@user17,4)
INSERT INTO Defense Values(4,'2022/12/30','Conrad Hotel',70.5)
INSERT INTO GUCianProgressReport Values(@user4,4,'2022/3/1',71,'in progress',4,@user17)
DECLARE @pub4 INT
INSERT INTO Publication Values('MBA','2023/1/8','Conrad Hotel',0,'Conrad Hotel')
set @pub4=scope_identity();
INSERT INTO ThesisHasPublication Values(4,@pub4)


declare @user27 INT
INSERT INTO PostGradUser Values('seif.gamal@gmail.com','Seif56$$')
set @user27=scope_identity();
INSERT INTO Examiner Values(@user27,'Seif Gamal','Finance',1)
INSERT INTO ExaminerEvaluateDefense Values('2022/12/30',4,@user27,'Accepted')


--user5
declare @user5 int 
INSERT INTO PostGradUser Values('Mahmoud.kased@student.guc.edu.eg','Mahmoud!675')
set @user5= scope_identity();
INSERT INTO GucianStudent Values(@user5,'Mahmoud','Kased','PHD','Law','ElRehabCity,NewCairo',1.3,1030)
INSERT INTO GucStudentPhoneNumber Values(@user5,'01141173473')


declare @user18 INT
INSERT INTO PostGradUser Values('Hatem_aly78@hotmail.com','Hatemm87&&')
set @user18=scope_identity();
INSERT INTO Supervisor Values(@user18,'Hatem Ali','Law')
DECLARE @payment5 INT
INSERT INTO Payment Values(32000,5,32.7)
set @payment5=scope_identity();
INSERT INTO Thesis Values(5,'Arbitration','PHD','Arbitration International Law','2022/1/1','2024/1/1','2024/1/5',92.4,@payment5,1)
INSERT INTO Installment Values('2022/8/8',@payment5,32000,0)
INSERT INTO GUCianStudentRegisterThesis Values(@user5,@user18,5)
INSERT INTO Defense Values(5,'2024/1/5','Fairmont Hotel',92.4)
INSERT INTO GUCianProgressReport Values(@user5,5,'2023/1/18',92,'in progress',5,@user18)
DECLARE @pub5 INT
INSERT INTO Publication Values('Arbitration','2024/1/20','Fairmont Hotel',0,'Fairmont Hotel')
set @pub5=scope_identity();
INSERT INTO ThesisHasPublication Values(5,@pub5)


declare @user28 INT
INSERT INTO PostGradUser Values('karl.jimenez@gmail.com','karlyy78%')
set @user28=scope_identity();
INSERT INTO Examiner Values(@user28,'Karl Jimenez','Arbitration',0)
INSERT INTO ExaminerEvaluateDefense Values('2024/1/5',5,@user28,'Accepted')


--user6
declare @user6 int
INSERT INTO PostGradUser Values('john.nabil@hotmail.com','John%275')
set @user6= scope_identity();
INSERT INTO NonGucianStudent Values(@user6,'John','Nabil','Master','Law','8 Mohamed Ibrahim Street,Maadi',2.6)
INSERT INTO NonGucStudentPhoneNumber Values(@user6,'01129175465')
Declare @course1 INT
INSERT INTO Course Values(8000,4,501)
set @course1 =scope_identity();
INSERT INTO NonGucianStudentTakeCourse Values(@user6,@course1,90)


declare @user19 INT
INSERT INTO PostGradUser Values('Haytham.Raouf35@hotmail.com','Haythamm45%%')
set @user19=scope_identity();
INSERT INTO Supervisor Values(@user19,'Haytham Raouf','Law')
DECLARE @payment6 INT
INSERT INTO Payment Values(27000,2,26.8)
set @payment6=scope_identity();
INSERT INTO Thesis Values(6,'International Law','Master','Master In International Law','2021/12/15','2022/5/5','2022/5/10',52.5,@payment6,3)
INSERT INTO Installment Values('2022/1/20',@payment6,9000,0)
INSERT INTO NonGUCianStudentRegisterThesis Values(@user6,@user19,6)
INSERT INTO Defense Values(6,'2022/5/10','GUC Campus',52.5)
INSERT INTO NonGUCianProgressReport Values(@user6,1,'2022/1/23',53,'in progress',6,@user19)
INSERT INTO NonGucianStudentPayForCourse Values(@user6,@payment6,@course1)
DECLARE @pub6 INT
INSERT INTO Publication Values('International Law','2023/6/20','GUC Campus',0,'GUC Campus')
set @pub6=scope_identity();
INSERT INTO ThesisHasPublication Values(6,@pub6)


declare @user29 INT
INSERT INTO PostGradUser Values('Amer.lotfy@hotmail.com','Amir456**')
set @user29=scope_identity();
INSERT INTO Examiner Values(@user29,'Amer Lotfy','International Law',1)
INSERT INTO ExaminerEvaluateDefense Values('2022/5/10',6,@user29,'Accepted')


--user7
declare @user7 int 
INSERT INTO PostGradUser Values('yasser.fahmy@gmail.com','Yasser&890')
set @user7= scope_identity();
INSERT INTO NonGucianStudent Values(@user7,'Yasser','Fahmy','PHD','Engineering','9 Nakhla elmotyaey Street,MasrElGedida',1.0)
INSERT INTO NonGucStudentPhoneNumber Values(@user7,'01111190465')
declare @course2 INT
INSERT INTO Course Values(10000,5,504)
set @course2 =scope_identity();
INSERT INTO NonGucianStudentTakeCourse Values(@user7,@course2,75)


declare @user20 INT
INSERT INTO PostGradUser Values('Hazem_waleedd@hotmail.com','Haze,m45*')
set @user20=scope_identity();
INSERT INTO Supervisor Values(@user20,'Hazem Walid','Engineering')
DECLARE @payment7 INT
INSERT INTO Payment Values(19700,2,12.5)
set @payment7=scope_identity();
INSERT INTO Thesis Values(7,'Software Engineering','PHD','Applications On Software Engineering','2021/11/18','2023/4/23','2023/11/30',85.8,@payment7,2)
INSERT INTO Installment Values('2022/5/5',@payment7,9650,0)
INSERT INTO NonGUCianStudentRegisterThesis Values(@user7,@user20,7)
INSERT INTO Defense Values(7,'2023/11/30','Fairmont Hotel',85.8)
INSERT INTO NonGUCianProgressReport Values(@user7,2,'2022/4/23',86,'in progress',7,@user20)
INSERT INTO NonGucianStudentPayForCourse Values(@user7,@payment7,@course2)
DECLARE @pub7 INT
INSERT INTO Publication Values('Software Engineering','2023/12/20','Fairmont Hotel',0,'Fairmont Hotel')
set @pub7=scope_identity();
INSERT INTO ThesisHasPublication Values(7,@pub7)


declare @user30 INT
INSERT INTO PostGradUser Values('rodolf.armando@hotmail.com','Rodolf%4fg')
set @user30=scope_identity();
INSERT INTO Examiner Values(@user30,'Rodolf Armando','Software Engineering',0)
INSERT INTO ExaminerEvaluateDefense Values('2023/11/30',7,@user30,'Accepted')


--user8
declare @user8 int 
INSERT INTO PostGradUser Values('Nader.Ahmed@gmail.com','Nader45%71')
set @user8= scope_identity();
INSERT INTO NonGucianStudent Values(@user8,'Nader','Ahmed','Master','Management','17 Morad Ahmed Street,6thOctober',3.0)
INSERT INTO NonGucStudentPhoneNumber Values(@user8,'01149575465')
declare @course3 INT
INSERT INTO Course Values(15000,8,101)
set @course3 =scope_identity();
INSERT INTO NonGucianStudentTakeCourse Values(@user8,@course3,83)


declare @user21 INT
INSERT INTO PostGradUser Values('Adel.sleem@hotmail.com','ADoull89$')
set @user21=scope_identity();
INSERT INTO Supervisor Values(@user21,'Adel Sleem','Management')
DECLARE @payment8 INT
INSERT INTO Payment Values(35000,4,8.7)
set @payment8=scope_identity();
INSERT INTO Thesis Values(8,'Accounting','Master','Fundementals Of Accounting','2021/10/4','2022/6/19','2022/6/29',77.8,@payment8,5)
INSERT INTO Installment Values('2021/11/2',@payment8,7000,0)
INSERT INTO NonGUCianStudentRegisterThesis Values(@user8,@user21,8)
INSERT INTO Defense Values(8,'2022/6/29','ALAzhar Confrenece Center',77.8)
INSERT INTO NonGUCianProgressReport Values(@user8,3,'2022/2/24',78,'in progress',8,@user21)
INSERT INTO NonGucianStudentPayForCourse Values(@user8,@payment8,@course3)
DECLARE @pub8 INT 
INSERT INTO Publication Values('Accounting','2022/12/20','AlAzhar Conference Center',0,'AlAzhar Conference Center')
set @pub8=scope_identity();
INSERT INTO ThesisHasPublication Values(8,@pub8)


declare @user31 INT
INSERT INTO PostGradUser Values('Hazem.amin@gmail.com','Hazem456+')
set @user31=scope_identity();
INSERT INTO Examiner Values(@user31,'Hazem Amin','Accounting',1)
INSERT INTO ExaminerEvaluateDefense Values('2022/6/29',8,@user31,'Accepted')


--user9
declare @user9 int 
INSERT INTO PostGradUser Values('ismail.hamdy@outlook.com','Ismail78$90')
set @user9= scope_identity();
INSERT INTO NonGucianStudent Values(@user9,'Ismail','Hamdy','PHD','Pharmacy','19 Ahmed Khalil Street,6thOctober',1.3)
INSERT INTO NonGucStudentPhoneNumber Values(@user9,'01129995465')
declare @course4 INT;
INSERT INTO Course Values(14000,8,502)
set @course4 =scope_identity();
INSERT INTO NonGucianStudentTakeCourse Values(@user9,@course4,68)


declare @user22 INT
INSERT INTO PostGradUser Values('Ahmed.waleedd@hotmail.com','Ahmedfh$%67')
set @user22=scope_identity();
INSERT INTO Supervisor Values(@user22,'Ahmed Walid','Pharmacy')
DECLARE @payment9 INT
INSERT INTO Payment Values(44750,5,29.7)
set @payment9=scope_identity();
INSERT INTO Thesis Values(9,'Pharmacuetical Industry','PHD','PHD In Pharmacuetical Industry','2021/8/8','2023/12/15','2023/12/25',88.3,@payment9,4)
INSERT INTO Installment Values('2021/10/20',@payment9,11185,0)
INSERT INTO NonGUCianStudentRegisterThesis Values(@user9,@user22,9)
INSERT INTO Defense Values(9,'2023/12/25','ALAzhar Conference Center',88.3)
INSERT INTO NonGUCianProgressReport Values(@user9,4,'2022/12/23',88,'in progress',9,@user22)
INSERT INTO NonGucianStudentPayForCourse Values(@user9,@payment9,@course4)
DECLARE @pub9 INT
INSERT INTO Publication Values('Pharmacuetical Industry','2022/12/20','AlAzhar Conference Center',0,'AlAzhar Conference Center')
set @pub9=scope_identity();
INSERT INTO ThesisHasPublication Values(9,@pub9)


declare @user32 INT
INSERT INTO PostGradUser Values('Ricardo.pina@gmail.com','Ricardo987+')
set @user32=scope_identity();
INSERT INTO Examiner Values(@user32,'Ricardo Pina','Pharmacuetical Industry',0)
INSERT INTO ExaminerEvaluateDefense Values('2023/12/25',9,@user32,'Accepted')


--user10
declare @user10 int 
INSERT INTO PostGradUser Values('Mohamed.Hamed@hotmail.com','Hamed56@390')
set @user10= scope_identity();
INSERT INTO NonGucianStudent Values(@user10,'Mohamed','Hamed','Master','Pharmacy','5 AbbasAlAkkad Street,NasrCity',2.2)
INSERT INTO NonGucStudentPhoneNumber Values(@user10,'01145084075')
declare @course5 INT;
INSERT INTO Course Values(6000,4,503)
set @course5 =scope_identity();
INSERT INTO NonGucianStudentTakeCourse Values(@user10,@course5,59)


declare @user23 INT
INSERT INTO PostGradUser Values('Ramy.malek76@hotmail.com','Ramyyty^56')
set @user23=scope_identity();
INSERT INTO Supervisor Values(@user23,'Ramy Malek','Pharmacy')
DECLARE @payment10 INT
INSERT INTO Payment Values(24750,3,23.4)
set @payment10=scope_identity();
INSERT INTO Thesis Values(10,'viruses','Master','Master In Viruses','2021/9/23','2022/8/1','2022/8/10',74.8,@payment10,3)
INSERT INTO Installment Values('2021/12/1',@payment10,8250,0)
INSERT INTO NonGUCianStudentRegisterThesis Values(@user10,@user23,10)
INSERT INTO Defense Values(10,'2022/8/10','GUC Campus',74.8)
INSERT INTO NonGUCianProgressReport Values(@user10,5,'2022/2/18',75,'in progress',10,@user23)
INSERT INTO NonGucianStudentPayForCourse Values(@user10,@payment10,@course5)
DECLARE @pub10 INT
INSERT INTO Publication Values('viruses','2022/12/20','GUC Campus',0,'GUC Campus')
set @pub10=scope_identity();
INSERT INTO ThesisHasPublication Values(10,@pub10)


declare @user33 INT
INSERT INTO PostGradUser Values('Yasser.gamal@gmail.com','Yasser67#@i')
set @user33=scope_identity();
INSERT INTO Examiner Values(@user33,'Yasser Gamal','Medical Research',1)
INSERT INTO ExaminerEvaluateDefense Values('2022/8/10',10,@user33,'Accepted')


--Admin1
declare @user11 int 
INSERT INTO PostGradUser Values('omar.mohamed@hotmail.com','Omar45^781')
set @user11= scope_identity();
INSERT INTO Admin Values(@user11)

--Admin2
declare @user12 int 
INSERT INTO PostGradUser Values('walid.marmoush@hotmail.com','Walid45#00')
set @user12= scope_identity();
INSERT INTO Admin Values(@user12)

--Admin3
declare @user13 int 
INSERT INTO PostGradUser Values('belal.ahmed@hotmail.com','Belalf35&8')
set @user13= scope_identity();
INSERT INTO Admin Values(@user13)






DECLARE @payment11 INT
INSERT INTO Payment Values(55867,6,50)
set @payment11=scope_identity();
INSERT INTO Thesis Values(11,'Robotics','PHD','Theory Of Robotics','2021/9/4','2023/8/26','2023/9/2',66.7,@payment11,1)
INSERT INTO Installment Values('2022/6/20',@payment11,55867,0)
INSERT INTO Defense Values(11,'2023/9/2','Marriot Hotel',66.7)


DECLARE @payment12 INT
INSERT INTO Payment Values(39750,2,67)
set @payment12=scope_identity();
INSERT INTO Thesis Values(12,'Machine Learning','Master','Theory of Machine Learning','2021/3/3','2022/2/1','2022/2/7',95.2,@payment12,1)
INSERT INTO Installment Values('2021/12/20',@payment12,39750,0)
INSERT INTO Defense Values(12,'2022/2/7','Marriot Hotel',95.2)


DECLARE @payment13 INT
INSERT INTO Payment Values(34850,1,67.9)
set @payment13=scope_identity();
INSERT INTO Thesis Values(13,'Data Science','Master','Fundementals of Data Science','2021/3/28','2022/1/1','2022/1/15',79.8,@payment13,3)
INSERT INTO Installment Values('2021/5/20',@payment13,11280,0)
INSERT INTO Defense Values(13,'2022/1/15','ALSalam Conference Center',79.8)


DECLARE @Payment14 INT
INSERT INTO Payment Values(40850,4,44.8)
set @payment14=scope_identity();
INSERT INTO Thesis Values(14,'Networks','PHD','Networks Analogy','2021/7/7','2022/7/7','2022/7/20',95.2,@payment14,4)
INSERT INTO Installment Values('2021/8/20',@payment14,10212.5,0)
INSERT INTO Defense Values(14,'2022/7/20','ALSalam Conference Center',95.2)


DECLARE @payment15 INT
INSERT INTO Payment Values(60500,6,33.7)
set @payment15=scope_identity();
INSERT INTO Thesis Values(15,'Cyber Security','PHD','Fundementals Of Cyber Security','2021/7/7','2023/7/7','2023/7/25',82.2,@payment15,2)
INSERT INTO Installment Values('2022/1/20',@payment15,30250,0)
INSERT INTO Defense Values(15,'2023/7/25','GUC Campus',82.2)