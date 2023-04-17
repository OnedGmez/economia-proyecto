create database dbRentAway;
use dbRentAway;

CREATE TABLE Tags
 (
 TagCode varchar (10) primary key not null,
 icono varchar (25)
 );
 
 Create table Countries(
 CountryCode varchar(10) primary key not null,
 CountryName varchar (25)
 );
 
 create table Items (
 ItemCode varchar (10) primary key,
 ItemName varchar (25)
 );
 
 create table Categories (
 CategoryCode varchar(10) primary key,
 CategoryName varchar (25)
 );
 
 create table TypesVehicles (
 TypeVehicleCode varchar (10) primary key,
 TypeName varchar (25)
 );
 
 create table TypesTransmitions (
 TypeTransmitionCode varchar(10) primary key,
 TypeName  varchar (25),
 NumGears  varchar (25)
 );
 
 create table Persons(
 DNI varchar (15) primary key,
 FirstName varchar (50),
 SecondName varchar (50),
 PaternalSurname varchar (50),
 MotherLastName varchar (50),
 DayOfBirth Date,
 Age INT ,
 gender char,
 URLProfilePhoto TEXT,
 CountryCode varchar(10),
 FOREIGN KEY (CountryCode) REFERENCES Countries(CountryCode)
 );
 
 
 create table ClientPersons (
 ClientCode varchar (10) primary key,
 RegisterDate DATE,
 AVGRating NUMERIC(3,2),
 NumServicesContracted INT DEFAULT 0,
 DNI varchar (15) unique KEY,
 FOREIGN KEY (DNI) REFERENCES Persons(DNI)
 );
 
 create table Services (
  ServiceCode varchar (10) primary key,
  ServiceName varchar (25),
  ItemCode varchar (10),
  Icono varchar (25),
   FOREIGN KEY (ItemCode) REFERENCES Items(ItemCode)
 );

create table DocumentsPerson(
DocumentCode varchar (25) primary key,
URLDriverLicense  TEXT,
URLTaskHistory TEXT,
URLCourtRegistry TEXT,
Validated BIT DEFAULT 0,
DNI varchar (15),
 FOREIGN KEY (DNI) REFERENCES Persons(DNI)

);

create table ContactInformation(
ContactCode varchar (10) primary key,
EmailAddress VARCHAR(100) unique,
TelephonePrefix varchar (10),
TelephoneNumber varchar (10) unique,
DNI varchar (15),
 FOREIGN KEY (DNI) REFERENCES Persons(DNI)
);
 
 create table Cards(
 BinCard varchar (18) primary key,
 CardName varchar (25),
 CardPin varchar (4),
 ExpirationDate DATE,
 OwnerName TEXT,
 CVV varchar (5),
 Balance NUMERIC(6,2),
 DNI varchar (15),
 FOREIGN KEY (DNI) REFERENCES Persons(DNI)
 );
 
 create table Payments(
 PaymentCode varchar (10) primary key,
 PaymentDate DATE,
 SubtotalReservation NUMERIC(6,2),
 SubtotalSecurityDeposit NUMERIC(6,2),
 OverallSubtotal NUMERIC(6,2),
 GrandTotalOld NUMERIC(6,2),
 TotalDepositReturned NUMERIC(6,2),
 GrandTotalNew NUMERIC(6,2),
 ChargeCard varchar (18),
 FOREIGN KEY (ChargeCard) REFERENCES Cards(BinCard)
 );
 
 create table DepositManagement (
 PaymentCode varchar (10) primary key,
 TotalDeposit NUMERIC(6,2),
 DamageCharge NUMERIC(6,2),
 DescriptionDamage TEXT,
 TotalRefundedDeposit NUMERIC(6,2),
 Revised BIT DEFAULT 0,
 FOREIGN KEY  (PaymentCode) REFERENCES  Payments(PaymentCode)
 );
 
 create table Apartments(
 ApartmentCode varchar(10) primary key,
 Coords varchar (100),
 City varchar (100),
 Rating NUMERIC(3,2),
 BaseRentalPrice NUMERIC(6,2),
 URLPhoto Text,
 SecurityDeposit NUMERIC(6,2),
 CancellationProtection NUMERIC(6,2),
 CategoryCode varchar (10),
 FOREIGN KEY (CategoryCode) REFERENCES  Categories (CategoryCode)
 );
 
 
