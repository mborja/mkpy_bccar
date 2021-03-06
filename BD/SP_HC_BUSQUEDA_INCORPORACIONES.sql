USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_HC_BUSQUEDA_INCORPORACIONES]    Script Date: 01/19/2012 15:04:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- EXEC SP_HC_BUSQUEDA_INCORPORACIONES '','','','','','','','','','-1'
ALTER PROCEDURE [dbo].[SP_HC_BUSQUEDA_INCORPORACIONES]
@CODREGION CHAR(2),
@CODZONA CHAR(6),
@FECHINSC CHAR(10), 
@CAMPANHAINSC CHAR(6),
@NRODOC CHAR(18),
@CODCONSU VARCHAR(15),
@APEPATERNO VARCHAR(30),
@APEMATERNO VARCHAR(30),
@NOMBRES VARCHAR(30),
@VERIFICA INT
AS
SET NOCOUNT ON
BEGIN
	DECLARE @_TRUE BIT
	SET @_TRUE = 'true'
	DECLARE @_UNO INT
	SET @_UNO = '1'
	DECLARE @_NEGATIVO INT
	SET @_NEGATIVO = '-1'
	DECLARE @_CAMPANHAINSC CHAR(11)	
	SET @_CAMPANHAINSC = 'No definida'
	DECLARE @_CODCONSU CHAR(11)	
	SET @_CODCONSU = 'No definido'
	IF @FECHINSC = ''
		BEGIN
			IF @VERIFICA = @_NEGATIVO
				BEGIN
					SELECT tb_gerentezona.codregion AS 'Región',tb_gerentezona.codzona AS 'Zona',tb_incorporacion.fecha AS 'Fecha inscripción','@_CAMPANHAINSC' AS 'Campaña inscripción',tb_incorporacion.nrodoc AS 'Documento identidad','@_CODCONSU' AS 'Código consultora',tb_incorporacion.apepaterno AS 'Apellido paterno',tb_incorporacion.apematerno AS 'Apellido materno',tb_incorporacion.nombres AS 'Nombres',tb_incorporacion.verifica AS 'Estado'
					FROM tb_incorporacion INNER JOIN tb_gerentezona ON tb_incorporacion.idgerentezona = tb_gerentezona.id 
					WHERE tb_gerentezona.codregion = @CODREGION AND tb_gerentezona.codzona = @CODZONA AND tb_incorporacion.nrodoc = @NRODOC AND tb_incorporacion.apepaterno = @APEPATERNO AND tb_incorporacion.apematerno = @APEMATERNO AND tb_incorporacion.nombres = @NOMBRES AND tb_gerentezona.estado = @_TRUE AND tb_incorporacion.idconsultora <> @_UNO
					UNION
					SELECT tb_gerentezona.codregion AS 'Región',tb_gerentezona.codzona AS 'Zona',tb_incorporacion.fecha AS 'Fecha inscripción',tb_consultora.campanhainsc AS 'Campaña inscripción',tb_consultora.nrodoc AS 'Documento identidad',tb_consultora.cod AS 'Código consultora',tb_consultora.apepaterno AS 'Apellido paterno',tb_consultora.apematerno AS 'Apellido materno',tb_consultora.nombres AS 'Nombres',tb_incorporacion.verifica AS 'Estado'
					FROM tb_incorporacion INNER JOIN tb_gerentezona ON tb_incorporacion.idgerentezona = tb_gerentezona.id INNER JOIN tb_consultora ON tb_incorporacion.idconsultora = tb_consultora.id
					WHERE tb_gerentezona.codregion = @CODREGION AND tb_gerentezona.codzona = @CODZONA AND tb_consultora.campanhainsc = @CAMPANHAINSC  AND tb_consultora.nrodoc = @NRODOC AND tb_consultora.cod = @CODCONSU AND tb_consultora.apepaterno = @APEPATERNO AND tb_consultora.apematerno = @APEMATERNO AND tb_consultora.nombres = @NOMBRES AND tb_consultora.estado = @_TRUE AND tb_gerentezona.estado = @_TRUE 
					ORDER BY 'Región','Zona','Fecha inscripción','Campaña inscripción','Documento identidad','Código consultora','Apellido paterno','Apellido materno','Nombres','Estado'
				END
			ELSE
				BEGIN
					SELECT tb_gerentezona.codregion AS 'Región',tb_gerentezona.codzona AS 'Zona',tb_incorporacion.fecha AS 'Fecha inscripción',@_CAMPANHAINSC AS 'Campaña inscripción',tb_incorporacion.nrodoc AS 'Documento identidad',@_CODCONSU AS 'Código consultora',tb_incorporacion.apepaterno AS 'Apellido paterno',tb_incorporacion.apematerno AS 'Apellido materno',tb_incorporacion.nombres AS 'Nombres',tb_incorporacion.verifica AS 'Estado'
					FROM tb_incorporacion INNER JOIN tb_gerentezona ON tb_incorporacion.idgerentezona = tb_gerentezona.id 
					WHERE tb_gerentezona.codregion = @CODREGION AND tb_gerentezona.codzona = @CODZONA AND tb_incorporacion.nrodoc = @NRODOC AND tb_incorporacion.apepaterno = @APEPATERNO AND tb_incorporacion.apematerno = @APEMATERNO AND tb_incorporacion.nombres = @NOMBRES AND tb_incorporacion.verifica = @VERIFICA AND tb_gerentezona.estado = @_TRUE 
					UNION
					SELECT tb_gerentezona.codregion AS 'Región',tb_gerentezona.codzona AS 'Zona',tb_incorporacion.fecha AS 'Fecha inscripción',tb_consultora.campanhainsc AS 'Campaña inscripción',tb_consultora.nrodoc AS 'Documento identidad',tb_consultora.cod AS 'Código consultora',tb_consultora.apepaterno AS 'Apellido paterno',tb_consultora.apematerno AS 'Apellido materno',tb_consultora.nombres AS 'Nombres',tb_incorporacion.verifica AS 'Estado'
					FROM tb_incorporacion INNER JOIN tb_gerentezona ON tb_incorporacion.idgerentezona = tb_gerentezona.id INNER JOIN tb_consultora ON tb_incorporacion.idconsultora = tb_consultora.id
					WHERE tb_gerentezona.codregion = @CODREGION AND tb_gerentezona.codzona = @CODZONA AND tb_consultora.campanhainsc = @CAMPANHAINSC  AND tb_consultora.nrodoc = @NRODOC AND tb_consultora.cod = @CODCONSU AND tb_consultora.apepaterno = @APEPATERNO AND tb_consultora.apematerno = @APEMATERNO AND tb_consultora.nombres = @NOMBRES AND tb_incorporacion.verifica = @VERIFICA AND tb_consultora.estado = @_TRUE AND tb_gerentezona.estado = @_TRUE 
					ORDER BY 'Región','Zona','Fecha inscripción','Campaña inscripción','Documento identidad','Código consultora','Apellido paterno','Apellido materno','Nombres','Estado'					
				END
		END
	ELSE
		BEGIN
			IF @VERIFICA = @_NEGATIVO
				BEGIN
					SELECT tb_gerentezona.codregion AS 'Región',tb_gerentezona.codzona AS 'Zona',tb_incorporacion.fecha AS 'Fecha inscripción',@_CAMPANHAINSC AS 'Campaña inscripción',tb_incorporacion.nrodoc AS 'Documento identidad',@_CODCONSU AS 'Código consultora',tb_incorporacion.apepaterno AS 'Apellido paterno',tb_incorporacion.apematerno AS 'Apellido materno',tb_incorporacion.nombres AS 'Nombres',tb_incorporacion.verifica AS 'Estado'
					FROM tb_incorporacion INNER JOIN tb_gerentezona ON tb_incorporacion.idgerentezona = tb_gerentezona.id 
					WHERE tb_gerentezona.codregion = @CODREGION AND tb_gerentezona.codzona = @CODZONA AND tb_incorporacion.fecha = @FECHINSC AND tb_incorporacion.nrodoc = @NRODOC AND tb_incorporacion.apepaterno = @APEPATERNO AND tb_incorporacion.apematerno = @APEMATERNO AND tb_incorporacion.nombres = @NOMBRES AND tb_gerentezona.estado = @_TRUE 
					UNION
					SELECT tb_gerentezona.codregion AS 'Región',tb_gerentezona.codzona AS 'Zona',tb_incorporacion.fecha AS 'Fecha inscripción',tb_consultora.campanhainsc AS 'Campaña inscripción',tb_consultora.nrodoc AS 'Documento identidad',tb_consultora.cod AS 'Código consultora',tb_consultora.apepaterno AS 'Apellido paterno',tb_consultora.apematerno AS 'Apellido materno',tb_consultora.nombres AS 'Nombres',tb_incorporacion.verifica AS 'Estado'
					FROM tb_incorporacion INNER JOIN tb_gerentezona ON tb_incorporacion.idgerentezona = tb_gerentezona.id INNER JOIN tb_consultora ON tb_incorporacion.idconsultora = tb_consultora.id
					WHERE tb_gerentezona.codregion = @CODREGION AND tb_gerentezona.codzona = @CODZONA AND tb_incorporacion.fecha = @FECHINSC AND tb_consultora.campanhainsc = @CAMPANHAINSC  AND tb_consultora.nrodoc = @NRODOC AND tb_consultora.cod = @CODCONSU AND tb_consultora.apepaterno = @APEPATERNO AND tb_consultora.apematerno = @APEMATERNO AND tb_consultora.nombres = @NOMBRES AND tb_consultora.estado = @_TRUE AND tb_gerentezona.estado = @_TRUE 
					ORDER BY 'Región','Zona','Fecha inscripción','Campaña inscripción','Documento identidad','Código consultora','Apellido paterno','Apellido materno','Nombres','Estado'
				END
			ELSE
				BEGIN
					SELECT tb_gerentezona.codregion AS 'Región',tb_gerentezona.codzona AS 'Zona',tb_incorporacion.fecha AS 'Fecha inscripción',@_CAMPANHAINSC AS 'Campaña inscripción',tb_incorporacion.nrodoc AS 'Documento identidad',@_CODCONSU AS 'Código consultora',tb_incorporacion.apepaterno AS 'Apellido paterno',tb_incorporacion.apematerno AS 'Apellido materno',tb_incorporacion.nombres AS 'Nombres',tb_incorporacion.verifica AS 'Estado'
					FROM tb_incorporacion INNER JOIN tb_gerentezona ON tb_incorporacion.idgerentezona = tb_gerentezona.id 
					WHERE tb_gerentezona.codregion = @CODREGION AND tb_gerentezona.codzona = @CODZONA AND tb_incorporacion.fecha = @FECHINSC AND tb_incorporacion.nrodoc = @NRODOC AND tb_incorporacion.apepaterno = @APEPATERNO AND tb_incorporacion.apematerno = @APEMATERNO AND tb_incorporacion.nombres = @NOMBRES AND tb_incorporacion.verifica = @VERIFICA AND tb_gerentezona.estado = @_TRUE 
					UNION
					SELECT tb_gerentezona.codregion AS 'Región',tb_gerentezona.codzona AS 'Zona',tb_incorporacion.fecha AS 'Fecha inscripción',tb_consultora.campanhainsc AS 'Campaña inscripción',tb_consultora.nrodoc AS 'Documento identidad',tb_consultora.cod AS 'Código consultora',tb_consultora.apepaterno AS 'Apellido paterno',tb_consultora.apematerno AS 'Apellido materno',tb_consultora.nombres AS 'Nombres',tb_incorporacion.verifica AS 'Estado'
					FROM tb_incorporacion INNER JOIN tb_gerentezona ON tb_incorporacion.idgerentezona = tb_gerentezona.id INNER JOIN tb_consultora ON tb_incorporacion.idconsultora = tb_consultora.id
					WHERE tb_gerentezona.codregion = @CODREGION AND tb_gerentezona.codzona = @CODZONA AND tb_incorporacion.fecha = @FECHINSC AND tb_consultora.campanhainsc = @CAMPANHAINSC  AND tb_consultora.nrodoc = @NRODOC AND tb_consultora.cod = @CODCONSU AND tb_consultora.apepaterno = @APEPATERNO AND tb_consultora.apematerno = @APEMATERNO AND tb_consultora.nombres = @NOMBRES AND tb_incorporacion.verifica = @VERIFICA AND tb_consultora.estado = @_TRUE AND tb_gerentezona.estado = @_TRUE 
					ORDER BY 'Región','Zona','Fecha inscripción','Campaña inscripción','Documento identidad','Código consultora','Apellido paterno','Apellido materno','Nombres','Estado'
				END
		END
END

