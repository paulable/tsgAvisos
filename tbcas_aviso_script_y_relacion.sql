USE MASTER
GO

DROP DATABASE IF EXISTS [BDGEmpresa1TE]
GO

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
	[AVISO_TIPO_NRO] [numeric](18, 0) NOT NULL,
	[AVISO_REGFECHA] [varchar](8) NULL,
	[AVISO_REGHORA] [varchar](6) NULL,
	[AVISO_PUBFECHA] [varchar](8) NULL,
	[AVISO_PUBHORA] [varchar](6) NULL,
	[AVISO_DESCRIPCION] [varchar](2000) NULL,
	[AVISO_ESTADO_NRO] [numeric](18, 0) NOT NULL,
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
	[CANTIDAD] [numeric](18,0) NULL,
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


CREATE TABLE [dbo].[TBUSUARI](
	[USUARI_CODIGO] [varchar](8) NOT NULL,
	[USUARI_PASS] [varchar](10) NULL,
	[USUARI_FECPASS] [varchar](8) NULL,
	[USUARI_ESTADO] [varchar](1) NULL,
	[USUARI_ESTASOCIADO] [varchar](2) NULL,
	[USUARI_NIVEL] [varchar](2) NULL,
	[USUARI_FECINI] [varchar](8) NULL,
	[USUARI_FECFIN] [varchar](8) NULL,
	[USUARI_DIAHORACC] [varchar](168) NULL,
	[USUARI_ACCFER] [varchar](1) NULL,
	[USUARI_NUMPASS] [varchar](1) NULL,
	[USUARI_PASSANT] [varchar](40) NULL,
	[USUARI_SYS_CRE] [varchar](20) NULL,
	[USUARI_SYS_MOD] [varchar](20) NULL,
	[USUARI_SYS_EST] [varchar](1) NULL,
	[USUARI_APEPAT] [varchar](15) NULL,
	[USUARI_APEMAT] [varchar](15) NULL,
	[USUARI_NOMBRES] [varchar](20) NULL,
	[USUARI_DOCIDENAC] [varchar](10) NULL,
	[USUARI_TIPDOCIDE] [varchar](1) NULL,
	[USUARI_CODDOCIDE] [varchar](10) NULL,
	[USUARI_TIPO] [varchar](2) NULL,
	[USUARI_TIPO_EXP] [varchar](2) NULL,
	[USUARI_DIAS_EXP] [varchar](4) NULL,
	[USUARI_CORREO] [varchar](50) NULL,
	[PERSON_COD_INTERNO] [varchar](10) NULL,
	[USUARI_TELEFONO] [varchar](50) NULL,
	[USUARI_SEXO] [varchar](2) NULL,
	[USUARI_FECHANAC] [varchar](8) NULL,
	[USUARI_DIRECCION] [varchar](250) NULL,
	[USUARI_PAIS] [varchar](6) NULL,
	[USUARI_DPTO] [varchar](6) NULL,
	[USUARI_PROV] [varchar](6) NULL,
	[USUARI_DIST] [varchar](6) NULL,
	[USUARI_EMPRESA] [varchar](250) NULL,
	[USUARI_EMPRESA_OFICINA] [varchar](250) NULL,
	[USUARI_EMPRESA_PUESTO] [varchar](250) NULL,
	[USUARI_PROVEEDOR] [varchar](1) NULL
) ON [PRIMARY]

ALTER TABLE TBUSUARI ADD CONSTRAINT PK_TBUSUARIO PRIMARY KEY([USUARI_CODIGO])
GO

ALTER TABLE [TBCAS_AVISO_COMENTARIO] ADD CONSTRAINT FK_COMENTARIO_USUARIO FOREIGN KEY ([AVISOCOM_USUARIO]) REFERENCES [TBUSUARI]([USUARI_CODIGO])
GO


