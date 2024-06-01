CREATE DATABASE IL_MARE;

USE IL_MARE;


CREATE TABLE Hotel (
Hotel_ID VARCHAR(255) NOT NULL PRIMARY KEY,
Hotel_Name VARCHAR(255) NOT NULL,
Hotel_location VARCHAR(255) NOT NULL,
No_of_rooms integer NOT NULL,
No_of_servicemen integer NOT NULL,
hotel_rating integer
);
DROP TABLE Hotel;

INSERT into Hotel VALUES('HTL1001','Il Mare West','Calabria',100,200,5);
INSERT into Hotel VALUES('HTL1002','Il Mare East','Amalfi Coast',100,200,5);


SELECT * FROM Hotel; 

CREATE TABLE Manager (
Manager_ID VARCHAR(255) NOT NULL PRIMARY KEY,
Manager_phone VARCHAR(255) NOT NULL,
Manager_address VARCHAR(255) NOT NULL,
Manager_First_Name VARCHAR(255) NOT NULL,
Manager_Last_Name VARCHAR(255) NOT NULL,
Manager_CNIC VARCHAR(255) NOT NULL,
Htl_ID  VARCHAR(255) FOREIGN KEY (Htl_ID) REFERENCES Hotel (Hotel_ID),
);
DROP TABLE Manager;

INSERT into Manager VALUES('MG1001','09999999','Amalfi Coast','Tracy','McConnell','90000000','HTL1002');
INSERT into Manager VALUES('MG1002','19999999','Calabria','Joshua','Mitchell','91111111','HTL1001');


SELECT * from Manager; 

CREATE TABLE Customerr (
Customer_ID VARCHAR(255) NOT NULL PRIMARY KEY,
Customer_First_Name VARCHAR(255) NOT NULL,
Customer_Last_Name VARCHAR(255) NOT NULL,
Customer_CNIC VARCHAR(255) NOT NULL,
Customer_phone VARCHAR(255) NOT NULL,
Mng_ID VARCHAR(255) FOREIGN KEY (Mng_ID) REFERENCES Manager (Manager_ID)
);
DROP TABLE Customerr;

INSERT into Customerr VALUES ('CUST1001','Pablo', 'Hudson', 37405678,03001188,'MG1002');
INSERT into Customerr VALUES ('CUST1002','Rabbie', 'Parkinson', 37400987,03002134,'MG1001');
INSERT into Customerr VALUES ('CUST1003','Packard', 'Rafferty', 37231245,03000987,'MG1001');
INSERT into Customerr VALUES ('CUST1004','Raffy', 'Parle', 37256789,03001218,'MG1001');
INSERT into Customerr VALUES ('CUST1005','Padern', 'Radbert', 23415372,03025688,'MG1002');
INSERT into Customerr VALUES ('CUST1006','Raine', 'Parsifal', 90293847,03007688,'MG1001');
INSERT into Customerr VALUES ('CUST1007','Rafi', 'Rakesh', 17823649,03002388,'MG1002');
INSERT into Customerr VALUES ('CUST1008','Pasquale', 'Napoleon', 38475012,03003288,'MG1001');
INSERT into Customerr VALUES ('CUST1009','Naoko', 'Patamon', 65781920,03008188,'MG1001');
INSERT into Customerr VALUES ('CUST1010','Patrick', 'Nadim', 25398172,03001278,'MG1002');


SELECT * from Customerr; 
SELECT Customer_ID,Customer_First_Name,Customer_Last_Name,Customer_CNIC,Customer_phone,Mng_ID from Customerr  WHERE Customer_ID = 'CUST1010';

CREATE TABLE Receptionist (
Receptionist_ID VARCHAR(255) NOT NULL PRIMARY KEY,
Receptionist_First_Name VARCHAR(255) NOT NULL,
Receptionist_Last_Name VARCHAR(255) NOT NULL,
Shift_time VARCHAR(255),
Receptionist_phone VARCHAR(255) NOT NULL,
No_of_bookings_per_day integer
);
DROP TABLE Receptionist;

