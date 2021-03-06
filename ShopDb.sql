USE [master]
GO
/****** Object:  Database [ProdavnicaDb]    Script Date: 5/22/2021 1:27:31 ******/
CREATE DATABASE [ProdavnicaDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProdavnicaDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProdavnicaDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProdavnicaDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProdavnicaDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProdavnicaDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProdavnicaDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProdavnicaDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProdavnicaDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProdavnicaDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProdavnicaDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProdavnicaDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProdavnicaDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProdavnicaDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProdavnicaDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProdavnicaDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProdavnicaDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProdavnicaDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProdavnicaDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProdavnicaDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProdavnicaDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProdavnicaDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProdavnicaDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProdavnicaDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProdavnicaDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProdavnicaDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProdavnicaDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProdavnicaDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProdavnicaDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProdavnicaDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProdavnicaDb] SET  MULTI_USER 
GO
ALTER DATABASE [ProdavnicaDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProdavnicaDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProdavnicaDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProdavnicaDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProdavnicaDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProdavnicaDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProdavnicaDb] SET QUERY_STORE = OFF
GO
USE [ProdavnicaDb]
GO
/****** Object:  Table [dbo].[Kupac]    Script Date: 5/22/2021 1:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kupac](
	[KupacId] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](30) NOT NULL,
	[Prezime] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KupacId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kupovina]    Script Date: 5/22/2021 1:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kupovina](
	[KupovinaId] [int] IDENTITY(1,1) NOT NULL,
	[KupacId] [int] NOT NULL,
	[DatumKupovina] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KupovinaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proizvod]    Script Date: 5/22/2021 1:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proizvod](
	[ProizvodId] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](100) NOT NULL,
	[Cena] [decimal](8, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProizvodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StavkeKupovina]    Script Date: 5/22/2021 1:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StavkeKupovina](
	[KupovinaId] [int] NOT NULL,
	[ProizvodId] [int] NOT NULL,
	[Kolicina] [int] NOT NULL,
 CONSTRAINT [PK_StavkeKupovina] PRIMARY KEY CLUSTERED 
(
	[KupovinaId] ASC,
	[ProizvodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zaposleni]    Script Date: 5/22/2021 1:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zaposleni](
	[ZaposleniId] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](30) NOT NULL,
	[Prezime] [nvarchar](30) NOT NULL,
	[KorisnickoIme] [nvarchar](20) NOT NULL,
	[Lozinka] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ZaposleniId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Kupac] ON 

INSERT [dbo].[Kupac] ([KupacId], [Ime], [Prezime]) VALUES (1, N'Pera', N'Peric')
INSERT [dbo].[Kupac] ([KupacId], [Ime], [Prezime]) VALUES (2, N'Marko', N'Markovi')
INSERT [dbo].[Kupac] ([KupacId], [Ime], [Prezime]) VALUES (3, N'Laza', N'Lazic')
SET IDENTITY_INSERT [dbo].[Kupac] OFF
GO
SET IDENTITY_INSERT [dbo].[Kupovina] ON 

INSERT [dbo].[Kupovina] ([KupovinaId], [KupacId], [DatumKupovina]) VALUES (1, 1, CAST(N'2021-05-22T00:55:12.993' AS DateTime))
INSERT [dbo].[Kupovina] ([KupovinaId], [KupacId], [DatumKupovina]) VALUES (2, 2, CAST(N'2021-05-22T00:55:45.883' AS DateTime))
SET IDENTITY_INSERT [dbo].[Kupovina] OFF
GO
SET IDENTITY_INSERT [dbo].[Proizvod] ON 

INSERT [dbo].[Proizvod] ([ProizvodId], [Naziv], [Cena]) VALUES (1, N'Jogurt Moja Kravica 250gr', CAST(32.56 AS Decimal(8, 2)))
INSERT [dbo].[Proizvod] ([ProizvodId], [Naziv], [Cena]) VALUES (2, N'Dugotrajno mleko IMLEK 2.8%mm 1,51', CAST(129.99 AS Decimal(8, 2)))
INSERT [dbo].[Proizvod] ([ProizvodId], [Naziv], [Cena]) VALUES (3, N'Majonez TOMY kesica 280g', CAST(104.00 AS Decimal(8, 2)))
INSERT [dbo].[Proizvod] ([ProizvodId], [Naziv], [Cena]) VALUES (4, N'Pasteta ARGETA jetrena 95g', CAST(78.99 AS Decimal(8, 2)))
SET IDENTITY_INSERT [dbo].[Proizvod] OFF
GO
INSERT [dbo].[StavkeKupovina] ([KupovinaId], [ProizvodId], [Kolicina]) VALUES (1, 2, 1)
INSERT [dbo].[StavkeKupovina] ([KupovinaId], [ProizvodId], [Kolicina]) VALUES (1, 3, 1)
INSERT [dbo].[StavkeKupovina] ([KupovinaId], [ProizvodId], [Kolicina]) VALUES (1, 4, 1)
INSERT [dbo].[StavkeKupovina] ([KupovinaId], [ProizvodId], [Kolicina]) VALUES (2, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Zaposleni] ON 

INSERT [dbo].[Zaposleni] ([ZaposleniId], [Ime], [Prezime], [KorisnickoIme], [Lozinka]) VALUES (1, N'Pera', N'Markovic', N'pera', N'pera1')
INSERT [dbo].[Zaposleni] ([ZaposleniId], [Ime], [Prezime], [KorisnickoIme], [Lozinka]) VALUES (2, N'Mika', N'Jovanovic', N'mika', N'mika1')
SET IDENTITY_INSERT [dbo].[Zaposleni] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Zaposlen__992E6F9210ADCCC9]    Script Date: 5/22/2021 1:27:31 ******/
ALTER TABLE [dbo].[Zaposleni] ADD UNIQUE NONCLUSTERED 
(
	[KorisnickoIme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Kupovina] ADD  DEFAULT (getdate()) FOR [DatumKupovina]
GO
ALTER TABLE [dbo].[Kupovina]  WITH CHECK ADD FOREIGN KEY([KupacId])
REFERENCES [dbo].[Kupac] ([KupacId])
GO
ALTER TABLE [dbo].[StavkeKupovina]  WITH CHECK ADD FOREIGN KEY([KupovinaId])
REFERENCES [dbo].[Kupovina] ([KupovinaId])
GO
ALTER TABLE [dbo].[StavkeKupovina]  WITH CHECK ADD FOREIGN KEY([ProizvodId])
REFERENCES [dbo].[Proizvod] ([ProizvodId])
GO
ALTER TABLE [dbo].[Zaposleni]  WITH CHECK ADD CHECK  ((len([KorisnickoIme])>(3)))
GO
ALTER TABLE [dbo].[Zaposleni]  WITH CHECK ADD CHECK  ((len([Lozinka])>(3)))
GO
/****** Object:  StoredProcedure [dbo].[UbaciKupovinu]    Script Date: 5/22/2021 1:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UbaciKupovinu]
(
	@KupacId int,
	@KupovinaId int OUTPUT
)
AS
INSERT INTO Kupovina(KupacId) VALUES(@KupacId)
SELECT @KupovinaId = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[UbaciStavkuKupovine]    Script Date: 5/22/2021 1:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UbaciStavkuKupovine]
(
	@KupovinaId int,
	@ProizvodId int,
	@Kolicina int
)
AS
INSERT StavkeKupovina VALUES(@KupovinaId,@ProizvodId,@Kolicina);
GO
USE [master]
GO
ALTER DATABASE [ProdavnicaDb] SET  READ_WRITE 
GO
