create database postgradDB;



create table PostGradUser
(
     id int primary key identity,
    email varchar(10) not null unique,
    password varchar(10) not null,
);


create table Admin
(
    id int primary key,
    foreign key(id) references PostGradUser  on delete cascade on update cascade  
);


create table GucianStudent
(
    id int primary key,
    firstName varchar(10) not null,
    lastName varchar(10) not null,
    type varchar(10) not null,
    faculty varchar(20) not null,
    address varchar(10) not null,
    GPA decimal(3,2) not null,
    undergradID varchar(10) not null,
    foreign key(id) references PostGradUser on delete cascade on update cascade
);



create table NonGucianStudent
(
    id int primary key,

    first_name varchar(20) not null,
    last_name varchar(20) not null,
    type varchar(20) not null,
    faculty varchar(20) not null,
    address varchar(50) not null,
    GPA decimal(3,2) not null,
    foreign key(id) references PostGradUser on delete cascade on update cascade
);


create table GUCStudentPhoneNumber
(
    id int,
    phone varchar(20),
    primary key(id, phone),
    foreign key (id) references GucianStudent on delete cascade on update cascade
);

create table NonGUCStudentPhoneNumber
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


create table Payment
(
    id int primary key identity,
    amount decimal ,
    no_Installments int ,
    fundPercentage decimal, 
    CHECK (fundPercentage>=0 AND fundPercentage<=100)

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
    payment_id int ,
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
    description varchar(200),
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
    description varchar (200),
    primary key(sid,no),
    check(eval>=0 and eval<=3),
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
--EXEC sp_MSforeachtable @command1="DROP TABLE ?"
