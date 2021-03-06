USE [master]
GO
/****** Object:  Database [MyCollege]    Script Date: 7/7/2021 8:29:31 PM ******/
CREATE DATABASE [MyCollege]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'systemstudents', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\systemstudents.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'systemstudents_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\systemstudents_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MyCollege] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyCollege].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyCollege] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyCollege] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyCollege] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyCollege] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyCollege] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyCollege] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyCollege] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyCollege] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyCollege] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyCollege] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyCollege] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyCollege] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyCollege] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyCollege] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyCollege] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyCollege] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyCollege] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyCollege] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyCollege] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyCollege] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyCollege] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyCollege] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyCollege] SET RECOVERY FULL 
GO
ALTER DATABASE [MyCollege] SET  MULTI_USER 
GO
ALTER DATABASE [MyCollege] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyCollege] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyCollege] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyCollege] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MyCollege] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MyCollege]
GO
/****** Object:  Table [dbo].[closelogin]    Script Date: 7/7/2021 8:29:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[closelogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[choose] [nchar](10) NULL,
 CONSTRAINT [PK_closelogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Depts]    Script Date: 7/7/2021 8:29:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Depts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dept] [nvarchar](max) NULL,
	[headId_FK] [int] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Depts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gender]    Script Date: 7/7/2021 8:29:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[gender] [nchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Levels]    Script Date: 7/7/2021 8:29:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Levels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[level] [nvarchar](max) NOT NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Levels] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Professors]    Script Date: 7/7/2021 8:29:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[image] [nchar](10) NULL,
	[genderId_FK] [int] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Professors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProfessorSubject]    Script Date: 7/7/2021 8:29:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfessorSubject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[professorId_FK] [int] NULL,
	[subjectId_Fk] [int] NULL,
 CONSTRAINT [PK_ProfessorSubject] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 7/7/2021 8:29:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[levelId_FK] [int] NULL,
	[nationalId] [decimal](18, 0) NULL,
	[mobile] [nvarchar](50) NULL,
	[password] [nvarchar](max) NULL,
	[firstName] [nvarchar](max) NULL,
	[lastName] [nvarchar](max) NULL,
	[middleName] [nvarchar](max) NULL,
	[surName] [nvarchar](max) NULL,
	[deptId_Fk] [int] NULL,
	[genderId_FK] [int] NULL,
	[image] [nvarchar](max) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentSubjects]    Script Date: 7/7/2021 8:29:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentSubjects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[studentId_Fk] [int] NOT NULL,
	[subjectId_FK] [int] NOT NULL,
	[isPassed] [bit] NULL,
 CONSTRAINT [PK_StudentSubjects] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 7/7/2021 8:29:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[subject] [nvarchar](max) NULL,
	[creditHour] [float] NULL,
	[code] [nchar](10) NULL,
	[isActive] [bit] NULL,
	[deptId_FK] [int] NULL,
	[preSubjectId_FK] [int] NULL,
	[day] [nchar](10) NULL,
	[totime] [time](7) NULL,
	[fromtime] [time](7) NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[closelogin] ON 

INSERT [dbo].[closelogin] ([id], [choose]) VALUES (1, N'true      ')
SET IDENTITY_INSERT [dbo].[closelogin] OFF
SET IDENTITY_INSERT [dbo].[Depts] ON 

INSERT [dbo].[Depts] ([id], [dept], [headId_FK], [isActive]) VALUES (1, N'CS', NULL, 1)
INSERT [dbo].[Depts] ([id], [dept], [headId_FK], [isActive]) VALUES (2, N'FC', NULL, 1)
SET IDENTITY_INSERT [dbo].[Depts] OFF
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([id], [gender]) VALUES (1, N'2         ')
INSERT [dbo].[Gender] ([id], [gender]) VALUES (2, N'1         ')
SET IDENTITY_INSERT [dbo].[Gender] OFF
SET IDENTITY_INSERT [dbo].[Levels] ON 

INSERT [dbo].[Levels] ([id], [level], [isActive]) VALUES (1, N'Level_1', 1)
INSERT [dbo].[Levels] ([id], [level], [isActive]) VALUES (2, N'Level_2', 1)
INSERT [dbo].[Levels] ([id], [level], [isActive]) VALUES (3, N'Level_3', 1)
SET IDENTITY_INSERT [dbo].[Levels] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([id], [levelId_FK], [nationalId], [mobile], [password], [firstName], [lastName], [middleName], [surName], [deptId_Fk], [genderId_FK], [image], [isActive]) VALUES (4, 1, CAST(1234567 AS Decimal(18, 0)), N'0102345776', N'1234567', N'omar', N'mahmoud', N'Tohmay', N'Youssef', 1, 1, NULL, 1)
INSERT [dbo].[Students] ([id], [levelId_FK], [nationalId], [mobile], [password], [firstName], [lastName], [middleName], [surName], [deptId_Fk], [genderId_FK], [image], [isActive]) VALUES (5, 2, NULL, N'010293344', NULL, N'omar', N'ahmoud', N'mohamed', N'youssef', 1, NULL, NULL, NULL)
INSERT [dbo].[Students] ([id], [levelId_FK], [nationalId], [mobile], [password], [firstName], [lastName], [middleName], [surName], [deptId_Fk], [genderId_FK], [image], [isActive]) VALUES (6, 2, CAST(1231345543 AS Decimal(18, 0)), N'012334432', N'1231345543', N'ahmed', N'tohmay', N'mahmoud', N'youssef', 1, NULL, NULL, 1)
INSERT [dbo].[Students] ([id], [levelId_FK], [nationalId], [mobile], [password], [firstName], [lastName], [middleName], [surName], [deptId_Fk], [genderId_FK], [image], [isActive]) VALUES (7, 2, CAST(12456776 AS Decimal(18, 0)), N'012354267', N'12456776', N'menna', N'ahmed', N'mohamed', N'[object king', 2, NULL, N'C:\fakepath\london-4643691_1920.jpg', 1)
INSERT [dbo].[Students] ([id], [levelId_FK], [nationalId], [mobile], [password], [firstName], [lastName], [middleName], [surName], [deptId_Fk], [genderId_FK], [image], [isActive]) VALUES (8, 2, CAST(12456776 AS Decimal(18, 0)), N'012354267', N'12456776', N'menna', N'ahmed', N'mohamed', N'king', 2, NULL, N'C:\fakepath\london-4643691_1920.jpg', 1)
INSERT [dbo].[Students] ([id], [levelId_FK], [nationalId], [mobile], [password], [firstName], [lastName], [middleName], [surName], [deptId_Fk], [genderId_FK], [image], [isActive]) VALUES (9, 2, CAST(12456776 AS Decimal(18, 0)), N'012354267', N'12456776', N'menna', N'ahmed', N'mohamed', N'[object king', 2, NULL, N'C:\fakepath\london-4643691_1920.jpg', 1)
INSERT [dbo].[Students] ([id], [levelId_FK], [nationalId], [mobile], [password], [firstName], [lastName], [middleName], [surName], [deptId_Fk], [genderId_FK], [image], [isActive]) VALUES (10, 2, CAST(2213221 AS Decimal(18, 0)), N'1111111111', N'2213221', N'ahmed', N'omar', N'mahamed', N'king', 1, NULL, N'C:\fakepath\images.png', 1)
INSERT [dbo].[Students] ([id], [levelId_FK], [nationalId], [mobile], [password], [firstName], [lastName], [middleName], [surName], [deptId_Fk], [genderId_FK], [image], [isActive]) VALUES (12, 2, CAST(123456 AS Decimal(18, 0)), N'12345', N'123456', N'fatma', N'omar', N'ahmed', N'eislam', 1, 1, N'C:\fakepath\tree-4641910_1920.jpg', 1)
INSERT [dbo].[Students] ([id], [levelId_FK], [nationalId], [mobile], [password], [firstName], [lastName], [middleName], [surName], [deptId_Fk], [genderId_FK], [image], [isActive]) VALUES (13, 2, CAST(123456 AS Decimal(18, 0)), N'12345', N'123456', N'fatma', N'omar', N'ahmed', N'eislam', 1, 1, N'C:\fakepath\tree-4641910_1920.jpg', 1)
INSERT [dbo].[Students] ([id], [levelId_FK], [nationalId], [mobile], [password], [firstName], [lastName], [middleName], [surName], [deptId_Fk], [genderId_FK], [image], [isActive]) VALUES (15, 3, CAST(123456789 AS Decimal(18, 0)), N'1234567', N'123456789', N'mode', N'samy', N'ahmed', N'saber', 1, 2, N'C:\fakepath\اجمل خلفيات كمبيوتر 2019 free wallpapers (149).jpg', 1)
INSERT [dbo].[Students] ([id], [levelId_FK], [nationalId], [mobile], [password], [firstName], [lastName], [middleName], [surName], [deptId_Fk], [genderId_FK], [image], [isActive]) VALUES (21, 2, CAST(12345678900012 AS Decimal(18, 0)), N'12345678900012', N'12345678900012', N'Saber', N'ahmed', N'omar', N'mamoud', 2, 2, N'C:\fakepath\fantasy-4652501__340.webp', 1)
INSERT [dbo].[Students] ([id], [levelId_FK], [nationalId], [mobile], [password], [firstName], [lastName], [middleName], [surName], [deptId_Fk], [genderId_FK], [image], [isActive]) VALUES (22, 2, CAST(12345678900012 AS Decimal(18, 0)), N'12345678900012', N'12345678900012', N'Saber', N'ahmed', N'omar', N'mamoud', 2, 2, N'C:\fakepath\fantasy-4652501__340.webp', 1)
INSERT [dbo].[Students] ([id], [levelId_FK], [nationalId], [mobile], [password], [firstName], [lastName], [middleName], [surName], [deptId_Fk], [genderId_FK], [image], [isActive]) VALUES (23, 2, CAST(12345678900012 AS Decimal(18, 0)), N'12345678900012', N'12345678900012', N'Saber', N'ahmed', N'omar', N'mamoud', 2, 2, N'C:\fakepath\fantasy-4652501__340.webp', 1)
SET IDENTITY_INSERT [dbo].[Students] OFF
SET IDENTITY_INSERT [dbo].[StudentSubjects] ON 

INSERT [dbo].[StudentSubjects] ([id], [studentId_Fk], [subjectId_FK], [isPassed]) VALUES (280, 4, 10, 1)
INSERT [dbo].[StudentSubjects] ([id], [studentId_Fk], [subjectId_FK], [isPassed]) VALUES (281, 4, 7, 1)
INSERT [dbo].[StudentSubjects] ([id], [studentId_Fk], [subjectId_FK], [isPassed]) VALUES (282, 4, 12, 1)
INSERT [dbo].[StudentSubjects] ([id], [studentId_Fk], [subjectId_FK], [isPassed]) VALUES (284, 10, 7, 1)
INSERT [dbo].[StudentSubjects] ([id], [studentId_Fk], [subjectId_FK], [isPassed]) VALUES (285, 10, 11, 1)
INSERT [dbo].[StudentSubjects] ([id], [studentId_Fk], [subjectId_FK], [isPassed]) VALUES (287, 10, 5, 1)
INSERT [dbo].[StudentSubjects] ([id], [studentId_Fk], [subjectId_FK], [isPassed]) VALUES (288, 4, 11, 1)
INSERT [dbo].[StudentSubjects] ([id], [studentId_Fk], [subjectId_FK], [isPassed]) VALUES (289, 10, 10, 1)
INSERT [dbo].[StudentSubjects] ([id], [studentId_Fk], [subjectId_FK], [isPassed]) VALUES (290, 10, 1, 1)
INSERT [dbo].[StudentSubjects] ([id], [studentId_Fk], [subjectId_FK], [isPassed]) VALUES (291, 12, 5, 1)
INSERT [dbo].[StudentSubjects] ([id], [studentId_Fk], [subjectId_FK], [isPassed]) VALUES (292, 12, 7, 1)
INSERT [dbo].[StudentSubjects] ([id], [studentId_Fk], [subjectId_FK], [isPassed]) VALUES (293, 12, 11, 1)
INSERT [dbo].[StudentSubjects] ([id], [studentId_Fk], [subjectId_FK], [isPassed]) VALUES (294, 12, 12, 1)
SET IDENTITY_INSERT [dbo].[StudentSubjects] OFF
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([id], [subject], [creditHour], [code], [isActive], [deptId_FK], [preSubjectId_FK], [day], [totime], [fromtime]) VALUES (1, N'Article properties', 3, N'P111      ', 1, 1, 1, N'Sunday    ', CAST(N'11:00:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Subjects] ([id], [subject], [creditHour], [code], [isActive], [deptId_FK], [preSubjectId_FK], [day], [totime], [fromtime]) VALUES (2, N'Article properties', 3, N'P111      ', 1, 2, 2, N'Thursday  ', CAST(N'11:00:00' AS Time), CAST(N'09:30:00' AS Time))
INSERT [dbo].[Subjects] ([id], [subject], [creditHour], [code], [isActive], [deptId_FK], [preSubjectId_FK], [day], [totime], [fromtime]) VALUES (3, N'Mathematical Analysis (1)', 4, N'M111      ', 1, 1, 3, N'Saturday  ', CAST(N'15:00:00' AS Time), CAST(N'14:00:00' AS Time))
INSERT [dbo].[Subjects] ([id], [subject], [creditHour], [code], [isActive], [deptId_FK], [preSubjectId_FK], [day], [totime], [fromtime]) VALUES (4, N'Mathematical Analysis (2)', 3, N'M114      ', 1, 1, 4, N'Tuesday   ', CAST(N'11:00:00' AS Time), CAST(N'10:00:00' AS Time))
INSERT [dbo].[Subjects] ([id], [subject], [creditHour], [code], [isActive], [deptId_FK], [preSubjectId_FK], [day], [totime], [fromtime]) VALUES (5, N'Mathematical Analysis (3)', 4, N'M211      ', 1, 1, 5, N'Tuesday   ', CAST(N'11:00:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Subjects] ([id], [subject], [creditHour], [code], [isActive], [deptId_FK], [preSubjectId_FK], [day], [totime], [fromtime]) VALUES (6, N'Mathematical Analysis (4)', 2.5, N'M211      ', 1, 1, 6, N'Tuesday   ', CAST(N'12:00:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Subjects] ([id], [subject], [creditHour], [code], [isActive], [deptId_FK], [preSubjectId_FK], [day], [totime], [fromtime]) VALUES (7, N'Structured programming', 4, N'M1312     ', 1, 1, 7, N'Saturday  ', CAST(N'11:00:00' AS Time), CAST(N'08:00:00' AS Time))
INSERT [dbo].[Subjects] ([id], [subject], [creditHour], [code], [isActive], [deptId_FK], [preSubjectId_FK], [day], [totime], [fromtime]) VALUES (8, N'Structured programming', 4, N'M1312     ', 1, 2, 8, N'Saturday  ', CAST(N'10:00:00' AS Time), CAST(N'08:00:00' AS Time))
INSERT [dbo].[Subjects] ([id], [subject], [creditHour], [code], [isActive], [deptId_FK], [preSubjectId_FK], [day], [totime], [fromtime]) VALUES (9, N'Athletic methods', 2.5, N'M2217     ', 1, 2, 9, N'Saturday  ', CAST(N'11:30:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Subjects] ([id], [subject], [creditHour], [code], [isActive], [deptId_FK], [preSubjectId_FK], [day], [totime], [fromtime]) VALUES (10, N'lieaner programming', 2.5, N'm127o     ', 1, 1, 10, N'Tuesday   ', CAST(N'17:00:00' AS Time), CAST(N'15:00:00' AS Time))
INSERT [dbo].[Subjects] ([id], [subject], [creditHour], [code], [isActive], [deptId_FK], [preSubjectId_FK], [day], [totime], [fromtime]) VALUES (11, N'lieaner programming', 4, N'plsc      ', 1, 1, 11, N'wensday   ', CAST(N'13:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Subjects] ([id], [subject], [creditHour], [code], [isActive], [deptId_FK], [preSubjectId_FK], [day], [totime], [fromtime]) VALUES (12, N'unlieaner programming', 3, N'knd       ', 1, 1, 12, N'Tuesday   ', CAST(N'13:00:00' AS Time), CAST(N'12:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Subjects] OFF
ALTER TABLE [dbo].[Depts]  WITH CHECK ADD  CONSTRAINT [FK_Depts_Professors] FOREIGN KEY([headId_FK])
REFERENCES [dbo].[Professors] ([id])
GO
ALTER TABLE [dbo].[Depts] CHECK CONSTRAINT [FK_Depts_Professors]
GO
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Gender] FOREIGN KEY([genderId_FK])
REFERENCES [dbo].[Gender] ([id])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_Professors_Gender]
GO
ALTER TABLE [dbo].[ProfessorSubject]  WITH CHECK ADD  CONSTRAINT [FK_ProfessorSubject_Professors] FOREIGN KEY([professorId_FK])
REFERENCES [dbo].[Professors] ([id])
GO
ALTER TABLE [dbo].[ProfessorSubject] CHECK CONSTRAINT [FK_ProfessorSubject_Professors]
GO
ALTER TABLE [dbo].[ProfessorSubject]  WITH CHECK ADD  CONSTRAINT [FK_ProfessorSubject_Subjects] FOREIGN KEY([subjectId_Fk])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[ProfessorSubject] CHECK CONSTRAINT [FK_ProfessorSubject_Subjects]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Depts] FOREIGN KEY([deptId_Fk])
REFERENCES [dbo].[Depts] ([id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Depts]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Gender] FOREIGN KEY([genderId_FK])
REFERENCES [dbo].[Gender] ([id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Gender]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Levels] FOREIGN KEY([levelId_FK])
REFERENCES [dbo].[Levels] ([id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Levels]
GO
ALTER TABLE [dbo].[StudentSubjects]  WITH CHECK ADD  CONSTRAINT [FK_StudentSubjects_Students] FOREIGN KEY([studentId_Fk])
REFERENCES [dbo].[Students] ([id])
GO
ALTER TABLE [dbo].[StudentSubjects] CHECK CONSTRAINT [FK_StudentSubjects_Students]
GO
ALTER TABLE [dbo].[StudentSubjects]  WITH CHECK ADD  CONSTRAINT [FK_StudentSubjects_Subjects] FOREIGN KEY([subjectId_FK])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[StudentSubjects] CHECK CONSTRAINT [FK_StudentSubjects_Subjects]
GO
ALTER TABLE [dbo].[Subjects]  WITH CHECK ADD  CONSTRAINT [FK_Subjects_Depts] FOREIGN KEY([deptId_FK])
REFERENCES [dbo].[Depts] ([id])
GO
ALTER TABLE [dbo].[Subjects] CHECK CONSTRAINT [FK_Subjects_Depts]
GO
ALTER TABLE [dbo].[Subjects]  WITH CHECK ADD  CONSTRAINT [FK_Subjects_Subjects] FOREIGN KEY([preSubjectId_FK])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Subjects] CHECK CONSTRAINT [FK_Subjects_Subjects]
GO
USE [master]
GO
ALTER DATABASE [MyCollege] SET  READ_WRITE 
GO
