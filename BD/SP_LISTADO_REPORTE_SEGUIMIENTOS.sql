USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTADO_REPORTE_SEGUIMIENTOS]    Script Date: 01/19/2012 15:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vsanchez
-- Create date: 18/05/2011
-- Description:	Obtiene listado de incorporaciones y/o consultoras de acuerdo a parámetros de búsqueda enviados.
-- =============================================
ALTER PROCEDURE [dbo].[SP_LISTADO_REPORTE_SEGUIMIENTOS] AS
BEGIN
	SET NOCOUNT ON;
SELECT 
		ts.id AS seguimientoID,
		tc.id AS consultoraID,
		tg.codregion AS region,
		tg.codzona AS zona,
		ts.fecha AS fechaIncorporacion,
		tc.campanhainsc AS campanhaInscripcion,
		CASE WHEN LTRIM(RTRIM(tc.nrodoc)) = 'No definido' THEN 'No definido' ELSE tc.nrodoc END AS numeroDocumento,
		CASE WHEN LEN(LTRIM(RTRIM(tc.apepaterno)))> 0 THEN tc.apepaterno ELSE 'No definido' END AS apellidoPaterno,
		CASE WHEN LEN(LTRIM(RTRIM(tc.apematerno)))> 0 THEN tc.apematerno ELSE 'No definido' END AS apellidoMaterno,
		CASE WHEN LEN(LTRIM(RTRIM(tc.nombres)))> 0 THEN tc.nombres ELSE 'No definido' END AS nombres,
		CASE WHEN LEN(LTRIM(RTRIM(tc.cod)))> 0 THEN tc.cod ELSE 'No definido' END AS consultoraCodigo,
		ts.verifica AS estadoVerificado,
		ts.estado AS estadoActivo
FROM tb_seguimiento ts (NOLOCK)
	LEFT JOIN tb_gerentezona tg (NOLOCK)
		ON tg.id = ts.idgerentezona
	LEFT JOIN tb_consultora tc (NOLOCK)
		ON tc.id = ts.idconsultora  
END
