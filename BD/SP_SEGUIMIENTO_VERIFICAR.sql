USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_SEGUIMIENTO_VERIFICAR]    Script Date: 01/19/2012 15:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_SEGUIMIENTO_VERIFICAR]
@ID INT
AS
SET NOCOUNT ON
BEGIN
	IF EXISTS (SELECT 1 FROM tb_seguimiento WHERE tb_seguimiento.id = @ID)
		BEGIN
			UPDATE tb_seguimiento SET verifica = CASE verifica WHEN 0 THEN 1 ELSE 0 END  WHERE id = @ID; 
		END
	ELSE
		BEGIN
			RAISERROR ('El seguimiento no existe', 18, 101);
		END
END
