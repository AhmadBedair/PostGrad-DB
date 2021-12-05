create database postgradDB;
use postgradDB;

--User or Users
create table Users
(
    id int primary key identity,
    email varchar(50) not null unique,
    password varchar(50) not null,
);


create table Admin
(
    id int primary key,
    foreign key(id) references Users
);


create table Student
(
    id int primary key,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    type varchar(20),
    faculty varchar(20) not null,
    address varchar(50) not null,
    GPA decimal(3,2) not null,
    foreign key(id) references Users
);


create table GucianStudent
(
    id int primary key,
    undergrad_id varchar(10) unique,
    foreign key (id) references Users on delete cascade on update cascade
);

create table NonGucianStudent
(
    id int primary key,
    foreign key (id) references Users on delete cascade on update cascade
);

create table GucStudentPhoneNumber
(
    id int,
    phone_number varchar(20),
    primary key(id, phone_number),
    foreign key (id) references GucianStudent on delete cascade on update cascade
);

create table NonGucStudentPhoneNumber
(
    id int,
    phone_number varchar(20),
    primary key(id, phone_number),
    foreign key (id) references NonGucianStudent on delete cascade on update cascade
);

create table Course
(
    id int primary key identity,
    fee decimal not null,
    creditHours int not null,
    code varchar(20) unique not null
);

create table Supervisor
(

    id int primary key,
    name varchar(20) not null,
    faculty varchar(20) not null,
    address varchar(50) not null,
    foreign key(id) references Users
    --why is id in schema not a foriegn key???#note
);

create table Thesis
(
    serial_Number varchar(30) primary key,
    field varchar(20) not null,
    type varchar(20) not null,
    title varchar(50) not null,
    startDate datetime not null,
    endDate datetime not null,
    defenseDate datetime not null,
    years as (endDate - startDate),
    grade decimal not null,
    payment_id int,
    noExtension int not null,
    foreign key (payment_id) references Payment on delete cascade on update cascade
);

create table Publication
(
    id int primary key identity,
    title varchar(50) not null,
    data datetime not null,
    place varchar(30) not null,
    accepted bit not null,
    host varchar(30) not null
);

create table Payment
(
    id int primary key identity,
    amount decimal,
    no_installments int,
    fund_percentage decimal,
    CHECK (fund_percentage>=0 AND fund_percentage<=100)
);

create table Examiner
(
    id int primary key identity,
    name varchar(20) not null,
    email varchar(30) not null,
    fieldOfWork varchar(30) not null,
    isNational bit not null
);


create table Defense
(
    serial_Number varchar(30),
    date datetime not null,
    location varchar(50) not null,
    grade decimal not null,
    primary key(serial_Number, date),
    foreign key(serial_Number) references Thesis on delete cascade on update cascade
);




create table GUCianProgressReport
(
    sid int,
    no int,
    thesis_serial_number varchar(30),
    supid int,
    date datetime not null,
    state varchar(20) not null,
    eval int not null,
    primary key(sid, no),
    foreign key(thesis_serial_number) references Thesis on delete cascade on update cascade,
    foreign key (sid) references GucianStudent on delete cascade on update cascade,
    foreign key (supid) references Supervisor on delete cascade on update cascade
);



create table NonGUCianProgressReport
(
    sid int,
    no int,
    thesis_serial_number varchar(30),
    supid int,
    date datetime not null,
    state varchar(20) not null,
    eval int not null,
    primary key(sid, no),
    check(eval>=0 and eval<=3),
    foreign key(thesis_serial_number) references Thesis on delete cascade on update cascade,
    foreign key (sid) references NonGucianStudent on delete cascade on update cascade,
    foreign key (supid) references Supervisor on delete cascade on update cascade
);

create table Installment
(
    date datetime,
    paymentid int,
    amount decimal not null,
    done bit not null,
    primary key(date, paymentid),
    foreign key (paymentid) references Payment on delete cascade on update cascade
);

create table NonGucianStudentPayForCourse
(
    sid int,
    cid int,
    paymentNo int,
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
    serial_number varchar(30),
    supid int,
    primary key(sid, serial_number, supid),
    foreign key(sid) references GucianStudent on delete cascade on update cascade,
    foreign key(serial_number) references Thesis on delete cascade on update cascade,
    foreign key(supid) references Supervisor on delete cascade on update cascade
);

create table NonGUCianStudentRegisterThesis
(
    sid int,
    serial_number varchar(30),
    supid int,
    primary key(sid, serial_number, supid),
    foreign key(sid) references NonGucianStudent on delete cascade on update cascade,
    foreign key(serial_number) references Thesis on delete cascade on update cascade,
    foreign key(supid) references Supervisor on delete cascade on update cascade
);

create table ExaminerEvaluateDefense
(
    date datetime,
    serial_number varchar(30),
    examinerid int,
    comment varchar(255),
    primary key (date, serial_number, examinerid),
    foreign key(serial_number, date) references Defense on delete cascade on update cascade,
    foreign key(examinerid) references Examiner on delete cascade on update cascade,
    
);

create table ThesisHasPublication
(
    serial_number varchar(30),
    pubid int,
    primary key(serial_number, pubid),
    foreign key(serial_number) references Thesis on delete cascade on update cascade,
    foreign key(pubid) references Publication on delete cascade on update cascade

);

