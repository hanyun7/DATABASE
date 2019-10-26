﻿--NGUYỄN KIM HUỆ - MSSV : 51702108
--LÊ THỊ THÀNH - MSSV : 51480108

CREATE DATABASE BTL
GO
USE BTL
GO

CREATE TABLE GA(
	MSG INT PRIMARY KEY IDENTITY (1,1),
	TENSB NVARCHAR (20) NOT NULL,
	THANHPHO NVARCHAR (50) NOT NULL,
	QUOCGIA NVARCHAR (50) NOT NULL)
	GO

CREATE TABLE TUYENBAY(
	MSTB INT PRIMARY KEY IDENTITY (1,1),
	MSG_DI INT NOT NULL,
	MSG_DEN INT NOT NULL)
	GO

CREATE TABLE LOAIMAYBAY(
	MSLMB INT PRIMARY KEY IDENTITY (1,1),
	HANGSX NVARCHAR(50) NOT NULL , 
	MODEL NVARCHAR(50) NOT NULL,
	SOGHEVIP INT NOT NULL,
	SOGHEPT INT NOT NULL,
	TONGSOGHE INT NOT NULL)
	GO

CREATE TABLE MAYBAY(
	MSMB NVARCHAR (20) PRIMARY KEY CHECK (MSMB like 'SAP[0-9][0-9][0-9]'),
	TONGGIOBAY FLOAT NOT NULL,
	NAMSX INT NOT NULL,
	THOIDIEMSD DATE NOT NULL,
	MSLMB INT NOT NULL)
	GO

