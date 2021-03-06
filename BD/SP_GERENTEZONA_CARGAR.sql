USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_GERENTEZONA_CARGAR]    Script Date: 01/19/2012 15:03:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_GERENTEZONA_CARGAR]
	@gerenteID		int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		tg.id AS gerenteID,
		tg.idpais AS paisID,
		tp.nombre AS paisNombre,
		tg.codregion AS regionCodigo,
		tg.codzona AS zonaCodigo,
		tg.pin,
		tg.imsi,
		tg.codconsu AS consultoraID,
		tg.nombres AS gerenteNombres,
		tg.apepaterno AS gerenteApePaterno,
		tg.apematerno AS gerenteApeMaterno,
		tg.nrodoc,
		tg.telefono,
		tg.email,
		tg.estado
	FROM
		tb_gerentezona tg,
		tb_pais tp
	WITH (NOLOCK)
	WHERE
		tg.idpais = tp.id
	AND
		tg.id = @gerenteID
	END

