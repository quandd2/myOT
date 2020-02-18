USE [MyOT]
GO
/****** Object:  Table [dbo].[OT_History]    Script Date: 2/18/2020 10:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OT_History](
	[Email] [nvarchar](50) NULL,
	[ID] [int] NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[StaffID] [nvarchar](50) NULL,
	[Date] [nchar](10) NULL,
	[StartTime] [nvarchar](50) NULL,
	[EndTime] [nvarchar](50) NULL,
	[Hours] [float] NULL,
	[AdditionalNote] [nvarchar](1050) NULL,
	[Address] [nvarchar](100) NULL,
	[FileCode] [int] NULL,
	[Status] [int] NULL,
	[DateChange] [datetime] NULL,
	[DateInit] [datetime] NULL,
	[ID_OT_Monthly] [int] NULL,
	[FlagOver10] [int] NULL,
 CONSTRAINT [PK_OT_History] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OT_Monthly]    Script Date: 2/18/2020 10:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OT_Monthly](
	[ID_OT_Monthly] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[HourOver10Percent] [float] NULL,
	[TeamRule] [int] NULL,
	[DateOpen] [datetime] NULL,
	[ExpDateSubmit] [datetime] NULL,
	[AliasTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_OT_Monthly] PRIMARY KEY CLUSTERED 
(
	[ID_OT_Monthly] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 2/18/2020 10:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Email] [nvarchar](50) NOT NULL,
	[IDStaff] [nvarchar](10) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[GroupTeamID] [int] NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[Status] [int] NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[OT_Monthly] ON 

INSERT [dbo].[OT_Monthly] ([ID_OT_Monthly], [Name], [Title], [HourOver10Percent], [TeamRule], [DateOpen], [ExpDateSubmit], [AliasTime]) VALUES (1, N'OT THÁNG 02/2020', N'OverTime Tháng 02/2020', 18, 1, CAST(0x0000AB64018733D5 AS DateTime), CAST(0x0000AB65018733D5 AS DateTime), N'202002')
SET IDENTITY_INSERT [dbo].[OT_Monthly] OFF
INSERT [dbo].[User] ([Email], [IDStaff], [FullName], [GroupTeamID], [Password], [Status], [RoleID]) VALUES (N'quandd@vpbank.com.vn ', N'205167', N'Đỗ Đại Quân', 21, N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 2, NULL)
