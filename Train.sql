create database trainmanagementsystem;
USE trainmanagementsystem ;

create table Stations (
    StationID INT AUTO_INCREMENT PRIMARY KEY,
    StationName VARCHAR(50) NOT NULL,
    Location VARCHAR(50) NOT NULL
);

INSERT INTO Stations (StationName, Location) VALUES
('Dhaka', 'Dhaka Division'),
('Chittagong', 'Chittagong Division'),
('Sylhet', 'Sylhet Division'),
('Rajshahi', 'Rajshahi Division'),
('Khulna', 'Khulna Division'),
('Rangpur', 'Rangpur Division'),
('Barisal', 'Barisal Division'),
('Comilla', 'Chittagong Division'),
('Mymensingh', 'Mymensingh Division'),
('Bogura', 'Rajshahi Division');

CREATE TABLE Trains (
    TrainID INT AUTO_INCREMENT PRIMARY KEY,
    TrainName VARCHAR(100) NOT NULL,
    SourceStationID INT NOT NULL,
    DestinationStationID INT NOT NULL,
    DepartureTime TIME NOT NULL,
    ArrivalTime TIME NOT NULL,
    FOREIGN KEY (SourceStationID) REFERENCES Stations(StationID),
    FOREIGN KEY (DestinationStationID) REFERENCES Stations(StationID)
);

INSERT INTO Trains (TrainName, SourceStationID, DestinationStationID, DepartureTime, ArrivalTime) VALUES
('Dhaka Express', 1, 2, '06:00:00', '10:30:00'),
('Chattala Express', 2, 1, '07:30:00', '12:00:00'),
('Padma Express', 3, 1, '09:00:00', '13:00:00'),
('Sundarban Express', 5, 1, '08:30:00', '12:30:00'),
('Lalmoni Express', 1, 6, '10:00:00', '14:00:00'),
('Jamuna Express', 5, 7, '11:00:00', '15:30:00'),
('Mahanagar Express', 2, 1, '12:00:00', '16:30:00'),
('Tista Express', 6, 1, '13:00:00', '17:00:00'),
('Rangpur Express', 6, 8, '14:00:00', '18:00:00'),
('Subarna Express', 1, 9, '15:00:00', '19:30:00');


CREATE TABLE Passengers (
    PassengerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    TrainID INT NOT NULL,
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID)
);
INSERT INTO Passengers (FirstName, LastName, Age, Gender, Email, PhoneNumber, TrainID) VALUES
('Mohammad', 'Ali', 35, 'Male', 'mohammad.ali@gmail.com', '01712345678', 1),
('Fatima', 'Begum', 28, 'Female', 'fatima.begum@gmail.com', '01798765432', 2),
('Ahmed', 'Hossain', 42, 'Male', 'ahmed.hossain@gmail.com', '01812345678', 3),
('Jannat', 'Sultana', 31, 'Female', 'jannat.sultana@gmail.com', '01898765432', 4),
('Rokeya', 'Khatun', 29, 'Female', 'rokeya.khatun@gmail.com', '01912345678', 5),
('Shahid', 'Islam', 36, 'Male', 'shahid.islam@gmail.com', '01998765432', 6),
('Khalil', 'Rahman', 45, 'Male', 'khalil.rahman@gmail.com', '01765432109', 7),
('Sara', 'Parveen', 33, 'Female', 'sara.parveen@gmail.com', '01711223344', 8),
('Sami', 'Chowdhury', 40, 'Male', 'sami.chowdhury@gmail.com', '01766554433', 9),
('Ayesha', 'Sayed', 25, 'Female', 'ayesha.sayed@gmail.com', '01822334455', 10);

CREATE TABLE TrainDelays (
    DelayID INT AUTO_INCREMENT PRIMARY KEY,
    TrainID INT NOT NULL,
    DelayReason VARCHAR(255),
    DelayDuration TIME NOT NULL,
    Date DATE NOT NULL,
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID)
);

INSERT INTO TrainDelays (TrainID, DelayReason, DelayDuration, Date) VALUES
(1, 'Technical issues', '01:30:00', '2024-11-24'),
(2, 'Signal failure', '00:45:00', '2024-11-24'),
(3, 'Weather conditions', '02:00:00', '2024-11-25'),
(4, 'Track maintenance', '01:15:00', '2024-11-26'),
(5, 'Operational issues', '01:00:00', '2024-11-27'),
(6, 'Signal problem', '00:45:00', '2024-11-28'),
(7, 'Train collision delay', '03:30:00', '2024-11-29'),
(8, 'Mechanical failure', '01:20:00', '2024-11-30'),
(9, 'Track obstruction', '00:50:00', '2024-12-01'),
(10, 'Weather conditions', '01:45:00', '2024-12-02');

