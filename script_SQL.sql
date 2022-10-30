USE TravelVietNam
GO
ALTER TABLE TaiKhoan
ALTER COLUMN pass varchar(50);
GO
 --Thêm bảng Vung_DiaDanh 
select dd.MaDiaDanh, dd.TenDiaDanh, dd.Img, dd.MoTa,v.Mavung, v.TenVung into Vung_DiaDanh  from Vung v join DiaDanh dd
on dd.Mavung=v.Mavung
