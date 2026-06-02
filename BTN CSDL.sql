USE master 
GO
CREATE DATABASE EBOOK
GO
USE EBOOK
GO


/*tạo bảng*/

CREATE TABLE DanhMuc (
[Ma Danh Muc] INT PRIMARY KEY,
[Ten Danh Muc] NVARCHAR(50),
)
GO

CREATE TABLE NguoiDung (
[ID] INT NOT NULL PRIMARY KEY,
[Vai Tro] NVARCHAR(50),
[Email] NVARCHAR(50),
[Ten] NVARCHAR(50),
[Gioi Tinh] CHAR(1),
[Ngay sinh] DATETIME,
[Mat khau] VARCHAR (100),
[Ten Dang Nhap] NVARCHAR(50),
[Ngay Dang ky] DATETIME NOT NULL,
[So Dien Thoai] INT,
)
GO

CREATE TABLE BaiBao (
[Ma Bai Bao] INT NOT NULL PRIMARY KEY,
[Ma Danh Muc] INT NOT NULL,
[Ma Bien Tap Vien] INT NOT NULL,
[Ma Phong Vien] INT NOT NULL,
[Ten Danh Muc] NVARCHAR(50) NOT NULL,
[Tieu De] NVARCHAR(100) NOT NULL,
[Noi Dung] NTEXT NOT NULL,
[Hinh Anh] IMAGE,
[Ngay Dang] DATETIME,
[Nguoi Duyet] NVARCHAR(50),
[Nguoi Dang] NVARCHAR (50),
[So Nguoi Xem] INT NOT NULL
 )
 GO
       

CREATE TABLE BienTapVien (
[Ma Bien Tap Vien] INT NOT NULL PRIMARY KEY,
[Ten Bien Tap Vien] nvarchar(50) NOT NULL,
[Ngay Sinh] DATETIME ,
[Gioi Tinh] CHAR(1) NOT NULL,
[Ten Dang Nhap] NVARCHAR(50),
[So Dien Thoai] INT,
[Email] VARCHAR(50),
[Ngay Dang ky] DATETIME NOT NULL,
[Mat Khau] VARCHAR(100),
[Vai Tro] NVARCHAR(50),
)
GO

CREATE TABLE DocGia (
[Ma doc Gia] INT NOT NULL PRIMARY KEY,
[Ten Doc Gia] NVARCHAR(50) NOT NULL,
[Ngay Sinh] DATETIME ,
[Gioi Tinh] CHAR(1) NOT NULL,
[Ten Dang Nhap] NVARCHAR(50),
[So Dien Thoai] INT,
[Email] VARCHAR(50),
[Ngay Dang ky] DATETIME,
[Mat Khau] VARCHAR(100),
[Vai Tro] NVARCHAR(50),
)
GO

CREATE TABLE PhongVien (
[Ma Phong Vien] INT NOT NULL PRIMARY KEY,
[Ten Phong Vien] NVARCHAR(50) NOT NULL,
[Ngay Sinh] DATETIME,
[Gioi Tinh] CHAR(1) NOT NULL,
[Ten Dang Nhap] NVARCHAR(50),
[So Dien Thoai] INT,
[Email] VARCHAR(50),
[Ngay Dang ky] DATETIME,
[Mat Khau] VARCHAR(100),
[Vai Tro] NVARCHAR(50),

)
GO

ALTER TABLE dbo.PhongVien WITH CHECK ADD CONSTRAINT Ck_PhongVien_Asex CHECK ([Gioi Tinh] IN ('F','M','N'))
ALTER TABLE dbo.DocGia WITH CHECK ADD CONSTRAINT Ck_DocGia_Asex CHECK ([Gioi Tinh] IN ('M','F','N'))
ALTER TABLE dbo.BienTapVien WITH CHECK ADD CONSTRAINT Ck_BienTapVien_Asex CHECK ([Gioi Tinh] IN ('M','F','N'))

ALTER TABLE dbo.BaiBao ADD CONSTRAINT Fk_BaiBao_MaDanhMuc FOREIGN KEY ([Ma Danh Muc]) REFERENCES dbo.DanhMuc ([Ma Danh Muc])
ALTER TABLE dbo.BaiBao ADD CONSTRAINT Fk_BaiBao_MaPhongVien FOREIGN KEY ([Ma Phong Vien]) REFERENCES dbo.PhongVien ([Ma Phong Vien])
ALTER TABLE dbo.BaiBao ADD CONSTRAINT Fk_BaiBao_MaBienTapVien FOREIGN KEY ([Ma Bien Tap Vien]) REFERENCES dbo.BienTapVien ([Ma Bien Tap Vien])

