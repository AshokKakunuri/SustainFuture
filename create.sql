-- Create Donors table
CREATE TABLE Donors (
  DonorID INT PRIMARY KEY,
  EventId INT,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Address VARCHAR(100),
  Phone VARCHAR(20),
  Email VARCHAR(100),
  Date DATE,
  DonationAmount INT,
  DonationType VARCHAR(20),
  FOREIGN KEY (EventId) REFERENCES Events(EventID)
);

-- Create Volunteers table
CREATE TABLE Volunteers (
  VolunteerID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Address VARCHAR(100),
  Phone VARCHAR(20),
  Email VARCHAR(100),
  VolunteerHours INT
);

-- Create Events table
CREATE TABLE Events (
  EventID INT PRIMARY KEY,
  EventName VARCHAR(50),
  EventDescription VARCHAR(100),
  EventDate DATE,
  Location VARCHAR(100),
  Attendance INT,
  OrganizerId VARCHAR(50),
  OrganizerName VARCHAR(50),
  Budget FLOAT
);

-- Create Donations table
CREATE TABLE Donations (
  DonationID INT PRIMARY KEY,
  DonorID INT,
  EventId INT,
  DonationAmount INT,
  DonationDate DATE,
  DonationType VARCHAR(20),
  FOREIGN KEY (DonorID) REFERENCES Donors(DonorID),
  FOREIGN KEY (EventId) REFERENCES Events(EventID)
);

-- Create VolunteerEvents table
CREATE TABLE VolunteerEvents (
  VolunteerID INT,
  EventID INT,
  PRIMARY KEY (VolunteerID, EventID),
  FOREIGN KEY (VolunteerID) REFERENCES Volunteers(VolunteerID),
  FOREIGN KEY (EventID) REFERENCES Events(EventID)
);

-- Create Expenses table
CREATE TABLE Expenses (
  ExpenseID INT PRIMARY KEY,
  EventID INT,
  Description VARCHAR(100),
  Amount DECIMAL(10,2),
  Date DATE,
  FOREIGN KEY (EventID) REFERENCES Events(EventID)
);

-- Create Staff table
CREATE TABLE Staff (
  StaffID INT PRIMARY KEY,
  VolunteerID INT,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Email VARCHAR(100),
  Phone VARCHAR(20),
  Address VARCHAR(100),
  Role VARCHAR(50),
  Salary DECIMAL(10,2),
  HireDate DATE,
  FOREIGN KEY (VolunteerID) REFERENCES Volunteers(VolunteerID)
);

-- Create WorksFor table
CREATE TABLE WorksFor (
  VolunteerName VARCHAR(50),
  VolunteerNumber INT,
  EventNumber INT,
  PRIMARY KEY (VolunteerName),
  FOREIGN KEY (VolunteerNumber) REFERENCES Volunteers(VolunteerID),
  FOREIGN KEY (EventNumber) REFERENCES Events(EventID)
);

-- Create Need table
CREATE TABLE Need (
  EventNumber INT PRIMARY KEY,
  EventName VARCHAR(50)
);

-- Create Attends table
CREATE TABLE Attends (
  DonorNumber INT,
  EventID INT,
  DonorName VARCHAR(50),
  FOREIGN KEY (DonorNumber) REFERENCES Donors(DonorID),
  FOREIGN KEY (EventID) REFERENCES Events(EventID),
  PRIMARY KEY (DonorNumber, EventID)
);