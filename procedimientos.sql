use master
go

use [BDGEmpresa1TE]
go

CREATE OR ALTER PROCEDURE SP_LISTAR_AVISOS
AS
BEGIN
	SELECT A.[EMPRESA_CODIGO],A.[AVISO_CODIGO],[AVISO_DESCRIPCION],[AVISO_DETALLE],convert(date, A.AVISO_PUBFECHA),STUFF(A.AVISO_PUBHORA, 3, 0 , ':'), C.[AVISO_ESTADO_DESCRIP], D.[AVISO_TIPO_DESCRIP]
	FROM [TBCAS_AVISOS] A JOIN [TBCAS_AVISOS_PUBLICA] B 
	ON (A.AVISO_CODIGO=B.AVISO_CODIGO AND A.EMPRESA_CODIGO=B.EMPRESA_CODIGO)
	JOIN [TBCAS_AVISOS_ESTADO] C ON A.AVISO_SYS_EST = C.AVISO_ESTADO_NRO
	JOIN [TBCAS_AVISOS_TIPO] D ON A.AVISO_TIPO_NRO = D.AVISO_TIPO_NRO
END
GO

select*from TBCAS_AVISOS

EXEC SP_LISTAR_AVISOS
GO

CREATE OR ALTER PROCEDURE SP_LISTAR_AVISO_COMPLETO
@empresa_codigo varchar(4),
@aviso_numero numeric(18,0)
AS
DECLARE @pCodigoUser varchar(8)
BEGIN
	SELECT A.AVISO_CODIGO,A.EMPRESA_CODIGO,USUARI_NOMBRES,USUARI_APEPAT,convert(date, A.AVISO_PUBFECHA),STUFF(A.AVISO_PUBHORA, 3, 0 , ':'),AVISO_DETALLE
	FROM [TBCAS_AVISOS] A JOIN [TBCAS_AVISOS_PUBLICA] B 
	ON (A.AVISO_CODIGO=B.AVISO_CODIGO AND A.EMPRESA_CODIGO=B.EMPRESA_CODIGO)
	JOIN [TBUSUARI] C ON B.USUARI_CODIGO=C.USUARI_CODIGO
	WHERE A.[EMPRESA_CODIGO]=@empresa_codigo AND A.[AVISO_CODIGO]=@aviso_numero

	SELECT @pCodigoUser=B.USUARI_CODIGO FROM [TBCAS_AVISOS_PUBLICA] B JOIN 
	[TBUSUARI] C ON B.USUARI_CODIGO=C.USUARI_CODIGO
	WHERE B.[EMPRESA_CODIGO]=@empresa_codigo AND B.[AVISO_CODIGO]=@aviso_numero

	UPDATE TBCAS_AVISOS_PUBLICA SET
	CANTIDAD = CANTIDAD+1
	WHERE EMPRESA_CODIGO=@empresa_codigo AND AVISO_CODIGO=@aviso_numero AND USUARI_CODIGO=@pCodigoUser
END
GO

CREATE OR ALTER PROCEDURE SP_LISTAR_COMENTARIO
@empresa_codigo varchar(4),
@aviso_numero numeric(18,0)
AS
BEGIN
	SELECT USUARI_NOMBRES,USUARI_APEPAT,AVISOCOM_COMENTARIO,convert(date, AVISOCOM_FECHA),STUFF(AVISOCOM_HORA, 3, 0 , ':')
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

CREATE OR ALTER PROCEDURE SP_NUEVO_COMENTARIO
@id_empresa varchar(4),
@id_aviso numeric(18,0),
@id_usuario varchar(8),
@AVISOCOM_COMENTARIO varchar(5000)
AS
DECLARE @vIdComentario decimal
BEGIN
	SELECT TOP(1) @vIdComentario=AVISOCOM_ID FROM TBCAS_AVISO_COMENTARIO
	WHERE EMPRESA_CODIGO=@id_empresa AND AVISO_CODIGO=@id_aviso AND AVISOCOM_USUARIO=@id_usuario
	ORDER BY AVISOCOM_ID DESC
	
	SET @vIdComentario=@vIdComentario+1

	INSERT INTO TBCAS_AVISO_COMENTARIO
	VALUES (@id_empresa, @id_aviso, @vIdComentario, @id_usuario, 
	@AVISOCOM_COMENTARIO, FORMAT(GETDATE(), 'yyyyMMdd'), FORMAT(GETDATE(), 'hhmm'), null, null)
END
GO

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

-- procedimiento para validar acceso en el login
CREATE OR ALTER PROCEDURE SP_BUSCAR_USUARIO
@p_usuari_codigo varchar(8),
@p_usuari_pass varchar(10)
AS
BEGIN
	SELECT USUARI_CODIGO, USUARI_PASS, USUARI_APEPAT, USUARI_APEMAT, USUARI_NOMBRES, USUARI_CORREO, USUARI_TELEFONO
	FROM [dbo].[TBUSUARI]
	WHERE USUARI_CODIGO = @p_usuari_codigo and USUARI_PASS = @p_usuari_pass
END
GO