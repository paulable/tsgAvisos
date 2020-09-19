use master
go

use [BDGEmpresa1TE]
go

CREATE OR ALTER PROCEDURE SP_LISTAR_AVISOS
AS
BEGIN
	SELECT A.[EMPRESA_CODIGO],A.[AVISO_CODIGO],[AVISO_DESCRIPCION],[AVISO_DETALLE]
	FROM [TBCAS_AVISOS] A JOIN [TBCAS_AVISOS_PUBLICA] B 
	ON (A.AVISO_CODIGO=B.AVISO_CODIGO AND A.EMPRESA_CODIGO=B.EMPRESA_CODIGO)
END
GO

CREATE OR ALTER PROCEDURE SP_BUSQUEDA
@tipo numeric(18,0),
@fecha varchar(8),
@estado tinyint
AS
BEGIN
	SELECT A.[EMPRESA_CODIGO],A.[AVISO_CODIGO],[AVISO_DESCRIPCION],[AVISO_DETALLE] FROM [dbo].[TBCAS_AVISOS] A JOIN
	[TBCAS_AVISOS_PUBLICA] B ON A.[AVISO_CODIGO]=B.[AVISO_CODIGO] AND A.[EMPRESA_CODIGO]=B.[EMPRESA_CODIGO] 
	WHERE [AVISO_TIPO_NRO]=@tipo AND [AVISO_PUBFECHA]=@fecha AND [AVISO_PUBLICA_ESTADO_ID]=@estado
END
GO

CREATE OR ALTER PROCEDURE SP_LISTAR_AVISO
@empresa_codigo varchar(4),
@aviso_numero numeric(18,0)
AS
BEGIN
	SELECT A.AVISO_CODIGO,A.EMPRESA_CODIGO,USUARI_NOMBRES,USUARI_APEPAT,AVISO_PUBFECHA,AVISO_PUBHORA,AVISO_DETALLE
	FROM [TBCAS_AVISOS] A JOIN [TBCAS_AVISOS_PUBLICA] B 
	ON (A.AVISO_CODIGO=B.AVISO_CODIGO AND A.EMPRESA_CODIGO=B.EMPRESA_CODIGO)
	JOIN [TBUSUARI] C ON B.USUARI_CODIGO=C.USUARI_CODIGO
	WHERE A.[EMPRESA_CODIGO]=@empresa_codigo AND A.[AVISO_CODIGO]=@aviso_numero
END
GO

SELECT * FROM [dbo].[TBCAS_AVISOS_PUBLICA]
go

SELECT * FROM [dbo].[TBCAS_AVISOS] WHERE EMPRESA_CODIGO='1009' and AVISO_CODIGO=2003
GO

EXEC SP_LISTAR_AVISO '1000',2003
GO

CREATE OR ALTER PROCEDURE SP_LISTAR_COMENTARIO
@empresa_codigo varchar(4),
@aviso_numero numeric(18,0)
AS
BEGIN
	SELECT USUARI_NOMBRES,USUARI_APEPAT,AVISOCOM_COMENTARIO,AVISOCOM_FECHA,AVISOCOM_HORA 
	FROM [TBCAS_AVISO_COMENTARIO] A JOIN [dbo].[TBUSUARI] B
	ON A.AVISOCOM_USUARIO=B.USUARI_CODIGO
	WHERE A.[EMPRESA_CODIGO]=@empresa_codigo AND A.[AVISO_CODIGO]=@aviso_numero
END
GO

CREATE OR ALTER PROCEDURE SP_LISTAR_ADJUNTOS
@empresa_codigo varchar(4),
@aviso_numero numeric(18,0)
AS
BEGIN
	SELECT A.EMPRESA_CODIGO,A.AVISO_CODIGO,AVISOARCH_CODIGO,AVISO_ARCHIVO,AVISO_RUTA FROM[dbo].[TBCAS_AVISO_ARCHIVO] A join [TBCAS_AVISOS] B 
	on A.EMPRESA_CODIGO=B.EMPRESA_CODIGO AND A.AVISO_CODIGO=B.AVISO_CODIGO
	WHERE A.EMPRESA_CODIGO=@empresa_codigo AND A.AVISO_CODIGO=@aviso_numero
END
GO


EXECUTE SP_LISTAR_ADJUNTOS '1001',2001
GO

SELECT * FROM [dbo].[TBCAS_AVISO_ARCHIVO]

CREATE OR ALTER PROCEDURE SP_LISTAR_TIPO
AS
BEGIN
	SELECT * FROM [dbo].[TBCAS_AVISOS_TIPO]
END
GO

CREATE OR ALTER PROCEDURE SP_LISTAR_ESTADO
AS
BEGIN
	SELECT * FROM [dbo].[TBCAS_AVISOS_ESTADO]
END
GO

INSERT INTO TBCAS_AVISOS (EMPRESA_CODIGO, AVISO_CODIGO, AVISO_TIPO_NRO, 
AVISO_REGFECHA, AVISO_REGHORA, AVISO_PUBFECHA, AVISO_PUBHORA, AVISO_DESCRIPCION, AVISO_SYS_EST, AVISO_DETALLE) 
VALUES (9999, 9999, 1, '01-03-20', '00:00', '02-03-20', '02:00', 'Aviso de prueba', 1, 
'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi ullam, porro voluptate magnam accusantium itaque, est! Amet laborum fuga numquam atque id minus eveniet dolorum, culpa harum aperiam at vitae.');
go

INSERT INTO TBCAS_AVISO_COMENTARIO (EMPRESA_CODIGO, AVISO_CODIGO, AVISOCOM_ID, AVISOCOM_USUARIO, AVISOCOM_COMENTARIO, AVISOCOM_FECHA, AVISOCOM_HORA, AVISOCOM_SYS_EST, AVISOCOM_SYS_CRE) 
VALUES (9999, 9999, 8001, 9001, 'No me parece justo son muy buenos, etc, No me parece justo son muy buenos, etc No me parece justo son muy buenos, etc No me parece justo son muy buenos, etc'
, '17-09-20', '09:00', 1, 1)
go

INSERT INTO TBCAS_AVISO_COMENTARIO (EMPRESA_CODIGO, AVISO_CODIGO, AVISOCOM_ID, AVISOCOM_USUARIO, AVISOCOM_COMENTARIO, AVISOCOM_FECHA, AVISOCOM_HORA, AVISOCOM_SYS_EST, AVISOCOM_SYS_CRE) 
VALUES (9999, 9999, 8003, 9001, 'no puede ser Lorem ipsum, dolor sit amet consectetur adipisicing, elit. Ad explicabo id, error asperiores quas cupiditate illum quibusdam perferendis ipsum distinctio vero aliquid magni, eligendi dignissimos repudiandae iure nisi, pariatur eveniet! son muy buenos, etc No me parece justo son muy buenos, etc'
, '17-09-20', '09:00', 1, 1)
go

INSERT INTO TBCAS_AVISOS_PUBLICA (EMPRESA_CODIGO, USUARI_CODIGO, AVISO_CODIGO, /*sirve para gestionar usuario que visitan avisos*/
 AVISO_PUBLICA_ESTADO_ID, CANTIDAD) VALUES (9999, 9002, 9999, 1, 0)
 go

INSERT INTO TBCAS_AVISO_ARCHIVO (EMPRESA_CODIGO, AVISO_CODIGO, AVISO_ARCHIVO, 
AVISO_RUTA, AVISO_SYS_EST, AVISOARCH_CODIGO, AVISOARCH_NROVECES) 
VALUES (9999, 9999, 'Redireccion', 'https://stackoverrun.com/es/q/202', 1, 7003,0);
go
