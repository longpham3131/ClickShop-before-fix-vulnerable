USE [master]
GO
/****** Object:  Database [ClickShopV2]    Script Date: 6/6/2021 10:54:56 AM ******/
CREATE DATABASE [ClickShopV3]
GO
USE [ClickShopV3]
GO
/****** Object:  UserDefinedFunction [dbo].[KienTraDangNhap]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[KienTraDangNhap](@TaiKhoan varchar(100), @MatKhau varchar(200))
RETURNS varchar(20)
AS
BEGIN
	DECLARE @LoaiTaiKhoan varchar(20)
	SET @MatKhau = dbo.MaHoaMD5(@MatKhau)
	-----------test-----------
	--DECLARE @MatKhau varchar(20)
    --DECLARE @TaiKhoan varchar(20)
	--SET @MatKhau = 1
	--SET @TaiKhoan = 'thuckha@gmail.com'
	-----------------
	SELECT @LoaiTaiKhoan= Ar.Role
	FROM AccountRole AR, Account A
	WHERE A.Email = @TaiKhoan AND A.Password = @MatKhau AND A.Email = AR.Email

	RETURN @LoaiTaiKhoan
END



GO
/****** Object:  UserDefinedFunction [dbo].[MaHoaMD5]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[MaHoaMD5] (@pass varchar(200))
RETURNS varchar(200)
AS
BEGIN
	RETURN CONVERT(varchar(200), HashBytes('MD5', @pass), 2);
END



GO
/****** Object:  UserDefinedFunction [dbo].[UF_KiemTraTonTai]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[UF_KiemTraTonTai] (@Email varchar(100))
RETURNS INT 
AS
BEGIN
	IF EXISTS (SELECT * FROM dbo.Account WHERE Email = @Email)
		RETURN 1;
	RETURN 0;
END	






GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](200) NOT NULL,
	[ImageLink] [varchar](400) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Gender] [varchar](1) NOT NULL,
	[DayOfBirth] [date] NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Account_CreatedDate]  DEFAULT (getdate()),
	[isAvailable] [bit] NOT NULL CONSTRAINT [DF_Account_isAvailable]  DEFAULT ((1)),
	[coin] [int] NULL,
 CONSTRAINT [PK_ACCOUNT] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AccountRole]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccountRole](
	[Email] [varchar](100) NOT NULL,
	[Role] [varchar](20) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Image]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Image](
	[ImageId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ImagePath] [varchar](400) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[UnitPrice] [decimal](19, 0) NOT NULL,
	[Gender] [int] NULL,
	[Description] [varchar](max) NULL,
	[Available] [int] NOT NULL CONSTRAINT [DF_Product_Available]  DEFAULT ((0)),
 CONSTRAINT [PK_PRODUCT] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductSize]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductSize](
	[ProductSizeId] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Size] [char](10) NULL,
	[Available] [int] NULL,
 CONSTRAINT [PK__ProductS__9DADF511EF6F20C0] PRIMARY KEY CLUSTERED 
(
	[ProductSizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[PurchaseOrderId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NULL,
	[SubTotal] [decimal](19, 4) NOT NULL,
	[Address] [varchar](max) NULL,
	[Phone] [varchar](max) NULL,
	[Status] [varchar](20) NOT NULL CONSTRAINT [DF_PurchaseOrder_Status]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_PurchaseOrder_CreatedDate]  DEFAULT (getdate()),
	[Name] [varchar](max) NULL,
	[CancelInvoice] [bit] NOT NULL CONSTRAINT [DF_PurchaseOrder_CancelInvoice]  DEFAULT ((1)),
 CONSTRAINT [PK_PURCHASEORDER] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseOrderDetail]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderDetail](
	[PurchaseOrderDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[PurchaseOrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Cost] [decimal](19, 4) NOT NULL,
	[UnitPrice] [decimal](19, 4) NOT NULL,
	[Subtotal] [decimal](19, 4) NOT NULL,
	[Size] [nchar](10) NULL,
 CONSTRAINT [PK_PurchaseOrderDetailId] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shipper](
	[PurchaseOrderId] [int] NOT NULL,
	[ShipperId] [int] NOT NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK__Shipper__2A05CAB3DB5CEE87] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[voucher]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[voucher](
	[code] [char](20) NOT NULL,
	[coin] [int] NOT NULL,
	[status] [char](10) NOT NULL,
 CONSTRAINT [PK_voucher] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[DemTheoSub]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[DemTheoSub]()
Returns table
as
	return (
		select Pro.SubCategoryId, SUM(A.soLanMua) as soLanMua
		from Product Pro, 
			(select Pur.ProductId, COUNT(*) as soLanMua
			from PurchaseOrderDetail Pur
			group by Pur.ProductId) A
		where A.ProductId = Pro.ProductId
		group by Pro.SubCategoryId
	)









GO
/****** Object:  UserDefinedFunction [dbo].[DemTheoCategory]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[DemTheoCategory]()
Returns table
as
	return select Sub.CategoryId, SUM(A.soLanMua) as soLanMua
	from SubCategory Sub, 
		DemTheoSub() A
	where A.SubCategoryId = Sub.SubCategoryId
	group by Sub.CategoryId









GO
/****** Object:  UserDefinedFunction [dbo].[CountNV]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[CountNV]()
Returns table
as
	return (
		Select count(*)as soluongNV From AccountRole
		where AccountRole.Role = 'Saler' OR AccountRole.Role = 'Shipper'
	)









GO
/****** Object:  View [dbo].[OV_OrderView]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OV_OrderView] AS
SELECT P.PurchaseOrderId, P.CreatedDate , A.Email, P.SubTotal, P.Address, P.Phone FROM PurchaseOrder P, Account A WHERE A.AccountId = P.AccountId








GO
/****** Object:  View [dbo].[SV_initOrderList]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SV_initOrderList]
AS
SELECT P.PurchaseOrderId, A.Email, P.SubTotal, P.Address, P.Phone, P.Status
FROM Account A, PurchaseOrder P
WHERE A.AccountId= P.AccountId AND P.Status ='init'









GO
/****** Object:  View [dbo].[SV_OrtherDetailNoShip]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[SV_OrtherDetailNoShip] AS
SELECT  PO.PurchaseOrderId, P.ProductId, Pro.Name, P.Quantity, P.Subtotal, P.Size
FROM PurchaseOrderDetail P, Product Pro, PurchaseOrder PO
WHERE PRO.ProductId = P.ProductId AND PO.Status='init' AND PO.PurchaseOrderId = P.PurchaseOrderId 



GO
/****** Object:  View [dbo].[SV_OrtherDetailPicking]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[SV_OrtherDetailPicking] AS
SELECT  PO.PurchaseOrderId, P.ProductId, Pro.Name, P.Quantity, P.Subtotal, P.Size
FROM PurchaseOrderDetail P, Product Pro, PurchaseOrder PO, Shipper SP 
WHERE PRO.ProductId = P.ProductId AND SP.Status='Picking' AND PO.PurchaseOrderId = P.PurchaseOrderId AND SP.PurchaseOrderId=P.PurchaseOrderId



GO
/****** Object:  View [dbo].[SV_OrtherDetailShipping]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[SV_OrtherDetailShipping] AS
SELECT  PO.PurchaseOrderId, P.ProductId, Pro.Name, P.Quantity, P.Subtotal, P.Size
FROM PurchaseOrderDetail P, Product Pro, PurchaseOrder PO, Shipper SP 
WHERE PRO.ProductId = P.ProductId AND 
(SP.Status='Shipping' OR SP.Status='Picking' OR SP.Status='Cancel' OR SP.Status = 'Completed') 
 AND PO.PurchaseOrderId = P.PurchaseOrderId AND SP.PurchaseOrderId=P.PurchaseOrderId



GO
/****** Object:  View [dbo].[SV_pickupList]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SV_pickupList]
AS
SELECT S.PurchaseOrderId, S.ShipperId, A.Email, P.SubTotal, P.Address, P.Phone, S.Status
FROM Account A, PurchaseOrder P, Shipper S
WHERE A.AccountId= P.AccountId  AND S.PurchaseOrderId = P.PurchaseOrderId AND S.Status='Picking'








GO
/****** Object:  View [dbo].[SV_shipperList]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[SV_shipperList] AS
SELECT A.AccountId, A.Email, A.FirstName, A.Phone, A.LastName, A.Address, A.Gender
FROM Shipper S, Account A, AccountRole AR
WHERE A.Email=AR.Email AND AR.Role='shipper'
GROUP BY A.AccountId, A.Email, A.FirstName, A.Phone, A.LastName, A.Address, A.Gender






GO
/****** Object:  View [dbo].[SV_shippingList]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SV_shippingList] AS
SELECT S.PurchaseOrderId, S.ShipperId, A.Email, P.SubTotal, P.Address, P.Phone, S.Status
FROM Account A, PurchaseOrder P, Shipper S
WHERE A.AccountId= P.AccountId  AND S.PurchaseOrderId = P.PurchaseOrderId AND P.Status ='Processing' AND (S.Status='shipping' OR S.Status='Cancel' OR S.Status='Completed')






GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable], [coin]) VALUES (1, N'admin@yourstore.com', N'353150814977D7034BA445E9DAEA761C', N'/img/user01.jpg', N'Pham', N'Hoang Long', N'0929372005', N'Quan 9', N'M', CAST(N'1900-01-01' AS Date), CAST(N'2020-11-30 00:00:00.000' AS DateTime), 1, 20000002)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable], [coin]) VALUES (2, N'tuankiet@gmail.com', N'C4CA4238A0B923820DCC509A6F75849B', N'/img/user02.jpg', N'Nguyen', N'Tuan Kiet', N'0904755055', N'Quan 9', N'M', CAST(N'2000-01-02' AS Date), CAST(N'2020-11-30 00:00:00.000' AS DateTime), 1, 20000000)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable], [coin]) VALUES (3, N'thuckha@gmail.com', N'C4CA4238A0B923820DCC509A6F75849B', N'/img/user03.jpg', N'Pham', N'Thuc Kha', N'0904152369', N'Phu Nhuan', N'M', CAST(N'2000-01-03' AS Date), CAST(N'2020-11-30 00:00:00.000' AS DateTime), 1, 20000000)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable], [coin]) VALUES (4, N'ngocuyen@gmail.com', N'C4CA4238A0B923820DCC509A6F75849B', N'/img/user04.jpg', N'Nguyen', N'Ngoc Uyen', N'0923991122', N'Thu Duc', N'F', CAST(N'2000-01-04' AS Date), CAST(N'2020-11-30 00:00:00.000' AS DateTime), 1, 20000000)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable], [coin]) VALUES (5, N'thiennhi@gmail.com', N'C4CA4238A0B923820DCC509A6F75849B', N'/img/user05.jpg', N'Chung', N'Thien Nhi', N'0904755555', N'Thu Duc', N'F', CAST(N'2000-01-05' AS Date), CAST(N'2020-11-30 00:00:00.000' AS DateTime), 1, 20000000)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable], [coin]) VALUES (11, N'kimhoang@gmail.com', N'C4CA4238A0B923820DCC509A6F75849B', N'none', N'Kim', N'Hoang', N'092', N'Long Xuyen', N'F', CAST(N'2002-07-16' AS Date), CAST(N'2020-12-15 14:32:16.427' AS DateTime), 1, 20000000)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable], [coin]) VALUES (12, N'trunghau@gmail.com', N'C4CA4238A0B923820DCC509A6F75849B', N'none', N'trung', N'hau', N'092', N'Ben Tre', N'M', CAST(N'2000-06-11' AS Date), CAST(N'2020-12-15 14:35:02.153' AS DateTime), 1, 20000000)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable], [coin]) VALUES (21, N'quangtien@gmail.com', N'C4CA4238A0B923820DCC509A6F75849B', N'none', N'Quang', N'Tien', N'092', N'Quan 9', N'M', CAST(N'2000-06-10' AS Date), CAST(N'2020-12-15 14:49:34.510' AS DateTime), 1, 20000000)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable], [coin]) VALUES (22, N'Shippervip@ship', N'C4CA4238A0B923820DCC509A6F75849B', N'none', N'Tran', N'TRung Kien', N'898565', N'09 Leivor, Tudeep', N'M', CAST(N'1993-02-23' AS Date), CAST(N'2020-12-16 17:05:11.053' AS DateTime), 1, 20000000)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable], [coin]) VALUES (23, N'newuser@MD5', N'C4CA4238A0B923820DCC509A6F75849B', N'none', N'Tran Thi', N' Loan A', N'1312424', N'05, La Xuan Oai, Quan 9', N'F', CAST(N'2020-12-16' AS Date), CAST(N'2020-12-16 20:35:46.140' AS DateTime), 0, 20000000)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable], [coin]) VALUES (24, N'thanhhai@yahoo.com', N'C4CA4238A0B923820DCC509A6F75849B', N'none', N'HAi', N'Le', N'999888', N'345, Leogid, Tufip', N'M', CAST(N'2020-12-20' AS Date), CAST(N'2020-12-16 20:51:46.327' AS DateTime), 1, 20000000)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable], [coin]) VALUES (31, N'pffgia1@gmail.com', N'15520F837E682CFC2DC75AC08ADBBF05', N'none', N'Tran', N'Van A', N'981231', N'NOPE', N'M', CAST(N'2020-12-03' AS Date), CAST(N'2020-12-18 17:58:07.050' AS DateTime), 1, 20000000)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable], [coin]) VALUES (32, N'pffdota04@gmail.com', N'C4CA4238A0B923820DCC509A6F75849B', N'none', N'Nguyen Tuan', N'Kiet', N'0348275002', N'484 Le van Viet', N'M', CAST(N'1999-12-22' AS Date), CAST(N'2020-12-28 11:34:58.923' AS DateTime), 1, 20000000)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable], [coin]) VALUES (33, N'pffgia9@gmail.com', N'ECCBC87E4B5CE2FE28308FD9F2A7BAF3', N'none', N'Tran', N'Van ngu', N'88777', N'NOPE2', N'F', CAST(N'2020-12-25' AS Date), CAST(N'2020-12-28 13:55:13.143' AS DateTime), 1, 20000000)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable], [coin]) VALUES (34, N'longpham3131@gmail.com', N'353150814977D7034BA445E9DAEA761C', N'none', N'Pham', N'Hoang Long', N'0932842881', N'Quan 9', N'M', CAST(N'2000-03-11' AS Date), CAST(N'2020-12-29 15:19:02.773' AS DateTime), 1, 13500000)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable], [coin]) VALUES (36, N'longpham31@yahoo.com', N'C4CA4238A0B923820DCC509A6F75849B', N'none', N'Pham', N'Hoang Long', N'09212', N'Quan 12', N'M', CAST(N'2000-03-11' AS Date), CAST(N'2020-12-30 10:24:58.760' AS DateTime), 1, 17500000)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable], [coin]) VALUES (37, N'quanly@gmail.com', N'C8706F0206EFFFA0D6F52DCFD361F1B5', N'none', N'Pham', N'Pháº¡m HoÃ ng Long', N'0944414908', N'8T2, Ä?Æ°á»ng Phan ÄÄ?ng LÆ°u, khÃ³m ÄÃ´ng Thá»?nh 6', N'M', CAST(N'2021-05-18' AS Date), CAST(N'2021-05-22 23:22:26.303' AS DateTime), 1, 0)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable], [coin]) VALUES (50, N'hle@gmail.com', N'C4CA4238A0B923820DCC509A6F75849B', N'none', N'Hoang', N'Le', N'0944414908', N'Long Xuyen', N'M', CAST(N'2021-06-22' AS Date), CAST(N'2021-06-05 22:43:53.523' AS DateTime), 1, 0)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable], [coin]) VALUES (58, N'cute@gmail.com', N'C8706F0206EFFFA0D6F52DCFD361F1B5', N'none', N'Pham', N'Long', N'0944414908', N'ASF', N'M', CAST(N'2021-06-24' AS Date), CAST(N'2021-06-05 23:14:04.297' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'admin@yourstore.com', N'Administrator')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'cute@gmail.com', N'USER')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'hle@gmail.com', N'USER')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'kimhoang@gmail.com', N'Administrator')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'longpham31@yahoo.com', N'USER')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'longpham3131@gmail.com', N'USER')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'newuser@MD5', N'USER')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'ngocuyen@gmail.com', N'USER')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'pffdota04@gmail.com', N'USER')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'pffgia1@gmail.com', N'USER')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'pffgia9@gmail.com', N'USER')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'quangtien@gmail.com', N'USER')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'quanly@gmail.com', N'USER')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'Shippervip@ship', N'Shipper')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'thanhhai@yahoo.com', N'USER')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'thiennhi@gmail.com', N'USER')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'thuckha@gmail.com', N'Shipper')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'trunghau@gmail.com', N'USER')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'tuankiet@gmail.com', N'USER')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (4, N'Accessories')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (1, N'Men Shoes')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (3, N'Tee (Unisex)')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (2, N'Women Shoes')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (1, 1, N'/image_product/Chelsea01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (2, 2, N'/image_product/Chelsea02.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (3, 3, N'/image_product/Chelsea03.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (4, 4, N'/image_product/Chelsea04.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (5, 5, N'/image_product/Chelsea05.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (6, 6, N'/image_product/Chelsea06.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (7, 7, N'/image_product/Chelsea07.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (8, 8, N'/image_product/Chelsea08.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (9, 9, N'/image_product/Chelsea09.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (10, 10, N'/image_product/Chelsea10.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (11, 11, N'/image_product/Chelsea11.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (12, 12, N'/image_product/Derby01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (13, 13, N'/image_product/Derby02.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (14, 14, N'/image_product/Derby03.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (15, 15, N'/image_product/Derby04.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (16, 16, N'/image_product/Derby05.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (17, 17, N'/image_product/Harness01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (18, 18, N'/image_product/Harness02.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (19, 19, N'/image_product/Harness03.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (20, 20, N'/image_product/Zip01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (21, 21, N'/image_product/Combat01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (22, 22, N'/image_product/Combat02.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (23, 23, N'/image_product/Oxford01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (24, 24, N'/image_product/Oxford02.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (25, 25, N'/image_product/Combat_Women01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (26, 26, N'/image_product/Combat_Women02.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (27, 27, N'/image_product/Chelsea_Women01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (28, 28, N'/image_product/Chelsea_Women02.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (29, 29, N'/image_product/Tee01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (30, 30, N'/image_product/Tee02.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (31, 31, N'/image_product/Tee03.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (32, 32, N'/image_product/Tee04.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (33, 33, N'/image_product/Tee05.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (34, 34, N'/image_product/Shirt01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (35, 35, N'/image_product/Shirt02.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (36, 36, N'/image_product/Belt01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (37, 37, N'/image_product/Belt02.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (38, 38, N'/image_product/Bracelet01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (39, 39, N'/image_product/Bracelet02.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (40, 40, N'/image_product/Chain01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (41, 41, N'/image_product/Bandana01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (42, 42, N'/image_product/Bandana02.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (43, 43, N'/image_product/Bandana03.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (44, 44, N'/image_product/Bandana04.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (45, 45, N'/image_product/Bandana05.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (46, 46, N'/image_product/Bandana06.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (47, 47, N'/image_product/Necklace01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (48, 48, N'/image_product/Bucket01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (49, 49, N'/image_product/Bucket02.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (50, 50, N'/image_product/Bucket03.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (51, 50, N'/image_product/sá»± ná»?i dáº­y cá»§a khá»?.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (52, 50, N'/image_product/sá»± ná»?i dáº­y cá»§a khá»?.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (61, 50, N'/image_product/', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (62, 50, N'/image_product/', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (63, 50, N'/image_product/ongmap.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (64, 50, N'/image_product/ongmap.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (65, 50, N'/image_product/ongmap.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (66, 50, N'/image_product/ongmap.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (67, 50, N'/image_product/ongmap.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (68, 50, N'/image_product/ongmap.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (69, 50, N'/image_product/ongmap.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (70, 50, N'/image_product/ongmap.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (71, 50, N'/image_product/ongmap.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (72, 50, N'/image_product/ongmap.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (73, 50, N'/image_product/ongmap.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (74, 50, N'/image_product/ongmap.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (75, 50, N'/image_product/ongmap.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (76, 50, N'/image_product/ongmap.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (77, 50, N'/image_product/ongmap.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (78, 50, N'/image_product/ongmap.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (79, 50, N'/image_product/ongmap.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (80, 50, N'/image_product/ongmap.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (81, 50, N'/image_product/ongmap.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (82, 50, N'/image_product/sá»± ná»?i dáº­y cá»§a khá»?.jpg', 1)
SET IDENTITY_INSERT [dbo].[Image] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (1, 1, N'The Basic Wolf Chelsea Boots - Black', CAST(1700000 AS Decimal(19, 0)), 0, N'Black, Cowhide Material,Rubber Shoe Sole, 3.5cm high', 0)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (2, 1, N'The Basic Wolf Chelsea Boots - Tan', CAST(1600000 AS Decimal(19, 0)), 0, N'Tan, Cowhide Material, Canvas Lining, Rubber Shoe Sole, 3.5cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (3, 1, N'The Classic Chealsea Boots - Black', CAST(1800000 AS Decimal(19, 0)), 0, N'Black, Glossy, Cowhide Material,Canvas Lining, Rubber Shoe Sole, 2.5cm high', 0)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (4, 1, N'The Rising Chelsea Boots Wolf Warrior - Black', CAST(2300000 AS Decimal(19, 0)), 0, N'Black, Glossy, Cowhide Material, Rubber Shoe Sole, Goat Leather Lining, 4.3cm high', 0)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (5, 1, N'The Rising Chelsea Boots Wolf Warrior - Tobacco', CAST(2300000 AS Decimal(19, 0)), 0, N'Tabacco, Cowhide Material, Rubber Shoe Sole, Goat Leather Lining, 4.3cm high', 14)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (6, 1, N'The Wild Walk Chelsea Boots - Black', CAST(2050000 AS Decimal(19, 0)), 0, N'Black, Glossy, Cowhide Material, Rubber Shoe Sole, Goat Leather Lining, 4.3cm high', 10)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (7, 1, N'The Wild Walk Chelsea Boots - Black Lizard', CAST(2200000 AS Decimal(19, 0)), 0, N'Black Lizard, Cowhide Material, Rubber Shoe Sole, Goat Leather Lining, 4.3cm high', 7)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (8, 1, N'The Wild Walk Chelsea Boots - Black Suede', CAST(2050000 AS Decimal(19, 0)), 0, N'Black Suede, Cowhide Material, Rubber Shoe Sole, Goat Leather Lining, 4.3cm high', 17)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (9, 1, N'The Wild Walk Chelsea Boots - Tan', CAST(2050000 AS Decimal(19, 0)), 0, N'Tan, Cowhide Material, Rubber Shoe Sole, Goat Leather Lining, 4.3cm high', 9)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (10, 1, N'The Wild Walk Chelsea Boots - Tabacco', CAST(2050000 AS Decimal(19, 0)), 0, N'Tabacco, Cowhide Material, Rubber Shoe Sole, Goat Leather Lining, 4.3cm high', 14)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (11, 1, N'The X Flawless Chelsea Boots - Black Suede', CAST(1800000 AS Decimal(19, 0)), 0, N'Black Suede, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 2.5cm high', 13)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (12, 2, N'The 4cm Heel Derby - Black Lizard', CAST(1005000 AS Decimal(19, 0)), 0, N'Black Lizard, Cowhide Material, Rubber Shoe Sole, Goat Leather Lining, 4.3cm high', 12)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (13, 2, N'The Modern Brogue Derby - Black', CAST(1200000 AS Decimal(19, 0)), 0, N'Black, Glossy, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 3cm high', 17)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (14, 2, N'The Modern Brogue Derby - Black Grain and White', CAST(1800000 AS Decimal(19, 0)), 0, N'Black Grain, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 3cm high', 25)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (15, 2, N'The Modern Derby - Black', CAST(1600000 AS Decimal(19, 0)), 0, N'Black, Glossy, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 3cm high', 14)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (16, 2, N'The Modern Derby - Black Grain', CAST(1800000 AS Decimal(19, 0)), 0, N'Black Grain, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 2.5cm high', 13)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (17, 3, N'The Alpha Wolf Harness Boots - Black', CAST(2450000 AS Decimal(19, 0)), 0, N'Black, Italian Cowhide Material, High Quality Rubber Shoe Sole, Goat Leather Lining, 4.7cm high', 17)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (18, 3, N'The Alpha Wolf Harness Boots - Black Bandana', CAST(2700000 AS Decimal(19, 0)), 0, N'Matte Black, Italian Cowhide Material, High Quality Rubber Shoe Sole, Goat Leather Lining, 4.7cm high, YKK Zipper, Blake Stitch', 16)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (19, 3, N'The Alpha Wolf Harness Boots - Tobacco', CAST(2450000 AS Decimal(19, 0)), 0, N'Tabacco, Italian Cowhide Material, High Quality Rubber Shoe Sole, Goat Leather Lining, 4.7cm high, YKK Zipper, Blake Stitch', 19)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (20, 4, N'The Ghost Zip Boot - Tobacco', CAST(2300000 AS Decimal(19, 0)), 0, N'Tobacco, Cowhide Material, High Quality Rubber Shoe Sole, Goat Leather Lining, 4.3cm high', 19)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (21, 5, N'The Combat Boots - Black', CAST(2000000 AS Decimal(19, 0)), 0, N'Black, Glossy, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 3cm high', 17)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (22, 5, N'The Combat Boots - Black Grain', CAST(2000000 AS Decimal(19, 0)), 0, N'Black Grain, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 3cm high', 19)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (23, 6, N'The Basic Wolf Oxford - Black', CAST(1500000 AS Decimal(19, 0)), 0, N'Black, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 3.5cm high', 23)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (24, 6, N'The Classic Captoe Oxford - Black', CAST(1500000 AS Decimal(19, 0)), 0, N'Black,Glossy, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 2.5cm high', 21)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (25, 7, N'The Basic Wolf Chelsea Boots - Tan - Women', CAST(1600000 AS Decimal(19, 0)), 1, N'Tan, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 3.5cm high', 22)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (26, 7, N'The Basic Wolf Chelsea Boots - Black - Women', CAST(1700000 AS Decimal(19, 0)), 1, N'Black, Glossy, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 3.5cm high', 23)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (27, 8, N'The SheWolf Classic Combat Boots - Black - Women', CAST(1500000 AS Decimal(19, 0)), 1, N'Black,Glossy, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 2.5cm high', 18)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (28, 8, N'The SheWolf Modern Combat Boots - Women', CAST(1500000 AS Decimal(19, 0)), 1, N'Black, Glossy, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 3cm high', 12)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (29, 9, N'The Wolf Basic Tee - Black', CAST(280000 AS Decimal(19, 0)), 2, N'97% cotton, 3% spandex, Anti-wrinkle - deodorizing - anti-stretch - fast color, 4-way stretch elastic', 6)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (30, 9, N'The Wolf Basic Tee - Tan', CAST(280000 AS Decimal(19, 0)), 2, N'97% cotton, 3% spandex, Anti-wrinkle - deodorizing - anti-stretch - fast color, 4-way stretch elastic', 6)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (31, 9, N'The Wolf Basic Tee - White', CAST(280000 AS Decimal(19, 0)), 2, N'97% cotton, 3% spandex, Anti-wrinkle - deodorizing - anti-stretch - fast color, 4-way stretch elastic', 7)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (32, 9, N'The Wolf Seven Elements Tee - Black', CAST(350000 AS Decimal(19, 0)), 2, N'97% cotton, 3% spandex, Anti-wrinkle - deodorizing - anti-stretch - fast color, 4-way stretch elastic', 7)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (33, 9, N'The Wolf Seven Elements Tee - White', CAST(350000 AS Decimal(19, 0)), 2, N'97% cotton, 3% spandex, Anti-wrinkle - deodorizing - anti-stretch - fast color, 4-way stretch elastic', 6)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (34, 10, N'The Brave Wolf Shirt - Black', CAST(500000 AS Decimal(19, 0)), 2, N'Black, Mango Silk Fabric', 6)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (35, 10, N'The Brave Wolf Shirt - White', CAST(500000 AS Decimal(19, 0)), 2, N'White, Mango Silk Fabric', 7)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (36, 11, N'The Alpha Wolf Belt Circle', CAST(450000 AS Decimal(19, 0)), 2, N'Facial skin: cow skin stamping varanus, Leather lining: nubuck cow leather, Key: pure copper, Structure: 50% machine sewing, 50% hand sewing', 2)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (37, 11, N'The Alpha Wolf Belt Square', CAST(450000 AS Decimal(19, 0)), 2, N'Facial skin: cow skin stamping varanus, Leather lining: nubuck cow leather, Key: pure copper, Structure: 50% machine sewing, 50% hand sewing', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (38, 12, N'The Alpha Wolf Bracelet', CAST(500000 AS Decimal(19, 0)), 2, N'Facial skin: Ostrich feet (real), Leather lining: nubuck cow leather, Chain chain: stainless high-grade alloy, Canopy head: stainless high-grade alloy, Key: stainless high-grade alloy, Structure: 50% machine sewing, 50% hand sewing', 2)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (39, 12, N'The Rising Wolf Bracelet', CAST(250000 AS Decimal(19, 0)), 2, N'Color: Black, Material: Cowhide', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (40, 13, N'The Rising Chain', CAST(250000 AS Decimal(19, 0)), 2, N'Silver', 2)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (41, 14, N'The Brave Wolf Bandana - Black', CAST(250000 AS Decimal(19, 0)), 2, N'Color: Black, Material: Silk, Size: 53 x 53 cm', 3)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (42, 14, N'The Brave Wolf Bandana - Forest Blue', CAST(250000 AS Decimal(19, 0)), 2, N'Color: Forest Blue, Material: Silk, Size: 53 x 53 cm', 2)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (43, 14, N'The Brave Wolf Bandana - Navy Blue', CAST(250000 AS Decimal(19, 0)), 2, N'Color: Navy Blue, Material: Silk, Size: 53 x 53 cm', 2)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (44, 14, N'The Brave Wolf Bandana Keychain - Black', CAST(350000 AS Decimal(19, 0)), 2, N'Color: Black, Material: Silk, Size: 53 x 53 cm', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (45, 14, N'The Brave Wolf Bandana Keychain - Forest Blue', CAST(350000 AS Decimal(19, 0)), 2, N'Color: Forest Blue, Material: Silk, Size: 53 x 53 cm', 2)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (46, 14, N'The Brave Wolf Bandana Keychain - Navy Blue', CAST(350000 AS Decimal(19, 0)), 2, N'Color: Navy Blue, Material: Silk, Size: 53 x 53 cm', 2)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (47, 15, N'The Brave Wolf Necklace', CAST(350000 AS Decimal(19, 0)), 2, N'Stainless Steel', 2)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (48, 16, N'The Wolf Bucket Hat - Black', CAST(700000 AS Decimal(19, 0)), 2, N'Black,Diameter 18 cm, suitable for top styles, Facial skin: Italian cowhide, covered with waterproof, 70-80% water resistant, Inner lining: High-grade denim, Zippers: Branded YKK stainless steel, Transparent surface: made of high quality PVC, flexible, unlike products sold on the market', 3)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (49, 16, N'The Wolf Bucket Hat - Black Lizard', CAST(700000 AS Decimal(19, 0)), 2, N'Black Lizard ,Diameter 18 cm, suitable for top styles, Facial skin: Italian cowhide, covered with waterproof, 70-80% water resistant, Inner lining: High-grade denim, Zippers: Branded YKK stainless steel, Transparent surface: made of high quality PVC, flexible, unlike products sold on the market', 3)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Gender], [Description], [Available]) VALUES (50, 16, N'The Wolf Bucket Hat - Black Python', CAST(700000 AS Decimal(19, 0)), 2, N'Black Python ,Diameter 18 cm, suitable for top styles, Facial skin: Italian cowhide, covered with waterproof, 70-80% water resistant, Inner lining: High-grade denim, Zippers: Branded YKK stainless steel, Transparent surface: made of high quality PVC, flexible, unlike products sold on the market', 2)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductSize] ON 

INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (6, 2, N'39        ', 0)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (7, 2, N'40        ', 0)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (8, 2, N'41        ', 1)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (9, 2, N'42        ', 0)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (10, 2, N'43        ', 0)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (11, 3, N'39        ', NULL)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (21, 5, N'39        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (22, 5, N'40        ', 3)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (23, 5, N'41        ', 3)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (24, 5, N'42        ', 3)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (25, 5, N'43        ', 3)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (26, 6, N'39        ', 0)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (27, 6, N'40        ', 3)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (28, 6, N'41        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (29, 6, N'42        ', 1)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (30, 6, N'43        ', 4)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (31, 7, N'39        ', 1)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (32, 7, N'40        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (33, 7, N'41        ', 3)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (34, 7, N'42        ', 4)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (35, 7, N'43        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (36, 8, N'39        ', 6)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (37, 8, N'40        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (38, 8, N'41        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (39, 8, N'42        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (40, 8, N'43        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (41, 9, N'39        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (42, 9, N'40        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (43, 9, N'41        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (44, 9, N'42        ', 1)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (45, 9, N'43        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (46, 10, N'39        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (47, 10, N'40        ', 4)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (48, 10, N'41        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (49, 10, N'42        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (50, 10, N'43        ', 4)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (51, 11, N'39        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (52, 11, N'40        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (53, 11, N'41        ', 3)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (54, 11, N'42        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (55, 11, N'43        ', 4)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (56, 12, N'39        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (57, 12, N'40        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (58, 12, N'41        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (59, 12, N'42        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (60, 12, N'43        ', 1)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (61, 13, N'39        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (62, 13, N'40        ', 3)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (63, 13, N'41        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (64, 13, N'42        ', 4)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (65, 13, N'43        ', 3)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (66, 14, N'39        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (67, 14, N'40        ', 6)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (68, 14, N'41        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (69, 14, N'42        ', 4)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (70, 14, N'43        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (71, 15, N'39        ', 3)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (72, 15, N'40        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (73, 15, N'41        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (74, 15, N'42        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (75, 15, N'43        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (76, 16, N'39        ', 1)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (77, 16, N'40        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (78, 16, N'41        ', 3)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (79, 16, N'42        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (80, 16, N'43        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (81, 17, N'39        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (82, 17, N'40        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (83, 17, N'41        ', 1)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (84, 17, N'42        ', 4)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (85, 17, N'43        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (86, 18, N'39        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (87, 18, N'40        ', 0)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (88, 18, N'41        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (89, 18, N'42        ', 9)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (90, 18, N'43        ', 0)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (91, 19, N'39        ', 8)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (92, 19, N'40        ', 0)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (93, 19, N'41        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (94, 19, N'42        ', 4)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (95, 19, N'43        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (96, 20, N'39        ', 3)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (97, 20, N'40        ', 4)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (98, 20, N'41        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (99, 20, N'42        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (100, 20, N'43        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (101, 21, N'39        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (102, 21, N'40        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (103, 21, N'41        ', 1)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (104, 21, N'42        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (105, 21, N'43        ', 1)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (106, 22, N'39        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (107, 22, N'40        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (108, 22, N'41        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (109, 22, N'42        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (110, 22, N'43        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (111, 23, N'39        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (112, 23, N'40        ', 3)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (113, 23, N'41        ', 5)
GO
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (114, 23, N'42        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (115, 23, N'43        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (116, 24, N'39        ', 1)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (117, 24, N'40        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (118, 24, N'41        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (119, 24, N'42        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (120, 24, N'43        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (121, 25, N'39        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (122, 25, N'40        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (123, 25, N'41        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (124, 25, N'42        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (125, 25, N'43        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (126, 26, N'39        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (127, 26, N'40        ', 3)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (128, 26, N'41        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (129, 26, N'42        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (130, 26, N'43        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (131, 27, N'39        ', 1)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (132, 27, N'40        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (133, 27, N'41        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (134, 27, N'42        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (135, 27, N'43        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (136, 28, N'39        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (137, 28, N'40        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (138, 28, N'41        ', 1)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (139, 28, N'42        ', 5)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (140, 28, N'43        ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (141, 29, N'S         ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (142, 30, N'S         ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (143, 31, N'S         ', 3)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (144, 32, N'S         ', 3)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (145, 33, N'S         ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (146, 34, N'S         ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (147, 35, N'S         ', 3)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (162, 29, N'M         ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (163, 30, N'M         ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (164, 31, N'M         ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (165, 32, N'M         ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (166, 33, N'M         ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (167, 34, N'M         ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (168, 35, N'M         ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (183, 29, N'L         ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (184, 30, N'L         ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (185, 31, N'L         ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (186, 32, N'L         ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (187, 33, N'L         ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (188, 34, N'L         ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (189, 35, N'L         ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (211, 36, N'Oversize  ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (212, 37, N'Oversize  ', 1)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (213, 38, N'Oversize  ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (214, 39, N'Oversize  ', 1)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (215, 40, N'Overs     ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (216, 41, N'Overs     ', 3)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (217, 42, N'Oversize  ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (218, 43, N'Oversize  ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (219, 44, N'Oversize  ', 1)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (220, 45, N'Oversize  ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (221, 46, N'Oversize  ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (222, 47, N'Oversize  ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (223, 48, N'Overs     ', 3)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (224, 49, N'Overs     ', 1)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (225, 50, N'Oversize  ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (226, 49, N'70CM      ', 2)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (227, 1, N'42        ', 0)
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductID], [Size], [Available]) VALUES (228, 4, N'41        ', 0)
SET IDENTITY_INSERT [dbo].[ProductSize] OFF
SET IDENTITY_INSERT [dbo].[PurchaseOrder] ON 

INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (1, 5, CAST(1680000.0000 AS Decimal(19, 4)), N'Thu Duc', N'0923991122', N'Completed', CAST(N'2020-12-01 00:00:00.000' AS DateTime), N'Ngoc Uyen', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (2, 2, CAST(7.0000 AS Decimal(19, 4)), N'Quan 2', N'540474747', N'Completed', CAST(N'1905-07-01 00:00:00.000' AS DateTime), N'TranH ung Dao', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (3, 1, CAST(2.0000 AS Decimal(19, 4)), N'Quan 7', N'066332', N'Completed', CAST(N'1905-07-01 00:00:00.000' AS DateTime), N'Bray', 0)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (4, 3, CAST(3.0000 AS Decimal(19, 4)), N'Quan 8', N'07032030', N'Processing', CAST(N'1905-07-01 00:00:00.000' AS DateTime), N'Hoang Long', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (5, 4, CAST(13.0000 AS Decimal(19, 4)), N'Quan 9', N'01364', N'Completed', CAST(N'1905-07-01 00:00:00.000' AS DateTime), N'Tuan Kiet', 0)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (6, 2, CAST(8.0000 AS Decimal(19, 4)), N'Quan 2', N'88889999', N'Processing', CAST(N'2020-12-16 17:12:20.047' AS DateTime), N'Thinh Coi', 0)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (7, 2, CAST(10.0000 AS Decimal(19, 4)), N'Thu Duc', N'777', N'Completed', CAST(N'2020-12-16 17:13:22.223' AS DateTime), N'Thinh Coi', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (27, 24, CAST(7040000.0000 AS Decimal(19, 4)), N'Cu Chi', N'+845252566636', N'Processing', CAST(N'2020-12-25 19:47:25.113' AS DateTime), N'Tran Van A', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (28, 4, CAST(1600000.0000 AS Decimal(19, 4)), N'Quan 9', N'091231', N'Init', CAST(N'2020-12-28 15:40:09.480' AS DateTime), N'Ngá»c Uy?ªn', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (29, 4, CAST(2400000.0000 AS Decimal(19, 4)), N'Quan 9', N'093248188', N'Processing', CAST(N'2020-12-28 17:55:03.500' AS DateTime), N'', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (30, 4, CAST(4000000.0000 AS Decimal(19, 4)), N'Quan 9', N'0921312', N'Init', CAST(N'2020-12-28 20:56:28.423' AS DateTime), N'Uyen Uye', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (31, 21, CAST(2050000.0000 AS Decimal(19, 4)), N'Quan 9', N'908', N'Init', CAST(N'2020-12-28 21:10:33.123' AS DateTime), N'Quan Tu', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (32, 21, CAST(2050000.0000 AS Decimal(19, 4)), N'Quan 9', N'908', N'Init', CAST(N'2020-12-28 21:17:47.177' AS DateTime), N'Quan Tu', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (33, 21, CAST(2050000.0000 AS Decimal(19, 4)), N'Quan 9', N'012', N'Init', CAST(N'2020-12-28 21:18:20.640' AS DateTime), N'Quang Tien', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (34, 21, CAST(2050000.0000 AS Decimal(19, 4)), N'Quan 12', N'0932', N'Init', CAST(N'2020-12-28 21:50:09.440' AS DateTime), N'AAAAA', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (35, 21, CAST(2050000.0000 AS Decimal(19, 4)), N'Quan 9999', N'1203921', N'Init', CAST(N'2020-12-28 21:51:43.653' AS DateTime), N'Tiennnnnn', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (36, 23, CAST(1600000.0000 AS Decimal(19, 4)), N'Quan 123', N'0923', N'Init', CAST(N'2020-12-28 21:59:31.217' AS DateTime), N'Quan Chien', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (37, 23, CAST(1600000.0000 AS Decimal(19, 4)), N'Quan 123', N'0923', N'Init', CAST(N'2020-12-28 22:01:10.943' AS DateTime), N'Quan Chien', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (42, 34, CAST(9600000.0000 AS Decimal(19, 4)), N'Quan 9', N'0932842881', N'Init', CAST(N'2020-12-30 12:30:54.423' AS DateTime), N'Pham Hoang Long ', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (43, 4, CAST(3100000.0000 AS Decimal(19, 4)), N'Thu Duc', N'0923991122', N'Processing', CAST(N'2020-12-30 13:32:55.197' AS DateTime), N'Nguyen Ngoc Uyen ', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (44, 4, CAST(3100000.0000 AS Decimal(19, 4)), N'Thu Duc', N'0923991122', N'Processing', CAST(N'2020-12-30 13:38:10.833' AS DateTime), N'Nguyen Ngoc Uyen ', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (45, 4, CAST(1600000.0000 AS Decimal(19, 4)), N'Thu Duc', N'0923991122', N'Completed', CAST(N'2020-12-30 13:44:29.903' AS DateTime), N'Nguyen Ngoc Uyen ', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (46, 34, CAST(1800000.0000 AS Decimal(19, 4)), N'Quan 9', N'0932842881', N'Completed', CAST(N'2021-01-18 21:24:37.603' AS DateTime), N'Pham Hoang Long ', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (47, 34, CAST(2050000.0000 AS Decimal(19, 4)), N'Quan 9', N'0932842881', N'Init', CAST(N'2021-01-20 00:07:28.260' AS DateTime), N'Pham Hoang Long ', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (48, 34, CAST(700000.0000 AS Decimal(19, 4)), N'Quan 9', N'0932842881', N'Init', CAST(N'2021-01-21 17:06:00.837' AS DateTime), N'Pham Hoang Long ', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (49, 36, CAST(2500000.0000 AS Decimal(19, 4)), N'Quan 12', N'0932842881', N'Init', CAST(N'2021-01-21 17:16:39.763' AS DateTime), N'Pham Hoang Long ', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (50, 34, CAST(250000.0000 AS Decimal(19, 4)), N'Quan 9', N'0932842881', N'Completed', CAST(N'2021-01-21 17:18:46.307' AS DateTime), N'Pham Hoang Long ', 0)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (51, 34, CAST(250000.0000 AS Decimal(19, 4)), N'Quan 9', N'0932842881', N'Completed', CAST(N'2021-01-21 23:01:52.437' AS DateTime), N'Pham Hoang Long ', 0)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (52, 34, CAST(1600000.0000 AS Decimal(19, 4)), N'Quan 9', N'0932842881', N'Init', CAST(N'2021-01-21 23:14:53.300' AS DateTime), N'Pham Hoang Long ', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (53, 34, CAST(4100000.0000 AS Decimal(19, 4)), N'Quan 9', N'0932842881', N'Init', CAST(N'2021-05-22 22:37:52.677' AS DateTime), N'Pham Hoang Long ', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (54, 34, CAST(8000000.0000 AS Decimal(19, 4)), N'Quan 9', N'0932842881', N'Init', CAST(N'2021-05-22 23:45:55.650' AS DateTime), N'Pham Hoang Long ', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (55, 34, CAST(2650000.0000 AS Decimal(19, 4)), N'Quan 9', N'0932842881', N'Init', CAST(N'2021-05-23 00:28:24.540' AS DateTime), N'Pham Hoang Long ', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (56, 34, CAST(1600000.0000 AS Decimal(19, 4)), N'Quan 9', N'0932842881', N'Init', CAST(N'2021-05-23 00:41:08.830' AS DateTime), N'Pham Hoang Long ', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (57, 34, CAST(6400000.0000 AS Decimal(19, 4)), N'Quan 9', N'0932842881', N'Init', CAST(N'2021-05-23 00:45:29.010' AS DateTime), N'Pham Hoang Long ', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (58, 34, CAST(450000.0000 AS Decimal(19, 4)), N'Quan 9', N'0932842881', N'Init', CAST(N'2021-05-23 08:40:38.923' AS DateTime), N'Pham Hoang Long ', 1)
SET IDENTITY_INSERT [dbo].[PurchaseOrder] OFF
SET IDENTITY_INSERT [dbo].[PurchaseOrderDetail] ON 

INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (1, 1, 26, 300, CAST(1500000.0000 AS Decimal(19, 4)), CAST(1500000.0000 AS Decimal(19, 4)), CAST(1500000.0000 AS Decimal(19, 4)), N'40        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (2, 2, 2, 1, CAST(1.0000 AS Decimal(19, 4)), CAST(1.0000 AS Decimal(19, 4)), CAST(1.0000 AS Decimal(19, 4)), N'40        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (3, 2, 13, 2, CAST(2.0000 AS Decimal(19, 4)), CAST(3.0000 AS Decimal(19, 4)), CAST(6.0000 AS Decimal(19, 4)), N'39        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (4, 3, 30, 2, CAST(1.0000 AS Decimal(19, 4)), CAST(1.0000 AS Decimal(19, 4)), CAST(2.0000 AS Decimal(19, 4)), N'2         ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (5, 4, 44, 1, CAST(2.0000 AS Decimal(19, 4)), CAST(3.0000 AS Decimal(19, 4)), CAST(3.0000 AS Decimal(19, 4)), N'2         ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (6, 5, 49, 2, CAST(5.0000 AS Decimal(19, 4)), CAST(6.0000 AS Decimal(19, 4)), CAST(12.0000 AS Decimal(19, 4)), N'40        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (7, 5, 6, 1, CAST(1.0000 AS Decimal(19, 4)), CAST(1.0000 AS Decimal(19, 4)), CAST(1.0000 AS Decimal(19, 4)), N'40        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (8, 6, 2, 2, CAST(1.0000 AS Decimal(19, 4)), CAST(1.0000 AS Decimal(19, 4)), CAST(2.0000 AS Decimal(19, 4)), N'43        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (9, 6, 13, 2, CAST(2.0000 AS Decimal(19, 4)), CAST(3.0000 AS Decimal(19, 4)), CAST(6.0000 AS Decimal(19, 4)), N'42        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (10, 7, 49, 1, CAST(5.0000 AS Decimal(19, 4)), CAST(6.0000 AS Decimal(19, 4)), CAST(6.0000 AS Decimal(19, 4)), N'41        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (11, 7, 30, 4, CAST(1.0000 AS Decimal(19, 4)), CAST(1.0000 AS Decimal(19, 4)), CAST(4.0000 AS Decimal(19, 4)), N'41        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (25, 27, 29, 3, CAST(280000.0000 AS Decimal(19, 4)), CAST(280000.0000 AS Decimal(19, 4)), CAST(840000.0000 AS Decimal(19, 4)), N'S         ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (26, 27, 7, 2, CAST(2200000.0000 AS Decimal(19, 4)), CAST(2200000.0000 AS Decimal(19, 4)), CAST(4400000.0000 AS Decimal(19, 4)), N'41        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (27, 27, 3, 1, CAST(1800000.0000 AS Decimal(19, 4)), CAST(1800000.0000 AS Decimal(19, 4)), CAST(1800000.0000 AS Decimal(19, 4)), N'42        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (28, 28, 2, 1, CAST(1600000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), N'42        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (29, 29, 13, 2, CAST(1200000.0000 AS Decimal(19, 4)), CAST(1200000.0000 AS Decimal(19, 4)), CAST(2400000.0000 AS Decimal(19, 4)), N'41        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (30, 30, 13, 2, CAST(1200000.0000 AS Decimal(19, 4)), CAST(1200000.0000 AS Decimal(19, 4)), CAST(2400000.0000 AS Decimal(19, 4)), N'42        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (31, 30, 2, 1, CAST(1600000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), N'43        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (32, 31, 6, 1, CAST(2050000.0000 AS Decimal(19, 4)), CAST(2050000.0000 AS Decimal(19, 4)), CAST(2050000.0000 AS Decimal(19, 4)), N'39        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (33, 32, 6, 1, CAST(2050000.0000 AS Decimal(19, 4)), CAST(2050000.0000 AS Decimal(19, 4)), CAST(2050000.0000 AS Decimal(19, 4)), N'39        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (34, 33, 6, 1, CAST(2050000.0000 AS Decimal(19, 4)), CAST(2050000.0000 AS Decimal(19, 4)), CAST(2050000.0000 AS Decimal(19, 4)), N'42        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (35, 34, 6, 1, CAST(2050000.0000 AS Decimal(19, 4)), CAST(2050000.0000 AS Decimal(19, 4)), CAST(2050000.0000 AS Decimal(19, 4)), N'43        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (36, 35, 6, 1, CAST(2050000.0000 AS Decimal(19, 4)), CAST(2050000.0000 AS Decimal(19, 4)), CAST(2050000.0000 AS Decimal(19, 4)), N'41        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (37, 36, 2, 1, CAST(1600000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), N'40        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (38, 37, 2, 1, CAST(1600000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), N'42        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (39, 42, 28, 1, CAST(1500000.0000 AS Decimal(19, 4)), CAST(1500000.0000 AS Decimal(19, 4)), CAST(1500000.0000 AS Decimal(19, 4)), N'42        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (40, 42, 18, 3, CAST(2700000.0000 AS Decimal(19, 4)), CAST(2700000.0000 AS Decimal(19, 4)), CAST(8100000.0000 AS Decimal(19, 4)), N'40        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (41, 43, 28, 1, CAST(1500000.0000 AS Decimal(19, 4)), CAST(1500000.0000 AS Decimal(19, 4)), CAST(1500000.0000 AS Decimal(19, 4)), N'39        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (42, 43, 2, 1, CAST(1600000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), N'41        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (43, 44, 28, 1, CAST(1500000.0000 AS Decimal(19, 4)), CAST(1500000.0000 AS Decimal(19, 4)), CAST(1500000.0000 AS Decimal(19, 4)), N'43        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (44, 44, 2, 1, CAST(1600000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), N'42        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (45, 45, 2, 1, CAST(1600000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), N'42        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (46, 46, 3, 1, CAST(1800000.0000 AS Decimal(19, 4)), CAST(1800000.0000 AS Decimal(19, 4)), CAST(1800000.0000 AS Decimal(19, 4)), N'40        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (47, 47, 6, 1, CAST(2050000.0000 AS Decimal(19, 4)), CAST(2050000.0000 AS Decimal(19, 4)), CAST(2050000.0000 AS Decimal(19, 4)), N'40        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (48, 48, 49, 1, CAST(700000.0000 AS Decimal(19, 4)), CAST(700000.0000 AS Decimal(19, 4)), CAST(700000.0000 AS Decimal(19, 4)), N'Oversize  ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (49, 49, 49, 1, CAST(700000.0000 AS Decimal(19, 4)), CAST(700000.0000 AS Decimal(19, 4)), CAST(700000.0000 AS Decimal(19, 4)), N'Oversize  ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (50, 49, 3, 1, CAST(1800000.0000 AS Decimal(19, 4)), CAST(1800000.0000 AS Decimal(19, 4)), CAST(1800000.0000 AS Decimal(19, 4)), N'43        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (51, 50, 39, 1, CAST(250000.0000 AS Decimal(19, 4)), CAST(250000.0000 AS Decimal(19, 4)), CAST(250000.0000 AS Decimal(19, 4)), N'Oversize  ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (52, 51, 40, 1, CAST(250000.0000 AS Decimal(19, 4)), CAST(250000.0000 AS Decimal(19, 4)), CAST(250000.0000 AS Decimal(19, 4)), N'Overs     ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (53, 52, 2, 1, CAST(1600000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), N'41        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (54, 53, 6, 2, CAST(2050000.0000 AS Decimal(19, 4)), CAST(2050000.0000 AS Decimal(19, 4)), CAST(4100000.0000 AS Decimal(19, 4)), N'39        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (55, 54, 2, 5, CAST(1600000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), CAST(8000000.0000 AS Decimal(19, 4)), N'43        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (56, 55, 44, 1, CAST(350000.0000 AS Decimal(19, 4)), CAST(350000.0000 AS Decimal(19, 4)), CAST(350000.0000 AS Decimal(19, 4)), N'Oversize  ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (57, 55, 5, 1, CAST(2300000.0000 AS Decimal(19, 4)), CAST(2300000.0000 AS Decimal(19, 4)), CAST(2300000.0000 AS Decimal(19, 4)), N'43        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (58, 56, 2, 1, CAST(1600000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), N'39        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (59, 57, 2, 4, CAST(1600000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), CAST(6400000.0000 AS Decimal(19, 4)), N'42        ')
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal], [Size]) VALUES (60, 58, 37, 1, CAST(450000.0000 AS Decimal(19, 4)), CAST(450000.0000 AS Decimal(19, 4)), CAST(450000.0000 AS Decimal(19, 4)), N'Oversize  ')
SET IDENTITY_INSERT [dbo].[PurchaseOrderDetail] OFF
INSERT [dbo].[Shipper] ([PurchaseOrderId], [ShipperId], [Status]) VALUES (4, 22, N'Shipping')
INSERT [dbo].[Shipper] ([PurchaseOrderId], [ShipperId], [Status]) VALUES (6, 22, N'Picking')
INSERT [dbo].[Shipper] ([PurchaseOrderId], [ShipperId], [Status]) VALUES (27, 3, N'Picking')
INSERT [dbo].[Shipper] ([PurchaseOrderId], [ShipperId], [Status]) VALUES (29, 3, N'Shipping')
INSERT [dbo].[Shipper] ([PurchaseOrderId], [ShipperId], [Status]) VALUES (43, 3, N'Picking')
INSERT [dbo].[Shipper] ([PurchaseOrderId], [ShipperId], [Status]) VALUES (44, 3, N'Shipping')
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (1, 1, N'Chealsea Boots - Men')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (2, 1, N'Derby')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (3, 1, N'Harness Boots')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (4, 1, N'Zip Boots')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (5, 1, N'Combat Boots - Men')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (6, 1, N'Oxford')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (7, 2, N'Chealsea Boots - Women')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (8, 2, N'Combat Boots - Women')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (9, 3, N'T-Shirt')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (10, 3, N'Shirt')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (11, 4, N'Belt')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (12, 4, N'Bracelet')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (13, 4, N'Chain')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (14, 4, N'Bandana')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (15, 4, N'Necklace')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (16, 4, N'Bucket Hat')
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
INSERT [dbo].[voucher] ([code], [coin], [status]) VALUES (N'Tet2021             ', 20000000, N'-1        ')
INSERT [dbo].[voucher] ([code], [coin], [status]) VALUES (N'VC2TR               ', 100000, N'-1        ')
INSERT [dbo].[voucher] ([code], [coin], [status]) VALUES (N'VTR                 ', 2000000, N'-1        ')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UC_ACCOUNT_EMAIL]    Script Date: 6/6/2021 10:54:56 AM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UC_ACCOUNT_EMAIL] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_ACCOUNTROLE_EMAIL_ROLE]    Script Date: 6/6/2021 10:54:56 AM ******/
ALTER TABLE [dbo].[AccountRole] ADD  CONSTRAINT [UQ_ACCOUNTROLE_EMAIL_ROLE] UNIQUE NONCLUSTERED 
(
	[Email] ASC,
	[Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UC_CATEGORY_NAME]    Script Date: 6/6/2021 10:54:56 AM ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [UC_CATEGORY_NAME] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UC_PRODUCTNAME]    Script Date: 6/6/2021 10:54:56 AM ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [UC_PRODUCTNAME] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_productName]    Script Date: 6/6/2021 10:54:56 AM ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [unique_productName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UC_SUBCATEGORY_NAME]    Script Date: 6/6/2021 10:54:56 AM ******/
