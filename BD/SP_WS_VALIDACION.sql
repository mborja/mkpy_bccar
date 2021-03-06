USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_WS_VALIDACION]    Script Date: 01/19/2012 14:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC SP_WS_VALIDACION '0xcc76ecb46671657aL','8','5738A3C7','DOM482683524852','001111'
ALTER PROCEDURE [dbo].[SP_WS_VALIDACION]
@APPID CHAR(19),
@IDPAIS INT,
@PIN CHAR(20) ,
@IMSI CHAR(20),
@CODIGO CHAR(6)    
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
	SET @_APPID = (SELECT tb_tabla.descripcion FROM tb_tabla WHERE (tb_tabla.id = @_TIPOTABLA_APPID) AND (tb_tabla.estado = @_TRUE))
	IF @APPID = @_APPID
		BEGIN
			IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE (tb_gerentezona.codregion + tb_gerentezona.codzona) = @CODIGO)
				BEGIN
					DECLARE @_UNO INT
					SET @_UNO = '1'
					DECLARE @_GERENTEZONA_CODIGO_CONTA INT
					SET @_GERENTEZONA_CODIGO_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona WHERE (tb_gerentezona.codregion + tb_gerentezona.codzona) = @CODIGO)
					IF @_GERENTEZONA_CODIGO_CONTA = @_UNO
						BEGIN
							DECLARE @_GERENTEZONA_ESTADO BIT
							SET @_GERENTEZONA_ESTADO = (SELECT tb_gerentezona.estado FROM tb_gerentezona WHERE (tb_gerentezona.codregion + tb_gerentezona.codzona) = @CODIGO)
							IF @_GERENTEZONA_ESTADO = @_TRUE
								BEGIN
									DECLARE @_CERO INT
									SET @_CERO = '0'
									IF EXISTS (SELECT 1 FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE ((tb_gerentezona.codregion + tb_gerentezona.codzona) = @CODIGO) AND (tb_gerentezona.idpais = @IDPAIS) AND (tb_pais.id <> @_CERO) AND (tb_pais.estado = @_TRUE))
										BEGIN
											DECLARE @_GERENTEZONA_PAIS_CONTA INT
											SET @_GERENTEZONA_PAIS_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE ((tb_gerentezona.codregion + tb_gerentezona.codzona) = @CODIGO) AND (tb_gerentezona.idpais = @IDPAIS) AND (tb_pais.estado = @_TRUE))
											IF @_GERENTEZONA_PAIS_CONTA = @_UNO
												BEGIN
													DECLARE @_VACIO CHAR
													SET @_VACIO = ''
													DECLARE @_PIN CHAR(20)
													SET @_PIN = (SELECT tb_gerentezona.pin FROM tb_gerentezona WHERE (tb_gerentezona.codregion + tb_gerentezona.codzona) = @CODIGO)
													DECLARE @_IMSI CHAR(20)
													SET @_IMSI = (SELECT tb_gerentezona.imsi FROM tb_gerentezona WHERE (tb_gerentezona.codregion + tb_gerentezona.codzona) = @CODIGO)
													IF ((@_PIN = @_VACIO) AND (@_IMSI = @_VACIO)) OR ((@_PIN = @PIN) AND (@_IMSI = @IMSI))
														BEGIN
															DECLARE @_DUPLICADO INT
															SET @_DUPLICADO = 0
															IF (@_PIN = @_VACIO) AND (@_IMSI = @_VACIO)
																BEGIN
																    SET @_DUPLICADO = (SELECT COUNT(tb_gerentezona.id) FROM  tb_gerentezona WHERE tb_gerentezona.pin = @PIN AND tb_gerentezona.imsi = @IMSI)
																    IF(@_DUPLICADO = 0)
																    BEGIN
																		UPDATE tb_gerentezona
																		SET tb_gerentezona.pin = @PIN,tb_gerentezona.imsi = @IMSI
																		WHERE (tb_gerentezona.codregion + tb_gerentezona.codzona) = @CODIGO
																	END
																END
															IF(@_DUPLICADO=0)	
																BEGIN
																	DECLARE @_DOCIDENTIDAD CHAR(2)
																	SET @_DOCIDENTIDAD = (SELECT tb_pais.tipodoc FROM tb_pais WHERE tb_pais.id = @IDPAIS) 
																	DECLARE @_FECHA SMALLDATETIME
																	SET @_FECHA = GETDATE()
																	DECLARE @_FECHA_yyyymmddHHMM CHAR(12) 
																	SET @_FECHA_yyyymmddHHMM  = REPLACE(REPLACE(REPLACE(CONVERT(CHAR(16),@_FECHA,20),'-',''),' ',''),':','') 
																	DECLARE @_CADUCIDAD_yyyymmddHHMM CHAR(12)
																	SET @_CADUCIDAD_yyyymmddHHMM = (SELECT REPLACE(REPLACE(REPLACE(CONVERT(CHAR(16),DATEADD(hh,tb_pais.caducidad,@_FECHA),20),'-',''),' ',''),':','') FROM tb_pais WHERE tb_pais.id = @IDPAIS)
																	SELECT 
																	tb_gerentezona.nombres,
																	tb_gerentezona.apepaterno,
																	tb_gerentezona.apematerno,
																	tb_gerentezona.codregion,
																	RTRIM(LTRIM(tb_gerentezona.codzona)) AS codzona,
																	tb_gerentezona.email,
																	@_DOCIDENTIDAD AS descripcion,
																	RTRIM(LTRIM(tb_gerentezona.nrodoc)) AS nrodoc,
																	RTRIM(LTRIM(tb_gerentezona.telefono)) AS telefono,
																	tb_pais.campanhaact,
																	@_FECHA_yyyymmddHHMM AS fecha, 
																	@_CADUCIDAD_yyyymmddHHMM AS caducidad,
																	CONVERT(INT,tb_pais.seguimientobb) AS seguimientobb,
																	CONVERT(INT,tb_pais.reingresobb) AS reingresobb,
																	CONVERT(INT,tb_pais.adicionalsc) AS adicionalsc,
																	CONVERT(INT,tb_pais.gpsbb) AS gpsbb,
																	CONVERT(INT,tb_pais.verificadoincorp) AS verificaincorp,
																	tb_pais.url,
																	tb_pais.version
																	FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id
																	WHERE (tb_gerentezona.codregion + tb_gerentezona.codzona) = @CODIGO
																END
															ELSE
																BEGIN
																	SELECT @_ERROR AS 'Mensaje','Ya existe otro Gerente de zona con IMSI/PIN registrado' AS 'Detalle'	
																END
														END
													ELSE
														BEGIN
															IF (@_PIN = @PIN)
																BEGIN
																	SELECT @_ERROR AS 'Mensaje','IMSI del BlackBerry de gerente de zona incorrecto' AS 'Detalle'	
																END
															ELSE
																BEGIN
																	IF (@_IMSI = @IMSI)
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
							SELECT @_ERROR AS 'Mensaje','Existen más de una gerente de zona con el mismo código' AS 'Detalle'
						END					
				END
			ELSE
				BEGIN
					SELECT @_ERROR AS 'Mensaje','Código de gerente de zona incorrecto' AS 'Detalle'
				END
		END
	ELSE
		BEGIN
			SELECT @_ERROR AS 'Mensaje','Código APPID incorrecto' AS 'Detalle'
		END
END


