USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_incorporacion_obtener]    Script Date: 01/19/2012 15:14:05 ******/
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
ALTER PROCEDURE [dbo].[usp_bel_incorporacion_obtener]
	@regionCodigo			CHAR(2) = '',
	@zonaCodigo				CHAR(6) = '',
	@fechaInscripcion		SMALLDATETIME = '',
	@campanhaInscripcion	VARCHAR(6) = '',
	@numeroDocumento		VARCHAR(18) = '',
	@consultoraCodigo		VARCHAR(15)	= '',
	@apellidoPaterno		VARCHAR(30) = '',
	@apellidoMaterno		VARCHAR(30) = '',
	@nombres				VARCHAR(30) = '',
	@estadoVerificado		BIT,
	@modoGrabacion			BIT
AS
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
		ON tc.nrodoc = ti.nrodoc
    WHERE
		(tg.codregion = @regionCodigo OR @regionCodigo IS NULL OR @regionCodigo = '')
	AND
		(tg.codzona = @zonaCodigo OR @zonaCodigo IS NULL OR @zonaCodigo = '')
	AND
		(ti.fecha = @fechaInscripcion OR @fechaInscripcion IS NULL OR @fechaInscripcion = '')
	AND
		(tc.campanhainsc LIKE '%'+@campanhaInscripcion+'%' OR @campanhaInscripcion IS NULL OR @campanhaInscripcion = '')
	AND
		(ti.nrodoc = @numeroDocumento OR @numeroDocumento IS NULL OR @numeroDocumento = '')
	AND
		(tc.cod LIKE '%'+@consultoraCodigo+'%' OR @consultoraCodigo IS NULL OR @consultoraCodigo = '' )
	AND
		(ti.apepaterno LIKE '%'+@apellidoPaterno+'%' or @apellidoPaterno is null) 
	AND
	    (ti.apematerno LIKE '%'+@apellidoMaterno+'%' or @apellidoMaterno is null) 
	AND
	    (ti.nombres LIKE '%'+@nombres+'%' or @nombres is null) 
	AND
		(ti.verifica = @estadoVerificado OR @estadoVerificado IS NULL)
	AND
		(ti.graba = @modoGrabacion OR @modoGrabacion IS NULL);

END