ALTER TABLE dbo.DocGia ADD CONSTRAINT Fk_NguoiDung_DocGia FOREIGN KEY ([Ma doc Gia]) REFERENCES dbo.NguoiDung(ID)
ALTER TABLE dbo.PhongVien ADD CONSTRAINT Fk_NguoiDung_PhongVien FOREIGN KEY ([Ma Phong Vien]) REFERENCES dbo.NguoiDung(ID)
ALTER TABLE dbo.BienTapVien ADD CONSTRAINT Fk_NguoiDung_BienTapVien FOREIGN KEY ([Ma Bien Tap Vien]) REFERENCES dbo.NguoiDung(ID)


set dateformat dmy /*(chạy câu lệnh này trước khi insert dữ liệu)*/
/*Thêm dữ liệu vào bảng DanhMuc*/
INSERT INTO dbo.DanhMuc ([Ma Danh Muc], [Ten Danh Muc]) VALUES (1, N'Giáo Dục')
INSERT INTO dbo.DanhMuc ([Ma Danh Muc], [Ten Danh Muc]) VALUES (2, N'Thể Thao')
INSERT INTO dbo.DanhMuc ([Ma Danh Muc], [Ten Danh Muc]) VALUES (3, N'Giải Trí')
INSERT INTO dbo.DanhMuc ([Ma Danh Muc], [Ten Danh Muc]) VALUES (4, N'Du Lịch')
INSERT INTO dbo.DanhMuc ([Ma Danh Muc], [Ten Danh Muc]) VALUES (5, N'Văn Hóa')

