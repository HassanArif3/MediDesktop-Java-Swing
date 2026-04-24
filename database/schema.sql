-- MediDesktop: Database Schema (SQL Server 2022)
-- Version: 3.1.0.0
-- Created by: Muhammad Adil Dar (6th Sem, CGPA: 3.66)

CREATE TABLE dbo.Patients (
    PatientID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Gender NVARCHAR(10),
    ContactNumber NVARCHAR(15) UNIQUE, -- Unique Constraint 1
    Email NVARCHAR(100) UNIQUE,        -- Unique Constraint 2
    Address NVARCHAR(MAX),
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE dbo.Doctors (
    DoctorID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Specialization NVARCHAR(100),
    ContactNumber NVARCHAR(15),
    IsActive BIT DEFAULT 1
);

CREATE TABLE dbo.Appointments (
    AppointmentID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT FOREIGN KEY REFERENCES dbo.Patients(PatientID), -- FK 1
    DoctorID INT FOREIGN KEY REFERENCES dbo.Doctors(DoctorID),    -- FK 2
    AppointmentDate DATETIME NOT NULL,
    Status NVARCHAR(20) DEFAULT 'Scheduled',
    Notes NVARCHAR(MAX)
);

CREATE TABLE dbo.MedicalRecords (
    RecordID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT FOREIGN KEY REFERENCES dbo.Patients(PatientID), -- FK 3
    Diagnosis NVARCHAR(MAX),
    TreatmentPlan NVARCHAR(MAX),
    RecordDate DATETIME DEFAULT GETDATE()
);
