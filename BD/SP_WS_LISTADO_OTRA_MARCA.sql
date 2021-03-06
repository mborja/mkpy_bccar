USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_WS_LISTADO_OTRA_MARCA]    Script Date: 01/19/2012 15:12:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- EXEC SP_WS_LISTADO_OTRA_MARCA '0xcc76ecb46671657aL','8','5738A3C7','DOM482683524852'
ALTER PROCEDURE [dbo].[SP_WS_LISTADO_OTRA_MARCA]
@APPID CHAR(19),
@IDPAIS INT,
@PIN CHAR(20) ,
@IMSI CHAR(20)
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
													DECLARE @_TIPOTABLA_CONTACTO INT
													SET @_TIPOTABLA_CONTACTO = '4'
													SELECT tb_tabla.cod,tb_tabla.descripcion 
													FROM tb_tabla 
													WHERE tb_tabla.idtipotabla = @_TIPOTABLA_CONTACTO AND tb_tabla.estado = @_TRUE	
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
							SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry perteneces a más de una gerente de zona' AS 'Detalle'
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
