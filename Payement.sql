/*CREATE TABLE Person
(
person_ID INT NOT NULL PRIMARY KEY
);
INSERT INTO Person(person_ID)
VALUES
    (1)
	;
CREATE TABLE Booking
(
ID INT NOT NULL PRIMARY KEY

);
INSERT INTO Booking(ID)
VALUES
    (1)
;*/

CREATE TABLE paymentType
(
ID INT NOT NULL PRIMARY KEY,
paymentMethod VARCHAR(13)
);

INSERT INTO paymentType (ID, paymentMethod)
VALUES
    (1, 'creditCard'), -- creditCard
    (2, 'cheque'), -- cheque 
    (3, 'bankTransfer'); -- banktransfer

	CREATE TABLE paymentStatus
(
 ID INT NOT NULL PRIMARY KEY,
 progress VARCHAR(20),
 );

INSERT INTO paymentStatus (ID, progress)
VALUES
    (1,'complete'), --status of payement is complete
    (2,'incomplete'), --status of payement is incomplete
    (3,'inconclusive'); --status of payement is inconclusive as in processing


CREATE TABLE deposit
(
ID INT NOT NULL PRIMARY KEY,
depositAmount DECIMAL(13,2),
depositStatus BIT DEFAULT 0,
depositDate Date,	
);

INSERT INTO deposit (ID, depositAmount, depositStatus, depositDate)
VALUES
    (1, 500.00, 1, '2021-09-08'),  -- depositID = 1, depositAmount = 500.00, depositStatus = true
    (2, 0.00, 0,'2020-11-22'),     -- depositID = 2, depositAmount = 0.00, depositStatus = false
    (3, 1000.50, 1,'2021-10-09'),  -- depositID = 3, depositAmount = 1000.50, depositStatus = true
    (4, 0.00, 0,'2022-05-11'),     -- depositID = 4, depositAmount = 0.00, depositStatus = false
    (5, 800.00, 1,'2023-07-14'),   -- depositID = 5, depositAmount = 800.00, depositStatus = true
    (6, 0.00, 0,'2020-05-01'),     -- depositID = 6, depositAmount = 0.00, depositStatus = false
    (7, 1200.75, 1,'2021-12-21'),  -- depositID = 7, depositAmount = 1200.75, depositStatus = true
    (8, 0.00, 0,'2023-06-26'),     -- depositID = 8, depositAmount = 0.00, depositStatus = false
    (9, 600.25, 1,'2020-12-08'),   -- depositID = 9, depositAmount = 600.25, depositStatus = true
    (10, 0.00, 0,'2023-11-08');    -- depositID = 10, depositAmount = 0.00, depositStatus = false

CREATE TABLE paymentTransfer
(
ID INT NOT NULL PRIMARY KEY,
idPaymentStatus INT NOT NULL,
idDeposit INT NOT NULL,
idPaymentType INT NOT NULL,
FOREIGN KEY (idPaymentStatus) REFERENCES paymentStatus(ID),
FOREIGN KEY (idDeposit) REFERENCES Deposit(ID),
FOREIGN KEY (idPaymentType) REFERENCES paymentType(ID)
);

INSERT INTO paymentTransfer (ID, idPaymentStatus, idDeposit, idPaymentType)
VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 1, 3, 3),
(4, 3, 4, 2),
(5, 2, 5, 1),
(6, 1, 6, 2),
(7, 3, 7, 3),
(8, 2, 8, 3),
(9, 1, 9, 2),
(10, 3,10, 1);

CREATE TABLE payment
(
ID INT NOT NULL PRIMARY KEY,
person_ID INT NOT NULL,
totalAmount DECIMAL(13,2)NOT NULL,
idPaymentType INT NOT NULL,
paymentDate DATE NOT NULL,
paymentDetails VARCHAR (255),
idpaymentTransfer INT NOT NULL,
idBooking INT NOT NULL,
FOREIGN KEY (idPaymentType) REFERENCES paymentType(ID),
FOREIGN KEY (idpaymentTransfer) REFERENCES paymentTransfer(ID),
FOREIGN KEY (idBooking) REFERENCES Booking(ID),
FOREIGN KEY (person_ID) REFERENCES Person(person_ID)
);

INSERT INTO payment (ID, person_ID, totalAmount,idPaymentType, paymentDate, paymentDetails,idpaymentTransfer, idBooking)
VALUES
    (1,1, 9120.75, 1, '2023-11-08', 'Payment for Grouptour 14868',1,1),
    (2,1, 885.50, 2, '2020-05-09', 'Payment for Grouptour 87895',2,1),
    (3,1, 1200.00, 3, '2021-07-10', 'Payment for Grouptour 64513',3,1),
    (4,1, 950.25, 1, '2022-06-11', 'Payment for Grouptour 15643',4,1),
    (5,1, 1175.30, 2, '2023-08-12', 'Payment for Grouptour 48113',5,1),
	(6,1, 2150.00, 3, '2023-09-15', 'Payment for Grouptour 32567',6,1),
    (7,1, 990.75, 1, '2022-04-18', 'Payment for Grouptour 78901',7,1),
    (8,1, 1180.50, 2, '2021-12-21', 'Payment for Grouptour 23456',8,1),
    (9,1, 775.25, 1, '2022-02-25', 'Payment for Grouptour 98765',9,1),
    (10,1, 1220.30, 3, '2023-03-28', 'Payment for Grouptour 43210',10,1);