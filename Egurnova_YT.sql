USE [YP_Egurnova]
GO
/****** Object:  User [YT_Technicians]    Script Date: 13.11.2024 2:12:07 ******/
CREATE USER [YT_Technicians] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [YT_Clients]    Script Date: 13.11.2024 2:12:07 ******/
CREATE USER [YT_Clients] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [YT_Admin]    Script Date: 13.11.2024 2:12:07 ******/
CREATE USER [YT_Admin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 13.11.2024 2:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[ClientFirstname] [nvarchar](100) NULL,
	[ClientLastname] [nvarchar](100) NULL,
	[ClientMiddlename] [nvarchar](100) NOT NULL,
	[ContactInfo] [nvarchar](255) NULL,
 CONSTRAINT [PK__Clients__E67E1A0431B00145] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 13.11.2024 2:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[RequestID] [int] NULL,
	[TechnicianID] [int] NULL,
	[CommentText] [nvarchar](max) NULL,
	[CommentDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 13.11.2024 2:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[EquipmentID] [int] IDENTITY(1,1) NOT NULL,
	[SerialNumber] [nvarchar](50) NULL,
	[EquipmentTypeID] [int] NOT NULL,
 CONSTRAINT [PK__Equipmen__344745999B622ED3] PRIMARY KEY CLUSTERED 
(
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquipmentType]    Script Date: 13.11.2024 2:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipmentType](
	[EquipmentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EquipmentType] PRIMARY KEY CLUSTERED 
(
	[EquipmentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FaultType]    Script Date: 13.11.2024 2:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaultType](
	[FaultTypeID] [int] IDENTITY(1,1) NOT NULL,
	[FaultTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_FaultType] PRIMARY KEY CLUSTERED 
(
	[FaultTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 13.11.2024 2:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[RequestDate] [datetime] NULL,
	[EquipmentID] [int] NULL,
	[FaultTypeID] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ClientID] [int] NULL,
	[StatusID] [int] NULL,
 CONSTRAINT [PK__Requests__33A8519A7A3EE5A3] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusType]    Script Date: 13.11.2024 2:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusType](
	[StatusID] [int] NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Technicians]    Script Date: 13.11.2024 2:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Technicians](
	[TechnicianID] [int] IDENTITY(1,1) NOT NULL,
	[TechnicianFirstname] [nvarchar](100) NULL,
	[TechnicianLastname] [nvarchar](100) NULL,
	[TechnicianMiddlename] [nvarchar](100) NULL,
	[ContactInfo] [nvarchar](255) NULL,
 CONSTRAINT [PK__Technici__301F82C183D4DD32] PRIMARY KEY CLUSTERED 
(
	[TechnicianID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ClientID], [ClientFirstname], [ClientLastname], [ClientMiddlename], [ContactInfo]) VALUES (1, N'Иван', N'Иванов', N'Иванович', N'ivanov@example.com')
INSERT [dbo].[Clients] ([ClientID], [ClientFirstname], [ClientLastname], [ClientMiddlename], [ContactInfo]) VALUES (2, N'Петр', N'Петров', N'Петрович', N'petrov@example.com')
INSERT [dbo].[Clients] ([ClientID], [ClientFirstname], [ClientLastname], [ClientMiddlename], [ContactInfo]) VALUES (3, N'Сидор', N'Сидоров', N'Сидорович', N'sidorov@example.com')
INSERT [dbo].[Clients] ([ClientID], [ClientFirstname], [ClientLastname], [ClientMiddlename], [ContactInfo]) VALUES (4, N'Алексей', N'Алексеев', N'Алексеевич', N'alekseev@example.com')
INSERT [dbo].[Clients] ([ClientID], [ClientFirstname], [ClientLastname], [ClientMiddlename], [ContactInfo]) VALUES (5, N'Дмитрий', N'Дмитриев', N'Дмитриевич', N'dmitriev@example.com')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([CommentID], [RequestID], [TechnicianID], [CommentText], [CommentDate]) VALUES (1, 1, 1, N'Проверил питание.', CAST(N'2024-11-13T01:51:39.433' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [RequestID], [TechnicianID], [CommentText], [CommentDate]) VALUES (2, 2, 2, N'Заменил картридж.', CAST(N'2024-11-13T01:51:39.433' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [RequestID], [TechnicianID], [CommentText], [CommentDate]) VALUES (3, 3, 3, N'Обновил драйвера.', CAST(N'2024-11-13T01:51:39.433' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [RequestID], [TechnicianID], [CommentText], [CommentDate]) VALUES (4, 4, 4, N'Проблема в роутере.', CAST(N'2024-11-13T01:51:39.433' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [RequestID], [TechnicianID], [CommentText], [CommentDate]) VALUES (5, 5, 5, N'Проверил настройки звука.', CAST(N'2024-11-13T01:51:39.433' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Equipment] ON 

INSERT [dbo].[Equipment] ([EquipmentID], [SerialNumber], [EquipmentTypeID]) VALUES (1, N'SN123456', 1)
INSERT [dbo].[Equipment] ([EquipmentID], [SerialNumber], [EquipmentTypeID]) VALUES (2, N'SN654321', 2)
INSERT [dbo].[Equipment] ([EquipmentID], [SerialNumber], [EquipmentTypeID]) VALUES (3, N'SN789012', 3)
INSERT [dbo].[Equipment] ([EquipmentID], [SerialNumber], [EquipmentTypeID]) VALUES (4, N'SN345678', 4)
INSERT [dbo].[Equipment] ([EquipmentID], [SerialNumber], [EquipmentTypeID]) VALUES (5, N'SN987654', 5)
SET IDENTITY_INSERT [dbo].[Equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[EquipmentType] ON 

INSERT [dbo].[EquipmentType] ([EquipmentTypeID], [EquipmentName]) VALUES (1, N'Компьютер')
INSERT [dbo].[EquipmentType] ([EquipmentTypeID], [EquipmentName]) VALUES (2, N'Принтер')
INSERT [dbo].[EquipmentType] ([EquipmentTypeID], [EquipmentName]) VALUES (3, N'Сканер')
INSERT [dbo].[EquipmentType] ([EquipmentTypeID], [EquipmentName]) VALUES (4, N'Ноутбук')
INSERT [dbo].[EquipmentType] ([EquipmentTypeID], [EquipmentName]) VALUES (5, N'Мобильный телефон')
SET IDENTITY_INSERT [dbo].[EquipmentType] OFF
GO
SET IDENTITY_INSERT [dbo].[FaultType] ON 

INSERT [dbo].[FaultType] ([FaultTypeID], [FaultTypeName]) VALUES (1, N'Не включается')
INSERT [dbo].[FaultType] ([FaultTypeID], [FaultTypeName]) VALUES (2, N'Ошибка печати')
INSERT [dbo].[FaultType] ([FaultTypeID], [FaultTypeName]) VALUES (3, N'Зависание системы')
INSERT [dbo].[FaultType] ([FaultTypeID], [FaultTypeName]) VALUES (4, N'Проблема с сетью')
INSERT [dbo].[FaultType] ([FaultTypeID], [FaultTypeName]) VALUES (5, N'Не работает звук')
SET IDENTITY_INSERT [dbo].[FaultType] OFF
GO
SET IDENTITY_INSERT [dbo].[Requests] ON 

INSERT [dbo].[Requests] ([RequestID], [RequestDate], [EquipmentID], [FaultTypeID], [Description], [ClientID], [StatusID]) VALUES (1, CAST(N'2024-11-13T01:51:39.433' AS DateTime), 1, 1, N'Компьютер не включается.', 1, 1)
INSERT [dbo].[Requests] ([RequestID], [RequestDate], [EquipmentID], [FaultTypeID], [Description], [ClientID], [StatusID]) VALUES (2, CAST(N'2024-11-13T01:51:39.433' AS DateTime), 2, 2, N'Ошибка при печати документа.', 2, 1)
INSERT [dbo].[Requests] ([RequestID], [RequestDate], [EquipmentID], [FaultTypeID], [Description], [ClientID], [StatusID]) VALUES (3, CAST(N'2024-11-13T01:51:39.433' AS DateTime), 3, 3, N'Сканер зависает при сканировании.', 3, 2)
INSERT [dbo].[Requests] ([RequestID], [RequestDate], [EquipmentID], [FaultTypeID], [Description], [ClientID], [StatusID]) VALUES (4, CAST(N'2024-11-13T01:51:39.433' AS DateTime), 4, 4, N'Нет доступа к сети.', 4, 2)
INSERT [dbo].[Requests] ([RequestID], [RequestDate], [EquipmentID], [FaultTypeID], [Description], [ClientID], [StatusID]) VALUES (5, CAST(N'2024-11-13T01:51:39.433' AS DateTime), 5, 5, N'Не работает звук на ноутбуке.', 5, 1)
SET IDENTITY_INSERT [dbo].[Requests] OFF
GO
INSERT [dbo].[StatusType] ([StatusID], [StatusName]) VALUES (1, N'Открыт')
INSERT [dbo].[StatusType] ([StatusID], [StatusName]) VALUES (2, N'В работе')
INSERT [dbo].[StatusType] ([StatusID], [StatusName]) VALUES (3, N'Закрыт')
INSERT [dbo].[StatusType] ([StatusID], [StatusName]) VALUES (4, N'Отложен')
INSERT [dbo].[StatusType] ([StatusID], [StatusName]) VALUES (5, N'Закрыт с комментариями')
GO
SET IDENTITY_INSERT [dbo].[Technicians] ON 

INSERT [dbo].[Technicians] ([TechnicianID], [TechnicianFirstname], [TechnicianLastname], [TechnicianMiddlename], [ContactInfo]) VALUES (1, N'Алексей', N'Алексеев', N'Алексеевич', N'alekseev@example.com')
INSERT [dbo].[Technicians] ([TechnicianID], [TechnicianFirstname], [TechnicianLastname], [TechnicianMiddlename], [ContactInfo]) VALUES (2, N'Дмитрий', N'Дмитриев', N'Дмитриевич', N'dmitriev@example.com')
INSERT [dbo].[Technicians] ([TechnicianID], [TechnicianFirstname], [TechnicianLastname], [TechnicianMiddlename], [ContactInfo]) VALUES (3, N'Сергей', N'Сергеев', N'Сергеевич', N'sergeev@example.com')
INSERT [dbo].[Technicians] ([TechnicianID], [TechnicianFirstname], [TechnicianLastname], [TechnicianMiddlename], [ContactInfo]) VALUES (4, N'Николай', N'Николаев', N'Николаевич', N'nikolaev@example.com')
INSERT [dbo].[Technicians] ([TechnicianID], [TechnicianFirstname], [TechnicianLastname], [TechnicianMiddlename], [ContactInfo]) VALUES (5, N'Владимир', N'Владимиров', N'Владимирович', N'vladimirov@example.com')
SET IDENTITY_INSERT [dbo].[Technicians] OFF
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (getdate()) FOR [CommentDate]
GO
ALTER TABLE [dbo].[Requests] ADD  CONSTRAINT [DF__Requests__Reques__5FB337D6]  DEFAULT (getdate()) FOR [RequestDate]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Requests] FOREIGN KEY([RequestID])
REFERENCES [dbo].[Requests] ([RequestID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Requests]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Technicians] FOREIGN KEY([TechnicianID])
REFERENCES [dbo].[Technicians] ([TechnicianID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Technicians]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_EquipmentType] FOREIGN KEY([EquipmentTypeID])
REFERENCES [dbo].[EquipmentType] ([EquipmentTypeID])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_EquipmentType]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Clients] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Clients]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Equipment] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[Equipment] ([EquipmentID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Equipment]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_FaultType] FOREIGN KEY([FaultTypeID])
REFERENCES [dbo].[FaultType] ([FaultTypeID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_FaultType]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_StatusType] FOREIGN KEY([StatusID])
REFERENCES [dbo].[StatusType] ([StatusID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_StatusType]
GO