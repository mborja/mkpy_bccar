USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_WS_REGISTRO_SEGUIMIENTO]    Script Date: 01/19/2012 14:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
EXEC SP_WS_REGISTRO_SEGUIMIENTO
@APPID = '0xcc76ecb46671657aL', 
@IDPAIS = '8', 
@PIN = '5738A3C7', 
@IMSI = 'DOM482683524852', 
@CODIGOZONA = '1111', 
@CAMPANHA = '', 
@FECHA = '', 
@CODIGOCONSULTORA = '', 
@OBSERVACION = '', 
@FECHA_INGRESO = '', 
@RECORD_PIN = '', 
@RECORD_IMSI = '', 
@RECORD_LONGITUD = '', 
@RECORD_LATITUD = '', 
@RECORD_MARGEN = '', 
@RECORD_NROSATELITES = '', 
@RECORD_OBSERVACION = '',
@RECORD_FECHAVISITA = ''
*/

ALTER PROCEDURE [dbo].[SP_WS_REGISTRO_SEGUIMIENTO]
@APPID CHAR(19),
@IDPAIS INT,
@PIN CHAR(20),
@IMSI CHAR(20),
@CODIGOZONA CHAR(6),
@CAMPANHA CHAR(6),
@FECHA CHAR(12),
@CODIGOCONSULTORA CHAR(20),
@NRODOC CHAR(20),
@OBSERVACION VARCHAR(200),
@FECHA_INGRESO CHAR(12),
@RECORD_PIN CHAR(20),
@RECORD_IMSI CHAR(20),
@RECORD_LONGITUD VARCHAR(20),
@RECORD_LATITUD VARCHAR(20),
@RECORD_MARGEN VARCHAR(9),
@RECORD_NROSATELITES INT,
@RECORD_OBSERVACION VARCHAR(200),
@RECORD_FECHAVISITA VARCHAR(12)
AS
SET NOCOUNT ON
BEGIN
	DECLARE @_TRUE BIT
	SET @_TRUE = 'true'
	DECLARE @_ERROR CHAR(2)
	SET @_ERROR = '0|'
	DECLARE @_TIPOTABLA_APPID INT
	SET @_TIPOTABLA_APPID = '1'
	DECLARE @_APPID CHAR(19)
	SET @_APPID = (SELECT tb_tabla.descripcion FROM tb_tabla WHERE tb_tabla.id = @_TIPOTABLA_APPID AND tb_tabla.estado = @_TRUE)
	IF @APPID = @_APPID
		BEGIN
			IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
				BEGIN
					DECLARE @_UNO INT
					SET @_UNO = '1'
					DECLARE @_GERENTEZONA_PIN_IMSI_CONTA INT
					SET @_GERENTEZONA_PIN_IMSI_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
					IF @_GERENTEZONA_PIN_IMSI_CONTA = @_UNO
						BEGIN
							DECLARE @_GERENTEZONA_ESTADO BIT
							SET @_GERENTEZONA_ESTADO = (SELECT tb_gerentezona.estado FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
							IF @_GERENTEZONA_ESTADO = @_TRUE
								BEGIN
									DECLARE @_CERO INT
									SET @_CERO = '0'
									IF EXISTS (SELECT 1 FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE (tb_gerentezona.idpais = @IDPAIS) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI) AND (tb_pais.id <> @_CERO) AND (tb_pais.estado = @_TRUE))
										BEGIN
											DECLARE @_GERENTEZONA_PAIS_CONTA INT
											SET @_GERENTEZONA_PAIS_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE (tb_gerentezona.idpais = @IDPAIS) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI) AND (tb_pais.estado = @_TRUE))
											IF @_GERENTEZONA_PAIS_CONTA = @_UNO
												BEGIN
													IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE (tb_gerentezona.codzona = SUBSTRING(@CODIGOZONA, 3, LEN(@CODIGOZONA))) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
														BEGIN
															DECLARE @_GERENTEZONA_CODZONA_CONTA INT
															SET @_GERENTEZONA_CODZONA_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona WHERE (tb_gerentezona.codzona = SUBSTRING(@CODIGOZONA, 3, LEN(@CODIGOZONA))) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
															IF @_GERENTEZONA_CODZONA_CONTA = @_UNO
																BEGIN
																	DECLARE @_IDGERENTEZONA INT
																	DECLARE @_CODIGOCONSULTORA CHAR(20)
																	SET @_CODIGOCONSULTORA = ''
																	SET @_IDGERENTEZONA = (SELECT tb_gerentezona.id FROM tb_gerentezona WHERE (tb_gerentezona.codzona = SUBSTRING(@CODIGOZONA, 3, LEN(@CODIGOZONA))) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))					
																	IF @NRODOC = ''
																		BEGIN
																			SET @_CODIGOCONSULTORA = @CODIGOCONSULTORA	
																		END
																	ELSE
																		BEGIN
																		   SET @_CODIGOCONSULTORA = (SELECT tb_consultora.cod FROM tb_consultora WHERE tb_consultora.nrodoc = @NRODOC)
																		END					
																	
																	IF EXISTS (SELECT 1 FROM tb_consultora WHERE tb_consultora.cod = @_CODIGOCONSULTORA)-- AND (tb_consultora.estado = @_TRUE))
																		BEGIN
																			DECLARE @_CONSULTORA_COD_CONTA INT
																			SET @_CONSULTORA_COD_CONTA = (SELECT COUNT(tb_consultora.id) FROM tb_consultora WHERE tb_consultora.cod = @_CODIGOCONSULTORA)-- AND (tb_consultora.estado = @_TRUE))
																			IF @_CONSULTORA_COD_CONTA <= @_UNO
																				BEGIN
																					DECLARE @_EXITO CHAR(2)
																					SET @_EXITO = '1|'
																					DECLARE @_IDCONSULTORA INT	
																					SET @_IDCONSULTORA = (SELECT tb_consultora.id FROM tb_consultora WHERE tb_consultora.cod = @_CODIGOCONSULTORA) --AND (tb_consultora.estado = @_TRUE))
																					DECLARE @_CAMPANHA CHAR(6)
																					SET @_CAMPANHA = (SELECT tb_pais.campanhaact FROM tb_pais WHERE tb_pais.id = @IDPAIS and tb_pais.estado = @_TRUE)
																					IF @RECORD_NROSATELITES = ''
																						BEGIN
																							SET @RECORD_NROSATELITES = '-1'
																						END
																						
																					-- asignando fecha ingreso
																					DECLARE @_FECHA_INGRESO SMALLDATETIME
																					IF @FECHA_INGRESO = ''
																						BEGIN
																							SET @FECHA_INGRESO = '199001010000'
																							SET @_FECHA_INGRESO = CONVERT(SMALLDATETIME,SUBSTRING(@FECHA_INGRESO,1,8)+SPACE(1)+SUBSTRING(@FECHA_INGRESO,9,2) + ':' + SUBSTRING(@FECHA_INGRESO,11,2))
																						END	
																					ELSE
																						BEGIN
																							SET @_FECHA_INGRESO = CAST(@FECHA_INGRESO AS DATETIME)
																						END
																					
																					-- asignando fecha
																					DECLARE @_FECHA SMALLDATETIME
																					IF @FECHA = ''
																						BEGIN
																							SET @FECHA = '199001010000'
																							SET @_FECHA = CONVERT(SMALLDATETIME,SUBSTRING(@FECHA,1,8)+SPACE(1)+SUBSTRING(@FECHA,9,2) + ':' + SUBSTRING(@FECHA,11,2))
																						END	
																					ELSE
																						BEGIN
																							SET @_FECHA = CAST(@FECHA AS DATETIME)
																						END
																					
																					-- asignando fecha de visita
																					DECLARE @_RECORD_FECHAVISITA SMALLDATETIME
																					IF @RECORD_FECHAVISITA = ''
																						BEGIN
																							SET @RECORD_FECHAVISITA = '199001010000'
																							SET @_RECORD_FECHAVISITA = CONVERT(SMALLDATETIME,SUBSTRING(@RECORD_FECHAVISITA,1,8)+SPACE(1)+SUBSTRING(@RECORD_FECHAVISITA,9,2) + ':' + SUBSTRING(@RECORD_FECHAVISITA,11,2))
																						END	
																					ELSE
																						BEGIN
																							SET @_RECORD_FECHAVISITA = CAST(@RECORD_FECHAVISITA AS DATETIME)
																						END
																					
																					DECLARE @_ESTADO BIT	
																					SET @_ESTADO = 'true'
																					INSERT INTO tb_seguimiento
																					(
																						idpais,
																						idgerentezona,
																						idconsultora,
																						campanha,
																						fechingr,
																						fecha,
																						observacion,
																						recpin,
																						recimsi,	
																						reclongitud,
																						reclatitud,	
																						recmargen,
																						recnrosatelites,
																						recobservacion,
																						recfechvisita,
																						estado
																					)
																					VALUES
																					(
																						@IDPAIS,
																						@_IDGERENTEZONA,
																						@_IDCONSULTORA,
																						@_CAMPANHA,
																						@_FECHA_INGRESO,
																						@_FECHA,
																						@OBSERVACION,
																						@RECORD_PIN,
																						@RECORD_IMSI,
																						@RECORD_LONGITUD,
																						@RECORD_LATITUD,
																						@RECORD_MARGEN,
																						@RECORD_NROSATELITES,
																						@RECORD_OBSERVACION,
																						@_RECORD_FECHAVISITA,
																						@_ESTADO
																					)
																					SELECT @_EXITO AS 'Mensaje','Grabación exitosa' AS 'Detalle'	
																				END
																			ELSE
																				BEGIN
																					SELECT @_ERROR AS 'Mensaje','Código asignado a más de una consultora' AS 'Detalle' 
																				END
																		END
																	ELSE
																		BEGIN
																			SELECT @_ERROR AS 'Mensaje','Código de consultora incorrecto' AS 'Detalle' 
																		END	
																END
															ELSE
																BEGIN
																	SELECT @_ERROR AS 'Mensaje','Código de zona asignado a más de una gerente de zona' AS 'Detalle'
																END
														END
													ELSE
														BEGIN
															SELECT @_ERROR AS 'Mensaje','´Código de gerente de zona incorrecto' AS 'Detalle'
														END
												END
											ELSE
												BEGIN
													SELECT @_ERROR AS 'Mensaje','Gerente de zona pertenece a más de un país' AS 'Detalle'
												END			
										END
									ELSE
										BEGIN
											SELECT @_ERROR AS 'Mensaje','País de gerente de zona incorrecto' AS 'Detalle'
										END
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','Gerente de zona desactivada' AS 'Detalle'
								END
						END
					ELSE
						BEGIN
							SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry asignados a más de una gerente de zona' AS 'Detalle'
						END
				END
			ELSE
				BEGIN
					IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.pin = @PIN)
						BEGIN
							SELECT @_ERROR AS 'Mensaje','IMSI del BlackBerry de gerente de zona incorrecto' AS 'Detalle'	
						END
					ELSE
						BEGIN
							IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.imsi = @IMSI)
								BEGIN
									SELECT @_ERROR AS 'Mensaje','PIN del BlackBerry de gerente de zona incorrecto' AS 'Detalle'
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry de gerente de zona incorrectos' AS 'Detalle'
								END	
						END	
				END
		END
	ELSE
		BEGIN
			SELECT @_ERROR AS 'Mensaje','Código APPID incorrecto' AS 'Detalle'
		END
END