/*Thêm dữ liệu vào bảng NguoiDung*/
INSERT INTO dbo.NguoiDung ([Vai Tro], [Email], [Ten], [ID], [Gioi Tinh], [Ngay sinh], [Mat khau], [Ten Dang Nhap], [Ngay Dang Ky], [So Dien Thoai])
VALUES (N'DocGia', N'meocon@gmail.com', N'Mèo con', N'201', N'F', N'1999-5-8', N'meoconcute', N'bemeonhomituot', N'2024-6-2', N'0982719382')
INSERT INTO dbo.NguoiDung ([Vai Tro], [Email], [Ten], [ID], [Gioi Tinh], [Ngay sinh], [Mat khau], [Ten Dang Nhap], [Ngay Dang Ky], [So Dien Thoai])
VALUES (N'DocGia', N'minhan@gmail.com', N'Hoa Tulip', N'202', N'F', N'1998-9-2', N'hoatulip1999', N'hoatulip', N'2023-5-2', N'0985718932')
INSERT INTO dbo.NguoiDung ([Vai Tro], [Email], [Ten], [ID], [Gioi Tinh], [Ngay sinh], [Mat khau], [Ten Dang Nhap], [Ngay Dang Ky], [So Dien Thoai])
VALUES (N'DocGia', N'jenny@gmail.com', N'Jenny Nguyễn', N'203', N'F', N'2005-12-2', N'jenny2024', N'jenny', N'2020-8-12', N'0927189382')
INSERT INTO dbo.NguoiDung ([Vai Tro], [Email], [Ten], [ID], [Gioi Tinh], [Ngay sinh], [Mat khau], [Ten Dang Nhap], [Ngay Dang Ky], [So Dien Thoai])
VALUES (N'DocGia', N'long@gmail.com', N'Bảo Long', N'204', N'M', N'2003-8-9', N'baolong3k', N'longbao', N'2022-1-2', N'0985718982')
INSERT INTO dbo.NguoiDung ([Vai Tro], [Email], [Ten], [ID], [Gioi Tinh], [Ngay sinh], [Mat khau], [Ten Dang Nhap], [Ngay Dang Ky], [So Dien Thoai])
VALUES (N'PhongVien', N'linhanh@gmail.com', N'Linh Anh', N'101', N'F', N'1993-9-9', N'linhanh299', N'betho', N'2023-1-9', N'0991738819')
INSERT INTO dbo.NguoiDung ([Vai Tro], [Email], [Ten], [ID], [Gioi Tinh], [Ngay sinh], [Mat khau], [Ten Dang Nhap], [Ngay Dang Ky], [So Dien Thoai])
VALUES (N'PhongVien', N'mhuy@gmail.com', N'Minh Huy', N'102', N'M', N'2000-6-2', N'mhuy2306', N'huyminh', N'2023-8-3', N'0991738519')
INSERT INTO dbo.NguoiDung ([Vai Tro], [Email], [Ten], [ID], [Gioi Tinh], [Ngay sinh], [Mat khau], [Ten Dang Nhap], [Ngay Dang Ky], [So Dien Thoai])
VALUES (N'PhongVien', N'hl285@gmail.com', N'Hạ Ly', N'103', N'F', N'1995-5-5', N'iloveu', N'summer', N'2020-6-7', N'0991438519')
INSERT INTO dbo.NguoiDung ([Vai Tro], [Email], [Ten], [ID], [Gioi Tinh], [Ngay sinh], [Mat khau], [Ten Dang Nhap], [Ngay Dang Ky], [So Dien Thoai])
VALUES (N'PhongVien', N'phong206@gmail.com', N'Đông Phong', N'104', N'M', N'1999-6-2', N'phong1234', N'phong123',N'2018-5-2', N'0981438519')
INSERT INTO dbo.NguoiDung ([Vai Tro], [Email], [Ten], [ID], [Gioi Tinh], [Ngay sinh], [Mat khau], [Ten Dang Nhap], [Ngay Dang Ky], [So Dien Thoai])
VALUES (N'BienTapVien', N'hongduy11@gmail.com', N'Hồng Duy', N'001', N'F', N'1998-1-1', N'hongduy1234', N'Hongduy', N'2020-5-5', N'0903697365') 
INSERT INTO dbo.NguoiDung ([Vai Tro], [Email], [Ten], [ID], [Gioi Tinh], [Ngay sinh], [Mat khau], [Ten Dang Nhap], [Ngay Dang Ky], [So Dien Thoai])
VALUES (N'BienTapVien', N'maichine@gmail.com', N'Mai Chi', N'002', N'F', N'1993-3-4', N'chichi34', N'Maichine', N'2019-7-8', N'0918672523')
INSERT INTO dbo.NguoiDung ([Vai Tro], [Email], [Ten], [ID], [Gioi Tinh], [Ngay sinh], [Mat khau], [Ten Dang Nhap], [Ngay Dang Ky], [So Dien Thoai])
VALUES (N'BienTapVien', N'huyoihuy@gmail.com', N' Huy Nguyễn', N'003', N'M', N'1997-11-12', N'huyoihuya', N'huyhuy', N'2022-8-12', N'0981973829')
INSERT INTO dbo.NguoiDung ([Vai Tro], [Email], [Ten], [ID], [Gioi Tinh], [Ngay sinh], [Mat khau], [Ten Dang Nhap], [Ngay Dang Ky], [So Dien Thoai])
VALUES (N'BienTapVien', N'taicute@gmail.com', N'Phú Tài', N'004', N'M', N'1999-10-9', N'tairatcute', N'iamsocute', N'2023-7-9', N'0912837902')

/*Thêm dữ liệu vào bảng DocGia*/
INSERT INTO dbo.DocGia ([Ma doc Gia], [Ten Doc Gia], [Gioi Tinh], [Ngay Sinh], [Ten Dang Nhap], [So Dien Thoai], [Email], [Ngay Dang ky], [Vai Tro], [Mat Khau])
VALUES (201, N'Mèo con', N'F', N'2003-9-2', N'bemeonhomituot', N'0982719382', N'meocon@gmail.com', N'2024-6-4', N'DocGia', N'meoconcute')
INSERT INTO dbo.DocGia ([Ma doc Gia], [Ten Doc Gia], [Gioi Tinh], [Ngay Sinh], [Ten Dang Nhap], [So Dien Thoai], [Email], [Ngay Dang ky], [Vai Tro], [Mat Khau])
VALUES (202, N'Hoa Tulip', N'F', N'2000-6-2', N'hoatulip', N'0985718932', N'minhan@gmail.com', N'2023-5-3', N'DocGia', N'hoatulip1999')
INSERT INTO dbo.DocGia ([Ma doc Gia], [Ten Doc Gia], [Gioi Tinh], [Ngay Sinh], [Ten Dang Nhap], [So Dien Thoai], [Email], [Ngay Dang ky], [Vai Tro], [Mat Khau])
VALUES (203, N'Jenny Nguyễn', N'F', N'1995-5-2', N'jenny', N'0927189382', N'jenny@gmail.com', N'2020-8-2', N'DocGia', N'jenny2024')
INSERT INTO dbo.DocGia ([Ma doc Gia], [Ten Doc Gia], [Gioi Tinh], [Ngay Sinh], [Ten Dang Nhap], [So Dien Thoai], [Email], [Ngay Dang ky], [Vai Tro], [Mat Khau])
VALUES (204, N'Bảo Long', N'M', N'1999-6-2', N'longbao', N'0985718982', N'long@gmail.com', N'2022-1-2', N'DocGia', N'baolong3k')