INSERT into Receptionist VALUES ('RCP0001', 'Amias', 'Bee', '9AM', '03001234',5);
INSERT into Receptionist VALUES ('RCP0002', 'Cassian', 'Clio', '9AM', '03341221',8);
INSERT into Receptionist VALUES ('RCP0003', 'Dove', 'Charles', '5PM', '03001132',15);
INSERT into Receptionist VALUES ('RCP0004', 'Guthrie', 'James', '9AM', '03003334',26);
INSERT into Receptionist VALUES ('RCP0005', 'Lilac', 'John', '9AM', '03004436',8);
INSERT into Receptionist VALUES ('RCP0006', 'Juana', 'Theo', '5PM', '03211234',14);
INSERT into Receptionist VALUES ('RCP0007', 'Romy', 'Henry', '5PM', '03308238',28);
INSERT into Receptionist VALUES ('RCP0008', 'River', 'Ezra', '5PM', '03007766',23);
INSERT into Receptionist VALUES ('RCP0009', 'Jupiter', 'Otis', '9AM', '03008898',20);
INSERT into Receptionist VALUES ('RCP0010', 'Peyton', 'Hudson', '9AM', '03216264',17);

SELECT * from Receptionist; 

SELECT [Receptionist_ID]
      ,[Receptionist_First_Name]
      ,[Receptionist_Last_Name]
      ,[Shift_time]
      ,[Receptionist_phone]
      ,[No_of_bookings_per_day]
  FROM [dbo].[Receptionist]


CREATE TABLE Servicee (
Service_ID VARCHAR(255) NOT NULL PRIMARY KEY,
Service_Type VARCHAR(255) NOT NULL,
Service_Charges integer,/*link it with bill*/
Cust_ID VARCHAR(255)FOREIGN KEY (Cust_ID) REFERENCES Customerr (Customer_ID),
Mng_ID VARCHAR(255) FOREIGN KEY (Mng_ID) REFERENCES Manager (Manager_ID)
);
DROP TABLE Servicee;

INSERT into Servicee VALUES ('SER3001', 'Food Service', 35 , 'CUST1010', 'MG1002');
INSERT into Servicee VALUES ('SER3002', 'Room Service', 60 , 'CUST1001', 'MG1002');
INSERT into Servicee VALUES ('SER3003', 'Food Service', 15 , 'CUST1004', 'MG1001');
INSERT into Servicee VALUES ('SER3004', 'Food Service', 29 , 'CUST1005', 'MG1002');
INSERT into Servicee VALUES ('SER3005', 'Room Service', 60 , 'CUST1005', 'MG1002');
INSERT into Servicee VALUES ('SER3006', 'Room Service', 60 , 'CUST1002', 'MG1001');
INSERT into Servicee VALUES ('SER3007', 'Room Service', 60 , 'CUST1010', 'MG1002');
INSERT into Servicee VALUES ('SER3008', 'Food Service', 45 , 'CUST1007', 'MG1002');
INSERT into Servicee VALUES ('SER3009', 'Room Service', 60 , 'CUST1009', 'MG1001');
INSERT into Servicee VALUES ('SER3010', 'Food Service', 34 , 'CUST1006', 'MG1001');

Select * from Servicee;


CREATE TABLE Bill (
Bill_ID VARCHAR(255) NOT NULL PRIMARY KEY,
Bill_Room_Type VARCHAR(255) NOT NULL,
Total_Bill integer,
statuss VARCHAR(255),
Recpt_ID VARCHAR(255) FOREIGN KEY (Recpt_ID) REFERENCES Receptionist (Receptionist_ID),
/*Srv_ID VARCHAR(255) FOREIGN KEY (Srv_ID) REFERENCES Servicee (Service_ID)*/
);
DROP TABLE Bill;

