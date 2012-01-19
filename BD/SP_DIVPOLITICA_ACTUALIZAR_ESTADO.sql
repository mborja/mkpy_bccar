USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_DIVPOLITICA_ACTUALIZAR_ESTADO]    Script Date: 01/19/2012 15:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_DIVPOLITICA_ACTUALIZAR_ESTADO]
	@divisionID		int,
	@estado			bit
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE 
		tb_divpolitica
	SET
		estado = @estado
	WHERE
		id = @divisionID
END

