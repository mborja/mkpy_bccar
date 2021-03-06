USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_WS_REGISTRO_INCORPORACION]    Script Date: 01/19/2012 14:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
EXEC SP_WS_REGISTRO_INCORPORACION
@APPID = '0xcc76ecb46671657aL',
@IDPAIS = '8',
@PIN = '5738A3C7',
@IMSI = 'DOM482683524852',
@CODIGOZONA = '1111',
@CODIGOTERRITORIO = '',
@CODIGOCONSULTORARECOMIENDA = '',
@FECHA = '',
@PRIMERNOMBRE = 'nombre9a',  
@SEGUNDONOMBRE = 'nombre9b',
@APELLIDOPATERNO = 'apepaterno9',
@APELLIDOMATERNO = 'apematerno9',
@NRODOCUMENTO = '99999',
@TELEFONOCASA = '',
@TELEFONOCELULAR = '',
@CORREOELECTRONICO = '', 
@IDCONTACTO = '1', 
@IDOTRAMARCA = '1', 
@IDESTADOCIVIL = '1', 
@IDNIVELEDUCATIVO = '1', 
@FECHANACIMIENTO = '', 
@SOLICITANTE_DIRECCION = '', 
@SOLICITANTE_CODIGOPOSTAL = '', 
@SOLICITANTE_REFERENCIA = '', 
@SOLICITANTE_DIVISIONPOLITICA1 = '', 
@SOLICITANTE_DIVISIONPOLITICA2 = '', 
@ENTREGA_DIRECCION = '', 
@ENTREGA_CODIGOPOSTAL = '', 
@ENTREGA_REFERENCIA = '', 
@ENTREGA_DIVISIONPOLITICA = '', 
@REFFAM_NOMBRES = '', 
@REFFAM_APELLIDOPATERNO = '', 
@REFFAM_APELLIDOMATERNO = '', 
@REFFAM_DIRECCION = '', 
@REFFAM_TELEFONO = '', 
@REFFAM_CELULAR = '', 
@REFFAM_IDVINCULO = '1', 
@REFNOFAM_NOMBRES = '', 
@REFNOFAM_APELLIDOPATERNO = '', 
@REFNOFAM_APELLIDOMATERNO = '', 
@REFNOFAM_DIRECCION = '', 
@REFNOFAM_TELEFONO = '', 
@REFNOFAM_CELULAR = '', 
@REFNOFAM_IDVINCULO = '5', 
@ADICIONAL_PROFESION = '', 
@ADICIONAL_LUGARTRABAJO = '', 
@ADICIONAL_TELEFONOTRABAJO = '', 
@ADICIONAL_HORAVISITA = '', 
@ADICIONAL_NROHIJOS = '', 
@ADICIONAL_NROINFANTES = '', 
@ADICIONAL_NROESCOLARES = '', 
@ADICIONAL_NRONIVELSUPERIOR = '', 
@ADICIONAL_NROADULTOS = '', 
@RECORD_PIN = '', 
@RECORD_IMSI = '', 
@RECORD_LONGITUD = '', 
@RECORD_LATITUD = '', 
@RECORD_MARGEN = '', 
@RECORD_NROSATELITES = '', 
@RECORD_OBSERVACION = '', 
@RECORD_FECHAVISITA = '', 
@TIPOGRABACION = '1'
*/

