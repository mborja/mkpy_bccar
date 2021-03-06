USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_INCORPORACION_VERIFICAR]    Script Date: 01/19/2012 15:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_INCORPORACION_VERIFICAR]
@ID INT
AS
SET NOCOUNT ON
BEGIN
	IF EXISTS (SELECT 1 FROM tb_incorporacion WHERE tb_incorporacion.id = @ID AND tb_incorporacion.graba = 1)
		BEGIN
			UPDATE tb_incorporacion SET verifica = CASE verifica WHEN 0 THEN 1 ELSE 0 END  WHERE id = @ID AND graba = 1; 
		END
	ELSE
		BEGIN
			RAISERROR ('La incorporacion no existe o no está en modo real', 18, 101);
		END
END

