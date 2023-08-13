CREATE TABLE Patient(
Email varchar(50) PRIMARY KEY,
Password varchar(30) NOT NULL,
Name varchar(50) NOT NULL,
Address varchar(60) NOT NULL,
Gender varchar(20) NOT NULL
);

CREATE TABLE MedicalHistory(
ID int PRIMARY KEY,
Ddate date NOT NULL,
Conditions varchar(100) NOT NULL, 
Surgeries varchar(100) NOT NULL, 
Medication varchar(100) NOT NULL
);

CREATE TABLE Doctor(
Email varchar(50) PRIMARY KEY,
Gender varchar(20) NOT NULL,
Password varchar(30) NOT NULL,
Name varchar(50) NOT NULL,
Salary int NOT NULL
);

CREATE TABLE Appointment(
ID int PRIMARY KEY,
Ddate date NOT NULL,
Starttime varchar(15) NOT NULL,
Endtime varchar(15) NOT NULL,
Status varchar(15) NOT NULL
);

CREATE TABLE PatientsAttendAppointments(
Patient varchar(50) NOT NULL,
Appt int NOT NULL,
Concerns varchar(40) NOT NULL,
Symptoms varchar(40) NOT NULL,
FOREIGN KEY (patient) REFERENCES Patient (Email) ON DELETE CASCADE,
FOREIGN KEY (appt) REFERENCES Appointment (ID) ON DELETE CASCADE,
PRIMARY KEY (Patient, Appt)
);

CREATE TABLE Schedule(
ID int PRIMARY KEY,
Starttime varchar(15) NOT NULL,
Endtime varchar(15) NOT NULL,
Breaktime varchar(15) NOT NULL,
Day varchar(20) NOT NULL
);

CREATE TABLE PatientsFillHistory(
Patient varchar(50) NOT NULL,
History int NOT NULL,
FOREIGN KEY (Patient) REFERENCES Patient (Email) ON DELETE CASCADE,
FOREIGN KEY (History) REFERENCES MedicalHistory (ID) ON DELETE 
CASCADE,
PRIMARY KEY (History)
);

CREATE TABLE Diagnose(
Appt int NOT NULL,
Doctor varchar(50) NOT NULL,
Diagnosis varchar(40) NOT NULL,
Prescription varchar(50) NOT NULL,
FOREIGN KEY (Appt) REFERENCES Appointment (ID) ON DELETE CASCADE,
FOREIGN KEY (Doctor) REFERENCES Doctor (Email) ON DELETE CASCADE,
PRIMARY KEY (Appt, Doctor)
);

CREATE TABLE DocsHaveSchedules(
Sched int NOT NULL,
Doctor varchar(50) NOT NULL,
FOREIGN KEY (Sched) REFERENCES Schedule (ID) ON DELETE CASCADE,
FOREIGN KEY (Doctor) REFERENCES Doctor (Email) ON DELETE CASCADE,
PRIMARY KEY (Sched, Doctor)
);

CREATE TABLE DoctorViewsHistory(
History int NOT NULL,
Doctor varchar(50) NOT NULL,
FOREIGN KEY (Doctor) REFERENCES Doctor (Email) ON DELETE CASCADE,
FOREIGN KEY (History) REFERENCES MedicalHistory (ID) ON DELETE 
CASCADE,
PRIMARY KEY (History, Doctor)
);

CREATE TABLE EmpDetails(
Deignation varchar(20),
NumOfEmp int
);