ALTER PROCEDURE [dbo].[SP_WS_REGISTRO_INCORPORACION]
@APPID CHAR(19),
@IDPAIS INT,
@PIN CHAR(20),
@IMSI CHAR(20),
@CODIGOZONA CHAR(6),
@CODIGOTERRITORIO CHAR(3),
@CODIGOCONSULTORARECOMIENDA CHAR(15),
@FECHA CHAR(12),
@PRIMERNOMBRE VARCHAR(30),
@SEGUNDONOMBRE VARCHAR(30),
@APELLIDOPATERNO VARCHAR(30),
@APELLIDOMATERNO VARCHAR(30),
@NRODOCUMENTO VARCHAR(18),
@TELEFONOCASA CHAR(15),
@TELEFONOCELULAR CHAR(15),
@CORREOELECTRONICO CHAR(40), 
@IDCONTACTO INT,
@IDOTRAMARCA INT,
@IDESTADOCIVIL INT,
@IDNIVELEDUCATIVO INT,
@FECHANACIMIENTO CHAR(12),
@SOLICITANTE_DIRECCION VARCHAR(100),
@SOLICITANTE_CODIGOPOSTAL VARCHAR(10),
@SOLICITANTE_REFERENCIA VARCHAR(100),
@SOLICITANTE_DIVISIONPOLITICA1 VARCHAR(50),
@SOLICITANTE_DIVISIONPOLITICA2 VARCHAR(50),
@ENTREGA_DIRECCION VARCHAR(100),
@ENTREGA_CODIGOPOSTAL VARCHAR(10),
@ENTREGA_REFERENCIA VARCHAR(100),
@ENTREGA_DIVISIONPOLITICA VARCHAR(50),
@REFFAM_NOMBRES VARCHAR(30),
@REFFAM_APELLIDOPATERNO VARCHAR(30),
@REFFAM_APELLIDOMATERNO VARCHAR(30),
@REFFAM_DIRECCION VARCHAR(100),
@REFFAM_TELEFONO CHAR(15),
@REFFAM_CELULAR CHAR(15),
@REFFAM_IDVINCULO INT,
@REFNOFAM_NOMBRES VARCHAR(30),
@REFNOFAM_APELLIDOPATERNO VARCHAR(30),
@REFNOFAM_APELLIDOMATERNO VARCHAR(30),
@REFNOFAM_DIRECCION VARCHAR(100),
@REFNOFAM_TELEFONO CHAR(15), 
@REFNOFAM_CELULAR CHAR(15),
@REFNOFAM_IDVINCULO INT,
@ADICIONAL_PROFESION VARCHAR(100),
@ADICIONAL_LUGARTRABAJO VARCHAR(50),
@ADICIONAL_TELEFONOTRABAJO CHAR(15),
@ADICIONAL_HORAVISITA CHAR(4),
@ADICIONAL_NROHIJOS INT,
@ADICIONAL_NROINFANTES INT,
@ADICIONAL_NROESCOLARES INT,
@ADICIONAL_NRONIVELSUPERIOR INT,
@ADICIONAL_NROADULTOS INT,
@RECORD_PIN CHAR(20),
@RECORD_IMSI CHAR(20),
@RECORD_LONGITUD VARCHAR(20),
@RECORD_LATITUD VARCHAR(20),
@RECORD_MARGEN CHAR(9),
@RECORD_NROSATELITES INT,
@RECORD_OBSERVACION VARCHAR(200),
@RECORD_FECHAVISITA VARCHAR(12),
@TIPOGRABACION BIT
AS
SET NOCOUNT ON
BEGIN
	DECLARE @_TRUE BIT
	SET @_TRUE = 'true'
	DECLARE @_ERROR CHAR(2)
	SET @_ERROR = '0|'
	IF @NRODOCUMENTO <> ''
		BEGIN
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
															DECLARE @_EXITO CHAR(2)
															SET @_EXITO = '1|'
															IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE (tb_gerentezona.codzona = SUBSTRING(@CODIGOZONA, 3, LEN(@CODIGOZONA))) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
																BEGIN
																	DECLARE @_GERENTEZONA_CODZONA_CONTA INT
																	SET @_GERENTEZONA_CODZONA_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona WHERE (tb_gerentezona.codzona = SUBSTRING(@CODIGOZONA, 3, LEN(@CODIGOZONA))) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
																	IF @_GERENTEZONA_CODZONA_CONTA = @_UNO
																		BEGIN
																		    IF EXISTS (SELECT DISTINCT RTRIM(LTRIM(CODSECCION)) + RTRIM(LTRIM(CODTERRITORIO)) FROM db_bcaribe.dbo.TB_CONSULTORA WHERE CODZONA = @CODIGOZONA AND (RTRIM(LTRIM(CODSECCION)) + RTRIM(LTRIM(CODTERRITORIO))) = @CODIGOTERRITORIO)
																				BEGIN
																					DECLARE @_IDGERENTEZONA INT
																					SET @_IDGERENTEZONA = (SELECT tb_gerentezona.id FROM tb_gerentezona WHERE tb_gerentezona.codzona = SUBSTRING(@CODIGOZONA, 3, LEN(@CODIGOZONA)) AND tb_gerentezona.pin = @PIN AND tb_gerentezona.imsi = @IMSI)
																					DECLARE @_IDCONSULTORA INT	
																					SET @_IDCONSULTORA = @_CERO						
																					DECLARE @_TIPOTABLA_CONTACTO INT
																					SET @_TIPOTABLA_CONTACTO = '3'
																					DECLARE @_TIPOTABLA_OTRAMARCA INT
																					SET @_TIPOTABLA_OTRAMARCA = '4'
																					DECLARE @_TIPOTABLA_ESTADOCIVIL INT
																					SET @_TIPOTABLA_ESTADOCIVIL = '5'
																					DECLARE @_TIPOTABLA_NIVELEDUCATIVO INT
																					SET @_TIPOTABLA_NIVELEDUCATIVO = '6'
																					DECLARE @_TIPOTABLA_VINCULO INT
																					SET @_TIPOTABLA_VINCULO = '7'
																					DECLARE	@_IDCONTACTO INT
																					SET @_IDCONTACTO = (SELECT tb_tabla.id FROM tb_tabla WHERE tb_tabla.cod = @IDCONTACTO AND tb_tabla.idtipotabla = @_TIPOTABLA_CONTACTO)		
																					DECLARE @_IDOTRAMARCA INT
																					SET @_IDOTRAMARCA = (SELECT tb_tabla.id FROM tb_tabla WHERE tb_tabla.cod = @IDOTRAMARCA AND tb_tabla.idtipotabla = @_TIPOTABLA_OTRAMARCA)
																					DECLARE @_IDESTADOCIVIL INT
																					SET @_IDESTADOCIVIL = (SELECT tb_tabla.id FROM tb_tabla WHERE tb_tabla.cod = @IDESTADOCIVIL AND tb_tabla.idtipotabla = @_TIPOTABLA_ESTADOCIVIL)
																					DECLARE	@_IDNIVELEDUCATIVO INT
																					SET @_IDNIVELEDUCATIVO = (SELECT tb_tabla.id FROM tb_tabla WHERE tb_tabla.cod = @IDNIVELEDUCATIVO AND tb_tabla.idtipotabla = @_TIPOTABLA_NIVELEDUCATIVO)
																					DECLARE @_REFFAM_IDVINCULO INT
																					SET @_REFFAM_IDVINCULO = (SELECT tb_tabla.id FROM tb_tabla WHERE tb_tabla.cod = @REFFAM_IDVINCULO AND tb_tabla.idtipotabla = @_TIPOTABLA_VINCULO)
																					DECLARE @_REFNOFAM_IDVINCULO INT
																					SET @_REFNOFAM_IDVINCULO = (SELECT tb_tabla.id FROM tb_tabla WHERE tb_tabla.cod = @REFNOFAM_IDVINCULO AND tb_tabla.idtipotabla = @_TIPOTABLA_VINCULO)
																					DECLARE @_NOMBRES VARCHAR(30)
																					SET @_NOMBRES = @PRIMERNOMBRE + SPACE(1) + @SEGUNDONOMBRE
																					IF @ADICIONAL_NROHIJOS = ''
																						BEGIN
																							SET @ADICIONAL_NROHIJOS = '0'
																						END
																					IF @ADICIONAL_NROINFANTES = ''
																						BEGIN
																							SET @ADICIONAL_NROINFANTES = '0'
																						END
																					IF @ADICIONAL_NROESCOLARES = ''
																						BEGIN
																							SET @ADICIONAL_NROESCOLARES = '0'
																						END
																					IF @ADICIONAL_NRONIVELSUPERIOR = ''
																						BEGIN
																							SET @ADICIONAL_NRONIVELSUPERIOR = '0'
																						END
																					IF @ADICIONAL_NROADULTOS = ''
																						BEGIN
																							SET @ADICIONAL_NROADULTOS = '0'
																						END
																					IF @RECORD_NROSATELITES = ''
																						BEGIN
																							SET @RECORD_NROSATELITES = '0'
																						END
																						
																					-- asignando fecha de nacimiento
																					
																					DECLARE @_FECHANACIMIENTO SMALLDATETIME
																					IF @FECHANACIMIENTO = ''
																						BEGIN
																							SET @FECHANACIMIENTO = '199001010000'
																							SET @_FECHANACIMIENTO = CONVERT(SMALLDATETIME,SUBSTRING(@FECHANACIMIENTO,1,8)+SPACE(1)+SUBSTRING(@FECHANACIMIENTO,9,2) + ':' + SUBSTRING(@FECHANACIMIENTO,11,2))
																						END	
																					ELSE
																						BEGIN
																							SET @_FECHANACIMIENTO = CONVERT(SMALLDATETIME,SUBSTRING(@FECHANACIMIENTO,1,8)+SPACE(1)+SUBSTRING(@FECHANACIMIENTO,9,2))
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
																							SET @_RECORD_FECHAVISITA = CONVERT(SMALLDATETIME,SUBSTRING(@RECORD_FECHAVISITA,1,8)+SPACE(1)+SUBSTRING(@RECORD_FECHAVISITA,9,2))
																						END
																					
																					--asignando hora
																					DECLARE @_ADICIONAL_HORAVISITA SMALLDATETIME
																					DECLARE @_ADICIONAL_HORAVISITA_yyyymmddHHMM CHAR(12)
																					
																					IF @ADICIONAL_HORAVISITA = ''
																						BEGIN
																							SET @ADICIONAL_HORAVISITA = '0000'
																							SET	@_ADICIONAL_HORAVISITA_yyyymmddHHMM = '19000101' + @ADICIONAL_HORAVISITA
																							SET @_ADICIONAL_HORAVISITA = CONVERT(SMALLDATETIME,SUBSTRING(@_ADICIONAL_HORAVISITA_yyyymmddHHMM,1,8)+SPACE(1)+SUBSTRING(@_ADICIONAL_HORAVISITA_yyyymmddHHMM,9,2) + ':' + SUBSTRING(@_ADICIONAL_HORAVISITA_yyyymmddHHMM,11,2))
																						END	
																					ELSE
																						BEGIN
																							SET	@_ADICIONAL_HORAVISITA_yyyymmddHHMM = '19000101' + @ADICIONAL_HORAVISITA
																							SET @_ADICIONAL_HORAVISITA = CONVERT(SMALLDATETIME,SUBSTRING(@_ADICIONAL_HORAVISITA_yyyymmddHHMM,1,8)+SPACE(1)+SUBSTRING(@_ADICIONAL_HORAVISITA_yyyymmddHHMM,9,2) + ':' + SUBSTRING(@_ADICIONAL_HORAVISITA_yyyymmddHHMM,11,2))
																						END
																					
																					-- asignando fecha
																					DECLARE @_FECHA SMALLDATETIME
																					
																					IF @FECHA = ''
																						BEGIN
																							SET @FECHA = '190001010000'
																							SET @_FECHA = CONVERT(SMALLDATETIME,SUBSTRING(@FECHA,1,8)+SPACE(1)+SUBSTRING(@FECHA,9,2) + ':' + SUBSTRING(@FECHA,11,2))
																						END	
																					ELSE
																						BEGIN
																							SET @_FECHA = CONVERT(SMALLDATETIME,SUBSTRING(@FECHA,1,8)+SPACE(1)+SUBSTRING(@FECHA,9,2))
																						END
																					
																					DECLARE @_ESTADO BIT
																					IF @TIPOGRABACION = @_TRUE
																						BEGIN
																							SET @_ESTADO = 'true'
																						END
																					ELSE
																						BEGIN
																							SET @_ESTADO = 'false'
																						END	
																						
																				    DECLARE @_ERROR_CONS_OBLI BIT
																				    SET @_ERROR_CONS_OBLI = 'false'
																						
																					IF (@_IDCONTACTO=1 AND EXISTS (SELECT 1 FROM tb_consultora where tb_consultora.cod = @CODIGOCONSULTORARECOMIENDA))
																						BEGIN
																						     SET @_ERROR_CONS_OBLI = 'true'
																						END	
																						
																					IF @_ERROR_CONS_OBLI = 'false'
																						BEGIN	
																							
																							IF NOT EXISTS (SELECT 1 FROM tb_consultora WHERE tb_consultora.nrodoc = @NRODOCUMENTO)
																								BEGIN
																									IF NOT EXISTS (SELECT 1 FROM tb_incorporacion WHERE tb_incorporacion.nrodoc = @NRODOCUMENTO)
																										BEGIN
																											INSERT INTO tb_incorporacion 
																											(
																												idpais,
																												idgerentezona,
																												idconsultora,
																												idtablacontacto,
																												idtablaotramarca,
																												idtablaestadocivil,
																												idtablaniveleducativo,
																												idtablareffamtipovinculo,
																												idtablarefnofamtipovinculo,
																												codterritorio,
																												codconsurecom,
																												apepaterno,
																												apematerno,
																												nombres,
																												nrodoc,
																												telefcasa,
																												telefcelular,
																												email,
																												fechnac,
																												solicdireccion,
																												soliccodpostal,
																												solicreferencia,
																												solicdivpolitica1,
																												solicdivpolitica2,
																												entregdireccion,
																												entregcodpostal,
																												entregreferencia,
																												entregdivpolitica,
																												reffamapepaterno,
																												reffamapematerno,
																												reffamnombres,
																												reffamdireccion,
																												reffamtelefono,
																												reffamcelular,
																												refnofamapepaterno,
																												refnofamapematerno,
																												refnofamnombres,
																												refnofamdireccion,
																												refnofamtelefono,
																												refnofamcelular,
																												adicprofesion,
																												adiclugartrab,
																												adictelefonotrab,
																												adichoravisita,
																												adicnrohijos,
																												adicnroinfantes,
																												adicnroescolares,
																												adicnronivsuperior,
																												adicnroadultos, 
																												recpin,
																												recimsi,
																												reclongitud,
																												reclatitud,
																												recmargen,
																												recnrosatelites,
																												recobservacion,
																												recfechvisita,
																												fecha,
																												graba,	
																												estado
																											)
																											VALUES
																											(
																												@IDPAIS,
																												@_IDGERENTEZONA,
																												null, --@_IDCONSULTORA,
																												@_IDCONTACTO,
																												@_IDOTRAMARCA,
																												@_IDESTADOCIVIL,
																												@_IDNIVELEDUCATIVO,
																												@_REFFAM_IDVINCULO,
																												@_REFNOFAM_IDVINCULO,
																												@CODIGOTERRITORIO,
																												@CODIGOCONSULTORARECOMIENDA,
																												@APELLIDOPATERNO,
																												@APELLIDOMATERNO,
																												@_NOMBRES,
																												@NRODOCUMENTO,
																												@TELEFONOCASA,
																												@TELEFONOCELULAR,
																												@CORREOELECTRONICO,
																												@_FECHANACIMIENTO,
																												@SOLICITANTE_DIRECCION,
																												@SOLICITANTE_CODIGOPOSTAL,
																												@SOLICITANTE_REFERENCIA,
																												@SOLICITANTE_DIVISIONPOLITICA1,
																												@SOLICITANTE_DIVISIONPOLITICA2,
																												@ENTREGA_DIRECCION,
																												@ENTREGA_CODIGOPOSTAL,
																												@ENTREGA_REFERENCIA, 
																												@ENTREGA_DIVISIONPOLITICA, 
																												@REFFAM_APELLIDOPATERNO,
																												@REFFAM_APELLIDOMATERNO,
																												@REFFAM_NOMBRES,
																												@REFFAM_DIRECCION,
																												@REFFAM_TELEFONO,
																												@REFFAM_CELULAR,
																												@REFNOFAM_APELLIDOPATERNO,
																												@REFNOFAM_APELLIDOMATERNO,
																												@REFNOFAM_NOMBRES,
																												@REFNOFAM_DIRECCION,
																												@REFNOFAM_TELEFONO,
																												@REFNOFAM_CELULAR,
																												@ADICIONAL_PROFESION,
																												@ADICIONAL_LUGARTRABAJO,
																												@ADICIONAL_TELEFONOTRABAJO,
																												@_ADICIONAL_HORAVISITA,
																												@ADICIONAL_NROHIJOS,
																												@ADICIONAL_NROINFANTES,
																												@ADICIONAL_NROESCOLARES,
																												@ADICIONAL_NRONIVELSUPERIOR,
																												@ADICIONAL_NROADULTOS,
																												@RECORD_PIN,
																												@RECORD_IMSI,								
																												@RECORD_LONGITUD,
																												@RECORD_LATITUD,
																												@RECORD_MARGEN,
																												@RECORD_NROSATELITES,
																												@RECORD_OBSERVACION, 
																												@_RECORD_FECHAVISITA, 
																												@_FECHA,
																												@TIPOGRABACION,
																												@_ESTADO	
																											)
																											SELECT @_EXITO AS 'Mensaje','Grabación exitosa' AS 'Detalle'
																										END
																									ELSE
																										BEGIN
																											DECLARE @_TIPOGRABACION BIT
																											SET @_TIPOGRABACION = (SELECT tb_incorporacion.graba FROM tb_incorporacion WHERE tb_incorporacion.nrodoc = @NRODOCUMENTO)	
																											IF @_TIPOGRABACION <> @_TRUE
																												BEGIN
																													UPDATE tb_incorporacion
																													SET
																													idpais = @IDPAIS,
																													idgerentezona = @_IDGERENTEZONA,
																													idconsultora = @_IDCONSULTORA,
																													idtablacontacto = @_IDCONTACTO,
																													idtablaotramarca = @_IDOTRAMARCA,
																													idtablaestadocivil = @_IDESTADOCIVIL,
																													idtablaniveleducativo = @_IDNIVELEDUCATIVO,
																													idtablareffamtipovinculo = @_REFFAM_IDVINCULO,
																													idtablarefnofamtipovinculo = @_REFNOFAM_IDVINCULO,
																													codterritorio = @CODIGOTERRITORIO,
																													codconsurecom = @CODIGOCONSULTORARECOMIENDA,
																													apepaterno = @APELLIDOPATERNO,
																													apematerno = @APELLIDOMATERNO,
																													nombres = @_NOMBRES,
																													nrodoc = @NRODOCUMENTO,
																													telefcasa = @TELEFONOCASA,
																													telefcelular = @TELEFONOCELULAR,
																													email = @CORREOELECTRONICO,
																													fechnac = @_FECHANACIMIENTO,
																													solicdireccion = @SOLICITANTE_DIRECCION,
																													soliccodpostal = @SOLICITANTE_CODIGOPOSTAL,
																													solicreferencia = @SOLICITANTE_REFERENCIA,
																													solicdivpolitica1 = @SOLICITANTE_DIVISIONPOLITICA1,
																													solicdivpolitica2 = @SOLICITANTE_DIVISIONPOLITICA2,
																													entregdireccion = @ENTREGA_DIRECCION,
																													entregcodpostal = @ENTREGA_CODIGOPOSTAL,
																													entregreferencia = @ENTREGA_REFERENCIA, 
																													entregdivpolitica = @ENTREGA_DIVISIONPOLITICA, 
																													reffamapepaterno = @REFFAM_APELLIDOPATERNO,
																													reffamapematerno = @REFFAM_APELLIDOMATERNO,
																													reffamnombres = @REFFAM_NOMBRES,
																													reffamdireccion = @REFFAM_DIRECCION,
																													reffamtelefono = @REFFAM_TELEFONO,
																													reffamcelular = @REFFAM_CELULAR,
																													refnofamapepaterno = @REFNOFAM_APELLIDOPATERNO,
																													refnofamapematerno = @REFNOFAM_APELLIDOMATERNO,
																													refnofamnombres = @REFNOFAM_NOMBRES,
																													refnofamdireccion = @REFNOFAM_DIRECCION,
																													refnofamtelefono = @REFNOFAM_TELEFONO,
																													refnofamcelular = @REFNOFAM_CELULAR,
																													adicprofesion = @ADICIONAL_PROFESION,
																													adiclugartrab = @ADICIONAL_LUGARTRABAJO,
																													adictelefonotrab = @ADICIONAL_TELEFONOTRABAJO,
																													adichoravisita = @_ADICIONAL_HORAVISITA,
																													adicnrohijos = @ADICIONAL_NROHIJOS,
																													adicnroinfantes = @ADICIONAL_NROINFANTES,
																													adicnroescolares = @ADICIONAL_NROESCOLARES,
																													adicnronivsuperior = @ADICIONAL_NRONIVELSUPERIOR,
																													adicnroadultos = @ADICIONAL_NROADULTOS,
																													recpin = @RECORD_PIN,
																													recimsi = @RECORD_IMSI,
																													reclongitud = @RECORD_LONGITUD,
																													reclatitud = @RECORD_LATITUD,
																													recmargen = @RECORD_MARGEN,
																													recnrosatelites = @RECORD_NROSATELITES,
																													recobservacion = @RECORD_OBSERVACION, 
																													recfechvisita = @_RECORD_FECHAVISITA, 
																													fecha = @_FECHA,
																													graba = @TIPOGRABACION,
																													estado = @_ESTADO
																													WHERE nrodoc = @NRODOCUMENTO
																													SELECT @_EXITO AS 'Mensaje','Grabación exitosa' AS 'Detalle'
																												END
																											ELSE
																												BEGIN
																													SELECT @_ERROR AS 'Mensaje','No se puede modificar un grabación hecha en modo real' AS 'Detalle'
																												END
																										END	
																								END
																					
																					ELSE
																						BEGIN
																							SELECT @_ERROR AS 'Mensaje','El documento ya está registrado como consultora' AS 'Detalle'
																						END
																					
																						END
																					ELSE
																					    BEGIN
																							SELECT @_ERROR AS 'Mensaje','El código de  la consultora de referencia' AS 'Detalle'
																					    END
																						
																				END
																			ELSE
																				BEGIN
																					SELECT @_ERROR AS 'Mensaje','El código de territorio no es correcto' AS 'Detalle'
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
	ELSE
		BEGIN
			SELECT @_ERROR AS 'Mensaje','Documento de identidad vacío' AS 'Detalle'
		END
END
