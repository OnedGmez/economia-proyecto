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
 DNI varchar (25) primary key,
 FirstName varchar (25),
 SecondName varchar (25),
 PaternalSurname varchar (25),
 MotherLastName varchar (25),
 DayOfBirth Date,
 Age varchar (25),
 gender varchar (25),
 URLProfilePhoto varchar (125),
 CountryCode varchar(10),
 FOREIGN KEY (CountryCode) REFERENCES Countries(CountryCode)
 );
 
 
 create table ClientPersons (
 ClientCode varchar (10) primary key,
 RegisterDate datetime,
 AVGRating varchar(25),
 NumServicesContracted varchar (25),
 DNI varchar (25) unique KEY,
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
URLDriverLicense  varchar (125),
URLTaskHistory varchar (125),
URLCourtRegistry varchar (125),
Validated varchar (25),
DNI varchar (25),
 FOREIGN KEY (DNI) REFERENCES Persons(DNI)

);

create table ContactInformation(
ContactCode varchar (10) primary key,
EmailAddress varchar (25) unique,
TelephonePrefix varchar (25),
TelephoneNumber varchar (25) unique,
DNI varchar (25),
 FOREIGN KEY (DNI) REFERENCES Persons(DNI)
);
 
 create table Cards(
 BinCard varchar (10) primary key,
 CardName varchar (25),
 CardPin varchar (25),
 ExpirationDate DATE,
 OwnerName varchar (25),
 CVV varchar (5),
 Balance varchar (25),
 DNI varchar (25),
 FOREIGN KEY (DNI) REFERENCES Persons(DNI)
 );
 
 create table Payments(
 PaymentCode varchar (10) primary key,
 PaymentDate datetime,
 SubtotalReservation  varchar (25),
 SubtotalSecurityDeposit varchar (25),
 OverallSubtotal varchar (25),
 GrandTotalOld varchar (25),
 TotalDepositReturned varchar (25),
 GrandTotalNew varchar (25),
 PaymentMade varchar (25),
 ChargeCard varchar (10),
 FOREIGN KEY (ChargeCard) REFERENCES Cards(BinCard)
 );
 
 create table DepositManagement (
 PaymentCode varchar (10) primary key,
 TotalDeposit varchar (25),
 DamageCharge varchar (25),
 DescriptionDamage varchar (25),
 TotalRefundedDeposit varchar (25),
 Revised varchar (25),
 Paycode varchar (10),
 FOREIGN KEY  (Paycode) REFERENCES  Payments(PaymentCode)
 );
 
 create table Apartments(
 ApartmentCode varchar(10) primary key,
 Coords varchar (25),
 City varchar (25),
 Rating varchar (25),
 BaseRentalPrice varchar (25),
 URLPhoto Text,
 SecurityDeposit varchar (25),
 CancellationProtection varchar (25),
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
 URLPropertyDeed varchar (125),
 Validated varchar (25),
 ApartmentCode varchar (10),
 FOREIGN KEY (ApartmentCode) REFERENCES Apartments(ApartmentCode)
 );
 
 create table DetailsApartment(
 DetailCode varchar (10) primary key,
 Location varchar (25),
 FloorNum varchar (25),
 ApartmentNum varchar (25),
 NumRooms varchar (25),
 NumBathRooms varchar (25),
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
 Available varchar (25),
 URLPhoto varchar (125),
 CategoryCode varchar (10),
 TypeVehicleCode varchar (10),
 FOREIGN KEY (CategoryCode) REFERENCES Categories (CategoryCode),
 FOREIGN KEY (TypeVehicleCode) REFERENCES  TypesVehicles (TypeVehicleCode)
 );
 
 create table DepartmentsReservation (
 DepartmentReservationCode varchar (10) primary key,
 ReservationDateHour datetime,
 ReservationEndDateHour datetime,
 ReservedDays INT AS (DATEDIFF(ReservationDateHour, ReservationEndDateHour)),
 ReservedBy varchar (10),
 ApartmentCode varchar (10),
 FOREIGN KEY  (ReservedBy) REFERENCES ClientPersons(ClientCode),
  FOREIGN KEY  (ApartmentCode) REFERENCES Apartments(ApartmentCode)
 );

create table DetailsVehicles (
DetailCode varchar (10) primary key,
Model varchar (25),
Year varchar (25),
NumPersons varchar (25),
LargeSuitcases varchar (25),
SmallSuitcases varchar (25),
EngineType varchar (25),
TankCapacity varchar (25),
NumDoors varchar (25),
PlateCode varchar (10),
TypeTransmition varchar (10),
FOREIGN KEY (PlateCode) REFERENCES Vehicles (PlateCode),
FOREIGN KEY (TypeTransmition) REFERENCES TypesTransmitions(TypeTransmitionCode)
);

create table VehicleDocs (
VehicleDocsCode varchar (10) primary key,
URLDoc varchar (125),
URLPropertyDeedVehicule varchar (125),
URLVehicleOverhaul varchar (125),
Validated varchar (25),
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
RentalPrice varchar (25),
CancellationProtection varchar (25),
FOREIGN KEY (PlateCode) REFERENCES Vehicles(PlateCode)
);

CREATE TABLE Cabs (
CabCode VARCHAR(10) PRIMARY KEY,
PlateCode VARCHAR (10) UNIQUE,
BaseRentalPrice varchar (25),
CancellationProtection varchar (25),
Available varchar (25),
FOREIGN KEY (PlateCode) REFERENCES Vehicles(PlateCode)
);

CREATE TABLE CabsReservation (
CabReservationCode VARCHAR(10) PRIMARY KEY,
CabCode  VARCHAR (10),
ReservatedBy VARCHAR (10),
OriginTravel varchar (25),
TravelDestination varchar (25),
KilometersAway varchar (25),
FOREIGN KEY (CabCode) REFERENCES Cabs(CabCode),
FOREIGN KEY (ReservatedBy) REFERENCES ClientPersons(ClientCode)
);

CREATE TABLE  RentACarsReservation (
RACReservationCode  VARCHAR(10) PRIMARY KEY,
RentACarCode VARCHAR (10),
ReservatedBy VARCHAR (10),
ReservationDateHour DATETIME,
ReservationEndDateHour DATETIME,
ReservedDays INT AS (DATEDIFF(ReservationDateHour, ReservationEndDateHour)),
ReceptionPlace VARCHAR (25),
ReturnPlace VARCHAR (25),
FOREIGN KEY (RentACarCode) REFERENCES RentACar(RentACarCode),
FOREIGN KEY (ReservatedBy) REFERENCES ClientPersons(ClientCode)

);


CREATE TABLE DetailsPayment (
DetailPaymentCode VARCHAR(10) PRIMARY KEY,
PaymentCode VARCHAR(10),
DepartmentReservationCode VARCHAR(10),
RACReservationCode VARCHAR(10),
CabReservationCode VARCHAR(10),
SecurityDepositDepartment VARCHAR(25),
SecurityDepositRentACar VARCHAR(25),
SubTotalDepartmentReservation VARCHAR(25),
SubTotalRACReservation VARCHAR(25),
SubTotalCabReservation VARCHAR(25),

FOREIGN KEY  (PaymentCode)              REFERENCES Payments(PaymentCode),
FOREIGN KEY (DepartmentReservationCode) REFERENCES DepartmentsReservation(DepartmentReservationCode),
FOREIGN KEY (RACReservationCode)        REFERENCES RentACarsReservation(RACReservationCode),
FOREIGN KEY (CabReservationCode)        REFERENCES CabsReservation(CabReservationCode)
);
