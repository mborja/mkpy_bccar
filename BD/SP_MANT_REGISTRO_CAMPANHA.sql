USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_MANT_REGISTRO_CAMPANHA]    Script Date: 01/19/2012 15:05:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- EXEC SP_MANT_REGISTRO_CAMPANHA '8','201106'
ALTER PROCEDURE [dbo].[SP_MANT_REGISTRO_CAMPANHA]
@IDPAIS INT,
@CAMPANHA CHAR(6)
AS
SET NOCOUNT ON
BEGIN
	IF @CAMPANHA <> ''
		BEGIN
			DECLARE @_TRUE BIT
			SET @_TRUE = 'true'
			DECLARE @_ERROR CHAR(2)
			SET @_ERROR = '0|'
			DECLARE @_CERO INT
			SET @_CERO = '0'
			IF EXISTS (SELECT 1 FROM tb_pais WHERE (tb_pais.id = @IDPAIS) AND (tb_pais.id <> @_CERO) AND (tb_pais.estado = @_TRUE))
				BEGIN
					DECLARE @_EXITO CHAR(2)
					SET @_EXITO = '1|'
					DECLARE @_ESTADO BIT
					SET @_ESTADO = 'true'
					UPDATE tb_pais
					SET
					campanhaact = @CAMPANHA
					WHERE tb_pais.id = @IDPAIS
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
