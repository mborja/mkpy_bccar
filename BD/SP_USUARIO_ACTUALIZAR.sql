USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_USUARIO_ACTUALIZAR]    Script Date: 01/19/2012 15:10:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_USUARIO_ACTUALIZAR]
	@usuarioID		int,
	@perfilID		int,
	@nombres		varchar(100),
	@estado			bit
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE 
		tb_usuario
	SET
		idtablaperfil = @perfilID,
		nombre = @nombres,
		estado = @estado
	WHERE
		id = @usuarioID
END

