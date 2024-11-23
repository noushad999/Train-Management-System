# Train Management System

## Overview
The **Train Management System** is a comprehensive database solution designed to manage train operations, passenger details, ticket bookings, complaints, and train delays. The system aims to facilitate smooth and efficient operations of the railway system, offering a seamless user experience for passengers while managing logistical challenges such as train delays and alternative travel paths.

This project is designed using **MySQL** for database management and features several interconnected tables to track the journey of passengers, complaints, train delays, and more.

## Features
- **Passenger Management**: Track passengers with their details such as name, age, gender, contact information, and train details.
- **Ticketing**: Manage ticket bookings for passengers and their associated trains.
- **Complaints Handling**: Track and store complaints filed by passengers about train delays, disruptions, or other issues.
- **Train Delay Management**: Record information about train delays, including reasons, duration, and the affected stations.
- **Alternative Travel Paths**: Offer passengers alternative routes in case they miss their train or face delays.
- **Station Information**: Store details about stations, including their locations and names.

## Database Schema

The following tables are included in the project:

1. **Passengers**
   - **Attributes**: PassengerID, FirstName, LastName, Age, Gender, Email, PhoneNumber, TrainID.
   - **Description**: Stores passenger information, which is linked to the specific train they are associated with.

2. **Stations**
   - **Attributes**: StationID, StationName, Location.
   - **Description**: Contains station details such as station names and their respective locations.

3. **Complaints**
   - **Attributes**: ComplaintID, PassengerID, ComplaintText, DateOfComplaint.
   - **Description**: Tracks complaints filed by passengers regarding train delays or any other concerns.

4. **TrainDays**
   - **Attributes**: DelayID, TrainID, DelayReason, DelayDuration, Date.
   - **Description**: Captures information about train delays, reasons for delays, and the affected travel dates.

5. **AlternativePaths**
   - **Attributes**: ID, MissedTrainID, AlternativeTrainID.
   - **Description**: Provides alternative train routes for passengers in case they miss their original train.

6. **Tickets**
   - **Attributes**: TicketID, PassengerID, TrainID, DateOfTravel.
   - **Description**: Stores ticket information including the passenger's details and the train for which the ticket was booked.

## Installation

To run this project, follow the steps below:

### Prerequisites
- **MySQL Server**: Ensure you have **MySQL** installed on your machine.
- **MySQL Workbench**: Optional, but recommended for ease of database management.

### Steps:
1. **Clone this repository**:
   ```bash
   git clone https://github.com/noushad999/train-management-system.git

   
