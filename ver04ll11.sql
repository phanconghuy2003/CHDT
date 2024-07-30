create database qldiemdanh4ll11
use qldiemdanh4ll11

select *from account
CREATE TABLE ADMIN (
    AdminID INT PRIMARY KEY,
    UserName VARCHAR(50) UNIQUE,
    Password VARCHAR(50)
);
INSERT INTO ADMIN (AdminID, UserName, Password)
VALUES (1, 'admin', '123');

CREATE TABLE account(
	UserName VARCHAR(50)  PRIMARY KEY,
	DisplayName VARCHAR(50),
	Password VARCHAR(50),
	TypeID INT
);

CREATE TABLE GIANGVIEN (
    MaGV VARCHAR(50) PRIMARY KEY,
    HoTenGV VARCHAR(255),
    TrinhDo VARCHAR(255),
    ChuyenMon VARCHAR(255)
);
	
CREATE TABLE SINHVIEN (
    MaSV VARCHAR(50) PRIMARY KEY,
    HoTenSV VARCHAR(255),
    NgaySinh DATE,
    GioiTinh VARCHAR(10) CHECK(GioiTinh IN ('Nam','Nu')),
    MaLop VARCHAR(10)
);

CREATE TABLE MONHOC (
    MaMH VARCHAR(50) PRIMARY KEY,
    TenMH VARCHAR(255),
    SoTinChi INT CHECK(SoTinChi > 0),
    TongSoTiet INT CHECK(TongSoTiet > 0),
    SoTietLyThuyet INT CHECK(SoTietLyThuyet >= 0),
    SoTietThucHanh INT CHECK(SoTietThucHanh >= 0)
);

CREATE TABLE CAHOC (
    MaCaHoc VARCHAR(50) PRIMARY KEY,
    GioBD TIME,
    GioKT TIME,
    SoTiet INT CHECK (SoTiet > 0)
);
ALTER TABLE CAHOC
ADD CONSTRAINT CHK_CAHOC_GIO CHECK (GioKT > GioBD);


CREATE TABLE PHONGHOC (
    MaPhongHoc VARCHAR(20) PRIMARY KEY,
    TenPhongHoc VARCHAR(255),
    DiaChi VARCHAR(255)
);

CREATE TABLE LOPMONHOC (
    MaLopMH VARCHAR(50) PRIMARY KEY,
    TenLopMH VARCHAR(255),
	MaGV VARCHAR(50),
	MaMH VARCHAR(50),
	MaCaHoc VARCHAR(50),
	FOREIGN KEY (MaGV) REFERENCES GIANGVIEN(MaGV),
	FOREIGN KEY (MaMH) REFERENCES MONHOC(MaMH),
	FOREIGN KEY (MaCaHoc) REFERENCES CAHOC(MaCaHoc),
);

CREATE TABLE SUDUNGPHONGHOC (
    MaLopMH VARCHAR(50),
    MaPhongHoc VARCHAR(20),
	PRIMARY KEY (MaLopMH, MaPhongHoc),
    FOREIGN KEY (MaLopMH) REFERENCES LOPMONHOC(MaLopMH),
    FOREIGN KEY (MaPhongHoc) REFERENCES PHONGHOC(MaPhongHoc)
);

CREATE TABLE DIEMDANH (
    MaSV VARCHAR(50), 
    MaLopMH VARCHAR(50),
	FOREIGN KEY (MaSV) REFERENCES SINHVIEN(MaSV),
	FOREIGN KEY (MaLopMH) REFERENCES LOPMONHOC(MaLopMH),
    Ngay DATE,
	PRIMARY KEY(MaSV, MaLopMH, Ngay),
    VangCoPhep BIT,
    VangKhongPhep BIT
);

INSERT INTO account(UserName, DisplayName, Password, TypeID) 
VALUES  
	('321', 'Tran Van A', '1234', 1), 
	('564', 'Le Thi B', '1234', 1),
    ('103', 'Pham Van E', '1234', 2),
    ('104', 'Nguyen Van F', '1234', 2),
    ('105', 'Tran Thi G', '1234', 2),
    ('106', 'Le Van H', '1234', 2),
    ('107', 'Tran Van I', '1234', 2),
    ('108', 'Nguyen Van J', '1234', 2),
    ('109', 'Le Thi K', '1234', 2),
    ('110', 'Pham Van L', '1234', 2),
    ('111', 'Nguyen Van M', '1234', 2),
    ('112', 'Tran Van N', '1234', 2);