create table ServicesApartment(
ServiceApartmentCode varchar (10) primary key,
ApartmentCode varchar (10),
ServiceCode varchar (10),
FOREIGN KEY (ApartmentCode) REFERENCES  Apartments(ApartmentCode),
FOREIGN KEY (ServiceCode) REFERENCES Services(ServiceCode)
 );
 
 create table ApartmentDocuments (
 DocumentCode varchar (10) primary key,
 URLPropertyDeed TEXT,
 Validated BIT DEFAULT 0,
 ApartmentCode varchar (10),
 FOREIGN KEY (ApartmentCode) REFERENCES Apartments(ApartmentCode)
 );
 
 create table DetailsApartment(
 DetailCode varchar (10) primary key,
 Location TEXT,
 FloorNum INT,
 NumRooms INT,
 NumBathRooms INT,
 ApartmentCode  varchar (10),
 TagCode varchar (10),
 FOREIGN KEY (ApartmentCode) REFERENCES Apartments(ApartmentCode),
 FOREIGN KEY (TagCode) REFERENCES Tags(TagCode)
 );
 
 create table Vehicles (
 PlateCode varchar (10) primary key,
 Brand varchar (25),
 Color varchar (25),
 City varchar (25),
 URLPhoto TEXT,
 CategoryCode varchar (10),
 TypeVehicleCode varchar (10),
 FOREIGN KEY (CategoryCode) REFERENCES Categories (CategoryCode),
 FOREIGN KEY (TypeVehicleCode) REFERENCES  TypesVehicles (TypeVehicleCode)
 );
 
 create table DepartmentsReservation (
 DepartmentReservationCode varchar (10) primary key,
 ReservationDate date,
 ReservationEndDate date,
 ReservedDays INT,
 ReservedBy varchar (10),
 ApartmentCode varchar (10),
 FOREIGN KEY  (ReservedBy) REFERENCES ClientPersons(ClientCode),
  FOREIGN KEY  (ApartmentCode) REFERENCES Apartments(ApartmentCode)
 );

create table DetailsVehicles (
DetailCode varchar (10) primary key,
Model varchar (25),
Year INT,
NumPersons INT,
LargeSuitcases INT,
SmallSuitcases INT,
EngineType varchar (25),
TankCapacity INT,
NumDoors INT,
PlateCode varchar (10),
TypeTransmition varchar (10),
FOREIGN KEY (PlateCode) REFERENCES Vehicles (PlateCode),
FOREIGN KEY (TypeTransmition) REFERENCES TypesTransmitions(TypeTransmitionCode)
);

create table VehicleDocs (
VehicleDocsCode varchar (10) primary key,
URLDoc TEXT,
URLPropertyDeedVehicule TEXT,
URLVehicleOverhaul TEXT,
Validated BIT DEFAULT 0,
PlateCode varchar (10),
FOREIGN KEY (PlateCode) REFERENCES Vehicles(PlateCode)
);

create table ServicesAvailableVehicle (
ServiceVehicleCode varchar (10) primary key,
PlateCode varchar (10),
ServiceCode varchar (10),
FOREIGN KEY (PlateCode) REFERENCES Vehicles(PlateCode),
FOREIGN KEY (ServiceCode) REFERENCES Services(ServiceCode)
);

CREATE TABLE RentACar (
RentACarCode VARCHAR (10) PRIMARY KEY,
PlateCode VARCHAR (10) UNIQUE,
RentalPrice NUMERIC(6,2),
CancellationProtection NUMERIC(6,2),
FOREIGN KEY (PlateCode) REFERENCES Vehicles(PlateCode)
);

CREATE TABLE Cabs (
CabCode VARCHAR(10) PRIMARY KEY,
PlateCode VARCHAR (10) UNIQUE,
BaseRentalPrice NUMERIC(6,2),
CancellationProtection NUMERIC(6,2),
Available BIT,
FOREIGN KEY (PlateCode) REFERENCES Vehicles(PlateCode)
);

CREATE TABLE CabsReservation (
CabReservationCode VARCHAR(10) PRIMARY KEY,
CabCode  VARCHAR (10),
ReservatedBy VARCHAR (10),
OriginTravel TEXT,
TravelDestination TEXT,
KilometersAway NUMERIC(6,2),
FOREIGN KEY (CabCode) REFERENCES Cabs(CabCode),
FOREIGN KEY (ReservatedBy) REFERENCES ClientPersons(ClientCode)
);

CREATE TABLE  RentACarsReservation (
RACReservationCode  VARCHAR(10) PRIMARY KEY,
RentACarCode VARCHAR (10),
ReservatedBy VARCHAR (10),
ReservationDate DATE,
ReservationEndDateHour DATE,
ReservedDays INT,
ReceptionPlace TEXT,
ReturnPlace TEXT,
FOREIGN KEY (RentACarCode) REFERENCES RentACar(RentACarCode),
FOREIGN KEY (ReservatedBy) REFERENCES ClientPersons(ClientCode)
);


CREATE TABLE DetailsPayment (
DetailPaymentCode VARCHAR(10) PRIMARY KEY,
PaymentCode VARCHAR(10),
DepartmentReservationCode VARCHAR(10),
RACReservationCode VARCHAR(10),
CabReservationCode VARCHAR(10),
SecurityDepositDepartment NUMERIC(10,2),
SecurityDepositRentACar NUMERIC(10,2),
SubTotalDepartmentReservation NUMERIC(10,2),
SubTotalRACReservation NUMERIC(10,2),
SubTotalCabReservation NUMERIC(10,2),

FOREIGN KEY  (PaymentCode)              REFERENCES Payments(PaymentCode),
FOREIGN KEY (DepartmentReservationCode) REFERENCES DepartmentsReservation(DepartmentReservationCode),
FOREIGN KEY (RACReservationCode)        REFERENCES RentACarsReservation(RACReservationCode),
FOREIGN KEY (CabReservationCode)        REFERENCES CabsReservation(CabReservationCode)
);
