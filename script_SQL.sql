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
-- 28/10--
ALTER TABLE Tour
ADD LinkVideo VARCHAR(200);

GO

CREATE TABLE DichVu
(
	MaDichVu INT IDENTITY PRIMARY KEY,
	TenDichVu NVARCHAR(500),
	MoTa NVARCHAR(2000)
);
GO
CREATE TABLE DichVu_Tour
(
	MaDichVu INT,
	MaTour INT,
	PRIMARY KEY (MaDichVu,MaTour),
	FOREIGN KEY (MaDichVu) REFERENCES DichVu(MaDichVu),
	FOREIGN KEY (MaTour) REFERENCES Tour(MaTour)
);
GO
DROP TABLE DichVuTour
GO
-- 29/10  thêm tọa độ 
ALTER TABLE Tour
ADD lat	VARCHAR(20)
GO

ALTER TABLE Tour
ADD lng	VARCHAR(20)
GO
UPDATE Tour
SET lat = '10.411483453106948', lng='107.1339507802514'
WHERE MaTour = 2
GO
ALTER TABLE DanhGia
ADD Review NVARCHAR(2000)
GO
ALTER TABLE DanhGia
ADD ThoiGian VARCHAR(50)
GO
ALTER TABLE ChiTietTK
ADD LinkAvatar VARCHAR(100)
GO
UPDATE ChiTietTK
SET LinkAvatar = 'img/avatar/avatar-2.jpg'
WHERE MaChiTietTK = 2
GO
 --Thêm bảng Vung_DiaDanh 
select dd.MaDiaDanh, dd.TenDiaDanh, dd.Img, dd.MoTa,v.Mavung, v.TenVung into Vung_DiaDanh  from Vung v join DiaDanh dd
on dd.Mavung=v.Mavung

--30/10
-- Modify Blog Table
-- Thêm MoTa(text) 
-- Thêm NgayDang (date)
-- Thêm NoiDung(ntext)
-- Thêm Columnn Category (nvarchar(50)) 
-- Thêm Tags (nvarchar(50)) 
-- Thêm Link_CoverImg (nvarchar(50))

--5/11
-- thêm bảng BlogComment

CREATE TABLE BlogComment(
MaComment INT PRIMARY KEY,
BlogID int FOREIGN KEY REFERENCES Blog(Blog_ID) NULL,
MaTaiKhoan INT  NULL FOREIGN KEY REFERENCES dbo.TaiKhoan(MaTaiKhoan),
NoiDung NVARCHAR(MAX) NULL,
NgayGio DATETIME NULL
)
GO

--thêm bảng reply
CREATE TABLE Reply(
MaReply INT PRIMARY KEY,
MaCmt int FOREIGN KEY REFERENCES dbo.BlogComment(MaComment) NULL,
MaTaiKhoan INT  NULL FOREIGN KEY REFERENCES dbo.TaiKhoan(MaTaiKhoan),
NoiDung NVARCHAR(MAX) NULL,
NgayGio DATETIME NULL
)
GO
GO

----------23/11/2022 - Quang Hung
ALTER TABLE TaiKhoan
ALTER COLUMN role varchar(10)
GO
