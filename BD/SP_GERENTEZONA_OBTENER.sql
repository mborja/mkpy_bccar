USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_GERENTEZONA_OBTENER]    Script Date: 01/19/2012 15:04:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_GERENTEZONA_OBTENER]
	@nombres		varchar(30),
	@regionCodigo	varchar(2),
	@zonaCodgo		varchar(6)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		tg.id AS gerenteID,
		tg.nombres AS gerenteNombres,
		tg.codregion AS regionCodigo,
		tg.codzona AS zonaCodigo,
		tg.email AS email
	FROM
		tb_gerentezona tg
	WITH (NOLOCK)
	WHERE
		tg.nombres like '%' + @nombres + '%'
	AND
		tg.codregion like '%' + @regionCodigo + '%'
	AND
		tg.codzona like '%' + @zonaCodgo + '%'
	ORDER BY tg.nombres	
END