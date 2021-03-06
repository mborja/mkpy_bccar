USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_reingreso_obtener_por_region_zona]    Script Date: 01/19/2012 15:15:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_bel_reingreso_obtener_por_region_zona]
	@regionCodigo		VARCHAR(2) = '',
	@zonaCodigo			VARCHAR(6) = '',
	@estadoVerificiado BIT	
AS
BEGIN
	SET NOCOUNT ON;

    SELECT DISTINCT
		   --tg.id AS gerenteID,
		   tg.codregion AS regionCodigo,
		   tg.codzona AS zonaCodigo,
		   tr.verifica AS estadoVerificado,
		   COUNT(tg.id) AS cantidad
	FROM   tb_reingreso tr(NOLOCK)
		  LEFT JOIN tb_gerentezona tg(NOLOCK)
				ON  tg.id = tr.idgerentezona
		LEFT JOIN tb_consultora tc(NOLOCK)
			ON  tc.id = tr.idconsultora
    WHERE
		( @regionCodigo IS NULL OR tg.codregion = @regionCodigo OR @regionCodigo = '')
	AND
		(@zonaCodigo IS NULL OR tg.codzona = @zonaCodigo OR  @zonaCodigo = '')
	AND
		(@estadoVerificiado IS NULL OR tr.verifica = @estadoVerificiado )
    GROUP BY
		tg.codregion, tg.codzona, tr.verifica
END
