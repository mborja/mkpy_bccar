USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_MANT_REGISTRO_FATURACION]    Script Date: 01/19/2012 15:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- EXEC SP_MANT_REGISTRO_FATURACION '8','','','','','' 
ALTER PROCEDURE [dbo].[SP_MANT_REGISTRO_FATURACION]
@IDPAIS INT,
@CODCIA CHAR(2),
@CAMPANHA CHAR(6),
@CODREGION CHAR(2),
@CODZONA CHAR(6),
@FECHA VARCHAR(12)
AS
SET NOCOUNT ON
BEGIN
	DECLARE @_ERROR CHAR(2)
	SET @_ERROR = '0|'
	IF @CAMPANHA <> ''
		BEGIN
			DECLARE @_TRUE BIT
			SET @_TRUE = 'true'
			DECLARE @_CERO INT
			SET @_CERO = '0'
			IF EXISTS (SELECT 1 FROM tb_pais WHERE (tb_pais.id = @IDPAIS) AND (tb_pais.id <> @_CERO) AND (tb_pais.estado = @_TRUE))
				BEGIN
					DECLARE @_EXITO CHAR(2)
					SET @_EXITO = '1|'
					IF @FECHA = ''
						BEGIN
							SET @FECHA = '199001010000'
						END	
					DECLARE @_FECHA SMALLDATETIME
					SET @_FECHA = CONVERT(SMALLDATETIME,SUBSTRING(@FECHA,1,8)+SPACE(1)+SUBSTRING(@FECHA,9,2) + ':' + SUBSTRING(@FECHA,11,2))										
					DECLARE @_ESTADO BIT
					SET @_ESTADO = 'true'
					INSERT INTO tb_facturacion
					(
						idpais,
						campanha,
						codcia,
						codregion,
						codzona,
						fecha,
						estado
					)
					VALUES
					(
						@IDPAIS,
						@CAMPANHA,
						@CODCIA,
						@CODREGION,
						@CODZONA,
						@_FECHA,
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
			SELECT @_ERROR AS 'Mensaje','Campanha vacía' AS 'Detalle'
		END
END

