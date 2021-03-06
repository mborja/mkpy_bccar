USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_REINGRESO_VERIFICAR]    Script Date: 01/19/2012 15:08:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_REINGRESO_VERIFICAR]
@ID INT
AS
SET NOCOUNT ON
BEGIN
	IF EXISTS (SELECT 1 FROM tb_reingreso WHERE tb_reingreso.id = @ID)
		BEGIN
			UPDATE tb_reingreso SET verifica = CASE verifica WHEN 0 THEN 1 ELSE 0 END  WHERE id = @ID; 
		END
	ELSE
		BEGIN
			RAISERROR ('El reingreso no existe', 18, 101);
		END
END