/*Thêm dữ liệu vào bảng PhongVien*/
INSERT INTO dbo.PhongVien ([Ma Phong Vien], [Ten Phong Vien], [Ngay Sinh], [Gioi Tinh], [Ten Dang Nhap], [So Dien Thoai], [Email], [Ngay Dang ky], [Vai Tro], [Mat Khau])
VALUES (101, N'Linh Anh', N'2003-9-1', N'F', N'betho', N'0991738819', N'linhanh@gmail.com', N'2023-1-9', N'PhongVien', N'linhanh299')
INSERT INTO dbo.PhongVien ([Ma Phong Vien], [Ten Phong Vien], [Ngay Sinh], [Gioi Tinh], [Ten Dang Nhap], [So Dien Thoai], [Email], [Ngay Dang ky], [Vai Tro], [Mat Khau])
VALUES (102, N'Minh Huy', N'2000-6-2', N'M', N'huyminh', N'0991738519', N'mhuy@gmail.com', N'2023-8-3', N'PhongVien', N'mhuy2306')
INSERT INTO dbo.PhongVien ([Ma Phong Vien], [Ten Phong Vien], [Ngay Sinh], [Gioi Tinh], [Ten Dang Nhap], [So Dien Thoai], [Email], [Ngay Dang ky], [Vai Tro], [Mat Khau])
VALUES (103, N'Hạ Ly', N'1995-5-1', N'F', N'summer', N'0991438519', N'hl285@gmail.com', N'2020-6-7', N'PhongVien', N'iloveu')
INSERT INTO dbo.PhongVien ([Ma Phong Vien], [Ten Phong Vien], [Ngay Sinh], [Gioi Tinh], [Ten Dang Nhap], [So Dien Thoai], [Email], [Ngay Dang ky], [Vai Tro], [Mat Khau])
VALUES (104, N'Đông Phong', N'1999-6-2', N'M', N'phong123', N'0981438519', N'phong206@gmail.com', N'2018-5-2', N'PhongVien', N'phong1234')


/*Thêm dữ liệu vào bảng BienTapVien*/
INSERT INTO dbo.BienTapVien ([Ma Bien Tap Vien], [Ten Bien Tap Vien], [Ngay Sinh], [Gioi Tinh], [Ten Dang Nhap], [So Dien Thoai], [Email], [Ngay Dang ky], [Vai Tro], [Mat Khau])
VALUES (001, N'Hồng Duy', N'1998-1-1', N'F', N'Hongduy', N'0903697365', N'hongduy11@gmail.com', N'2020-5-5', N'BienTapVien', N'hongduy1234' )
INSERT INTO dbo.BienTapVien ([Ma Bien Tap Vien], [Ten Bien Tap Vien], [Ngay Sinh], [Gioi Tinh], [Ten Dang Nhap], [So Dien Thoai], [Email], [Ngay Dang ky], [Vai Tro], [Mat Khau])
VALUES (002, N'Mai Chi', N'1993-3-4', N'F', N'Maichine', N'0918672523', N'maichine@gmail.com', N'2019-7-8', N'BienTapVien', N'chichi34')
INSERT INTO dbo.BienTapVien ([Ma Bien Tap Vien], [Ten Bien Tap Vien], [Ngay Sinh], [Gioi Tinh], [Ten Dang Nhap], [So Dien Thoai], [Email], [Ngay Dang ky], [Vai Tro], [Mat Khau])
VALUES (003, N'Huy Nguyễn', N'1997-11-12', N'M', N'huyhuy', N'0981973829', N'huyoihuy@gmail.com', N'2022-8-12', N'BienTapVien', N'huyoihuya')
INSERT INTO dbo.BienTapVien ([Ma Bien Tap Vien], [Ten Bien Tap Vien], [Ngay Sinh], [Gioi Tinh], [Ten Dang Nhap], [So Dien Thoai], [Email], [Ngay Dang ky], [Vai Tro], [Mat Khau])
VALUES (004, N'Phú Tài', N'1999-10-9', N'M', N'iamsocute', N'0912837902', N'taicute@gmail.com', N'2023-7-10', N'BienTapVien', N'tairatcute')

