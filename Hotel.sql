					/*		Creating and start using HoteManagement Database		*/
--create database HotelManagement;

--use HotelManagement;

					/*		Creating Table Customers		*/

create table Customers
(
	id int primary key identity,
	[address] nvarchar(50) not null,
	phone_number nvarchar(20),
	reservation_date date not null,
	reservation_days int not null,
	debt int,
	name nvarchar(20) not null,
	surname nvarchar(40) not null,
)

					/*		Creating Table Room Types		*/

create table RoomTypes
(
	id int primary key identity,
	type nvarchar(10),
	lodger_count int not null
)

					/*		Creating Table Rooms		*/

create table Rooms
(
	id int primary key identity,
	room_type int references RoomTypes(id),
	subrooms int not null
)

alter table Customers
add room_id int references Rooms(id)

					/*		Creating Table Room Status		*/

create table RoomStatus
(
	id int primary key identity,
	status nvarchar(10),
	room_id int references Rooms(id)
)

					/*		Creating Table Service Types		*/

create table ServiceTypes
(
	id int primary key identity,
	service_name nvarchar(20),
	service_description nvarchar(100),
	price int not null
)

					/*		Creating Table ServiceCharges		*/

create table ServiceCharges
(
	id int primary key identity,
	service_type int references ServiceTypes(id),
)

					/*		Creating Table Payments		*/

create table Payments
(
	id int primary key identity,
	customer_id int references Customers(id),
	service_charge int references ServiceCharges(id),
)

					/*		Creating Table Calendars		*/

create table Calendars
(
	id int primary key identity,
	start_date date not null,
	end_date date not null,
	status int references RoomStatus(id)
)

					/*		Creating Table Reservations		*/

create table Reservations
(
	id int primary key identity,
	payment_id int references Payments(id),
	calendar_id int references Calendars(id)
)

------------------------------------------Insert values  ------------------------------------

					/*		Insert Data	RoomTypes		*/

insert into RoomTypes values
('standart', 0),
('luxe', 3),
('vip', 2)

					/*		Insert Data	Rooms		*/

insert into Rooms values
(3, 2),
(3, 1),
(2, 1),
(2, 0),
(1, 1),
(1, 1)

					/*		Insert Data	RoomStatus		*/

alter table RoomStatus
add start_date date

alter table RoomStatus
add end_date date

insert into RoomStatus values
('busy', 5, '2022-01-10', '2022-01-17'),
('busy', 6, '2022-01-15', '2022-01-20'),
('available', 1, '2022-01-20', '2022-01-23'),
('reserverd', 2, '2022-01-28', '2022-02-03'),
('reserved', 3, '2022-02-01', '2022-02-18')


					/*		Insert Data	Customers		*/

insert into Customers values
('Baku, Yasamal', '055-111-11-11', '2022-05-02', 7, 0, 'Elnur', 'Maharramli', 3),
('Baku, Nizami', '051-222-22-22', '2021-12-23', 5, 120, 'Orxan', 'Nasibli', 2),
('Baku, Yasamal', '050-333-33-33', '2022-02-12', 7, 0, 'Madat', 'Nazaraliyev',5),
('Baku, Yasamal', '077-444-44-44', '2022-05-22', 7, 0, 'Xeyali', 'Mammadov',1),
('Baku, Yasamal', '099-555-55-55', '2022-03-20', 3, 50, 'Akif', 'Talibov', 3),
('Baku, Yasamal', '070-666-66-66', '2022-02-03', 9, 20, 'Sabir', 'Amirli', 4)

					/*		Insert Data	Service Types		*/

insert into ServiceTypes values
('spa service', 'Spa', 10),
('restaurant service', 'Restaurant', 20),
('swimming service', 'Pool', 14),
('entertainment', 'Entertainment', 25)

					/*		Insert Data	Service Charge		*/

insert into ServiceCharges values
(8),
(9),
(10),
(11)

					/*		Insert Data	Payments		*/

insert into Payments values
(3, 4),
(4, 1),
(4, 3),
(5, 4),
(7, 2),
(6, 3),
(8, 1)

					/*		Insert Data	Reservations		*/