ALTER TABLE [dbo].[SubCategory] ADD  CONSTRAINT [UC_SUBCATEGORY_NAME] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountRole]  WITH CHECK ADD  CONSTRAINT [FK_EMAIL_ACCOUNT] FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Email])
GO
ALTER TABLE [dbo].[AccountRole] CHECK CONSTRAINT [FK_EMAIL_ACCOUNT]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_IMAGE_PRODUCT] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_IMAGE_PRODUCT]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_SUBCATEGORYID_PRODUCT] FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategory] ([SubCategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_SUBCATEGORYID_PRODUCT]
GO
ALTER TABLE [dbo].[ProductSize]  WITH CHECK ADD  CONSTRAINT [Productt_FK] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductSize] CHECK CONSTRAINT [Productt_FK]
GO
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_PURCHASEORDER_ACCOUNT] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PURCHASEORDER_ACCOUNT]
GO
ALTER TABLE [dbo].[PurchaseOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_PURCHASEORDERDETAIL_PRODUCT] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[PurchaseOrderDetail] CHECK CONSTRAINT [FK_PURCHASEORDERDETAIL_PRODUCT]
GO
ALTER TABLE [dbo].[PurchaseOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_PURCHASEORDERDETAIL_PURCHCASEORDER] FOREIGN KEY([PurchaseOrderId])
REFERENCES [dbo].[PurchaseOrder] ([PurchaseOrderId])
GO
ALTER TABLE [dbo].[PurchaseOrderDetail] CHECK CONSTRAINT [FK_PURCHASEORDERDETAIL_PURCHCASEORDER]
GO
ALTER TABLE [dbo].[Shipper]  WITH CHECK ADD  CONSTRAINT [FK__Shipper__Purchas__5CD6CB2B] FOREIGN KEY([PurchaseOrderId])
REFERENCES [dbo].[PurchaseOrder] ([PurchaseOrderId])
GO
ALTER TABLE [dbo].[Shipper] CHECK CONSTRAINT [FK__Shipper__Purchas__5CD6CB2B]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SUBCATEGORY_CATEGORY] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SUBCATEGORY_CATEGORY]
GO
/****** Object:  StoredProcedure [dbo].[OSP_CapNhanDonHang]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OSP_CapNhanDonHang]
@PurchaseOrderId INT, @Address varchar(MAX), @Phone varchar(MAX)
AS

BEGIN
	UPDATE dbo.PurchaseOrder SET Address = @Address, Phone = @Phone WHERE PurchaseOrderId = @PurchaseOrderId
END









GO
/****** Object:  StoredProcedure [dbo].[OSP_CapNhatChiTiet]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OSP_CapNhatChiTiet]
@PurchaseOrderDetailId BIGINT, @PurchaseOrderId INT, @ProductId INT, @Quantity INT, @UnitPrice decimal(19, 4), @Subtotal decimal(19, 4)
AS

BEGIN
	UPDATE dbo.PurchaseOrderDetail SET ProductId = @ProductId, Quantity = @Quantity, UnitPrice = @UnitPrice, Subtotal = @Subtotal
	WHERE PurchaseOrderId = @PurchaseOrderId AND PurchaseOrderDetailId = @PurchaseOrderDetailId
END








GO
/****** Object:  StoredProcedure [dbo].[PSP_CapNhatSanPham]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_CapNhatSanPham]
(@proID INT, @SubCate INT , @Name VARCHAR(100),@imgPath varchar(400), @UnitPrice decimal(19,0), @Gender INT, @Description varchar(MAX), @Available INT)
AS
BEGIN
	UPDATE Product 
	SET SubCategoryId= @SubCate,
		Name=@Name,
		UnitPrice= @UnitPrice,
		Gender= @Gender,
		Description= @Description,
		Available= @Available
	 WHERE ProductId= @proID

	 UPDATE dbo.Image SET ImagePath = @imgPath WHERE ProductId = @proID


END






GO
/****** Object:  StoredProcedure [dbo].[PSP_CapNhatSizeSanPham]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PSP_CapNhatSizeSanPham]
(@prodsizeID INT,@Name VARCHAR(5), @Available INT)
AS
BEGIN
	UPDATE ProductSize 
	SET Size=@Name,Available= @Available
	 WHERE ProductSizeId= @prodsizeID

END




GO
/****** Object:  StoredProcedure [dbo].[PSP_ThemSizeSanPham]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PSP_ThemSizeSanPham]
(@prodID INT,@Name VARCHAR(5), @Available INT)
AS
BEGIN
	INSERT dbo.ProductSize( ProductID ,
	          Size ,
	          Available
	        )
	VALUES  ( @prodID , -- SubCategoryId - int
	          @Name , -- Name - varchar(100)
	          @Available 
	        )
END





GO
/****** Object:  StoredProcedure [dbo].[PSP_ThemSP]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_ThemSP]
@SubCate INT , @Name VARCHAR(100),@imgPath varchar(400), @UnitPrice decimal(19,0), @Gender INT, @Description varchar(MAX), @Available INT
AS
BEGIN
	INSERT dbo.Product
	        ( SubCategoryId ,
	          Name ,
	          UnitPrice ,     
	          Gender ,
	          Description ,
	          Available
	        )
	VALUES  ( @SubCate , -- SubCategoryId - int
	          @Name , -- Name - varchar(100)
	          @UnitPrice , -- UnitPrice - decimal      
	          @Gender , -- Gender - int
	          @Description , -- Description - varchar(max)
	          0  -- Available - bit
	        )

	DECLARE @proID INT
	SELECT @proID = MAX(ProductId) FROM dbo.Product
	INSERT dbo.Image
	        ( ProductId ,
	          ImagePath ,
	          DisplayOrder
	        )
	VALUES  ( @proID , -- ProductId - int
	          @imgPath , -- ImagePath - varchar(400)
	          1  -- DisplayOrder - int
	        ) 



END



GO
/****** Object:  StoredProcedure [dbo].[USP_CapNhatUser]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--------------------------------------------------------------


CREATE PROCEDURE [dbo].[USP_CapNhatUser]
@Email varchar(100), @FirstName varchar(50), @LastName varchar(50), @Phone varchar(20), 
@Address varchar(200), @Gender varchar(1), @DayOfBirth DATE
AS
BEGIN
	UPDATE dbo.Account SET FirstName = @FirstName, LastName = @LastName, Phone = @Phone,
	 Address = @Address, DayOfBirth = @DayOfBirth WHERE Email = @Email
END









GO
/****** Object:  StoredProcedure [dbo].[USP_DangKy]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DangKy]
(@Email varchar(100), @Pass varchar(100), @FirstName varchar(50), @LastName varchar(50), @Phone varchar(20), 
@Address varchar(200), @Gender varchar(1), @DayOfBirth DATE)
AS
BEGIN
		INSERT dbo.Account
		        ( Email ,
		          Password ,
		          ImageLink ,
		          FirstName ,
		          LastName ,
		          Phone ,
		          Address ,
		          Gender ,
		          DayOfBirth ,
		          CreatedDate ,
		          isAvailable,
				  coin
		        )
		VALUES  ( @Email , -- Email - varchar(100)
		          dbo.MaHoaMD5(@Pass) , -- Password - varchar(200)
		          'none' , -- ImageLink - varchar(400)
		          @FirstName , -- FirstName - varchar(50)
		          @LastName , -- LastName - varchar(50)
		          @Phone , -- Phone - varchar(20)
		          @Address , -- Address - varchar(200)
		          @Gender , -- Gender - varchar(1)
		          @DayOfBirth , -- DayOfBirth - datetime
		          GETDATE() , -- CreatedDate - datetime
		          1,  -- isAvailable - bit
				  0
		        )
		INSERT dbo.AccountRole
		        ( Email, Role )
		VALUES  ( @Email, -- Email - varchar(100)
		          'USER'  -- Role - varchar(20)
		          )
END 


GO
/****** Object:  StoredProcedure [dbo].[USP_TaoUser]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_TaoUser] 
(@Email varchar(100), @FirstName varchar(50), @LastName varchar(50), @Phone varchar(20), 
@Address varchar(200), @Gender varchar(1), @DayOfBirth DATE, @Role varchar(20))
AS
BEGIN
		INSERT dbo.Account
		        ( Email ,
		          Password ,
		          ImageLink ,
		          FirstName ,
		          LastName ,
		          Phone ,
		          Address ,
		          Gender ,
		          DayOfBirth ,
		          CreatedDate ,
		          isAvailable,
				  coin
		        )
		VALUES  ( @Email , -- Email - varchar(100)
		          dbo.MaHoaMD5('1') , -- Password - varchar(200)
		          'none' , -- ImageLink - varchar(400)
		          @FirstName , -- FirstName - varchar(50)
		          @LastName , -- LastName - varchar(50)
		          @Phone , -- Phone - varchar(20)
		          @Address , -- Address - varchar(200)
		          @Gender , -- Gender - varchar(1)
		          @DayOfBirth , -- DayOfBirth - datetime
		          GETDATE() , -- CreatedDate - datetime
		          1,  -- isAvailable - bit
				  0
		        )
		INSERT dbo.AccountRole
		        ( Email, Role )
		VALUES  ( @Email, -- Email - varchar(100)
		          @Role  -- Role - varchar(20)
		          )
END 


GO
/****** Object:  Trigger [dbo].[MaHoa]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [dbo].[MaHoa]
ON [dbo].[Account]
AFTER  UPDATE
AS
BEGIN
	DECLARE @newPass VARCHAR(200),@oldPass VARCHAR(200), @id VARCHAR(100)


	SELECT @newPass = Inserted.Password
	FROM Inserted

	
	SELECT @oldPass = Deleted.Password
	FROM Deleted

	PRINT @newPass  
	PRINT @oldPass
	IF @newPass <> @oldPass
	BEGIN
		SELECT @newPass = Inserted.Password, @id = Inserted.Email 
		FROM Inserted
		SET @newPass = dbo.MaHoaMD5(@newPass)
		UPDATE dbo.Account 
		SET Password = @newPass
		WHERE Email = @id
	END
END





GO
/****** Object:  Trigger [dbo].[PTG_capNhatSoLuongSanPham]    Script Date: 6/6/2021 10:54:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[PTG_capNhatSoLuongSanPham]
ON	[dbo].[ProductSize]
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @tongSL INT, @maSP INT
	SELECT @tongSL = SUM(ProductSize.Available) , @maSP = Inserted.ProductID  FROM Inserted , dbo.ProductSize WHERE ProductSize.ProductID = Inserted.ProductID GROUP BY Inserted.ProductID

	PRINT @tongSL
	PRINT @maSP
	UPDATE dbo.Product SET Available = @tongSL WHERE ProductId = @maSP


END

GO
USE [master]
GO
ALTER DATABASE [ClickShopV2] SET  READ_WRITE 
GO
