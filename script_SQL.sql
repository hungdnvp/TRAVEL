USE TravelVietNam
GO
ALTER TABLE TaiKhoan
ALTER COLUMN pass varchar(50);
GO

-- 26/10 CREATE TYPE_TOUR
CREATE TABLE TravelType
(
	MaTravelType INT IDENTITY PRIMARY KEY,
	TravelTypeName NVARCHAR(100)
)
GO
CREATE TABLE Tour_TravelType
(
	MaTour INT,
	MaTravelType INT,
	PRIMARY KEY (MaTour,MaTravelType),
	FOREIGN KEY (MaTour) REFERENCES Tour(MaTour),
	FOREIGN KEY (MaTravelType) REFERENCES TravelType(MaTravelType)
)
GO
INSERT INTO TravelType VALUES('Adventure');
INSERT INTO TravelType VALUES('Escorted Tour');
INSERT INTO TravelType VALUES('River Cruise');
INSERT INTO TravelType VALUES('Suffing');
GO
INSERT INTO Tour_TravelType VALUES(1,1);
INSERT INTO Tour_TravelType VALUES(1,2);
INSERT INTO Tour_TravelType VALUES(1,4);
INSERT INTO Tour_TravelType VALUES(2,1);
INSERT INTO Tour_TravelType VALUES(2,3);
INSERT INTO Tour_TravelType VALUES(3,3);
INSERT INTO Tour_TravelType VALUES(3,4);
INSERT INTO Tour_TravelType VALUES(4,1);
INSERT INTO Tour_TravelType VALUES(4,4);
INSERT INTO Tour_TravelType VALUES(5,2);
INSERT INTO Tour_TravelType VALUES(6,3);
INSERT INTO Tour_TravelType VALUES(6,1);
INSERT INTO Tour_TravelType VALUES(7,4);
INSERT INTO Tour_TravelType VALUES(8,3);
INSERT INTO Tour_TravelType VALUES(8,2);
GO