/*Thêm dữ liệu vào bảng BaiBao*/
INSERT INTO dbo.BaiBao ([Ma Bai Bao], [Ma Danh Muc], [Ma Bien Tap Vien], [Ma Phong Vien], [Ten Danh Muc], [Tieu De], [Noi Dung], [Ngay Dang], [Nguoi Duyet], [Nguoi Dang], [So Nguoi Xem])
VALUES (301, 1, 001, 101, N'Giao Duc', N'Điểm chuẩn lớp 6 trường THCS Cầu Giấy tăng', N'Trường THCS Cầu Giấy chiều 24/6 công bố điểm chuẩn vào lớp 6 với 60/71,5, cao hơn năm ngoái 1,5 điểm.', N'2024-6-2', N'Hà Anh', N'Minh Bùi', 999)
INSERT INTO dbo.BaiBao ([Ma Bai Bao], [Ma Danh Muc], [Ma Bien Tap Vien], [Ma Phong Vien], [Ten Danh Muc], [Tieu De], [Noi Dung], [Ngay Dang], [Nguoi Duyet], [Nguoi Dang], [So Nguoi Xem])
VALUES (302, 2, 002, 103, N'Thể Thao', N'Pháp - Hà Lan: Phân định ngôi đầu', N'Kết quả màn đại chiến giữa Pháp và Hà Lan nhiều khả năng sẽ định đoạt hai vị trí dẫn đầu bảng D Euro 2024', N'2024-6-2', N'Ngô Phong', N'Binz', 10927)
INSERT INTO dbo.BaiBao ([Ma Bai Bao], [Ma Danh Muc], [Ma Bien Tap Vien], [Ma Phong Vien], [Ten Danh Muc], [Tieu De], [Noi Dung], [Ngay Dang], [Nguoi Duyet], [Nguoi Dang], [So Nguoi Xem])
VALUES (303, 3, 003, 102, N'Giải Trí', N'Loạt chi tiết ẩn trong InsideOut 2', N'Inside Out 2" cài cắm nhiều chi tiết gợi nhớ phần đầu năm 2015 và "Toy Story" của hãng Pixar và Disney', N'2024-6-2', N'Đông Nhi', N'Thúy Ngân', 192389)
INSERT INTO dbo.BaiBao ([Ma Bai Bao], [Ma Danh Muc], [Ma Bien Tap Vien], [Ma Phong Vien], [Ten Danh Muc], [Tieu De], [Noi Dung], [Ngay Dang], [Nguoi Duyet], [Nguoi Dang], [So Nguoi Xem])
VALUES (304, 4, 004, 101, N'Du Lịch', N'10 hãng hàng không tốt nhất thế giới 2024', N'Qatar Airways là hãng hàng không tốt nhất thế giới 2024; Vietnam Airlines đứng thứ 45 trong top 100, tụt một bậc so với năm ngoái.', N'2024-6-4', N'Thảo Linh', 'Lan Ngọc', 890)
INSERT INTO dbo.BaiBao ([Ma Bai Bao], [Ma Danh Muc], [Ma Bien Tap Vien], [Ma Phong Vien], [Ten Danh Muc], [Tieu De], [Noi Dung], [Ngay Dang], [Nguoi Duyet], [Nguoi Dang], [So Nguoi Xem])
VALUES (305, 5, 002, 104, N'Văn Hóa', N'Người mẫu ảnh Châu Bùi bị quay lén khi thay đồ', N'QKhi thử đồ trong nhà vệ sinh của studio ở quận 3, fashionista Châu Bùi phát hiện chiếc camera quay lén, đã ghi lại nhiều hình ảnh của cô, nên trình báo công an.', N'2024-6-2', N'Binz', N'Decao', 98291829)



/*THỰC HIỆN CÁC TRUY VẤN */

/*1 kiểm tra một số bảng sau khi thêm vào */
SELECT * FROM dbo.BaiBao
SELECT * FROM dbo.DanhMuc
SELECT * FROM dbo.NguoiDung
SELECT * FROM dbo.PhongVien
SELECT * FROM dbo.DocGia
SELECT * FROM dbo.BienTapVien

/*2 sử dụng truy vấn ODER BY sắp xếp giảm dần các bài báo được duyệt*/
USE EBOOK
go
SELECT [Ma Bai Bao], [Ngay Dang] FROM BaiBao
 WHERE [Ngay Dang] IS NOT NULL
 ORDER BY [Ma Bai Bao] DESC 

