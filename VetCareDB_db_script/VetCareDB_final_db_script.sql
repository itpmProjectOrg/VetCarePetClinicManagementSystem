-- database - mysql
-- database name : vetcaredb
use vetcaredb;

create table login(
   uname VARCHAR(45) not null,
   password VARCHAR(45),

   constraint pk_petOwner
          primary key(uname)
);

create table PetOwner(
	      ownerID int auto_increment,
          name varchar(30) unique,
          addr varchar(80) not null,
          contactNo char(10) not null,
          
          constraint pk_petOwner
          primary key(ownerID)
);

create table Pet (
	petID int auto_increment,
	ownerID int ,
    name varchar(20) not null,
    petType varchar(60),
    breed varchar(40),
    sex varchar(10),
    dob date,
	date date,
    
    
    constraint pk_pet
    primary key(petID),
    
    constraint fk_ownerID
    foreign key(ownerID)
    references PetOwner(ownerID)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

create table Veterinarian(
	name varchar(70) unique,
    speciality varchar(70) not null,
    registrationNo char(6) not null,
    email varchar(100) not null,
    contactNo char(10),
	addr varchar(100),
    
    constraint pk_veterinarian
    primary key(name)
);

create table Availability(
	id int auto_increment,
    veterinarian varchar(70),
    startTime time,
    endTime time,
    availableDate date,
    holidayAvailability char(3),
    exception date,
    
    constraint pk_availability
    primary key(id,veterinarian),
    
    constraint fk_veterinarian_1
    foreign key(Veterinarian)
    references Veterinarian(name)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

create table Appointment(
	id int auto_increment,
    ownerID int,
    aDate date not null,
    aTime time not null,
    payment real,
    paymentStatus varchar(30) ,
    appointmentNo int not null,
    veterinarian varchar(70),
    
    constraint pk_appointment
    primary key(id),
    
    constraint fk_ownerID_1
    foreign key(ownerID)
    references PetOwner(ownerID)
    ON UPDATE CASCADE
    ON DELETE SET NULL,
    
	constraint fk_veterinarian_2
    foreign key(veterinarian)
    references Veterinarian(name)
    ON UPDATE CASCADE
    ON DELETE SET NULL
    
);


create table Prescription (
	presID int auto_increment,
    pallor varchar(5),
    weight float,
    medication varchar(100),
    othersign varchar(50),
    symptoms varchar(50),
    last_date date,
    petID int,
    veterinarian varchar(70),
    
    constraint pk_prescription
    primary key(presID),
    
    constraint fk_petID
    foreign key(petID)
	references Pet(petID)
    ON UPDATE CASCADE
    ON DELETE SET NULL,
    
	constraint fk_veterinarian_3
    foreign key(veterinarian)
	references Veterinarian(name)
    ON UPDATE CASCADE
    ON DELETE SET NULL
    
);

create table clinicRecord(
	CR_ID int,
    DFE date,
    duration varchar(20),
    diagnosis varchar(10),
    investiagtion_performed varchar(20),
    speciality_referral varchar(20),
    allergies varchar(10),
    petID int,
    veterinarian varchar(70),
    
	constraint fk_petID1
    foreign key(petID)
	references Pet(petID)
    ON UPDATE CASCADE
    ON DELETE SET NULL,
    
	constraint fk_veterinarian_4
    foreign key(veterinarian)
	references Veterinarian(name)
    ON UPDATE CASCADE
    ON DELETE SET NULL
    
);

-- login
insert into login values('admin', 'admin123');

-- petOwner 
insert into petOwner values(1,'Anne Jay', 'Jk str,Colombo','0713490765');
insert into petOwner values(2,'Jay Sean', 'Maple str, Kandy','0723490700');
insert into petOwner values(3,'Jack Helen', 'Jad str, NuwaraEliya','0713000765');
insert into petOwner values(4,'Ken Helsy', 'Con str,Colombo','0713100666');
insert into petOwner values(5,'Larry Mack', 'Hilton str, Kandy','0763600768');

-- Veterinarian
insert into Veterinarian values('Amal Karunayak','Dentistry','3465','amal@gmail.com','0774379678','Kandy');
insert into Veterinarian values('Kasun Ekanayak','Dermatology','8460','kasun@gmail.com','0774379678','Kandy');
insert into Veterinarian values('Akila Kariywasam','Emergency and critical care','5460','akila@gmail.com','0774379600','Colombo');
insert into Veterinarian values('Janaka Kulathunga','Internal medicine','3550','janaka@gmail.com','0774099678','Colombo');
insert into Veterinarian values('Indika Herath','Dermatology','9421','indika@gmail.com','0714370673','Galle');

-- availability
insert into availability values (1,'Amal Karunayak', '06:30:00', '08:00:00','2022-03-07','yes','2022-03-08');
insert into availability values (2,'Kasun Ekanayak', '06:30:00', '08:30:00','2022-03-07','no', null);
insert into availability values (3,'Kasun Ekanayak', '17:30:00', '19:00:00','2022-03-12','yes', null);
insert into availability values (4,'Indika Herath', '17:30:00', '19:30:00','2022-02-17','no','2022-03-20');
insert into availability values (5,'Janaka Kulathunga', '18:30:00', '20:00:00','2022-03-18','yes','2022-03-28');

-- appointment
insert into appointment values(1,1,'2022-03-07','06:30:00',0,'pending', 1, 'Amal Karunayak');
insert into appointment values(2,2,'2022-03-07','06:35:00',0,'pending', 2, 'Amal Karunayak');
insert into appointment values(3,2,'2022-03-12','18:00:00',0,'pending', 1, 'Kasun Ekanayak');
insert into appointment values(4,3,'2022-03-12','18:15:00',0,'pending', 2, 'Kasun Ekanayak');
insert into appointment values(5,5,'2022-02-17','17:45:00',1200,'completed', 3, 'Indika Herath');

 -- pet
insert into pet values (1, 1, 'Kerby', 'Dog', 'Golden Retriver', 'female', '2020-09-16', '2021-10-20');
insert into pet values (2, 2, 'Kitty', 'Cat', 'Persian', 'female', '2022-01-10', '2022-02-14');
insert into pet values (3, 3, 'Ellie', 'Dog', 'GSD', 'female', '2022-03-02', '2022-03-28');
insert into pet values (4, 4, 'Blacky', 'Dog', 'GSD', 'male', '2022-03-28', '2022-04-01');
insert into pet values (5, 5, 'Harry', 'Parrot', ' Macaws', 'male', '2021-09-07', '2022-01-05');

 -- prescription
insert into prescription values(1,'yes',30,'Clavulanate','','diarrhea , vomiting','2022-03-14',1,'Indika Herath');
insert into prescription values(2,'no',8,'Amoxicillin','no other sign','indigestion and lack of appetite','2022-03-20',2,'Indika Herath');
insert into prescription values(3,'no',25,'Miconazole','no other sign','intense itchiness, flaky or crusty skin','2022-03-07',3,'Kasun Ekanayak');
insert into prescription values(4,'no',36,'oral health assessment and treatment','excessive drooling','chewing more slowly than usual.','2022-03-07',4,'Amal Karunayak');

-- clinicRecord
insert into clinicRecord values(1,'2022-03-8','6 month','oral exam','x-ray','none','none',4, 'Amal Karunayak');
insert into clinicRecord values(2,'2022-03-22','1 week','health-ck','blood-test','none','none',2, 'Indika Herath');
insert into clinicRecord values(3,'2022-03-14','1 week','health-ck','blood-test','none','none',1, 'Indika Herath');
insert into clinicRecord values(4,'2022-03-07','1 month','antibiotic','none','none','none',3, 'Kasun Ekanayak');

