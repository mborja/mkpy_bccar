USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_reingreso_obtener]    Script Date: 01/19/2012 15:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vsanchez
-- Create date: 23/05/2011
-- Description:	Obtiene listado de reingresos con estado 1 que coincidan con los parámetros de búsqueda indicados.
-- =============================================
ALTER PROCEDURE [dbo].[usp_bel_reingreso_obtener]
	@regionCodigo			VARCHAR(2) = '',
	@zonaCodigo				VARCHAR(6) = '',
	@fechaReingreso			SMALLDATETIME = '',
	@campanhaInscripcion	VARCHAR(6) = '',
	@campanhaFacturacion	VARCHAR(6) = '',
	@documentoNumero		VARCHAR(18) = '',
	@consultoraCodigo		VARCHAR(15)	= '',
	@apellidoPaterno		VARCHAR(30) = '',
	@apellidoMaterno		VARCHAR(30) = '',
	@nombres				VARCHAR(30) = '',
	@estadoVerificado		BIT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		tr.id AS reingresoID,
		tc.codregion AS regionCodigo,
		substring(tc.codzona,3,7) AS zonaCodigo,
		convert(varchar(10), tr.fecha, 103) AS fechaReingreso,
		tc.campanhainsc AS campanhaInscripcion,
		tc.campanhaprico AS campanhaPrimeraCompra,
		tr.nrodoc AS documentoNumero,
		tr.codconsu AS consultoraCodigo,
--		tc.cod AS consultoraCodigo,
		tr.apepaterno AS apellidoPaterno,
		tr.apematerno AS apellidoMaterno,
		tr.nombres AS nombres,
		tr.estado AS estadoActivo,
		tr.verifica AS estadoVerificado
	FROM 
		tb_reingreso tr(NOLOCK)
		LEFT JOIN tb_gerentezona tg(NOLOCK)
			ON  tg.id = tr.idgerentezona
		LEFT JOIN tb_consultora tc(NOLOCK)
			ON tc.id = tr.idconsultora
	WHERE
		(tg.codregion = @regionCodigo OR @regionCodigo IS NULL OR @regionCodigo = '') 
	AND
		(tg.codzona = @zonaCodigo OR @zonaCodigo IS NULL OR @zonaCodigo = '')
	AND
		(tr.fecha = @fechaReingreso OR @fechaReingreso IS NULL OR @fechaReingreso = '')
	AND
		(tc.campanhainsc = @campanhaInscripcion OR @campanhaInscripcion IS NULL OR @campanhaInscripcion = '')
	AND
		(tc.campanhaprico = @campanhaFacturacion OR @campanhaFacturacion IS NULL OR @campanhaFacturacion = '')
	AND
		(tr.nrodoc = @documentoNumero OR @documentoNumero IS NULL OR @documentoNumero = '')
	AND
		(tr.codconsu LIKE '%'+@consultoraCodigo+'%' OR @consultoraCodigo IS NULL OR @consultoraCodigo = '' )
	AND
		(tr.apepaterno LIKE '%'+@apellidoPaterno+'%' OR @apellidoPaterno IS NULL OR @apellidoPaterno = '')
	AND
		(tr.apematerno LIKE '%'+@apellidoMaterno+'%' OR @apellidoMaterno IS NULL OR @apellidoMaterno = '')
	AND
		(tr.nombres LIKE '%'+@nombres+'%' OR @nombres IS NULL OR @nombres = '')
	AND
		(@estadoVerificado IS NULL or tr.verifica = @estadoVerificado)
END