INSERT into Bill VALUES ('B1001', 'two-bed', 100 ,'un-paid', 'RCP0005' );
INSERT into Bill VALUES ('B1002', 'one-bed', 50 ,'un-paid', 'RCP0001');
INSERT into Bill VALUES ('B1003', 'one-bed', 50 ,'un-paid', 'RCP0006');
INSERT into Bill VALUES ('B1004', 'suite', 200 ,'un-paid', 'RCP0002');
INSERT into Bill VALUES ('B1005', 'two-bed', 100 ,'un-paid', 'RCP0003');
INSERT into Bill VALUES ('B1006', 'one-bed', 50 ,'un-paid', 'RCP0007');
INSERT into Bill VALUES ('B1007', 'two-bed', 100 ,'un-paid', 'RCP0009');
INSERT into Bill VALUES ('B1008', 'suite', 200 ,'un-paid', 'RCP0010');
INSERT into Bill VALUES ('B1009', 'two-bed', 100 ,'un-paid', 'RCP0008');
INSERT into Bill VALUES ('B1010', 'one-bed', 50 ,'un-paid', 'RCP0004');

Select * from Bill;

CREATE TABLE Booking (
Booking_ID VARCHAR(255) NOT NULL PRIMARY KEY,
Booking_time VARCHAR(255) NOT NULL,
Cust_ID VARCHAR(255) FOREIGN KEY (Cust_ID) REFERENCES Customerr (Customer_ID)
);
DROP TABLE Booking;

INSERT into Booking VALUES ('BK4001', '12PM', 'CUST1001');
INSERT into Booking VALUES ('BK4002', '1PM', 'CUST1002');
INSERT into Booking VALUES ('BK4003', '2PM', 'CUST1003');
INSERT into Booking VALUES ('BK4004', '11AM', 'CUST1004');
INSERT into Booking VALUES ('BK4005', '1AM', 'CUST1005');
INSERT into Booking VALUES ('BK4006', '3PM', 'CUST1006');
INSERT into Booking VALUES ('BK4007', '7PM', 'CUST1007');
INSERT into Booking VALUES ('BK4008', '9PM', 'CUST1008');
INSERT into Booking VALUES ('BK4009', '2PM', 'CUST1009');
INSERT into Booking VALUES ('BK4010', '11PM', 'CUST1010');

SELECT * FROM Booking;


CREATE TABLE  Rooms (
Room_ID VARCHAR(255) NOT NULL PRIMARY KEY,
Bill_per_day integer,
Accommodation integer,
Htl_ID VARCHAR(255) FOREIGN KEY (Htl_ID) REFERENCES Hotel (Hotel_ID),
Cust_ID VARCHAR(255) FOREIGN KEY (Cust_ID) REFERENCES Customerr (Customer_ID)
);
DROP TABLE Rooms;

INSERT into Rooms VALUES ('R5001', 50 ,2, 'HTL1001','CUST1001');/*one*/
INSERT into Rooms VALUES ('R5002', 50 ,2, 'HTL1001','CUST1005');/*one*/
INSERT into Rooms VALUES ('R5003', 50 ,2, 'HTL1001','CUST1007');/*one*/
INSERT into Rooms VALUES ('R5004', 100 ,4, 'HTL1001','CUST1010');/*two*/
INSERT into Rooms VALUES ('R5005', 100 ,4, 'HTL1002','CUST1002');/*two*/
INSERT into Rooms VALUES ('R5006', 100 ,4, 'HTL1002','CUST1003');/*two*/
INSERT into Rooms VALUES ('R5007', 50 ,2, 'HTL1002','CUST1004');/*one*/
INSERT into Rooms VALUES ('R5008', 200 ,8, 'HTL1002','CUST1006');/*suite*/
INSERT into Rooms VALUES ('R5009', 200 ,8, 'HTL1002','CUST1008');/*suite*/
INSERT into Rooms VALUES ('R5010', 100 ,4, 'HTL1002','CUST1010');/*two*/


SELECT * FROM Rooms;


