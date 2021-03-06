USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTADO_REPORTE_INCORPORACIONES]    Script Date: 01/19/2012 15:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery9.sql|7|0|C:\Users\prsbb\AppData\Local\Temp\1\~vsA190.sql
-- =============================================
-- Author:		vsanchez
-- Create date: 18/05/2011
-- Description:	Obtiene listado de incorporaciones y/o consultoras de acuerdo a parámetros de búsqueda enviados.
-- =============================================
ALTER PROCEDURE [dbo].[SP_LISTADO_REPORTE_INCORPORACIONES] AS
BEGIN
	SET NOCOUNT ON;
    SELECT
		ti.id AS incorporacionID,
		tc.id AS consultoraID,
		tg.codregion AS region,
		tg.codzona AS zona,
		convert(varchar(10), ti.fecha, 103) AS fechaIncorporacion,
		tc.campanhainsc AS campanhaInscripcion,
		ti.nrodoc AS numeroDocumento,
		ti.apepaterno AS apellidoPaterno,
		ti.apematerno AS apellidoMaterno,
		ti.nombres AS nombres,
		tc.cod AS consultoraCodigo,
		ti.verifica AS estadoVerificado,
		ti.estado AS estadoActivo,
		'I' AS tipo
	FROM [db_bcaribe].[dbo].[tb_incorporacion] ti (NOLOCK)
	JOIN [db_bcaribe].[dbo].[tb_gerentezona] tg (NOLOCK)
	  ON tg.id = ti.idgerentezona
	LEFT JOIN [db_bcaribe].[dbo].[tb_consultora] tc (NOLOCK)
		ON tc.id = ti.idconsultora;

END
