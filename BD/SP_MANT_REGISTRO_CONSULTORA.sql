USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_MANT_REGISTRO_CONSULTORA]    Script Date: 01/19/2012 15:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/*
EXEC SP_MANT_REGISTRO_CONSULTORA
@IDPAIS = '8',
@CODCIA = '',
@CODIGO = 'DD',
@NRODOC = '44444',
@NOMBRES = '',
@APEPATERNO = '',
@APEMATERNO = '',
@TELEFONO1 = '',
@TELEFONO2 = '',
@EMAIL = '',
@PASARPED = '',
@MOTIVORET = '',
@CODREGION = '',
@CODZONA = '',
@CODSECCION = '',
@CODTERRITORIO = '',
@CAMPANHAINSC = '',
@CAMPANHAPRICO = ''
*/

ALTER PROCEDURE [dbo].[SP_MANT_REGISTRO_CONSULTORA]
@IDPAIS INT,
@CODCIA CHAR(2),
@CODIGO CHAR(15),
@NRODOC CHAR(18),
@NOMBRES VARCHAR(30),
@APEPATERNO VARCHAR(30),
@APEMATERNO VARCHAR(30),
@TELEFONO1 CHAR(15),
@TELEFONO2 CHAR(15),
@EMAIL VARCHAR(40),
@PASARPED CHAR(2),
@MOTIVORET CHAR(2),
@CODREGION CHAR(2),
@CODZONA CHAR(6),
@CODSECCION CHAR(2),
@CODTERRITORIO CHAR(2),
@CAMPANHAINSC CHAR(6),
@CAMPANHAPRICO CHAR(6)
AS
SET NOCOUNT ON
BEGIN
	DECLARE @_TRUE BIT
	SET @_TRUE = 'true'
	DECLARE @_ERROR CHAR(2)
	SET @_ERROR = '0|'
	IF @NRODOC <> ''
		BEGIN
			IF @CODIGO <> ''
				BEGIN
					IF NOT EXISTS (SELECT 1 FROM tb_consultora WHERE (tb_consultora.cod = @CODIGO) AND (tb_consultora .estado = @_TRUE))
						BEGIN
							IF NOT EXISTS (SELECT 1 FROM tb_consultora WHERE tb_consultora.nrodoc = @NRODOC)
								BEGIN
									DECLARE @_CERO INT
									SET @_CERO = '0'
									IF EXISTS (SELECT 1 FROM tb_pais WHERE (tb_pais.id = @IDPAIS) AND (tb_pais.id <> @_CERO) AND (tb_pais.estado = @_TRUE))
										BEGIN
											DECLARE @_EXITO CHAR(2)
											SET @_EXITO = '1|'
											DECLARE @_ESTADO BIT
											SET @_ESTADO = 'true'
											INSERT INTO tb_consultora
											(
												idpais,
												campanhainsc,
												campanhaprico,
												codregion,
												codzona,
												codseccion,
												codterritorio,
												codcia,
												pasarped,
												motivoret,
												cod,
												apepaterno,
												apematerno,
												nombres,
												nrodoc,
												telefono1,	
												telefono2,
												email,
												estado
											)
											VALUES
											(
												@IDPAIS,
												@CAMPANHAINSC,
												@CAMPANHAPRICO,
												@CODREGION,
												@CODZONA,
												@CODSECCION,
												@CODTERRITORIO,
												@CODCIA,
												@PASARPED,
												@MOTIVORET,
												@CODIGO,
												@APEPATERNO,
												@APEMATERNO,
												@NOMBRES,
												@NRODOC,
												@TELEFONO1,
												@TELEFONO2,
												@EMAIL,
												@_ESTADO
											)
											UPDATE tb_incorporacion
											SET idconsultora = (SELECT tb_consultora.id FROM tb_consultora WHERE tb_consultora.cod = @CODIGO)
											WHERE tb_incorporacion.nrodoc =  @NRODOC
											SELECT @_EXITO AS 'Mensaje','Grabación exitosa' AS 'Detalle'
										END
									ELSE
										BEGIN
											SELECT @_ERROR AS 'Mensaje','País incorrecto' AS 'Detalle'
										END
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','Documento de identidad ya existe' AS 'Detalle'
								END
						END
					ELSE
						BEGIN
							SELECT @_ERROR AS 'Mensaje','Código de consultora ya existe' AS 'Detalle'
						END
				END
			ELSE
				BEGIN
					SELECT @_ERROR AS 'Mensaje','Código de consultora vacío' AS 'Detalle'
				END
		END
	ELSE
		BEGIN
			SELECT @_ERROR AS 'Mensaje','Documento de identidad vacío' AS 'Detalle'
		END
END



