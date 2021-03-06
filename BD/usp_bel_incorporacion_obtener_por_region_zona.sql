USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_incorporacion_obtener_por_region_zona]    Script Date: 01/19/2012 15:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_bel_incorporacion_obtener_por_region_zona]
	@regionCodigo VARCHAR(2) = '',
	@zonaCodigo VARCHAR(6) = '',
	@modoGrabacion BIT,
	@estadoVerifica BIT
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT DISTINCT
	       --tg.id AS gerenteID,
	       tg.codregion AS regionCodigo,
	       tg.codzona AS zonaCodigo,
	       ti.graba AS modoGrabacion,
	       ti.verifica AS estadoVerifica,
	       COUNT(ti.id) AS cantidad
--	       (
--	           SELECT COUNT(ti2.id)
--	           FROM   tb_incorporacion ti2(NOLOCK)
--	                  JOIN tb_gerentezona tg2(NOLOCK)
--	                       ON  tg2.id = ti2.idgerentezona
--	           WHERE  tg2.codregion = tg.codregion
--	                  AND tg2.codzona = tg.codzona
--	                  AND ti2.verifica = ti.verifica
--	       ) AS cantidad
	FROM   tb_incorporacion ti(NOLOCK)
	       JOIN tb_gerentezona tg(NOLOCK)
	            ON  tg.id = ti.idgerentezona
	WHERE  (
	           tg.codregion = @regionCodigo
	           OR @regionCodigo IS NULL
	           OR @regionCodigo = ''
	       )
	       AND (
	               tg.codzona = @zonaCodigo
	               OR @zonaCodigo IS NULL
	               OR @zonaCodigo = ''
	           )
	       AND (
	               ti.graba = @modoGrabacion
	               OR @modoGrabacion IS NULL
	           )
	       AND (
	               ti.verifica = @estadoVerifica
	               OR @estadoVerifica IS NULL
	           )
	GROUP BY 
	       tg.codregion,
	       tg.codzona,
	       ti.graba,
	       ti.verifica

END
