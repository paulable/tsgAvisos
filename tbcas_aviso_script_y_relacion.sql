CREATE DATABASE [BDGEmpresa1TE]
GO
USE [BDGEmpresa1TE]
GO
/****** Object:  Table [dbo].[TBCAS_AVISO_ARCHIVO]    Script Date: 15/09/2020 09:13:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBCAS_AVISO_ARCHIVO](
	[EMPRESA_CODIGO] [varchar](4) NOT NULL,
	[AVISO_CODIGO] [numeric](18, 0) NOT NULL,
	[AVISO_ARCHIVO] [varchar](500) NULL,
	[AVISO_RUTA] [varchar](500) NULL,
	[AVISO_SYS_CRE] [varchar](20) NULL,
	[AVISO_SYS_EST] [varchar](1) NULL,
	[AVISOARCH_CODIGO] [numeric](18, 0) NOT NULL,
	[AVISOARCH_NROVECES] [numeric](18, 0) NULL,
 CONSTRAINT [PK_TBCAS_AVISO_ARCHIVO] PRIMARY KEY CLUSTERED 
(
	[EMPRESA_CODIGO] ASC,
	[AVISO_CODIGO] ASC,
	[AVISOARCH_CODIGO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBCAS_AVISO_COMENTARIO]    Script Date: 15/09/2020 09:13:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBCAS_AVISO_COMENTARIO](
	[EMPRESA_CODIGO] [varchar](4) NOT NULL,
	[AVISO_CODIGO] [numeric](18, 0) NOT NULL,
	[AVISOCOM_ID] [numeric](18, 0) NOT NULL,
	[AVISOCOM_USUARIO] [varchar](8) NULL,
	[AVISOCOM_COMENTARIO] [varchar](5000) NULL,
	[AVISOCOM_FECHA] [varchar](8) NULL,
	[AVISOCOM_HORA] [varchar](4) NULL,
	[AVISOCOM_SYS_EST] [varchar](1) NULL,
	[AVISOCOM_SYS_CRE] [varchar](20) NULL,
 CONSTRAINT [PK_TBCAS_AVISO_COMENTARIO_1] PRIMARY KEY CLUSTERED 
(
	[EMPRESA_CODIGO] ASC,
	[AVISO_CODIGO] ASC,
	[AVISOCOM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBCAS_AVISOS]    Script Date: 15/09/2020 09:13:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBCAS_AVISOS](
	[EMPRESA_CODIGO] [varchar](4) NOT NULL,
	[AVISO_NRO] [numeric](18, 0) NOT NULL,
	[AVISO_TIPO] [varchar](1) NULL,
	[AVISO_REGFECHA] [varchar](8) NULL,
	[AVISO_REGHORA] [varchar](6) NULL,
	[AVISO_PUBFECHA] [varchar](8) NULL,
	[AVISO_PUBHORA] [varchar](6) NULL,
	[AVISO_DESCRIPCION] [varchar](2000) NULL,
	[AVISO_ESTADO] [varchar](1) NULL,
	[AVISO_SYS_EST] [varchar](1) NULL,
	[AVISO_DETALLE] [varchar](2000) NULL,
 CONSTRAINT [PK_TBCAS_AVISOS_1] PRIMARY KEY CLUSTERED 
(
	[EMPRESA_CODIGO] ASC,
	[AVISO_NRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBCAS_AVISOS_ARCHIVO_XUSUARIO]    Script Date: 15/09/2020 09:13:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBCAS_AVISOS_ARCHIVO_XUSUARIO](
	[EMPRESA_CODIGO] [varchar](4) NOT NULL,
	[AVISO_CODIGO] [numeric](18, 0) NOT NULL,
	[AVISOARCH_CODIGO] [numeric](18, 0) NOT NULL,
	[AVISOARCH_USUARIO] [nchar](10) NOT NULL,
	[AVISOARCH_FECHA] [varchar](8) NOT NULL,
	[AVISOARCH_HORA] [varchar](4) NOT NULL,
	[AVISOARCH_SYS_EST] [varchar](1) NULL,
	[AVISOARCH_SYS_CRE] [varchar](20) NULL,
 CONSTRAINT [PK_TBCAS_AVISOS_ARCHIVO_XUSUARIO] PRIMARY KEY CLUSTERED 
(
	[EMPRESA_CODIGO] ASC,
	[AVISO_CODIGO] ASC,
	[AVISOARCH_CODIGO] ASC,
	[AVISOARCH_USUARIO] ASC,
	[AVISOARCH_FECHA] ASC,
	[AVISOARCH_HORA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBCAS_AVISOS_PUBLICA]    Script Date: 15/09/2020 09:13:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBCAS_AVISOS_PUBLICA](
	[EMPRESA_CODIGO] [varchar](4) NOT NULL,
	[USUARIO] [varchar](8) NOT NULL,
	[AVISO_NRO] [numeric](18, 0) NOT NULL,
	[ESTADO] [varchar](1) NULL,
 CONSTRAINT [PK_TBCAS_AVISOS_PUBLICA] PRIMARY KEY CLUSTERED 
(
	[EMPRESA_CODIGO] ASC,
	[USUARIO] ASC,
	[AVISO_NRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[TBCAS_AVISO_ARCHIVO]  WITH CHECK ADD  CONSTRAINT [FK_TBCAS_AVISO_ARCHIVO_TBCAS_AVISOS1] FOREIGN KEY([EMPRESA_CODIGO], [AVISO_CODIGO])
REFERENCES [dbo].[TBCAS_AVISOS] ([EMPRESA_CODIGO], [AVISO_NRO])
GO
ALTER TABLE [dbo].[TBCAS_AVISO_ARCHIVO] CHECK CONSTRAINT [FK_TBCAS_AVISO_ARCHIVO_TBCAS_AVISOS1]
GO
ALTER TABLE [dbo].[TBCAS_AVISO_COMENTARIO]  WITH CHECK ADD  CONSTRAINT [FK_TBCAS_AVISO_COMENTARIO_TBCAS_AVISOS] FOREIGN KEY([EMPRESA_CODIGO], [AVISO_CODIGO])
REFERENCES [dbo].[TBCAS_AVISOS] ([EMPRESA_CODIGO], [AVISO_NRO])
GO
ALTER TABLE [dbo].[TBCAS_AVISO_COMENTARIO] CHECK CONSTRAINT [FK_TBCAS_AVISO_COMENTARIO_TBCAS_AVISOS]
GO
ALTER TABLE [dbo].[TBCAS_AVISOS_ARCHIVO_XUSUARIO]  WITH CHECK ADD  CONSTRAINT [FK_TBCAS_AVISOS_ARCHIVO_XUSUARIO_TBCAS_AVISO_ARCHIVO] FOREIGN KEY([EMPRESA_CODIGO], [AVISO_CODIGO], [AVISOARCH_CODIGO])
REFERENCES [dbo].[TBCAS_AVISO_ARCHIVO] ([EMPRESA_CODIGO], [AVISO_CODIGO], [AVISOARCH_CODIGO])
GO
ALTER TABLE [dbo].[TBCAS_AVISOS_ARCHIVO_XUSUARIO] CHECK CONSTRAINT [FK_TBCAS_AVISOS_ARCHIVO_XUSUARIO_TBCAS_AVISO_ARCHIVO]
GO
ALTER TABLE [dbo].[TBCAS_AVISOS_PUBLICA]  WITH CHECK ADD  CONSTRAINT [FK_TBCAS_AVISOS_PUBLICA_TBCAS_AVISOS] FOREIGN KEY([EMPRESA_CODIGO], [AVISO_NRO])
REFERENCES [dbo].[TBCAS_AVISOS] ([EMPRESA_CODIGO], [AVISO_NRO])
GO
ALTER TABLE [dbo].[TBCAS_AVISOS_PUBLICA] CHECK CONSTRAINT [FK_TBCAS_AVISOS_PUBLICA_TBCAS_AVISOS]
GO


/****** Object:  Table [dbo].[TBCAS_AVISOS]    Script Date: 15/09/2020 09:13:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBCAS_AVISOS_TIPO](
	[EMPRESA_CODIGO] [varchar](4) NOT NULL,
	[AVISO_NRO] [numeric](18, 0) NOT NULL,
	[AVISO_TIPO] [varchar](1) NULL,
	[AVISO_REGFECHA] [varchar](8) NULL,
	[AVISO_REGHORA] [varchar](6) NULL,
	[AVISO_PUBFECHA] [varchar](8) NULL,
	[AVISO_PUBHORA] [varchar](6) NULL,
	[AVISO_DESCRIPCION] [varchar](2000) NULL,
	[AVISO_ESTADO] [varchar](1) NULL,
	[AVISO_SYS_EST] [varchar](1) NULL,
	[AVISO_DETALLE] [varchar](2000) NULL,
 CONSTRAINT [PK_TBCAS_AVISOS_TIPO_1] PRIMARY KEY CLUSTERED 
(
	[EMPRESA_CODIGO] ASC,
	[AVISO_NRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO