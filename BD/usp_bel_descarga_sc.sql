USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_descarga_sc]    Script Date: 01/19/2012 15:13:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_bel_descarga_sc] 
	@IDPAIS INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT
		RIGHT ('00000'+ CAST (ti.id AS varchar), 5) AS LOTE,
		--ti.idpais AS PAIS,
		tp.nomenclatura AS PAIS,
		'' AS CODEB,
		UPPER(RTRIM(LTRIM(tg.codregion)) + RTRIM(LTRIM(tg.codzona)) + RTRIM(LTRIM(ti.codterritorio)))  AS TERRI,
		(SELECT tb_tabla.cod FROM tb_tabla WHERE tb_tabla.id = ti.idtablacontacto AND tb_tabla.idtipotabla = 3) AS TIPCON,
		ti.codconsurecom AS RECOMMEN,
		CASE WHEN LEN(LTRIM(RTRIM(tc.apepaterno)))> 0 THEN tc.apepaterno ELSE ti.apepaterno END AS APPAT,
		CASE WHEN LEN(LTRIM(RTRIM(tc.apematerno)))> 0 THEN tc.apematerno ELSE ti.apematerno END AS APMAT,
		CASE WHEN LEN(LTRIM(RTRIM(tc.nombres)))> 0 THEN tc.nombres ELSE ti.nombres END AS NOMBRE,
		Convert (varchar(10), ti.fechnac, 112) AS FECNAC,
		'' AS DOCID,
		'' AS MONOT,
		'' AS CUIT,
		(SELECT tb_tabla.cod FROM tb_tabla WHERE tb_tabla.id = ti.idtablaestadocivil AND tb_tabla.idtipotabla = 5) AS ECIV,
		(SELECT tb_tabla.cod FROM tb_tabla WHERE tb_tabla.id = ti.idtablaniveleducativo AND tb_tabla.idtipotabla = 6) AS NIVED,
		ti.solicdireccion AS SOLDIR,
		ti.solicdivpolitica1 AS SOLBAR,
		ti.solicdivpolitica2 AS SOLLOC,
		'' AS SOLPROV,
		ti.soliccodpostal AS SOLCPOS,
		ti.telefcasa AS SOLTLF,
		ti.telefcelular AS SOLOTLF,
		(SELECT tb_tabla.cod FROM tb_tabla WHERE tb_tabla.id = ti.idtablaotramarca AND tb_tabla.idtipotabla = 4) AS VTADIR,
		'' AS EMAILX,
		UPPER(RTRIM(LTRIM(ti.reffamapepaterno + ' ' + ti.reffamapematerno + ' ' + ti.reffamnombres))) AS RFAMNOM,
		ti.reffamdireccion AS RFAMDIR,
		ti.reffamtelefono AS RFAMTEL,
		(SELECT tb_tabla.cod FROM tb_tabla WHERE tb_tabla.id = ti.idtablareffamtipovinculo AND tb_tabla.idtipotabla = 7) AS RFAMVIN,
		UPPER(RTRIM(LTRIM(ti.refnofamapepaterno + ' ' + ti.refnofamapematerno + ' ' + ti.refnofamnombres))) AS RNFAMNOM,
		ti.refnofamdireccion AS RNFAMDIR,
		ti.refnofamtelefono AS RNFAMTEL,
		(SELECT tb_tabla.cod FROM tb_tabla WHERE tb_tabla.id = ti.idtablarefnofamtipovinculo AND tb_tabla.idtipotabla = 7) AS RNFAMVIN,
		'' AS RGARNOM,
		'' AS RGARDIR,
		'' AS RGARTEL,
		'' AS RGARVIN,
		'' AS RGARDOC,
		ti.entregdireccion AS ENTDIR,
		ti.entregdivpolitica AS ENTLOC,
		'' AS ENTBAR,
		ti.entregcodpostal AS ENTCPOS,
		'' AS ENTTEL,
		'' AS CODERR,
		'' AS DESERR,
		ti.email AS EMAIL,
		ti.nrodoc AS SEGSOC,
		'B' AS CANAL,
		'' AS ENTPROV,
		ti.reclongitud AS RECLONG,
		ti.reclatitud AS RECLAT,
		ti.recmargen AS RECMGN,
		ti.recnrosatelites AS RECSAT,
		ti.recpin AS RECPIN,
		ti.recimsi AS RECIMSI,
		ti.adicprofesion AS PROFESIO,
		ti.adiclugartrab AS LUGTRA,
		ti.adictelefonotrab AS TELTRA,
		Convert (varchar(5), ti.adichoravisita, 108) AS HORVIS,
		ti.adicnrohijos AS NROHIJO,
		'0' AS NROINFA,
		'0' AS NROESCO,
		'0' AS NROSUPER,
		'0' AS NROADUL
	FROM
			tb_incorporacion ti (NOLOCK)
		JOIN tb_gerentezona tg (NOLOCK)
			ON tg.id = ti.idgerentezona
		LEFT JOIN tb_consultora tc (NOLOCK)
			ON tc.id = ti.idconsultora
		INNER JOIN tb_pais TP (NOLOCK)
			ON TI.idpais = TP.id
    WHERE
		ti.verifica = 1
		AND
		ti.graba = 1
		AND
		ti.idpais = @IDPAIS 
		
END
