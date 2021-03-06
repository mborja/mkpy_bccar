USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_seguimiento_obtener_por_region_zona]    Script Date: 01/19/2012 15:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_bel_seguimiento_obtener_por_region_zona]
	@regionCodigo		VARCHAR(2) = '',
	@zonaCodigo			VARCHAR(6) = '',
	@estadoVerificiado	BIT
AS
BEGIN
	SET NOCOUNT ON;

    SELECT DISTINCT
		   --tr.id AS gerenteID,
		   tg.codregion AS regionCodigo,
		   tg.codzona AS zonaCodigo,
		   --tr.verifica AS estadoVerificado,
			COUNT(tg.id) AS cantidad
	FROM   tb_seguimiento tr(NOLOCK)
		   JOIN tb_gerentezona tg(NOLOCK)
				ON  tg.id = tr.idgerentezona
    WHERE
		(tg.codregion = @regionCodigo OR @regionCodigo IS NULL OR @regionCodigo = '')
	AND
		(tg.codzona = @zonaCodigo OR @zonaCodigo IS NULL OR @zonaCodigo = '')
	AND
		(tr.verifica = @estadoVerificiado OR @estadoVerificiado IS NULL)
    GROUP BY
		tg.codregion, tg.codzona--, tr.verifica
END
