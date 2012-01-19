USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_GERENTEZONA_ACTUALIZAR]    Script Date: 01/19/2012 15:03:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_GERENTEZONA_ACTUALIZAR]
	@gerenteID		int,
	@pin			VARCHAR(20),
	@imsi			VARCHAR(20),
	@estado			bit
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE
		tb_gerentezona
	SET
		pin = @pin,
		imsi = @imsi,
		estado = @estado
	WHERE
		id = @gerenteID
END