/****** Object:  Table [dbo].[TBCAS_AVISOS_TIPO]    Script Date: 16/09/2020 13:39:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBCAS_AVISOS_TIPO](
	[AVISO_TIPO_DESCRIP] [varchar](20) NOT NULL,
	[AVISO_TIPO_NRO] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_TBCAS_AVISOS_TIPO_1] PRIMARY KEY CLUSTERED 
(
	[AVISO_TIPO_NRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[TBCAS_AVISOS_ESTADO]    Script Date: 16/09/2020 14:00:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBCAS_AVISOS_ESTADO](
	[AVISO_ESTADO_DESCRIP] [varchar](20) NOT NULL,
	[AVISO_ESTADO_NRO] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_TBCAS_AVISOS_ESTADO_1] PRIMARY KEY CLUSTERED 
(
	[AVISO_ESTADO_NRO] ASC
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

ALTER TABLE [dbo].[TBCAS_AVISOS]  WITH CHECK ADD  CONSTRAINT [FK_TBCAS_AVISOS_TBCAS_AVISOS_TIPO1] FOREIGN KEY(AVISO_TIPO_NRO)
REFERENCES [dbo].[TBCAS_AVISOS_TIPO] (AVISO_TIPO_NRO)
GO
ALTER TABLE [dbo].[TBCAS_AVISOS] CHECK CONSTRAINT [FK_TBCAS_AVISOS_TBCAS_AVISOS_TIPO1]
GO

ALTER TABLE [dbo].[TBCAS_AVISOS]  WITH CHECK ADD  CONSTRAINT [FK_TBCAS_AVISOS_TBCAS_AVISOS_ESTADO1] FOREIGN KEY(AVISO_ESTADO_NRO)
REFERENCES [dbo].[TBCAS_AVISOS_ESTADO] (AVISO_ESTADO_NRO)
GO
ALTER TABLE [dbo].[TBCAS_AVISOS] CHECK CONSTRAINT [FK_TBCAS_AVISOS_TBCAS_AVISOS_ESTADO1]
GO

INSERT INTO TBCAS_AVISOS_TIPO (AVISO_TIPO_DESCRIP, AVISO_TIPO_NRO) VALUES ('Boletin', 1);
INSERT INTO TBCAS_AVISOS_TIPO (AVISO_TIPO_DESCRIP, AVISO_TIPO_NRO) VALUES ('Información',2);
INSERT INTO TBCAS_AVISOS_TIPO (AVISO_TIPO_DESCRIP, AVISO_TIPO_NRO) VALUES ('Problema', 3);

INSERT INTO TBCAS_AVISOS_ESTADO (AVISO_ESTADO_DESCRIP, AVISO_ESTADO_NRO) VALUES ('Registrado', 1);
INSERT INTO TBCAS_AVISOS_ESTADO (AVISO_ESTADO_DESCRIP, AVISO_ESTADO_NRO) VALUES ('Publicado', 2);

INSERT INTO TBCAS_AVISOS (EMPRESA_CODIGO, AVISO_NRO, AVISO_TIPO_NRO, AVISO_REGFECHA, AVISO_REGHORA, AVISO_PUBFECHA, AVISO_PUBHORA, AVISO_DESCRIPCION, AVISO_ESTADO_NRO, AVISO_SYS_EST, AVISO_DETALLE) 
VALUES (1001, 2001, 2, '01-01-20', '08:00', '02-01-20', '09:00', 'la descripcion 1', 1, 2, 'este es un detalle 1');
INSERT INTO TBCAS_AVISOS (EMPRESA_CODIGO, AVISO_NRO, AVISO_TIPO_NRO, AVISO_REGFECHA, AVISO_REGHORA, AVISO_PUBFECHA, AVISO_PUBHORA, AVISO_DESCRIPCION, AVISO_ESTADO_NRO, AVISO_SYS_EST, AVISO_DETALLE) 
VALUES (1002, 2002, 3, '01-02-20', '18:00', '02-02-20', '19:00', 'la descripcion 2', 2, 1, 'este es un detalle 2');
INSERT INTO TBCAS_AVISOS (EMPRESA_CODIGO, AVISO_NRO, AVISO_TIPO_NRO, AVISO_REGFECHA, AVISO_REGHORA, AVISO_PUBFECHA, AVISO_PUBHORA, AVISO_DESCRIPCION, AVISO_ESTADO_NRO, AVISO_SYS_EST, AVISO_DETALLE) 
VALUES (1003, 2003, 1, '01-03-20', '00:00', '02-03-20', '02:00', 'la descripcion 3', 1, 2, 'este es un detalle 3');

INSERT INTO TBCAS_AVISOS_PUBLICA (EMPRESA_CODIGO, USUARIO, AVISO_NRO, CANTIDAD) VALUES (1001, 9001, 2001, 0);
INSERT INTO TBCAS_AVISOS_PUBLICA (EMPRESA_CODIGO, USUARIO, AVISO_NRO, CANTIDAD) VALUES (1002, 9002, 2002, 0);
INSERT INTO TBCAS_AVISOS_PUBLICA (EMPRESA_CODIGO, USUARIO, AVISO_NRO, CANTIDAD) VALUES (1003, 9003, 2003, 0);

INSERT INTO TBUSUARI (USUARI_CODIGO,USUARI_PASS,USUARI_FECPASS,USUARI_ESTADO,USUARI_ESTASOCIADO,USUARI_NIVEL,USUARI_FECINI,USUARI_FECFIN,USUARI_DIAHORACC,USUARI_ACCFER,USUARI_NUMPASS,USUARI_PASSANT,USUARI_SYS_CRE,USUARI_SYS_MOD,USUARI_SYS_EST,USUARI_APEPAT,USUARI_APEMAT,USUARI_NOMBRES,USUARI_DOCIDENAC,USUARI_TIPDOCIDE,USUARI_CODDOCIDE,USUARI_TIPO,USUARI_TIPO_EXP,USUARI_DIAS_EXP,USUARI_CORREO,PERSON_COD_INTERNO,USUARI_TELEFONO,USUARI_SEXO,USUARI_FECHANAC,USUARI_DIRECCION,USUARI_PAIS,USUARI_DPTO,USUARI_PROV,USUARI_DIST,USUARI_EMPRESA,USUARI_EMPRESA_OFICINA,USUARI_EMPRESA_PUESTO,USUARI_PROVEEDOR) 
VALUES (1003, 9003, 2003, 0);


exec sp_columns TBUSUARI;



/*INSERT INTO TBCAS_AVISO_COMENTARIO (EMPRESA_CODIGO, AVISO_CODIGO, AVISOCOM_ID, AVISOCOM_USUARIO, AVISOCOM_COMENTARIO, AVISOCOM_FECHA, AVISOCOM_HORA, AVISOCOM_SYS_EST, AVISOCOM_SYS_CRE) 
VALUES ();*/


/*
1xxx empresa_codigo
2xxx aviso_nro
3xxx avisocom_id
9xxx usuarios
8xxx



*/