INSERT INTO GIANGVIEN (MaGV, HoTenGV, TrinhDo, ChuyenMon)
VALUES
    ('321', 'Tran Van A', 'Thac Si', 'He thong thong tin'),
    ('564', 'Le Thi B', 'Giao Su', 'Cong nghe phan mem');

INSERT INTO SINHVIEN (MaSV, HoTenSV, NgaySinh, GioiTinh, MaLop)
VALUES
    ('103', 'Pham Van E', '2002-08-10', 'Nam', 'L03'),
    ('104', 'Nguyen Van F', '2001-12-05', 'Nam', 'L01'),
    ('105', 'Tran Thi G', '2003-02-20', 'Nu', 'L02'),
    ('106', 'Le Van H', '2002-04-15', 'Nam', 'L03'),
    ('107', 'Tran Van I', '2000-09-30', 'Nam', 'L01'),
    ('108', 'Nguyen Van J', '2002-05-25', 'Nam', 'L02'),
    ('109', 'Le Thi K', '2003-11-12', 'Nu', 'L03'),
    ('110', 'Pham Van L', '2001-06-18', 'Nam', 'L01'),
    ('111', 'Nguyen Van M', '2002-03-09', 'Nam', 'L02'),
    ('112', 'Tran Van N', '2000-07-22', 'Nam', 'L03');

INSERT INTO MONHOC (MaMH, TenMH, SoTinChi, TongSoTiet, SoTietLyThuyet, SoTietThucHanh)
VALUES
    ('201', 'Cong nghe phan mem', 3, 45, 30, 15),
    ('202', 'Lap trinh web', 4, 30, 20, 10),
    ('203', 'Nhap mon lap trinh', 2, 40, 30, 20),
    ('204', 'Toan roi rac', 4, 60, 20, 10)

INSERT INTO CAHOC (MaCaHoc, GioBD, GioKT, SoTiet)
VALUES
    ('301', '07:00:00', '09:15:00', 3),
    ('302', '09:30:00', '11:45:00', 3),
    ('303', '12:30:00', '14:45:00', 3),
    ('304', '15:00:00', '17:25:00', 3),
    ('305', '07:00:00', '10:45:00', 5),
    ('306', '12:30:00', '16:15:00', 4);

INSERT INTO PHONGHOC (MaPhongHoc, TenPhongHoc, DiaChi)
VALUES
    ('A101', 'Room A101', 'Toa A, 140 Le Trong Tan'),
    ('B202', 'Room B202', 'Toa B, 140 Le Trong Tan'),
    ('A102', 'Room A102', 'Toa C, 140 Le Trong Tan'),
    ('B203', 'Room B203', 'Toa D, 140 Le Trong Tan');

INSERT INTO LOPMONHOC (MaLopMH, TenLopMH, MaGV, MaMH, MaCaHoc)
VALUES
    ('LMH101', 'Cong nghe phan mem', 321, 201, 301),
    ('LCS102', 'Lap trinh web', 564, 202, 305),
    ('LMH103', 'Nhap mon lap trinh', 321, 203, 303),
    ('LCS104', 'Toan roi rac', 564, 204, 302);

INSERT INTO SUDUNGPHONGHOC (MaLopMH, MaPhongHoc)
VALUES
    ('LMH101', 'A101'),
    ('LCS102', 'B202'),
    ('LMH103', 'A102'),
    ('LCS104', 'B203');

INSERT INTO DIEMDANH (MaSV, MaLopMH, Ngay, VangCoPhep, VangKhongPhep)
VALUES
	('103', 'LMH101', '2023-10-01', 0, 0),
    ('104', 'LMH101', '2023-10-01', 0, 0),
    ('105', 'LCS102', '2023-11-01', 0, 0),
    ('106', 'LCS102', '2023-11-01', 0, 0),
	('107', 'LMH103', '2023-12-01', 0, 0),
    ('108', 'LMH103', '2023-12-01', 0, 0),
	('109', 'LCS104', '2023-3-01', 0, 0),
    ('110', 'LCS104', '2023-3-01', 0, 0),

