CREATE DATABASE postgradDB
use postgradDB

GO

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
    firstName varchar(20) not null,
    lastName varchar(20) not null,
    type varchar(20) not null,
    faculty varchar(20) not null,
    address varchar(50) not null,
    GPA decimal(4,3) not null,
    undergradID int,
    foreign key(id) references PostGradUser on delete cascade on update cascade
);




create table NonGucianStudent
(
    id int primary key,
    firstName varchar(20) not null,
    lastName varchar(20) not null,
    type varchar(20) not null,
    faculty varchar(20) not null,
    address varchar(80) not null,
    GPA decimal(4,3) not null,
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
    fees decimal(11, 5) not null,
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
    amount decimal(11, 5) not null,
    no_Installments int not null,
    fundPercentage decimal(6, 3) not null
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
    grade decimal(10,5) not null,
    payment_id int,
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
    grade decimal(10, 5),
    primary key(serialNumber, date),
    foreign key(serialNumber) references Thesis on delete cascade on update cascade
);




create table GUCianProgressReport
(
    sid int,
    no int identity,
    date datetime,
    eval int check(eval>=0 and eval<=3),
    state varchar(20),
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
    no int identity,
    date datetime,
    eval int check(eval>=0 and eval<=3),
    state varchar(20),
    thesisSerialNumber int,
    supid int,
    description varchar(200),
    primary key(sid,no),
    foreign key(thesisSerialNumber) references Thesis on delete cascade on update cascade,
    foreign key (sid) references NonGucianStudent on delete cascade on update cascade,
    foreign key (supid) references Supervisor on delete cascade on update cascade
);

create table Installment
(
    date datetime,
    paymentId int,
    amount decimal(11, 5),
    done bit,
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
    grade decimal(10,5),
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
    comment varchar(300),
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
