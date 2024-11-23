# Train Management System

![Train Management System](https://media.giphy.com/media/9fclu64Xq0guY/giphy.gif?cid=ecf05e47t0pelj18nh7evgrzocijqljhdopsmfmw0140bauj&ep=v1_gifs_search&rid=giphy.gif&ct=g)


## Overview
The **Train Management System** is a database project designed to manage information related to train stations, trains, passengers, ticket bookings, delays, and employees. The system allows for tracking train schedules, passenger details, and train delays, while also offering alternative paths for delayed trains and managing employee data.

## Database Schema

### Tables:
1. **Stations**: Stores information about train stations.
    - `StationID` (INT): Primary key, auto-incremented.
    - `StationName` (VARCHAR): Name of the station.
    - `Location` (VARCHAR): Location/Division of the station.

2. **Trains**: Stores information about trains, including their source and destination stations.
    - `TrainID` (INT): Primary key, auto-incremented.
    - `TrainName` (VARCHAR): Name of the train.
    - `SourceStationID` (INT): Foreign key referring to `Stations(StationID)`.
    - `DestinationStationID` (INT): Foreign key referring to `Stations(StationID)`.
    - `DepartureTime` (TIME): Train departure time.
    - `ArrivalTime` (TIME): Train arrival time.

3. **Passengers**: Stores passenger details and the train they are traveling on.
    - `PassengerID` (INT): Primary key, auto-incremented.
    - `PName` (VARCHAR): Name of the passenger.
    - `Age` (INT): Age of the passenger.
    - `Gender` (VARCHAR): Gender of the passenger.
    - `Email` (VARCHAR): Email address of the passenger.
    - `PhoneNumber` (VARCHAR): Phone number of the passenger.
    - `TrainID` (INT): Foreign key referring to `Trains(TrainID)`.

4. **TrainDelays**: Stores details about train delays.
    - `DelayID` (INT): Primary key, auto-incremented.
    - `TrainID` (INT): Foreign key referring to `Trains(TrainID)`.
    - `DelayReason` (VARCHAR): Reason for the delay.
    - `DelayDuration` (TIME): Duration of the delay.
    - `Date` (DATE): Date of the delay.

5. **AlternativePaths**: Stores information about alternative train paths in case of delays.
    - `PathID` (INT): Primary key, auto-incremented.
    - `MissedTrainID` (INT): Foreign key referring to `Trains(TrainID)` for the delayed train.
    - `AlternativeTrainID` (INT): Foreign key referring to `Trains(TrainID)` for the alternative train.
    - `Description` (VARCHAR): Description of the alternative route.

6. **Tickets**: Stores ticket booking information for passengers.
    - `TicketID` (INT): Primary key, auto-incremented.
    - `PassengerID` (INT): Foreign key referring to `Passengers(PassengerID)`.
    - `TrainID` (INT): Foreign key referring to `Trains(TrainID)`.
    - `Fare` (DECIMAL): Fare of the ticket.
    - `DateOfTravel` (DATE): Date of travel.

7. **Complaints**: Stores complaints filed by passengers.
    - `ComplaintID` (INT): Primary key, auto-incremented.
    - `PassengerID` (INT): Foreign key referring to `Passengers(PassengerID)`.
    - `ComplaintText` (VARCHAR): Text of the complaint.
    - `DateOfComplaint` (DATE): Date the complaint was filed.

8. **Employees**: Stores information about employees working at various stations.
    - `EmployeeID` (INT): Primary key, auto-incremented.
    - `EmpName` (VARCHAR): Name of the employee.
    - `Role` (VARCHAR): Role of the employee (e.g., Station Master, Ticket Counter).
    - `StationID` (INT): Foreign key referring to `Stations(StationID)`.
    - `ContactNumber` (VARCHAR): Contact number of the employee.
    - `Salary` (DECIMAL): Salary of the employee.
    - `DateOfJoining` (DATE): Date when the employee joined.

## SQL Queries

Below are some of the key SQL queries for interacting with the database.

1. **Retrieve all stations and their locations:**
    ```sql
    SELECT StationID, StationName, Location FROM Stations;
    ```

2. **Get the details of all trains, including their source and destination stations:**
    ```sql
    SELECT TrainID, TrainName, SourceStationID, DestinationStationID, DepartureTime, ArrivalTime
    FROM Trains;
    ```

3. **List all passengers with their associated train details:**
    ```sql
    SELECT P.PassengerID, P.PName, P.Age, P.Gender, P.Email, P.PhoneNumber, T.TrainName
    FROM Passengers P
    JOIN Trains T ON P.TrainID = T.TrainID;
    ```

4. **Find all train delays with their reasons and duration:**
    ```sql
    SELECT T.TrainName, D.DelayReason, D.DelayDuration, D.Date
    FROM TrainDelays D
    JOIN Trains T ON D.TrainID = T.TrainID;
    ```

5. **Get a list of alternative paths for trains that were delayed:**
    ```sql
    SELECT T1.TrainName AS MissedTrain, T2.TrainName AS AlternativeTrain, AP.Description
    FROM AlternativePaths AP
    JOIN Trains T1 ON AP.MissedTrainID = T1.TrainID
    JOIN Trains T2 ON AP.AlternativeTrainID = T2.TrainID;
    ```

6. **Get the list of tickets booked by passengers for a specific train:**
    ```sql
    SELECT P.PName, T.TrainName, TK.Fare, TK.DateOfTravel
    FROM Tickets TK
    JOIN Passengers P ON TK.PassengerID = P.PassengerID
    JOIN Trains T ON TK.TrainID = T.TrainID;
    ```

## Installation

1. Clone or download the repository to your local machine.
2. Open a MySQL client or use a tool like MySQL Workbench.
3. Run the provided SQL script to create the database and populate the tables with sample data.
4. Execute the SQL queries to interact with the database.

## Conclusion
The Train Management System efficiently handles information related to train operations, passenger details, and train delays, providing a comprehensive overview of the operations for effective management.

## Thank you all for listening to our presentation! 🚂 We hope you won’t miss your train, and we also appreciate your patience—if you’ve been on this ride with us till the end, you definitely deserve a first-class ticket!
![Train Management System](https://i.giphy.com/media/v1.Y2lkPTc5MGI3NjExbXVxa3l2MmZ2aTdwejBtNmhrdDhxeWxtMWZwcm0wZDZvY3IxenQ2ZSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/5YS2veXdeDhsI/giphy.gif)


## Do You Guys Have Any Question!

![Train Management System](https://i.giphy.com/media/v1.Y2lkPTc5MGI3NjExa2V5NGFmM3FxY2xyZW8ycmt6cmZ2djE4YmZsbzI1bHhsMDBmMW45OSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/pglQIJTs40YcE/giphy.gif)