---------------------------------------------------

    ('103', 'LMH101', '2023-4-01', 0, 0),
    ('104', 'LMH101', '2023-4-01', 0, 0),

    ('105', 'LCS102', '2023-5-01', 0, 0),
    ('106', 'LCS102', '2023-5-01', 0, 0),

    ('107', 'LMH103', '2023-6-01', 0, 0),
    ('108', 'LMH103', '2023-6-01', 0, 0),

    ('109', 'LCS104', '2023-7-01', 0, 0),
    ('110', 'LCS104', '2023-7-01', 0, 0),

-----------------------------------------------------

    ('103', 'LMH101', '2023-8-01', 0, 0),
    ('104', 'LMH101', '2023-8-01', 0, 0),

    ('105', 'LCS102', '2023-9-01', 0, 0),
    ('106', 'LCS102', '2023-9-01', 0, 0),

    ('107', 'LMH103', '2023-2-01', 0, 0),
    ('108', 'LMH103', '2023-2-01', 0, 0),

    ('109', 'LCS104', '2023-1-01', 0, 0),
    ('110', 'LCS104', '2023-1-01', 0, 0);

ALTER TABLE DIEMDANH ADD GhiChu VARCHAR(100);

SELECT LOPMONHOC.MaLopMH FROM LOPMONHOC WHERE LOPMONHOC.MaGV ='321'

SELECT LOPMONHOC.MaLopMH, MONHOC.TenMH
FROM LOPMONHOC
INNER JOIN MONHOC ON LOPMONHOC.MaMH = MONHOC.MaMH
WHERE LOPMONHOC.MaGV = '321';

select *from dbo.DIEMDANH
select *from dbo.PHONGHOC

select * count(VangCoPhep) as 'vang phep' ,count(VangKhongPhep)  as 'vang ko phep' from DIEMDANH

select *from dbo.account
select Password from dbo.account where UserName= '321'

select *from dbo.DIEMDANH

select count(*) as 'vang' from DIEMDANH where VangCoPhep= 1 or VangKhongPhep= 1

update DIEMDANH set VangCoPhep= 0 where VangCoPhep =1
select *from SINHVIEN

SELECT  dd.MaSV, sv.HoTenSV, VangCoPhep, VangKhongPhep, GhiChu FROM DIEMDANH dd, SINHVIEN sv where Ngay= '2023-04-01' and MaLopMH = 'LMH101' and dd.MaSV= sv.MaSV
 select *from SINHVIEN

SELECT MONHOC.TenMH AS TENMONHOC, DIEMDANH.MaLopMH,
    SUM(
        CASE WHEN DIEMDANH.VangCoPhep = 1 THEN 1 ELSE 0 END +
        CASE WHEN DIEMDANH.VangKhongPhep = 1 THEN 1 ELSE 0 END
    ) AS TongSoVang
FROM DIEMDANH
INNER JOIN LOPMONHOC ON DIEMDANH.MaLopMH = LOPMONHOC.MaLopMH
INNER JOIN MONHOC ON LOPMONHOC.MaMH = MONHOC.MaMH
WHERE DIEMDANH.MaSV = '103'
GROUP BY MONHOC.TenMH, DIEMDANH.MaLopMH;

select Ngay, VangCoPhep, VangKhongPhep, GhiChu
from DIEMDANH 
where MaSV='104' and (VangCoPhep=1 or VangKhongPhep=1) and MaLopMH = 'LMH101'

INSERT INTO DIEMDANH (MaSV, MaLopMH, Ngay, VangCoPhep, VangKhongPhep)
VALUES
	('103', 'LCS102', '2023-10-01', 0, 0),
	('103', 'LMH103', '2023-11-01', 0, 0);
select * from LOPMONHOC
select *from DIEMDANH where MaLopMH = 'LCS102' and MaSV='103'


SELECT CONCAT(DAY(Ngay), '-', MONTH(Ngay), '-', YEAR(Ngay)) AS Ngay, 
SUM(CONVERT(INT, VangCoPhep)) AS VangCoPhep,
SUM(CONVERT(INT, VangKhongPhep)) AS VangKhongPhep,GhiChu
FROM DIEMDANH
WHERE MaSV = '104'
AND (VangCoPhep = 1 OR VangKhongPhep = 1)
AND MaLopMH = 'LMH101'
GROUP BY CONCAT(DAY(Ngay), '-', MONTH(Ngay), '-', YEAR(Ngay)), GhiChu