CREATE TABLE CHUYENBAY(
	MSCB NVARCHAR (20) PRIMARY KEY CHECK (MSCB like 'SA[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	TRANGTHAI NVARCHAR (20) CHECK (TRANGTHAI = 'CB' or TRANGTHAI = 'DB' or TRANGTHAI ='HB'),
	SOGHETRONG INT NOT NULL, 
	THOIDIEMDI DATETIME NOT NULL, 
	THOIDIEMDEN DATETIME NOT NULL,
	MSMB NVARCHAR (20) NOT NULL, 
	MSTB INT NOT NULL)
	GO

CREATE TABLE TRANGTHAITG(
	MSTTTG INT PRIMARY KEY IDENTITY (1,1), 
	TENTT NVARCHAR(50) NOT NULL CHECK (TENTT = 'TG' or TENTT = 'HH' or TENTT ='DD'), 
	PHANTRAMTP FLOAT NOT NULL)
	GO

CREATE TABLE PHIVCHH(
	MSPHH INT PRIMARY KEY IDENTITY (1,1),
	LOAIVE NVARCHAR(50) CHECK (LOAIVE = 'VIP' or LOAIVE = 'PT') NOT NULL,
	TRONGLUONGDM INT NOT NULL,
	DONGIA_KG FLOAT NOT NULL , 
	THOIDIEMAPDUNG DATE NOT NULL)
	GO

CREATE TABLE KHACHHANG(
	MSKH NVARCHAR (20) PRIMARY KEY CONSTRAINT CHK_KH CHECK (MSKH like 'NL[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' or MSKH like 'TE[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	HOTEN NVARCHAR(50),
	NGAYSINH DATE,
	GIOITINH NVARCHAR(20) CHECK (GIOITINH = 'Nam' or  GIOITINH = N'Nữ'),
	QUOCTICH NVARCHAR(50),
	SODT VARCHAR (20) CHECK (SODT like '+84[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	DIACHI NVARCHAR (100),
	MSTTTG INT,
	MSPHH INT,
	MSCB NVARCHAR (20),
	KHOILUONGVUOT INT)
	GO

CREATE TABLE KHACHHANGNL(
	MSKH NVARCHAR (20) PRIMARY KEY,
	CMND NVARCHAR(20) UNIQUE NOT NULL,
	PASSPORT NVARCHAR(50))
	GO

CREATE TABLE KHACHHANGTE(
	MSKH NVARCHAR (20) PRIMARY KEY,
	THONGTINKSINH NVARCHAR(MAX),
	MSNGH NVARCHAR(20) NOT NULL)
	GO

CREATE TABLE GHENGOI(
	MSG INT PRIMARY KEY IDENTITY (1,1),
	GHESO VARCHAR (3) CHECK (GHESO  LIKE '[A-Z][0-9][0-9]') NOT NULL ,
	LOAIGHE NVARCHAR (20) CHECK (LOAIGHE like 'VIP' or LOAIGHE like 'PT') NOT NULL,
	MSLMB INT,
	UNIQUE(GHESO,MSLMB))
	GO

CREATE TABLE GHEKHACH(
	MSKH NVARCHAR (20) NOT NULL , 
	GHESO VARCHAR (3) NOT NULL, 
	GIA FLOAT NOT NULL,
	PRIMARY KEY (MSKH,GHESO))
	GO

CREATE TABLE THUCPHAM(
	MSTP INT PRIMARY KEY IDENTITY (1,1),
	TEN NVARCHAR (50) UNIQUE, 
	MOTA NVARCHAR(MAX) NOT NULL)
	GO

CREATE TABLE GIATHUCPHAM(
	MSGTP INT PRIMARY KEY IDENTITY (1,1),
	GIA FLOAT NOT NULL, 
	NGAYAPDUNG DATE NOT NULL,
	MSTP INT NOT NULL)
	GO

CREATE TABLE CHUYENBAYTHUCPHAM(
	MSCB  NVARCHAR (20) NOT NULL,
	MSTP INT NOT NULL,
	PRIMARY KEY(MSCB,MSTP))
	GO

CREATE TABLE NHANVIEN(
	MSNV VARCHAR (15) NOT NULL PRIMARY KEY CONSTRAINT CHK_NV CHECK (MSNV like 'PC[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR MSNV like 'TV[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR MSNV like 'KS[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR MSNV like 'DH[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR MSNV like 'KT[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	HOTEN NVARCHAR (50) NOT NULL,
	NGAYSINH DATE NOT NULL,
	GIOITINH NVARCHAR (3) CHECK (GIOITINH = 'Nam' or  GIOITINH = N'Nữ'),
	QUOCTICH NVARCHAR (50) NOT NULL,
	CMND NVARCHAR (20) UNIQUE NOT NULL CONSTRAINT CHK_CMND CHECK (CMND like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	PASSPORT NVARCHAR (50) CONSTRAINT CHK_PASSPORT CHECK (PASSPORT like 'P[0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR PASSPORT like 'C[0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL ,
	NGAYVAOLAM DATE NOT NULL,
	DIACHI NVARCHAR (50) NOT NULL,
	SODT CHAR (20) NOT NULL CONSTRAINT CHK_DT CHECK (SODT like '+84[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	TIENLUONG FLOAT NOT NULL)
	GO

CREATE TABLE BANGCAP(
	MSBC INT PRIMARY KEY IDENTITY(1,1),
	TENBANGCAP NVARCHAR(20) NOT NULL,
	TRUONGDAOTAO NVARCHAR(50) NOT NULL,
	NAMDAT INT NOT NULL,
	MSNV VARCHAR (15))
	GO

CREATE TABLE PHICONG(
	MSNV VARCHAR(15) PRIMARY KEY,
	LOAIPHICONG NVARCHAR(20) NOT NULL)
	GO

CREATE TABLE TIEPVIEN(
	MSNV VARCHAR(15) PRIMARY KEY, 
	NGOAINGUTHONGTHAO NVARCHAR(20) NOT NULL)
	GO

CREATE TABLE CHINHANH(
	MSCN INT PRIMARY KEY IDENTITY (1,1),
	TENCHINHANH NVARCHAR (50) NOT NULL,
	THANHPHO NVARCHAR (50) NOT NULL,
	QUOCGIA NVARCHAR (50) NOT NULL)
	GO

CREATE TABLE NHANVIENMD(
	MSNV VARCHAR(15) PRIMARY KEY, 
	MSCN INT NOT NULL,
	MSNV_TRUONG VARCHAR(15) NOT NULL)
	GO

CREATE TABLE CALAMVIEC(
	MSCLV VARCHAR(2) PRIMARY KEY NOT NULL CONSTRAINT CHK_CLV CHECK (MSCLV like '[C][1-3]'),
	TUGIO TIME NOT NULL,
	DENGIO TIME NOT NULL)
	GO

CREATE TABLE NVMATDAT_CALV(
	MSNV VARCHAR(15) NOT NULL,
	MSCLV VARCHAR(2) NOT NULL,
	NGAYBATDAU DATE NOT NULL,
	PRIMARY KEY (MSNV,MSCLV))
	GO

CREATE TABLE VANHANH(
	MSNV VARCHAR(15),
	MSCB NVARCHAR (20),
	PRIMARY KEY (MSNV,MSCB))
	GO

CREATE TABLE LAI(
	MSNV VARCHAR(15),
	MSLMB INT,
	PRIMARY KEY (MSNV,MSLMB))
	GO

CREATE TABLE KIEMTRA(
	MSNV VARCHAR(15),
	MSCB NVARCHAR (20),
	PRIMARY KEY (MSNV,MSCB))
	GO

CREATE TABLE CHUYENMONBD(
	MSNV VARCHAR(15),
	MSLMB INT,
	PRIMARY KEY (MSNV,MSLMB))
	GO

ALTER TABLE TUYENBAY ADD CONSTRAINT FK_TUYENBAY_GADI FOREIGN KEY (MSG_DI) REFERENCES GA(MSG); 
GO
ALTER TABLE TUYENBAY ADD CONSTRAINT FK_TUYENBAY_GADEN FOREIGN KEY (MSG_DEN) REFERENCES GA(MSG); 
GO
ALTER TABLE KHACHHANG ADD CONSTRAINT FK_KHACHHANG_TRANGTHAITG FOREIGN KEY (MSTTTG) REFERENCES TRANGTHAITG(MSTTTG); 
GO
ALTER TABLE KHACHHANG ADD CONSTRAINT FK_KHACHHANG_PHIVCHH FOREIGN KEY (MSPHH) REFERENCES PHIVCHH(MSPHH); 
GO
ALTER TABLE KHACHHANG ADD CONSTRAINT FK_KHACHHANG_CHUYENBAY FOREIGN KEY (MSCB) REFERENCES CHUYENBAY(MSCB); 
GO
ALTER TABLE KHACHHANGNL ADD CONSTRAINT FK_KHACHHANGNL_KHACHHANG FOREIGN KEY (MSKH) REFERENCES KHACHHANG(MSKH); 
GO
ALTER TABLE KHACHHANGTE ADD CONSTRAINT FK_KHACHHANGTE_KHACHHANG FOREIGN KEY (MSKH) REFERENCES KHACHHANG(MSKH); 
GO
ALTER TABLE CHUYENBAY ADD CONSTRAINT FK_CHUYENBAY_MAYBAY FOREIGN KEY (MSMB) REFERENCES MAYBAY(MSMB); 
GO
ALTER TABLE CHUYENBAY ADD CONSTRAINT FK_CHUYENBAY_TUYENBAY FOREIGN KEY (MSTB) REFERENCES TUYENBAY(MSTB); 
GO
ALTER TABLE GHEKHACH ADD CONSTRAINT FK_GHEKHACH_KHACHHANG FOREIGN KEY (MSKH) REFERENCES KHACHHANG(MSKH); 
GO
ALTER TABLE MAYBAY ADD CONSTRAINT FK_MAYBAY_LOAIMAYBAY FOREIGN KEY (MSLMB) REFERENCES LOAIMAYBAY(MSLMB); 
GO
ALTER TABLE GHENGOI ADD CONSTRAINT FK_GHENGOI_LOAIMAYBAY FOREIGN KEY (MSLMB) REFERENCES LOAIMAYBAY(MSLMB); 
GO
ALTER TABLE GIATHUCPHAM ADD CONSTRAINT FK_GIATHUCPHAM_THUCPHAM FOREIGN KEY (MSTP) REFERENCES THUCPHAM(MSTP); 
GO
ALTER TABLE CHUYENBAYTHUCPHAM ADD CONSTRAINT FK_CHUYENBAYTHUCPHAM_CHUYENBAY FOREIGN KEY (MSCB) REFERENCES CHUYENBAY(MSCB); 
GO
ALTER TABLE CHUYENBAYTHUCPHAM ADD CONSTRAINT FK_CHUYENBAYTHUCPHAM_THUCPHAM FOREIGN KEY (MSTP) REFERENCES THUCPHAM(MSTP); 
GO
ALTER TABLE BANGCAP ADD CONSTRAINT FK_BANGCAP_NHANVIEN FOREIGN KEY (MSNV) REFERENCES NHANVIEN(MSNV); 
GO
ALTER TABLE PHICONG ADD CONSTRAINT FK_PHICONG_NHANVIEN FOREIGN KEY (MSNV) REFERENCES NHANVIEN(MSNV); 
GO
ALTER TABLE TIEPVIEN ADD CONSTRAINT FK_TIEPVIEN_NHANVIEN FOREIGN KEY (MSNV) REFERENCES NHANVIEN(MSNV); 
GO
ALTER TABLE NHANVIENMD ADD CONSTRAINT FK_NHANVIENMD_NHANVIEN FOREIGN KEY (MSNV) REFERENCES NHANVIEN(MSNV); 
GO
ALTER TABLE NHANVIENMD ADD CONSTRAINT FK_NHANVIENMD_NHANVIENTRUONG FOREIGN KEY (MSNV_TRUONG) REFERENCES NHANVIEN(MSNV); 
GO
ALTER TABLE NHANVIENMD ADD CONSTRAINT FK_NHANVIENMD_CHINHANH FOREIGN KEY (MSCN) REFERENCES CHINHANH(MSCN); 
GO
ALTER TABLE NVMATDAT_CALV ADD CONSTRAINT FK_NVMATDAT_CALV_NHANVIEN FOREIGN KEY (MSNV) REFERENCES NHANVIEN(MSNV); 
GO
ALTER TABLE NVMATDAT_CALV ADD CONSTRAINT FK_NVMATDAT_CALV_CALAMVIEC FOREIGN KEY (MSCLV) REFERENCES CALAMVIEC(MSCLV);
GO
ALTER TABLE VANHANH ADD CONSTRAINT FK_VANHANH_NHANVIEN FOREIGN KEY (MSNV) REFERENCES NHANVIEN(MSNV); 
GO
ALTER TABLE VANHANH ADD CONSTRAINT FK_VANHANH_CHUYENBAY FOREIGN KEY (MSCB) REFERENCES CHUYENBAY(MSCB); 
GO
ALTER TABLE LAI ADD CONSTRAINT FK_LAI_NHANVIEN FOREIGN KEY (MSNV) REFERENCES NHANVIEN(MSNV); 
GO
ALTER TABLE LAI ADD CONSTRAINT FK_LAI_LOAIMAYBAY FOREIGN KEY (MSLMB) REFERENCES LOAIMAYBAY(MSLMB); 
GO
ALTER TABLE KIEMTRA ADD CONSTRAINT FK_KIEMTRA_NHANVIEN FOREIGN KEY (MSNV) REFERENCES NHANVIEN(MSNV); 
GO
ALTER TABLE KIEMTRA ADD CONSTRAINT FK_KIEMTRA_CHUYENBAY FOREIGN KEY (MSCB) REFERENCES CHUYENBAY(MSCB); 
GO
ALTER TABLE CHUYENMONBD ADD CONSTRAINT FK_CHUYENMONBD_NHANVIEN FOREIGN KEY (MSNV) REFERENCES NHANVIEN(MSNV); 
GO
ALTER TABLE CHUYENMONBD ADD CONSTRAINT FK_CHUYENMONBD_LOAIMAYBAY FOREIGN KEY (MSLMB) REFERENCES LOAIMAYBAY(MSLMB); 
GO

--INDEX

CREATE INDEX INDEX_CHUYENBAY
ON CHUYENBAY (SOGHETRONG,THOIDIEMDI,THOIDIEMDEN,MSTB)
INCLUDE (TRANGTHAI)
GO

CREATE INDEX INDEX_GHETRONG_CHUYENBAY
ON CHUYENBAY(MSMB)
GO

CREATE INDEX INDEX_GHETRONG_MAYBAY
ON LOAIMAYBAY(MSLMB)
GO

CREATE INDEX INDEX_GHETRONG_GHENGOI
ON GHENGOI(MSLMB)
INCLUDE (GHESO,LOAIGHE)
GO

--TRIGGER

CREATE TRIGGER CHK_GHE
ON LOAIMAYBAY
FOR INSERT,UPDATE
AS
	IF (((SELECT SOGHEVIP FROM inserted) + (SELECT SOGHEPT FROM inserted)) != (SELECT TONGSOGHE FROM inserted))
BEGIN
	RAISERROR (N'Tổng số ghế phải bằng tổng số ghế VIP và số ghế Phổ Thông',16,1)
ROLLBACK TRAN
END
GO

CREATE TRIGGER CHK_MAYBAY_CHUYENBAY
ON CHUYENBAY 
FOR INSERT,UPDATE
AS
	DECLARE @THOIDIEMDI DATETIME, @THOIDIEMDEN DATETIME, @TONGGIOBAY FLOAT, @TONGGIOBAY_DAU FLOAT, @MSMB NVARCHAR(20)
	SET @THOIDIEMDI = (SELECT THOIDIEMDI FROM inserted)
	SET @THOIDIEMDEN = (SELECT THOIDIEMDEN FROM inserted)
	SET @TONGGIOBAY_DAU = (SELECT TONGGIOBAY FROM MAYBAY WHERE MSMB = (SELECT MSMB FROM inserted))
	SET @MSMB = (SELECT MSMB FROM inserted)
	SET @TONGGIOBAY = 0
BEGIN
	IF (SELECT TRANGTHAI FROM inserted) = 'DB'
		BEGIN
			SET @TONGGIOBAY = DATEDIFF(HOUR, CONVERT(TIME, @THOIDIEMDI, 120) , CONVERT(TIME, @THOIDIEMDEN, 120))
		END 
	IF @TONGGIOBAY != @TONGGIOBAY_DAU
		BEGIN
			UPDATE MAYBAY
			SET TONGGIOBAY = @TONGGIOBAY
			WHERE MAYBAY.MSMB = @MSMB
		END	
END
GO

--PROC

CREATE PROC UPDATE_PVCHH(@MSKH NVARCHAR(20),@MSPHH INT)
AS
BEGIN
	IF EXISTS (SELECT MSKH FROM GHEKHACH WHERE MSKH = @MSKH)
		BEGIN
			UPDATE KHACHHANG
			SET MSPHH = @MSPHH
			WHERE KHACHHANG.MSKH = @MSKH
		END
		
END
GO

CREATE PROC UPDATE_KHOILUONGVUOT(@MSKH NVARCHAR(20),@KHOILUONG INT)
AS
BEGIN	
	DECLARE @TRONGLUONGDM INT, @KHOILUONGVUOT INT
	SET @TRONGLUONGDM = (	SELECT TRONGLUONGDM 
							FROM PHIVCHH 
							WHERE MSPHH IN (	SELECT MSPHH 
												FROM KhachHang 
												WHERE MSKH = @MSKH	))
	SET @KHOILUONGVUOT = @KHOILUONG - @TRONGLUONGDM
	IF (@KHOILUONGVUOT > 0)
		BEGIN
			UPDATE KHACHHANG 
			SET KHOILUONGVUOT = @KHOILUONGVUOT
			WHERE KHACHHANG.MSKH = @MSKH
		END
	ELSE
		BEGIN
		UPDATE KHACHHANG 
		SET KHOILUONGVUOT = 0 
		WHERE KHACHHANG.MSKH = @MSKH
		END
END
GO

CREATE FUNCTION UPDATE_PHIVANCHUYEN(@MSKH NVARCHAR(20))
RETURNS INT
AS 
BEGIN
	DECLARE @TRONGLUONGDM INT, @KHOILUONGVUOT INT, @DONGIA INT, @PHIVANCHUYEN INT
	
	SET @KHOILUONGVUOT = (SELECT KHOILUONGVUOT FROM KHACHHANG WHERE MSKH = @MSKH)
	SET @TRONGLUONGDM = (	SELECT TRONGLUONGDM 
							FROM PHIVCHH 
							WHERE MSPHH IN (	SELECT MSPHH 
												FROM KHACHHANG 
												WHERE MSKH = @MSKH	))
	SET @DONGIA = (	SELECT DONGIA_KG 
					FROM PHIVCHH 
					WHERE MSPHH IN (	SELECT MSPHH 
										FROM KHACHHANG 
										WHERE MSKH = @MSKH	))
	SET @PHIVANCHUYEN = (@KHOILUONGVUOT + @TRONGLUONGDM) * @DONGIA
	RETURN @PHIVANCHUYEN
END
GO
--INSERT

INSERT INTO GA (TENSB,THANHPHO,QUOCGIA) VALUES (N'Liên Khương',N'Đà Lạt',N'Việt Nam')
INSERT INTO GA (TENSB,THANHPHO,QUOCGIA) VALUES(N'Nội Bài',N'Hà Nội',N'Việt Nam')
INSERT INTO GA (TENSB,THANHPHO,QUOCGIA) VALUES(N'Tân Sơn Nhất',N'Hồ Chí Minh',N'Việt Nam')
INSERT INTO GA (TENSB,THANHPHO,QUOCGIA) VALUES(N'Đà Nẵng',N'Đà Nẵng',N'Việt Nam')
GO

INSERT INTO TUYENBAY (MSG_DI,MSG_DEN) VALUES ('1','2')
INSERT INTO TUYENBAY (MSG_DI,MSG_DEN) VALUES ('3','2')
INSERT INTO TUYENBAY (MSG_DI,MSG_DEN) VALUES ('3','4')
INSERT INTO TUYENBAY (MSG_DI,MSG_DEN) VALUES ('2','4')
GO

INSERT INTO LOAIMAYBAY (HANGSX,MODEL,SOGHEVIP,SOGHEPT,TONGSOGHE) VALUES ('Airbus','A350',16,162,178)
INSERT INTO LOAIMAYBAY (HANGSX,MODEL,SOGHEVIP,SOGHEPT,TONGSOGHE) VALUES	('Antonov','An-2',20,200,220)
INSERT INTO LOAIMAYBAY (HANGSX,MODEL,SOGHEVIP,SOGHEPT,TONGSOGHE) VALUES	('Bombardier','CS300',20,230,250)
INSERT INTO LOAIMAYBAY (HANGSX,MODEL,SOGHEVIP,SOGHEPT,TONGSOGHE) VALUES	('Comac','ARJ-21',16,174,190)
GO

INSERT INTO MAYBAY VALUES ('SAP001',2.5,2014,'12/01/2015',1)
INSERT INTO MAYBAY VALUES ('SAP002',1.5,2015,'12/01/2016',2)
INSERT INTO MAYBAY VALUES ('SAP003',1.5,2015,'12/01/2016',3)
INSERT INTO MAYBAY VALUES ('SAP004',2,2014,'12/01/2015',4)
GO

INSERT INTO CHUYENBAY VALUES ('SA0000001','CB',2,'12/12/2018 09:00','12/13/2018 11:00','SAP001',1)
INSERT INTO CHUYENBAY VALUES ('SA0000002','CB',3,'12/12/2018 13:45','12/13/2018 15:15','SAP002',2)
INSERT INTO CHUYENBAY VALUES ('SA0000003','DB',5,'12/12/2018 18:00','12/13/2018 20:00','SAP003',3)
INSERT INTO CHUYENBAY VALUES ('SA0000004','HB',4,'12/12/2018 01:00','12/13/2018 03:00','SAP004',4)
GO

INSERT INTO TRANGTHAITG (TENTT,PHANTRAMTP) VALUES ('TG',00.00)
INSERT INTO TRANGTHAITG (TENTT,PHANTRAMTP) VALUES ('HH',50.00)
INSERT INTO TRANGTHAITG (TENTT,PHANTRAMTP) VALUES ('DD',35.00)
GO

INSERT INTO PHIVCHH (LOAIVE,TRONGLUONGDM,DONGIA_KG,THOIDIEMAPDUNG) VALUES ('VIP',40,30000,'11/12/2018')
INSERT INTO PHIVCHH (LOAIVE,TRONGLUONGDM,DONGIA_KG,THOIDIEMAPDUNG) VALUES ('PT',30,25000,'11/12/2018')
INSERT INTO PHIVCHH (LOAIVE,TRONGLUONGDM,DONGIA_KG,THOIDIEMAPDUNG) VALUES ('VIP',50,40000,'11/12/2018')
INSERT INTO PHIVCHH (LOAIVE,TRONGLUONGDM,DONGIA_KG,THOIDIEMAPDUNG) VALUES ('PT',49,50000,'11/12/2018')
GO

INSERT INTO KHACHHANG VALUES ('NL0000000001',N'Nguyễn Minh Hạnh','01/03/1989',N'Nữ',N'Việt Nam','+84385943880','TPHCM',1,1,'SA0000001',3)
INSERT INTO KHACHHANG VALUES ('NL0000000002',N'Lê Thị Thành','12/06/1991',N'Nữ',N'Việt Nam','+84384729759','TPHCM',2,2,'SA0000002',6)
INSERT INTO KHACHHANG VALUES ('NL0000000003',N'Trần Quang Việt','01/08/1986','Nam',N'Việt Nam','+84384620823','HN',1,1,'SA0000003',2)
INSERT INTO KHACHHANG VALUES ('NL0000000004',N'Nguyễn Kim Huệ','05/03/1996',N'Nữ',N'Việt Nam','+84385039852','HN',2,2,'SA0000004',7)
INSERT INTO KHACHHANG VALUES ('TE0000000001',N'Trần Yến Linh','01/03/2012',N'Nữ',N'Việt Nam','+84385943880','TPHCM',1,1,'SA0000001',0)
INSERT INTO KHACHHANG VALUES ('TE0000000002',N'Lê Thị Bảo Ngân','12/06/2014',N'Nữ',N'Việt Nam','+84384729759','TPHCM',2,2,'SA0000002',0)
INSERT INTO KHACHHANG VALUES ('TE0000000003',N'Trần Yến Nhi','01/08/2012',N'Nữ',N'Việt Nam','+84384620823','HN',1,1,'SA0000003',0)
INSERT INTO KHACHHANG VALUES ('TE0000000004',N'Hoàng Quốc Bảo','05/03/2013','Nam',N'Việt Nam','+84385039852','HN',2,2,'SA0000004',0)
GO

INSERT INTO KHACHHANGNL VALUES ('NL0000000001','251127563','P3298525')
INSERT INTO KHACHHANGNL VALUES ('NL0000000002','252938991','P2942828')
INSERT INTO KHACHHANGNL VALUES ('NL0000000003','371842949','C3498359')
INSERT INTO KHACHHANGNL VALUES ('NL0000000004','837292738','P5939128')
GO

INSERT INTO KHACHHANGTE VALUES ('TE0000000001','Họ Tên : Trần Yến Linh, Mgày Sinh : 01/03/2012, Giới Tính : Nữ...','NL0000000001')
INSERT INTO KHACHHANGTE VALUES ('TE0000000002','Họ Tên : Lê Thị Bảo Ngân, Mgày Sinh : 12/06/2014, Giới Tính : Nữ...','NL0000000002')
INSERT INTO KHACHHANGTE VALUES ('TE0000000003','Họ Tên : Trần Yến Nhi, Mgày Sinh : 01/08/2012, Giới Tính : Nữ...','NL0000000003')
INSERT INTO KHACHHANGTE VALUES ('TE0000000004','Họ Tên : Hoàng Quốc Bảo, Mgày Sinh : 05/03/2013, Giới Tính : Nam...','NL0000000004')
GO

INSERT INTO GHENGOI (GHESO,LOAIGHE,MSLMB) VALUES ('A07','VIP',1)
INSERT INTO GHENGOI (GHESO,LOAIGHE,MSLMB) VALUES ('A08','VIP',1)
INSERT INTO GHENGOI (GHESO,LOAIGHE,MSLMB) VALUES ('A09','VIP',1)
INSERT INTO GHENGOI (GHESO,LOAIGHE,MSLMB) VALUES ('D14','VIP',2)
INSERT INTO GHENGOI (GHESO,LOAIGHE,MSLMB) VALUES ('D15','VIP',2)
INSERT INTO GHENGOI (GHESO,LOAIGHE,MSLMB) VALUES ('D10','VIP',2)
INSERT INTO GHENGOI (GHESO,LOAIGHE,MSLMB) VALUES ('G09','PT',3)
INSERT INTO GHENGOI (GHESO,LOAIGHE,MSLMB) VALUES ('G10','PT',3)
INSERT INTO GHENGOI (GHESO,LOAIGHE,MSLMB) VALUES ('G15','PT',3)
INSERT INTO GHENGOI (GHESO,LOAIGHE,MSLMB) VALUES ('H05','PT',4)
INSERT INTO GHENGOI (GHESO,LOAIGHE,MSLMB) VALUES ('H06','PT',4)
INSERT INTO GHENGOI (GHESO,LOAIGHE,MSLMB) VALUES ('H09','PT',4)
GO

INSERT INTO GHEKHACH VALUES ('NL0000000001','A07',5500000)
INSERT INTO GHEKHACH VALUES ('NL0000000002','D14',4500000)
INSERT INTO GHEKHACH VALUES ('NL0000000003','G09',3750000)
INSERT INTO GHEKHACH VALUES ('NL0000000004','H05',3750000)
INSERT INTO GHEKHACH VALUES ('TE0000000001','A08',2750000)
INSERT INTO GHEKHACH VALUES ('TE0000000002','D15',2250000)
INSERT INTO GHEKHACH VALUES ('TE0000000003','G10',1850000)
INSERT INTO GHEKHACH VALUES ('TE0000000004','H06',1850000)
GO

INSERT INTO THUCPHAM (TEN,MOTA) VALUES (N'Hamburger',N'Một loại thức ăn bao gồm bánh mì kẹp có thịt xay ở giữa')
INSERT INTO THUCPHAM (TEN,MOTA) VALUES (N'Bánh mì',N'Bánh mì truyền thống của Việt Nam')
INSERT INTO THUCPHAM (TEN,MOTA) VALUES (N'Phở',N'Là một món ăn truyền thống của Việt Nam, gồm bánh phở và nước dùng cùng với thịt bò hoặc thịt gà cắt lát mỏng')
INSERT INTO THUCPHAM (TEN,MOTA) VALUES (N'Sữa',N'Sữa Vinamilk')
INSERT INTO THUCPHAM (TEN,MOTA) VALUES (N'Bánh trưng',N'Một loại bánh làm từ gạo nếp và gói lại bằng lá rong')
GO

INSERT INTO GIATHUCPHAM (GIA,NGAYAPDUNG,MSTP) VALUES (50000,'01/01/2018',1)
INSERT INTO GIATHUCPHAM (GIA,NGAYAPDUNG,MSTP) VALUES (20000,'01/01/2018',2)
INSERT INTO GIATHUCPHAM (GIA,NGAYAPDUNG,MSTP) VALUES (30000,'01/01/2018',3)
INSERT INTO GIATHUCPHAM (GIA,NGAYAPDUNG,MSTP) VALUES (10000,'01/01/2018',4)
GO

INSERT INTO CHUYENBAYTHUCPHAM VALUES ('SA0000001',1)
INSERT INTO CHUYENBAYTHUCPHAM VALUES ('SA0000002',2)
INSERT INTO CHUYENBAYTHUCPHAM VALUES ('SA0000003',3)
INSERT INTO CHUYENBAYTHUCPHAM VALUES ('SA0000004',4)
GO

INSERT INTO NHANVIEN VALUES ('PC0000000001',N'Huỳnh Anh Tài','04/15/1993',N'Nam',N'Việt Nam','251174953','P9392084','12/30/2018','TPHCM','+84385830495',30000000)
INSERT INTO NHANVIEN VALUES ('PC0000000002',N'Dương Lam Hàng','07/23/1992',N'Nam',N'Việt Nam','235566768','P5764645','12/30/2018','TPHCM','+84384354576',20000000)
INSERT INTO NHANVIEN VALUES ('PC0000000003',N'Trương Thị Bích Phương','04/10/1992',N'Nữ',N'Việt Nam','454325675','P4265736','12/30/2018','TPHCM','+84385465768',20000000)
INSERT INTO NHANVIEN VALUES ('PC0000000004',N'Nguyễn Dương','01/15/1991',N'Nam',N'Việt Nam','356547787','P5475363','12/30/2018','TPHCM','+84386735794',20000000)
INSERT INTO NHANVIEN VALUES ('TV0000000001',N'Trần Phương Ngọc Anh','01/01/1991',N'Nữ',N'Việt Nam','454393295','C1462569','04/01/2016','HN','+84347255449',30000000)
INSERT INTO NHANVIEN VALUES ('TV0000000002',N'Trần Yến Nhi','07/01/1992',N'Nữ',N'Việt Nam','456576997','C6978949','04/01/2016','HN','+84374667635',20000000)
INSERT INTO NHANVIEN VALUES ('TV0000000003',N'Lê Bảo Ngân','04/23/1990',N'Nữ',N'Việt Nam','576674273','C8779567','04/01/2016','HN','+84346568766',20000000)
INSERT INTO NHANVIEN VALUES ('TV0000000004',N'Đinh Thị Anh Thư','09/01/1989',N'Nữ',N'Việt Nam','897545865','C5797935','04/01/2016','HN','+84465445787',20000000)
INSERT INTO NHANVIEN VALUES ('DH0000000001',N'Nguyễn Hồng Nam','09/21/1990',N'Nam',N'Việt Nam','435477854','C5465368','11/25/2017','HN','+84385765745',30000000)
INSERT INTO NHANVIEN VALUES ('DH0000000002',N'Hoàng Thùy Dương','08/04/1990',N'Nữ',N'Việt Nam','945832049','C5679870','11/01/2017','HN','+84383452241',15000000)
INSERT INTO NHANVIEN VALUES ('DH0000000003',N'Ngô Bảo Châu','08/12/1991',N'Nam',N'Việt Nam','466583457','C2423436','11/25/2017','HN','+84383522357',15000000)
INSERT INTO NHANVIEN VALUES ('DH0000000004',N'Trần Văn Gia Huy','11/04/1992',N'Nam',N'Việt Nam','579452323','C5476588','11/01/2017','HN','+84384654765',15000000)
INSERT INTO NHANVIEN VALUES ('KS0000000001',N'Trần Phương Thanh','12/14/1992',N'Nữ',N'Việt Nam','574855477','P5462646','10/30/2018','TPHCM','+84384536545',25000000)
INSERT INTO NHANVIEN VALUES ('KS0000000002',N'Nguyễn Minh Phong','10/17/1993',N'Nam',N'Việt Nam','876364513','P4656567','10/30/2018','TPHCM','+84386592045',15000000)
INSERT INTO NHANVIEN VALUES ('KS0000000003',N'Nguyễn Hà Như Phương','12/20/1989',N'Nữ',N'Việt Nam','547576378','P4352364','10/30/2018','TPHCM','+84386592045',15000000)
INSERT INTO NHANVIEN VALUES ('KS0000000004',N'Lê Ngọc Duy','10/14/1992',N'Nam',N'Việt Nam','537537668','P3547656','10/30/2018','TPHCM','+84383454657',15000000)
INSERT INTO NHANVIEN VALUES ('KT0000000001',N'Huỳnh Ngọc Thảo Như','06/14/1991',N'Nữ',N'Việt Nam','354365768','P3547658','10/30/2018','TPHCM','+84383424225',30000000)
INSERT INTO NHANVIEN VALUES ('KT0000000002',N'Lâm Thành Đạt','12/11/1992',N'Nam',N'Việt Nam','353645754','P5342346','10/30/2018','TPHCM','+84385765809',15000000)
INSERT INTO NHANVIEN VALUES ('KT0000000003',N'Nguyễn Quốc Bảo','12/30/1991',N'Nam',N'Việt Nam','435345366','P7685664','10/30/2018','TPHCM','+84381029443',15000000)
INSERT INTO NHANVIEN VALUES ('KT0000000004',N'Nguyễn Thị Ý Nhi','09/12/1992',N'Nữ',N'Việt Nam','234244698','P2324356','10/30/2018','TPHCM','+84380919949',15000000)
GO

INSERT INTO BANGCAP (TENBANGCAP,TRUONGDAOTAO,NAMDAT,MSNV) VALUES (N'Kỹ Sư Phi Công','Viet Flight Training',2010,'PC0000000001')
INSERT INTO BANGCAP (TENBANGCAP,TRUONGDAOTAO,NAMDAT,MSNV) VALUES (N'Cử Nhân','Viet Flight Training',2010,'TV0000000001')
INSERT INTO BANGCAP (TENBANGCAP,TRUONGDAOTAO,NAMDAT,MSNV) VALUES (N'Cử Nhân','Viet Flight Training',2010,'DH0000000001')
INSERT INTO BANGCAP (TENBANGCAP,TRUONGDAOTAO,NAMDAT,MSNV) VALUES (N'Cử Nhân','Viet Flight Training',2010,'DH0000000002')
GO

INSERT INTO PHICONG VALUES ('PC0000000001','CT')
INSERT INTO PHICONG VALUES ('PC0000000002','CT')
INSERT INTO PHICONG VALUES ('PC0000000003','PL')
INSERT INTO PHICONG VALUES ('PC0000000004','PL')
GO

INSERT INTO TIEPVIEN  VALUES ('TV0000000001',N'Tiếng Anh')
INSERT INTO TIEPVIEN  VALUES ('TV0000000002',N'Tiếng Trung')
INSERT INTO TIEPVIEN  VALUES ('TV0000000003',N'Tiếng Nhật')
INSERT INTO TIEPVIEN  VALUES ('TV0000000004',N'Tiếng Anh')
GO

INSERT INTO CHINHANH (TENCHINHANH,THANHPHO,QUOCGIA) VALUES (N'Chi nhánh Hà Nội',N'Hà Nội',N'Việt Nam')
INSERT INTO CHINHANH (TENCHINHANH,THANHPHO,QUOCGIA) VALUES (N'Chi nhánh Đà Nẵng',N'Đà Nẵng',N'Việt Nam')
INSERT INTO CHINHANH (TENCHINHANH,THANHPHO,QUOCGIA) VALUES (N'Chi nhánh TP Hồ Chí Minh',N'TP Hồ Chí Minh',N'Việt Nam')
INSERT INTO CHINHANH (TENCHINHANH,THANHPHO,QUOCGIA) VALUES (N'Chi nhánh Vũng Tàu',N'Vũng Tàu',N'Việt Nam')
GO

INSERT INTO CALAMVIEC VALUES ('C1','06:00','14:00')
INSERT INTO CALAMVIEC VALUES ('C2','14:00','23:00')
INSERT INTO CALAMVIEC VALUES ('C3','23:00','6:00')
GO

INSERT INTO NHANVIENMD VALUES ('KT0000000001',1,'KT0000000001')
INSERT INTO NHANVIENMD VALUES ('KT0000000002',1,'KT0000000001')
INSERT INTO NHANVIENMD VALUES ('KT0000000003',2,'KT0000000001')
INSERT INTO NHANVIENMD VALUES ('KT0000000004',3,'KT0000000001')
INSERT INTO NHANVIENMD VALUES ('DH0000000001',1,'DH0000000001')
INSERT INTO NHANVIENMD VALUES ('DH0000000002',2,'DH0000000001')
INSERT INTO NHANVIENMD VALUES ('DH0000000003',2,'DH0000000001')
INSERT INTO NHANVIENMD VALUES ('DH0000000004',3,'DH0000000001')
INSERT INTO NHANVIENMD VALUES ('KS0000000001',1,'KS0000000001')
INSERT INTO NHANVIENMD VALUES ('KS0000000002',2,'KS0000000001')
INSERT INTO NHANVIENMD VALUES ('KS0000000003',3,'KS0000000001')
INSERT INTO NHANVIENMD VALUES ('KS0000000004',3,'KS0000000001')
GO

INSERT INTO NVMATDAT_CALV VALUES ('KT0000000001','C1','01/01/2018')
INSERT INTO NVMATDAT_CALV VALUES ('KT0000000002','C1','02/01/2017')
INSERT INTO NVMATDAT_CALV VALUES ('KT0000000003','C2','03/01/2018')
INSERT INTO NVMATDAT_CALV VALUES ('KT0000000004','C3','04/01/2016')
INSERT INTO NVMATDAT_CALV VALUES ('DH0000000001','C1','05/01/2018')
INSERT INTO NVMATDAT_CALV VALUES ('DH0000000002','C2','06/01/2018')
INSERT INTO NVMATDAT_CALV VALUES ('DH0000000003','C2','07/01/2017')
INSERT INTO NVMATDAT_CALV VALUES ('DH0000000004','C3','08/01/2017')
INSERT INTO NVMATDAT_CALV VALUES ('KS0000000001','C1','09/01/2016')
INSERT INTO NVMATDAT_CALV VALUES ('KS0000000002','C2','10/01/2018')
INSERT INTO NVMATDAT_CALV VALUES ('KS0000000003','C3','11/01/2018')
INSERT INTO NVMATDAT_CALV VALUES ('KS0000000004','C3','12/01/2018')
GO

INSERT INTO VANHANH VALUES ('PC0000000001','SA0000001')
INSERT INTO VANHANH VALUES ('PC0000000003','SA0000001')
INSERT INTO VANHANH VALUES ('PC0000000002','SA0000002')
INSERT INTO VANHANH VALUES ('PC0000000004','SA0000002')
INSERT INTO VANHANH VALUES ('TV0000000001','SA0000001')
INSERT INTO VANHANH VALUES ('TV0000000002','SA0000002')
GO

INSERT INTO LAI VALUES ('PC0000000001',1)
INSERT INTO LAI VALUES ('PC0000000002',2)
INSERT INTO LAI VALUES ('PC0000000003',3)
INSERT INTO LAI VALUES ('PC0000000004',4)
GO

INSERT INTO KIEMTRA VALUES ('KT0000000001','SA0000001')
INSERT INTO KIEMTRA VALUES ('KT0000000002','SA0000002')
INSERT INTO KIEMTRA VALUES ('KT0000000003','SA0000003')
INSERT INTO KIEMTRA VALUES ('KT0000000004','SA0000004')
GO

INSERT INTO CHUYENMONBD VALUES ('KT0000000001',1)
INSERT INTO CHUYENMONBD VALUES ('KT0000000002',2)
INSERT INTO CHUYENMONBD VALUES ('KT0000000003',3)
INSERT INTO CHUYENMONBD VALUES ('KT0000000004',4)
GO

--UPDATE

--Update tình trạng của chuyến bay SA0000001 từ Chờ Bay sang Đã Bay
UPDATE CHUYENBAY
SET	TRANGTHAI = 'DB'
WHERE MSCB = 'SA0000001'
GO

--Update tình trạng của khách hàngNL0000000001 từ Tham Gia sang Đổi 
UPDATE KHACHHANG
SET	MSTTTG = 3
WHERE MSKH = 'NL0000000001'
GO

--DELETE

DELETE FROM THUCPHAM
WHERE TEN LIKE N'Bánh trưng'
GO

--Xóa dữ liệu thành công trong trường hợp dữ liệu cần xóa không tham chiếu tới bất kỳ dữ liệu nào của bảng khác
--Khi xóa dữ liệu thành công thì chỉ bảng THUCPHAM sẽ bị ảnh hưởng bởi thao tác xóa này
--vì điều kiện xóa dữ liệu thành công là dữ liệu cần xóa không tham chiếu tới bất kỳ dữ liệu nào của bảng khác nên sẽ không ảnh hưởng tới các bảng khác

--SELECT

--Thông tin nhân viên thuộc phi hành đoàn tham gia chuyến bay mã số SA0000001
SELECT NHANVIEN.MSNV,NHANVIEN.HOTEN,NHANVIEN.SODT,NHANVIEN.DIACHI
FROM VANHANH 
	JOIN NHANVIEN ON VANHANH.MSNV = NHANVIEN.MSNV
	JOIN CHUYENBAY ON VANHANH.MSCB = CHUYENBAY.MSCB
WHERE CHUYENBAY.MSCB like 'SA0000001'
GO

--Thông tin nhân viên làm ca 1
SELECT NHANVIEN.MSNV,NHANVIEN.HOTEN,NVMATDAT_CALV.MSCLV,CALAMVIEC.TUGIO,CALAMVIEC.DENGIO
FROM NHANVIEN 
	JOIN NVMATDAT_CALV ON NHANVIEN.MSNV = NVMATDAT_CALV.MSNV
	JOIN CALAMVIEC ON NVMATDAT_CALV.MSCLV = CALAMVIEC.MSCLV
WHERE NVMATDAT_CALV.MSCLV like 'C1'
GO

--Thông tin các chuyến bay còn chỗ trống trong ngày 12/12/2018 của tuyến bay từ Đà Lạt đi Hà Nội
SELECT *
FROM CHUYENBAY
JOIN TUYENBAY ON CHUYENBAY.MSTB = TUYENBAY.MSTB
WHERE SOGHETRONG > 0 AND TUYENBAY.MSG_DI = 1 AND TUYENBAY.MSG_DEN = 2 AND CONVERT(DATE,THOIDIEMDI) = '12/12/2018' 
GO

--Danh sách ghế còn trống trong chuyến bay SA0000001
SELECT GHENGOI.GHESO,CHUYENBAY.MSCB
FROM MAYBAY 
	JOIN GHENGOI ON MAYBAY.MSLMB = GHENGOI.MSLMB
	JOIN CHUYENBAY ON CHUYENBAY.MSMB = MAYBAY.MSMB
WHERE CHUYENBAY.MSCB like 'SA0000001'
EXCEPT
SELECT GHESO,KHACHHANG.MSCB
FROM GHEKHACH 
	JOIN KHACHHANG ON GHEKHACH.MSKH = KHACHHANG.MSKH
WHERE KHACHHANG.MSCB like 'SA0000001'

----END----