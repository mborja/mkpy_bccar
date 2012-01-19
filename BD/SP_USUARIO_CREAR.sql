USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_USUARIO_CREAR]    Script Date: 01/19/2012 15:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_USUARIO_CREAR]
	@paisID			int,
	@perfilID		int,
	@usuario		varchar(15),
	@clave			varchar(15),
	@nombres		varchar(100),
	@estado			bit
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO 
		tb_usuario
	VALUES
		(
			@paisID,
			@perfilID,
			@usuario,
			@clave,
			@nombres,
			@estado
		)
END

