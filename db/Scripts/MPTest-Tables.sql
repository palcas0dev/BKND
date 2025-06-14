USE [mptest]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_sec_perfil_permisos]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_sec_perfil_permisos] DROP CONSTRAINT IF EXISTS [FK_tbl_sec_perfil_permisos_tbl_sec_permisos]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_sec_perfil_permisos]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_sec_perfil_permisos] DROP CONSTRAINT IF EXISTS [FK_tbl_sec_perfil_permisos_tbl_admin_perfiles]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_sec_perfil_gestion]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_sec_perfil_gestion] DROP CONSTRAINT IF EXISTS [FK_tbl_sec_perfil_gestion_tbl_cat_gestion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_sec_perfil_gestion]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_sec_perfil_gestion] DROP CONSTRAINT IF EXISTS [FK_tbl_sec_perfil_gestion_tbl_admin_perfiles]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_neg_expediente_gestion]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_neg_expediente_gestion] DROP CONSTRAINT IF EXISTS [FK_tbl_neg_expediente_gestion_tbl_neg_expediente]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_neg_expediente_gestion]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_neg_expediente_gestion] DROP CONSTRAINT IF EXISTS [FK_tbl_neg_expediente_gestion_tbl_cat_gestion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_neg_expediente_gestion]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_neg_expediente_gestion] DROP CONSTRAINT IF EXISTS [FK_tbl_neg_expediente_gestion_tbl_admin_usuarios]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_neg_expediente]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_neg_expediente] DROP CONSTRAINT IF EXISTS [FK_tbl_neg_expediente_tbl_admin_usuarios]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_admin_usuarios]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_admin_usuarios] DROP CONSTRAINT IF EXISTS [FK_tbl_admin_usuarios_tbl_admin_perfiles]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_admin_sesion]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_admin_sesion] DROP CONSTRAINT IF EXISTS [FK_tbl_admin_sesion_tbl_admin_usuarios]
GO
/****** Object:  Table [dbo].[tbl_sec_permisos]    Script Date: 8/06/2025 15:11:16 ******/
DROP TABLE IF EXISTS [dbo].[tbl_sec_permisos]
GO
/****** Object:  Table [dbo].[tbl_sec_perfil_permisos]    Script Date: 8/06/2025 15:11:16 ******/
DROP TABLE IF EXISTS [dbo].[tbl_sec_perfil_permisos]
GO
/****** Object:  Table [dbo].[tbl_sec_perfil_gestion]    Script Date: 8/06/2025 15:11:16 ******/
DROP TABLE IF EXISTS [dbo].[tbl_sec_perfil_gestion]
GO
/****** Object:  Table [dbo].[tbl_neg_expediente_gestion]    Script Date: 8/06/2025 15:11:16 ******/
DROP TABLE IF EXISTS [dbo].[tbl_neg_expediente_gestion]
GO
/****** Object:  Table [dbo].[tbl_neg_expediente]    Script Date: 8/06/2025 15:11:16 ******/
DROP TABLE IF EXISTS [dbo].[tbl_neg_expediente]
GO
/****** Object:  Table [dbo].[tbl_cat_gestion]    Script Date: 8/06/2025 15:11:16 ******/
DROP TABLE IF EXISTS [dbo].[tbl_cat_gestion]
GO
/****** Object:  Table [dbo].[tbl_admin_usuarios]    Script Date: 8/06/2025 15:11:16 ******/
DROP TABLE IF EXISTS [dbo].[tbl_admin_usuarios]
GO
/****** Object:  Table [dbo].[tbl_admin_sesion]    Script Date: 8/06/2025 15:11:16 ******/
DROP TABLE IF EXISTS [dbo].[tbl_admin_sesion]
GO
/****** Object:  Table [dbo].[tbl_admin_perfiles]    Script Date: 8/06/2025 15:11:16 ******/
DROP TABLE IF EXISTS [dbo].[tbl_admin_perfiles]
GO
/****** Object:  Table [dbo].[tbl_admin_perfiles]    Script Date: 8/06/2025 15:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_admin_perfiles](
	[TAP_ID] [int] IDENTITY(1,1) NOT NULL,
	[tap_nombre] [varchar](100) NOT NULL,
	[tap_descripcion] [varchar](max) NULL,
	[updatedAt] [datetime] NULL,
	[createdAt] [datetime] NULL,
	[updatedBy] [varchar](100) NULL,
	[createdBy] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_admin_perfiles] PRIMARY KEY CLUSTERED 
(
	[TAP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_admin_sesion]    Script Date: 8/06/2025 15:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_admin_sesion](
	[TAS_ID] [int] IDENTITY(1,1) NOT NULL,
	[TAU_ID] [int] NOT NULL,
	[tas_inicio] [datetime] NOT NULL,
	[tas_final] [datetime] NULL,
	[tas_token] [varchar](max) NOT NULL,
	[updatedAt] [datetime] NULL,
	[createdAt] [datetime] NULL,
	[updatedBy] [varchar](100) NULL,
	[createdBy] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_admin_sesion] PRIMARY KEY CLUSTERED 
(
	[TAS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_admin_usuarios]    Script Date: 8/06/2025 15:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_admin_usuarios](
	[TAU_ID] [int] IDENTITY(1,1) NOT NULL,
	[TAP_ID] [int] NOT NULL,
	[tau_login] [varchar](100) NOT NULL,
	[tau_nombre] [varchar](500) NOT NULL,
	[tau_pass] [varchar](max) NOT NULL,
	[tau_activo] [varchar](1) NOT NULL,
	[updatedAt] [datetime] NULL,
	[createdAt] [datetime] NULL,
	[updatedBy] [varchar](100) NULL,
	[createdBy] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_admin_usuarios] PRIMARY KEY CLUSTERED 
(
	[TAU_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_cat_gestion]    Script Date: 8/06/2025 15:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cat_gestion](
	[TCG_ID] [int] IDENTITY(1,1) NOT NULL,
	[tcg_codigo] [varchar](10) NOT NULL,
	[tcg_nombre] [varchar](500) NOT NULL,
	[tcg_descripcion] [varchar](max) NOT NULL,
	[tcg_activa] [varchar](1) NOT NULL,
	[tcg_cambia_estado] [varchar](100) NULL,
	[tcg_tipo] [varchar](100) NULL,
	[updatedAt] [datetime] NULL,
	[createdAt] [datetime] NULL,
	[updatedBy] [varchar](100) NULL,
	[createdBy] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_cat_gestion] PRIMARY KEY CLUSTERED 
(
	[TCG_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_neg_expediente]    Script Date: 8/06/2025 15:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_neg_expediente](
	[TNE_ID] [int] IDENTITY(1,1) NOT NULL,
	[TAU_ID] [int] NOT NULL,
	[tne_nombre_fiscal] [varchar](max) NULL,
	[tne_codigo] [varchar](100) NOT NULL,
	[tne_fecha_recepcion] [datetime] NOT NULL,
	[tne_titulo] [varchar](max) NOT NULL,
	[tne_descripcion] [varchar](max) NOT NULL,
	[tne_estado] [varchar](100) NOT NULL,
	[updatedAt] [datetime] NULL,
	[createdAt] [datetime] NULL,
	[updatedBy] [varchar](100) NULL,
	[createdBy] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_neg_expediente] PRIMARY KEY CLUSTERED 
(
	[TNE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_neg_expediente_gestion]    Script Date: 8/06/2025 15:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_neg_expediente_gestion](
	[TNEG_ID] [int] IDENTITY(1,1) NOT NULL,
	[TNE_ID] [int] NOT NULL,
	[TCG_ID] [int] NOT NULL,
	[TAU_ID] [int] NOT NULL,
	[tneg_fecha_gestion] [datetime] NOT NULL,
	[tneg_mensaje] [varchar](max) NULL,
	[tneg_info] [varchar](max) NULL,
	[tneg_estado] [varchar](100) NULL,
	[updatedAt] [datetime] NULL,
	[createdAt] [datetime] NULL,
	[updatedBy] [varchar](100) NULL,
	[createdBy] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_neg_expediente_gestion] PRIMARY KEY CLUSTERED 
(
	[TNEG_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_sec_perfil_gestion]    Script Date: 8/06/2025 15:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_sec_perfil_gestion](
	[TSPG_ID] [int] IDENTITY(1,1) NOT NULL,
	[TCG_ID] [int] NOT NULL,
	[TAP_ID] [int] NOT NULL,
	[updatedAt] [datetime] NULL,
	[createdAt] [datetime] NULL,
	[updatedBy] [varchar](100) NULL,
	[createdBy] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_sec_perfil_gestion] PRIMARY KEY CLUSTERED 
(
	[TSPG_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_sec_perfil_permisos]    Script Date: 8/06/2025 15:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_sec_perfil_permisos](
	[TSPP_ID] [int] IDENTITY(1,1) NOT NULL,
	[TSP_ID] [int] NOT NULL,
	[TAP_ID] [int] NOT NULL,
	[updatedAt] [datetime] NULL,
	[createdAt] [datetime] NULL,
	[updatedBy] [varchar](100) NULL,
	[createdBy] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_sec_perfil_permisos] PRIMARY KEY CLUSTERED 
(
	[TSPP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_sec_permisos]    Script Date: 8/06/2025 15:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_sec_permisos](
	[TSP_ID] [int] IDENTITY(1,1) NOT NULL,
	[tsp_nombre] [varchar](max) NOT NULL,
	[tsp_endpoint] [varchar](max) NOT NULL,
	[tsp_descripcion] [varchar](max) NOT NULL,
	[tsp_activo] [varchar](1) NOT NULL,
	[updatedAt] [datetime] NULL,
	[createdAt] [datetime] NULL,
	[updatedBy] [varchar](100) NULL,
	[createdBy] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_sec_permisos] PRIMARY KEY CLUSTERED 
(
	[TSP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_admin_perfiles] ON 

INSERT [dbo].[tbl_admin_perfiles] ([TAP_ID], [tap_nombre], [tap_descripcion], [updatedAt], [createdAt], [updatedBy], [createdBy]) VALUES (1, N'Administrador', N'Permisos nivel 0 (Acceso Total))', NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_admin_perfiles] ([TAP_ID], [tap_nombre], [tap_descripcion], [updatedAt], [createdAt], [updatedBy], [createdBy]) VALUES (2, N'Nivel 1', N'Acceso de Nivel 1', CAST(N'2021-10-05T03:48:39.000' AS DateTime), NULL, N'2021-10-05 03:48:39', NULL)
INSERT [dbo].[tbl_admin_perfiles] ([TAP_ID], [tap_nombre], [tap_descripcion], [updatedAt], [createdAt], [updatedBy], [createdBy]) VALUES (3, N'Nivel 2', N'Acceso de nivel 2', CAST(N'2021-10-05T03:49:09.000' AS DateTime), NULL, N'2021-10-05 03:49:09', NULL)
SET IDENTITY_INSERT [dbo].[tbl_admin_perfiles] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_admin_sesion] ON 

INSERT [dbo].[tbl_admin_sesion] ([TAS_ID], [TAU_ID], [tas_inicio], [tas_final], [tas_token], [updatedAt], [createdAt], [updatedBy], [createdBy]) VALUES (1, 3, CAST(N'2025-06-08T11:29:43.450' AS DateTime), CAST(N'2025-06-08T11:29:57.687' AS DateTime), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjMsImlhdCI6MTc0OTQwMzc4MywiZXhwIjoxNzQ5NDE4MTgzfQ.miyXelXp33-GwDOs4WrFofg0LkCuxfReYUM5wxoESjg', CAST(N'2025-06-08T11:29:57.687' AS DateTime), CAST(N'2025-06-08T11:29:43.450' AS DateTime), N'admin', N'admin')
INSERT [dbo].[tbl_admin_sesion] ([TAS_ID], [TAU_ID], [tas_inicio], [tas_final], [tas_token], [updatedAt], [createdAt], [updatedBy], [createdBy]) VALUES (2, 3, CAST(N'2025-06-08T11:29:57.690' AS DateTime), CAST(N'2025-06-08T11:48:55.163' AS DateTime), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjMsImlhdCI6MTc0OTQwMzc5NywiZXhwIjoxNzQ5NDE4MTk3fQ.1trFuwRH3wouthNFlUB1mAx0phQ4LZjLrwlWkMMh4Ng', CAST(N'2025-06-08T11:48:55.163' AS DateTime), CAST(N'2025-06-08T11:29:57.690' AS DateTime), N'admin', N'admin')
INSERT [dbo].[tbl_admin_sesion] ([TAS_ID], [TAU_ID], [tas_inicio], [tas_final], [tas_token], [updatedAt], [createdAt], [updatedBy], [createdBy]) VALUES (3, 3, CAST(N'2025-06-08T11:48:55.167' AS DateTime), CAST(N'2025-06-08T12:03:27.170' AS DateTime), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjMsImlhdCI6MTc0OTQwNDkzNSwiZXhwIjoxNzQ5NDE5MzM1fQ.y75llha6fKATZRpRrOHveEb9voRA0C3zrdSwihwL42E', CAST(N'2025-06-08T12:03:27.170' AS DateTime), CAST(N'2025-06-08T11:48:55.167' AS DateTime), N'admin', N'admin')
INSERT [dbo].[tbl_admin_sesion] ([TAS_ID], [TAU_ID], [tas_inicio], [tas_final], [tas_token], [updatedAt], [createdAt], [updatedBy], [createdBy]) VALUES (4, 3, CAST(N'2025-06-08T14:38:16.297' AS DateTime), NULL, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjMsImlhdCI6MTc0OTQxNTA5NiwiZXhwIjoxNzQ5NDI5NDk2fQ.688GO51buahhfMfuDWQ3xqeg1ZIl7AbUJTh8grCDm8A', NULL, CAST(N'2025-06-08T14:38:16.297' AS DateTime), NULL, N'admin')
SET IDENTITY_INSERT [dbo].[tbl_admin_sesion] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_admin_usuarios] ON 

INSERT [dbo].[tbl_admin_usuarios] ([TAU_ID], [TAP_ID], [tau_login], [tau_nombre], [tau_pass], [tau_activo], [updatedAt], [createdAt], [updatedBy], [createdBy]) VALUES (3, 1, N'admin', N'sysadmin', N'$2b$10$KrJEUDrDyxKEdBpTOYsuku7aoyl5NAuQFEgwENX8DA46kDcDWf2FC', N'S', NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_admin_usuarios] ([TAU_ID], [TAP_ID], [tau_login], [tau_nombre], [tau_pass], [tau_activo], [updatedAt], [createdAt], [updatedBy], [createdBy]) VALUES (5, 2, N'juan', N'juan perez', N'$2b$10$KrJEUDrDyxKEdBpTOYsuku7aoyl5NAuQFEgwENX8DA46kDcDWf2FC', N'S', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_admin_usuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_cat_gestion] ON 

INSERT [dbo].[tbl_cat_gestion] ([TCG_ID], [tcg_codigo], [tcg_nombre], [tcg_descripcion], [tcg_activa], [tcg_cambia_estado], [tcg_tipo], [updatedAt], [createdAt], [updatedBy], [createdBy]) VALUES (2, N'N00', N'Nuevo Expediente', N'gestion para nuevo expediente', N'S', N'DISPONIBLE', N'ENTRADA', NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_cat_gestion] ([TCG_ID], [tcg_codigo], [tcg_nombre], [tcg_descripcion], [tcg_activa], [tcg_cambia_estado], [tcg_tipo], [updatedAt], [createdAt], [updatedBy], [createdBy]) VALUES (3, N'I00', N'Ingreso Expediente', N'gestion para ingreso de expediente', N'S', N'DISPONIBLE', N'ENTRADA', NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_cat_gestion] ([TCG_ID], [tcg_codigo], [tcg_nombre], [tcg_descripcion], [tcg_activa], [tcg_cambia_estado], [tcg_tipo], [updatedAt], [createdAt], [updatedBy], [createdBy]) VALUES (4, N'O00', N'Salida de Expediente', N'gestion de salida de Expediente', N'S', N'NO DISPONIBLE', N'SALIDA', NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_cat_gestion] ([TCG_ID], [tcg_codigo], [tcg_nombre], [tcg_descripcion], [tcg_activa], [tcg_cambia_estado], [tcg_tipo], [updatedAt], [createdAt], [updatedBy], [createdBy]) VALUES (6, N'O01', N'Salida por Prestamo', N'gestion de salida por prestamo de expdiente', N'S', N'PRESTAMO', N'SALIDA', NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_cat_gestion] ([TCG_ID], [tcg_codigo], [tcg_nombre], [tcg_descripcion], [tcg_activa], [tcg_cambia_estado], [tcg_tipo], [updatedAt], [createdAt], [updatedBy], [createdBy]) VALUES (9, N'I01', N'Devolucion de expediente ', N'gestion para ingreso de expediente por prestamo', N'S', N'DISPONIBLE', N'ENTRADA', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_cat_gestion] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_neg_expediente] ON 

INSERT [dbo].[tbl_neg_expediente] ([TNE_ID], [TAU_ID], [tne_nombre_fiscal], [tne_codigo], [tne_fecha_recepcion], [tne_titulo], [tne_descripcion], [tne_estado], [updatedAt], [createdAt], [updatedBy], [createdBy]) VALUES (2, 3, N'Jose Julian Dominguez', N'20250608-00001', CAST(N'2025-06-08T00:00:00.000' AS DateTime), N'expediente prueba 1', N'expediente para pruebas 1', N'DISPONIBLE', NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_neg_expediente] ([TNE_ID], [TAU_ID], [tne_nombre_fiscal], [tne_codigo], [tne_fecha_recepcion], [tne_titulo], [tne_descripcion], [tne_estado], [updatedAt], [createdAt], [updatedBy], [createdBy]) VALUES (3, 3, N'Ana Figueroa', N'20250608-00002', CAST(N'2025-06-08T00:00:00.000' AS DateTime), N'exp2', N'expediente 2', N'DISPONIBLE', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_neg_expediente] OFF
GO
ALTER TABLE [dbo].[tbl_admin_sesion]  WITH CHECK ADD  CONSTRAINT [FK_tbl_admin_sesion_tbl_admin_usuarios] FOREIGN KEY([TAU_ID])
REFERENCES [dbo].[tbl_admin_usuarios] ([TAU_ID])
GO
ALTER TABLE [dbo].[tbl_admin_sesion] CHECK CONSTRAINT [FK_tbl_admin_sesion_tbl_admin_usuarios]
GO
ALTER TABLE [dbo].[tbl_admin_usuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbl_admin_usuarios_tbl_admin_perfiles] FOREIGN KEY([TAP_ID])
REFERENCES [dbo].[tbl_admin_perfiles] ([TAP_ID])
GO
ALTER TABLE [dbo].[tbl_admin_usuarios] CHECK CONSTRAINT [FK_tbl_admin_usuarios_tbl_admin_perfiles]
GO
ALTER TABLE [dbo].[tbl_neg_expediente]  WITH CHECK ADD  CONSTRAINT [FK_tbl_neg_expediente_tbl_admin_usuarios] FOREIGN KEY([TAU_ID])
REFERENCES [dbo].[tbl_admin_usuarios] ([TAU_ID])
GO
ALTER TABLE [dbo].[tbl_neg_expediente] CHECK CONSTRAINT [FK_tbl_neg_expediente_tbl_admin_usuarios]
GO
ALTER TABLE [dbo].[tbl_neg_expediente_gestion]  WITH CHECK ADD  CONSTRAINT [FK_tbl_neg_expediente_gestion_tbl_admin_usuarios] FOREIGN KEY([TAU_ID])
REFERENCES [dbo].[tbl_admin_usuarios] ([TAU_ID])
GO
ALTER TABLE [dbo].[tbl_neg_expediente_gestion] CHECK CONSTRAINT [FK_tbl_neg_expediente_gestion_tbl_admin_usuarios]
GO
ALTER TABLE [dbo].[tbl_neg_expediente_gestion]  WITH CHECK ADD  CONSTRAINT [FK_tbl_neg_expediente_gestion_tbl_cat_gestion] FOREIGN KEY([TCG_ID])
REFERENCES [dbo].[tbl_cat_gestion] ([TCG_ID])
GO
ALTER TABLE [dbo].[tbl_neg_expediente_gestion] CHECK CONSTRAINT [FK_tbl_neg_expediente_gestion_tbl_cat_gestion]
GO
ALTER TABLE [dbo].[tbl_neg_expediente_gestion]  WITH CHECK ADD  CONSTRAINT [FK_tbl_neg_expediente_gestion_tbl_neg_expediente] FOREIGN KEY([TNE_ID])
REFERENCES [dbo].[tbl_neg_expediente] ([TNE_ID])
GO
ALTER TABLE [dbo].[tbl_neg_expediente_gestion] CHECK CONSTRAINT [FK_tbl_neg_expediente_gestion_tbl_neg_expediente]
GO
ALTER TABLE [dbo].[tbl_sec_perfil_gestion]  WITH CHECK ADD  CONSTRAINT [FK_tbl_sec_perfil_gestion_tbl_admin_perfiles] FOREIGN KEY([TAP_ID])
REFERENCES [dbo].[tbl_admin_perfiles] ([TAP_ID])
GO
ALTER TABLE [dbo].[tbl_sec_perfil_gestion] CHECK CONSTRAINT [FK_tbl_sec_perfil_gestion_tbl_admin_perfiles]
GO
ALTER TABLE [dbo].[tbl_sec_perfil_gestion]  WITH CHECK ADD  CONSTRAINT [FK_tbl_sec_perfil_gestion_tbl_cat_gestion] FOREIGN KEY([TCG_ID])
REFERENCES [dbo].[tbl_cat_gestion] ([TCG_ID])
GO
ALTER TABLE [dbo].[tbl_sec_perfil_gestion] CHECK CONSTRAINT [FK_tbl_sec_perfil_gestion_tbl_cat_gestion]
GO
ALTER TABLE [dbo].[tbl_sec_perfil_permisos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_sec_perfil_permisos_tbl_admin_perfiles] FOREIGN KEY([TAP_ID])
REFERENCES [dbo].[tbl_admin_perfiles] ([TAP_ID])
GO
ALTER TABLE [dbo].[tbl_sec_perfil_permisos] CHECK CONSTRAINT [FK_tbl_sec_perfil_permisos_tbl_admin_perfiles]
GO
ALTER TABLE [dbo].[tbl_sec_perfil_permisos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_sec_perfil_permisos_tbl_sec_permisos] FOREIGN KEY([TSP_ID])
REFERENCES [dbo].[tbl_sec_permisos] ([TSP_ID])
GO
ALTER TABLE [dbo].[tbl_sec_perfil_permisos] CHECK CONSTRAINT [FK_tbl_sec_perfil_permisos_tbl_sec_permisos]
GO