CREATE TABLE AlternativePaths (
    PathID INT AUTO_INCREMENT PRIMARY KEY,
    MissedTrainID INT NOT NULL,
    AlternativeTrainID INT NOT NULL,
    Description VARCHAR(255),
    FOREIGN KEY (MissedTrainID) REFERENCES Trains(TrainID),
    FOREIGN KEY (AlternativeTrainID) REFERENCES Trains(TrainID)
);

INSERT INTO AlternativePaths (MissedTrainID, AlternativeTrainID, Description) VALUES
(1, 8, 'Switch to Chattala Express for Dhaka to Chittagong route.'),
(2, 9, 'Switch to Lalmoni Express for Dhaka to Rangpur route.'),
(3, 7, 'Use Parabat Express for Sylhet to Dhaka route.'),
(4, 6, 'Take Jamuna Express from Khulna to Dhaka.'),
(5, 10, 'Use Rangpur Express for Dhaka to Rangpur route.'),
(6, 4, 'Switch to Sundarban Express for Khulna to Dhaka route.'),
(7, 3, 'Use Padma Express for Rajshahi to Dhaka route.'),
(8, 2, 'Take Mahanagar Express for Chittagong to Dhaka route.'),
(9, 5, 'Use Tista Express for Rangpur to Dhaka route.'),
(10, 1, 'Switch to Subarna Express for Dhaka to Chittagong route.');

CREATE TABLE Tickets (
    TicketID INT AUTO_INCREMENT PRIMARY KEY,
    PassengerID INT NOT NULL,
    TrainID INT NOT NULL,
    Fare DECIMAL(10, 2),
    DateOfTravel DATE,
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID)
);

INSERT INTO Tickets (PassengerID, TrainID, Fare, DateOfTravel) VALUES
(1, 1, 500.00, '2024-11-24'),
(2, 2, 600.00, '2024-11-25'),
(3, 3, 550.00, '2024-11-26'),
(4, 4, 700.00, '2024-11-27'),
(5, 5, 650.00, '2024-11-28'),
(6, 6, 750.00, '2024-11-29'),
(7, 7, 800.00, '2024-11-30'),
(8, 8, 400.00, '2024-12-01'),
(9, 9, 450.00, '2024-12-02'),
(10, 10, 300.00, '2024-12-03');


CREATE TABLE Complaints (
    ComplaintID INT AUTO_INCREMENT PRIMARY KEY,
    PassengerID INT NOT NULL,
    ComplaintText VARCHAR(255),
    DateOfComplaint DATE,
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID)
);

INSERT INTO Complaints (PassengerID, ComplaintText, DateOfComplaint) VALUES
(1, 'Train delayed by over an hour.', '2024-11-24'),
(3, 'Seats were unclean.', '2024-11-25'),
(5, 'Air conditioning was not functioning.', '2024-11-26'),
(7, 'Noisy compartments.', '2024-11-27'),
(2, 'Toilet facilities were inadequate.', '2024-11-28'),
(6, 'Train staff were uncooperative.', '2024-11-29'),
(8, 'Overcrowding in compartments.', '2024-11-30'),
(4, 'Train was late but no announcements.', '2024-12-01'),
(9, 'Ticket booking process was complicated.', '2024-12-02'),
(10, 'Wrong information about arrival times.', '2024-12-03');


CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    EmpName VARCHAR(100),
    Role VARCHAR(50),
    StationID INT NOT NULL,
    ContactNumber VARCHAR(15),
    Salary DECIMAL(10, 2),
    DateOfJoining DATE,
    FOREIGN KEY (StationID) REFERENCES Stations(StationID)
);

INSERT INTO Employees (EmpName, Role, StationID, ContactNumber, Salary, DateOfJoining) VALUES
('Abdul Karim', 'Station Master', 1, '01712345678', 50000.00, '2010-05-12'),
('Rahima Begum', 'Ticket Counter', 2, '01812345679', 30000.00, '2015-08-22'),
('Hasan Ali', 'Train Driver', 3, '01612345670', 55000.00, '2008-01-15'),
('Rokeya Sultana', 'Train Conductor', 4, '01912345671', 35000.00, '2017-03-10'),
('Mizanur Rahman', 'Maintenance Staff', 5, '01512345672', 25000.00, '2019-07-01'),
('Fahmida Akter', 'Platform Security', 1, '01312345673', 27000.00, '2020-11-18'),
('Jahangir Alam', 'Station Manager', 6, '01412345674', 60000.00, '2005-04-23'),
('Shirin Akter', 'Ticket Checker', 7, '01712345675', 32000.00, '2018-09-05'),
('Kamal Hossain', 'Porter', 8, '01812345676', 20000.00, '2021-02-12'),
('Nasima Begum', 'Janitor', 9, '01912345677', 18000.00, '2019-12-09');


