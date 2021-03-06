USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_MANT_REGISTRO_GERENTEZONA]    Script Date: 01/19/2012 15:06:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








/*
EXEC SP_MANT_REGISTRO_GERENTEZONA
@IDPAIS = '8',
@CODCIA = '',
@CODCONSU = '',
@NRODOC = '1234567890',
@NOMBRE = '',
@CODREGION = '00',
@CODZONA = '1111',
@CODSECCION = '',
@CODTERRITORIO = '',
@TELEFONO = '',
@EMAIL = 'gzona@belcorp.biz',
@PASARPED = '',
@MOTIVORET = ''
*/

ALTER PROCEDURE [dbo].[SP_MANT_REGISTRO_GERENTEZONA]
@IDPAIS INT,
@CODCIA CHAR(2),
@CODCONSU CHAR(15),
@NRODOC CHAR(18),
@NOMBRE VARCHAR(30),
@CODREGION CHAR(2),
@CODZONA CHAR(6),
@CODSECCION CHAR(2),
@CODTERRITORIO CHAR(2),
@TELEFONO CHAR(15),
@EMAIL VARCHAR(40),
@PASARPED CHAR(2),
@MOTIVORET CHAR(2)
AS
SET NOCOUNT ON
BEGIN
	DECLARE @_TRUE BIT
	SET @_TRUE = 'true'
	DECLARE @_ERROR CHAR(2)
	SET @_ERROR = '0|'
	IF @NRODOC <> ''
		BEGIN
			IF @CODZONA <> ''
				BEGIN
					IF NOT EXISTS (SELECT 1 FROM tb_gerentezona WHERE (tb_gerentezona.codzona = @CODZONA) AND (tb_gerentezona.estado = @_TRUE))
						BEGIN
							IF NOT EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.nrodoc = @NRODOC)
								BEGIN
									DECLARE @_CERO INT
									SET @_CERO = '0'
									IF EXISTS (SELECT 1 FROM tb_pais WHERE (tb_pais.id = @IDPAIS) AND (tb_pais.id <> @_CERO) AND (tb_pais.estado = @_TRUE))
										BEGIN
											DECLARE @_EXITO CHAR(2)
											SET @_EXITO = '1|'
											DECLARE @_ESTADO BIT
											IF @EMAIL = ''
												BEGIN
													SET @_ESTADO = 'false'
												END
											ELSE
												BEGIN
													SET @_ESTADO = 'true'
												END
											INSERT INTO tb_gerentezona
											(
												idpais,
												codregion,
												codzona,
												codseccion,
												codterritorio,
												codcia,
												codconsu,
												pasarped,
												motivoret,
												nombreS,
												nrodoc,
												telefono,
												email,
												estado
											)
											VALUES
											(
												@IDPAIS,
												@CODREGION,
												@CODZONA,
												@CODSECCION,
												@CODTERRITORIO,
												@CODCIA,
												@CODCONSU,
												@PASARPED,
												@NOMBRE,
												@MOTIVORET,
												@NRODOC,
												@TELEFONO,
												@EMAIL,
												@_ESTADO
											)
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
							SELECT @_ERROR AS 'Mensaje','Código de zona ya existe' AS 'Detalle'
						END
				END
			ELSE
				BEGIN
					SELECT @_ERROR AS 'Mensaje','Código de zona vacío' AS 'Detalle'
				END
		END
	ELSE
		BEGIN
			SELECT @_ERROR AS 'Mensaje','Documento de identidad vacío' AS 'Detalle'
		END
END


