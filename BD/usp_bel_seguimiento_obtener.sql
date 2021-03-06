USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_seguimiento_obtener]    Script Date: 01/19/2012 15:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vsanchez
-- Create date: 18/05/2011
-- Description:	Obtiene listado de incorporaciones y/o consultoras de acuerdo a parámetros de búsqueda enviados.
-- =============================================
ALTER PROCEDURE [dbo].[usp_bel_seguimiento_obtener]
	@regionCodigo			CHAR(2) = '',
	@zonaCodigo				CHAR(6) = '',
	@fechaInscripcion		SMALLDATETIME = '',
	@campanhaInscripcion	VARCHAR(6) = '',
	@numeroDocumento		VARCHAR(18) = '',
	@consultoraCodigo		VARCHAR(15)	= '',
	@apellidoPaterno		VARCHAR(30) = '',
	@apellidoMaterno		VARCHAR(30) = '',
	@nombres				VARCHAR(30) = '',
	@estadoVerificado		BIT
AS
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
    WHERE
		(tg.codregion = @regionCodigo OR @regionCodigo IS NULL OR @regionCodigo = '')
	AND
		(tg.codzona = @zonaCodigo OR @zonaCodigo IS NULL OR @zonaCodigo = '')
	AND
		(ts.fecha = @fechaInscripcion OR @fechaInscripcion IS NULL OR @fechaInscripcion = '')
	AND
		(tc.campanhainsc LIKE '%'+@campanhaInscripcion+'%' OR @campanhaInscripcion IS NULL OR @campanhaInscripcion = '')
	AND
		(tc.nrodoc = @numeroDocumento OR @numeroDocumento IS NULL OR @numeroDocumento = '')
	AND
		(tc.cod LIKE '%'+@consultoraCodigo+'%' OR @consultoraCodigo IS NULL OR @consultoraCodigo = '' )
	AND
		(tc.apepaterno LIKE '%'+@apellidoPaterno+'%' OR @apellidoPaterno IS NULL OR @apellidoPaterno = '') 
	AND
		(tc.apematerno LIKE '%'+@apellidoMaterno+'%' OR @apellidoMaterno IS NULL OR @apellidoMaterno = '')
	AND
		(tc.nombres LIKE '%'+@nombres+'%' OR @nombres IS NULL OR @nombres = '')
	AND
		(ts.verifica = @estadoVerificado OR @estadoVerificado IS NULL);
END