GO

/*3  Truy vấn sử dụng toán tử Like để tìm tên danh mục của bài báo bắt đầu bằng chữ G*/
USE EBOOK
go
SELECT * FROM BaiBao WHERE [Ten Danh Muc] LIKE 'G%'

GO

/*4 Lấy ra họ tên, ngày sinh, tuổi của các phóng viên nhỏ hơn 35 tuổi*/
USE EBOOK
GO
SELECT [Ten Phong Vien], [Ngay Sinh], (YEAR(GETDATE()) - YEAR([Ngay Sinh])) AS Tuoi FROM dbo.PhongVien
WHERE YEAR(GETDATE()) - YEAR([Ngay Sinh]) <= 35
GO

/*5 Truy vấn dữ liệu từ nhiều bảng sử dụng Inner join để lọc ra Email So Dien Thoai của độc giả đọc bài báo */
USE EBOOK
go
SELECT BienTapVien.[Email], BienTapVien.[So Dien Thoai], BienTapVien.[Ten Bien Tap Vien], BaiBao.[Ma Bai Bao], BaiBao.[Noi Dung]
FROM BaiBao
INNER JOIN BienTapVien
ON BaiBao.[Ma Bien Tap Vien] = BienTapVien.[Ma Bien Tap Vien]
GO


/*6 Truy vấn dữ liệu FULL OUTER JOIN gồm 2 bảng PhongVien và BaiBao*/
USE EBOOK
go
SELECT * FROM dbo.PhongVien FULL OUTER JOIN dbo.BaiBao
ON PhongVien.[Ma Phong Vien] = BaiBao.[Ma Phong Vien]

GO

/* Truy vấn dữ liệu SELF JOIN gồm 2 bảng PhongVien và BaiBao*/
USE EBOOK
GO
SELECT BaiBao.[Ma Bai Bao], BaiBao.[Ma Phong Vien], PhongVien.[Ten Phong Vien]
FROM BaiBao
JOIN PhongVien
ON BaiBao.[Ma Phong Vien] = PhongVien.[Ma Phong Vien]
GO

/*7. Sử dụng truy vấn con. Từ bảng BaiBao, truy vấn cột [Ma Bai Bao]. Với điều kiện thoả mãn [Ma Bai Bao] có [So Nguoi Xem] lớn hơn 3000.*/
USE EBOOK
GO
SELECT * FROM BaiBao
WHERE [Ma Bai Bao] IN (
      SELECT [Ma Bai Bao]
	  FROM dbo.BaiBao
	  WHERE [So Nguoi Xem] > 3000)

GO


/*8. Sử dụng truy vấn With lọc ra những bài báo hot với lượt xem trên 1000*/
USE EBOOK
go
WITH BaiBaoViral AS (
SELECT [Ma Bai Bao],
       SUM([So Nguoi Xem]) AS Tong_Luot_xem
FROM BaiBao
GROUP BY [Ma Bai Bao]
)
SELECT BaiBaoViral.[Ma Bai Bao],BaiBaoViral.Tong_Luot_xem,
	CASE 
		WHEN BaiBaoViral.Tong_Luot_xem >= 1000 THEN 'Bai Bao Viral'
		ELSE NULL
		END
FROM BaiBaoViral

GO

/*9. Sử dụng truy vấn Group By và Having: xuất ra số lượng bài báo của từng phóng viên mà viết nhiều hơn 2 bài*/
USE EBOOK
go
SELECT dbo.PhongVien.[Ma Phong Vien], COUNT(*) AS [So Luong Bai Bao] FROM dbo.BaiBao, dbo.PhongVien
WHERE dbo.PhongVien.[Ma Phong Vien] = dbo.BaiBao.[Ma Phong Vien]
GROUP BY dbo.PhongVien.[Ma Phong Vien]
HAVING COUNT(*) > 1

GO

/*10. Tạo Function Đếm số bài báo trong mỗi thể loại với mã thể loại là tham số*/
USE EBOOK
go
CREATE FUNCTION Fn_DemSLBB (@MaDanhMuc INT)
RETURNS INT AS
BEGIN 
     DECLARE @Cnt INT;
	 SELECT @Cnt = COUNT(b.[Ma Danh Muc])
	 FROM dbo.DanhMuc b
	 WHERE b.[Ma Danh Muc] = @MaDanhMuc
	 RETURN @Cnt
END