CREATE TABLE Checkout (
Checkout_ID VARCHAR(255) NOT NULL PRIMARY KEY,
Check_in_date VARCHAR(255) NOT NULL,
Check_out_date VARCHAR(255) NOT NULL,
Cust_ID VARCHAR(255) FOREIGN KEY (Cust_ID) REFERENCES Customerr (Customer_ID)
);
DROP TABLE Checkout;

INSERT into Checkout VALUES ('CHK6001', '10-2-2022','11-2-2022','CUST1001');
INSERT into Checkout VALUES ('CHK6002', '1-1-2022','2-1-2022','CUST1002');
INSERT into Checkout VALUES ('CHK6003', '23-3-2022','25-3-2022','CUST1003');
INSERT into Checkout VALUES ('CHK6004', '20-2-2022','22-2-2022','CUST1004');
INSERT into Checkout VALUES ('CHK6005', '9-2-2022','17-2-2022','CUST1005');
INSERT into Checkout VALUES ('CHK6006', '1-2-2022','3-2-2022','CUST1006');
INSERT into Checkout VALUES ('CHK6007', '9-4-2022','13-4-2022','CUST1007');
INSERT into Checkout VALUES ('CHK6008', '17-5-2022','18-5-2022','CUST1008');
INSERT into Checkout VALUES ('CHK6009', '8-5-2022','12-5-2022','CUST1009');
INSERT into Checkout VALUES ('CHK6010', '22-2-2022','24-2-2022','CUST1010');

SELECT * FROM Checkout;


CREATE TABLE Validates_ID (
Recpt_ID VARCHAR(255)FOREIGN KEY (Recpt_ID) REFERENCES Receptionist (Receptionist_ID),
Book_ID VARCHAR(255) FOREIGN KEY (Book_ID) REFERENCES Booking (Booking_ID)
/*its booking not bill*/
);
DROP TABLE Validates_ID;

INSERT into Validates_ID VALUES ('RCP0001','BK4001');
INSERT into Validates_ID VALUES ('RCP0002','BK4006');
INSERT into Validates_ID VALUES ('RCP0003','BK4003');
INSERT into Validates_ID VALUES ('RCP0004','BK4005');
INSERT into Validates_ID VALUES ('RCP0005','BK4009');
INSERT into Validates_ID VALUES ('RCP0006','BK4007');
INSERT into Validates_ID VALUES ('RCP0007','BK4004');
INSERT into Validates_ID VALUES ('RCP0008','BK4010');
INSERT into Validates_ID VALUES ('RCP0009','BK4002');
INSERT into Validates_ID VALUES ('RCP0010','BK4008');

SELECT * FROM Validates_ID;

CREATE TABLE gives_ID (
Recpt_ID VARCHAR(255) FOREIGN KEY (Recpt_ID) REFERENCES Receptionist (Receptionist_ID),
Cust_ID VARCHAR(255) FOREIGN KEY (Cust_ID) REFERENCES Customerr (Customer_ID)
);
DROP TABLE gives_ID;

INSERT into  gives_ID VALUES ('RCP0001','CUST1001');
INSERT into  gives_ID VALUES ('RCP0002','CUST1006');
INSERT into  gives_ID VALUES ('RCP0003','CUST1003');
INSERT into  gives_ID VALUES ('RCP0004','CUST1005');
INSERT into  gives_ID VALUES ('RCP0005','CUST1009');
INSERT into  gives_ID VALUES ('RCP0006','CUST1007');
INSERT into  gives_ID VALUES ('RCP0007','CUST1004');
INSERT into  gives_ID VALUES ('RCP0008','CUST1010');
INSERT into  gives_ID VALUES ('RCP0009','CUST1002');
INSERT into  gives_ID VALUES ('RCP0010','CUST1008');

SELECT * FROM gives_ID;