#Retrieve all stations and their locations.
SELECT * FROM Stations;

#Get the details of all trains, including their source and destination stations.
SELECT * FROM Trains;

# List all passengers with their associated train details.
SELECT P.PassengerID, P.FirstName, P.Age, P.Gender, P.Email, P.PhoneNumber, T.TrainName
FROM Passengers P
JOIN Trains T ON P.TrainID = T.TrainID;

# Find all train delays with their reasons and duration.
SELECT T.TrainName, D.DelayReason, D.DelayDuration, D.Date
FROM TrainDelays D
JOIN Trains T ON D.TrainID = T.TrainID;

#Get a list of alternative paths for trains that were delayed.
SELECT T1.TrainName AS MissedTrain, T2.TrainName AS AlternativeTrain, AP.Description
FROM AlternativePaths AP
JOIN Trains T1 ON AP.MissedTrainID = T1.TrainID
JOIN Trains T2 ON AP.AlternativeTrainID = T2.TrainID;

# Get the list of tickets booked by passengers for a specific train.
SELECT P.FirstName, T.TrainName, TK.Fare, TK.DateOfTravel
FROM Tickets TK
JOIN Passengers P ON TK.PassengerID = P.PassengerID
JOIN Trains T ON TK.TrainID = T.TrainID
WHERE T.TrainID = 9;  

#List complaints from passengers about the train service.
SELECT P.FirstName, C.ComplaintText, C.DateOfComplaint
FROM Complaints C
JOIN Passengers P ON C.PassengerID = P.PassengerID;

#Get the salary details of all employees working at a specific station
SELECT E.EmpName, E.Role, E.Salary
FROM Employees E
WHERE E.StationID = 1;


#Get the details of passengers who complained about train delays.
SELECT P.FirstName, C.ComplaintText, D.DelayReason
FROM Complaints C
JOIN Passengers P ON C.PassengerID = P.PassengerID
JOIN TrainDelays D ON C.PassengerID = D.TrainID;

# Get the list of all stations along with the trains that pass through each station.
SELECT S.StationName, T.TrainName
FROM Stations S
JOIN Trains T ON S.StationID = T.SourceStationID OR S.StationID = T.DestinationStationID;

#Find all trains departing from a specific station.
SELECT TrainName, DepartureTime
FROM Trains
WHERE SourceStationID = 1; 

#List all passengers with their ticket details.
SELECT P.FirstName, P.Email, T.TrainName, TK.TicketID, TK.Fare, TK.DateOfTravel
FROM Passengers P
JOIN Tickets TK ON P.PassengerID = TK.PassengerID
JOIN Trains T ON TK.TrainID = T.TrainID;

#Get the details of trains that have had delays in the past week.
SELECT T.TrainName, D.DelayReason, D.DelayDuration
FROM TrainDelays D
JOIN Trains T ON D.TrainID = T.TrainID
WHERE D.Date >= CURDATE() - INTERVAL 7 DAY;

#Get a list of employees working on trains for a particular station
SELECT E.EmpName, E.Role, E.Salary
FROM Employees E
JOIN Stations S ON E.StationID = S.StationID
WHERE S.StationID = 1; 

#Get the train schedules for all trains departing within the next 24 hours
SELECT TrainName, DepartureTime, ArrivalTime
FROM Trains
WHERE DepartureTime >= CURDATE() AND DepartureTime < CURDATE() + INTERVAL 1 DAY;

#Get the list of all trains with their respective routes.
SELECT TrainName, S1.StationName AS SourceStation, S2.StationName AS DestinationStation
FROM Trains T
JOIN Stations S1 ON T.SourceStationID = S1.StationID
JOIN Stations S2 ON T.DestinationStationID = S2.StationID;

# List the employees with the highest salaries at each station.
SELECT E.EmpName, E.Salary, S.StationName
FROM Employees E
JOIN Stations S ON E.StationID = S.StationID
WHERE E.Salary = (SELECT MAX(Salary) FROM Employees WHERE StationID = S.StationID);

#Get a summary of the number of trains departing and arriving at each station
SELECT S.StationName, 
       COUNT(DISTINCT T1.TrainID) AS Departures, 
       COUNT(DISTINCT T2.TrainID) AS Arrivals
FROM Stations S
LEFT JOIN Trains T1 ON T1.SourceStationID = S.StationID
LEFT JOIN Trains T2 ON T2.DestinationStationID = S.StationID
GROUP BY S.StationName;