CREATE TABLE Does (
Cust_ID VARCHAR(255) FOREIGN KEY (Cust_ID) REFERENCES Customerr (Customer_ID),
Ckt_ID VARCHAR(255) FOREIGN KEY (Ckt_ID) REFERENCES Checkout (Checkout_ID),
No_of_days integer,
Checkout_time VARCHAR(255) NOT NULL,

);
DROP TABLE Does;

INSERT into  Does VALUES ('CUST1001', 'CHK6001',4,'8PM');
INSERT into  Does VALUES ('CUST1002', 'CHK6002',1,'8AM');
INSERT into  Does VALUES ('CUST1003', 'CHK6003',2,'3PM');
INSERT into  Does VALUES ('CUST1004', 'CHK6004',2,'5AM');
INSERT into  Does VALUES ('CUST1005', 'CHK6005',5,'9PM');
INSERT into  Does VALUES ('CUST1006', 'CHK6006',1,'11PM');
INSERT into  Does VALUES ('CUST1007', 'CHK6007',1,'7AM');
INSERT into  Does VALUES ('CUST1008', 'CHK6008',2,'2AM');
INSERT into  Does VALUES ('CUST1009', 'CHK6009',1,'5PM');
INSERT into  Does VALUES ('CUST1010', 'CHK6010',2,'6AM');

SELECT * FROM Does;


CREATE TABLE Orders (
Cust_ID VARCHAR(255) FOREIGN KEY (Cust_ID) REFERENCES Customerr (Customer_ID),
Srv_ID VARCHAR(255) FOREIGN KEY (Srv_ID) REFERENCES Servicee (Service_ID),
Order_time VARCHAR(255) NOT NULL,

);
DROP TABLE Orders;

INSERT into  Orders VALUES ('CUST1001', 'SER3002','6PM');
INSERT into  Orders VALUES ('CUST1002', 'SER3006','1PM');
INSERT into  Orders VALUES ('CUST1004', 'SER3003','5AM');
INSERT into  Orders VALUES ('CUST1005', 'SER3004','5PM');
INSERT into  Orders VALUES ('CUST1005', 'SER3005','2AM');
INSERT into  Orders VALUES ('CUST1006', 'SER3010','9AM');
INSERT into  Orders VALUES ('CUST1007', 'SER3008','11AM');
INSERT into  Orders VALUES ('CUST1009', 'SER3009','8PM');
INSERT into  Orders VALUES ('CUST1010', 'SER3001','3PM');
INSERT into  Orders VALUES ('CUST1010', 'SER3007','1AM');

SELECT * FROM Orders;

CREATE TABLE Complaints (
Cust_ID VARCHAR(255) FOREIGN KEY (Cust_ID) REFERENCES Customerr (Customer_ID),
Mng_ID VARCHAR(255) FOREIGN KEY (Mng_ID) REFERENCES Manager (Manager_ID),
Issue_encountered VARCHAR(255) NOT NULL
);
DROP TABLE Complaints;

INSERT into  Complaints VALUES ('CUST1001', 'MG1002','Long Wait on Hold');
INSERT into  Complaints VALUES ('CUST1002', 'MG1001','Unavailable or Out of Stock Product');
INSERT into  Complaints VALUES ('CUST1003', 'MG1001',' Repeating the Customers Problem');
INSERT into  Complaints VALUES ('CUST1004', 'MG1001','Uninterested Service Rep');
INSERT into  Complaints VALUES ('CUST1005', 'MG1002','Poor Product or Service');
INSERT into  Complaints VALUES ('CUST1006', 'MG1001','Lack of Follow Up');
INSERT into  Complaints VALUES ('CUST1007', 'MG1002','Uninterested Service Rep');
INSERT into  Complaints VALUES ('CUST1008', 'MG1001','Lack of Follow Up');
INSERT into  Complaints VALUES ('CUST1009', 'MG1001','Poor Product or Service');
INSERT into  Complaints VALUES ('CUST1010', 'MG1002','Unavailable or Out of Stock Product');

SELECT * FROM Complaints;