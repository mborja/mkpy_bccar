USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_incorporacion_obtener_porID]    Script Date: 01/19/2012 15:14:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_bel_incorporacion_obtener_porID]
	@incorporacionID		INT
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		ti.id AS incorporacionID,
		-- Datos de inscripcion
		RTRIM(LTRIM(tg.codregion)) +'-'+ RTRIM(LTRIM(tg.codzona)) + RTRIM(LTRIM(ti.codterritorio)) AS territorioCodigo,
		(SELECT tt.descripcion FROM tb_tabla tt WHERE tt.id = ti.idtablacontacto) AS contactoTipo,
		ti.codconsurecom AS consultoraRefiereID,
		-- Datos personales
		CASE WHEN LEN(LTRIM(RTRIM(tc.apepaterno)))> 0 THEN tc.apepaterno ELSE ti.apepaterno END AS apellidoPaterno,
		CASE WHEN LEN(LTRIM(RTRIM(tc.apematerno)))> 0 THEN tc.apematerno ELSE ti.apematerno END AS apellidoMaterno,
		CASE WHEN LEN(LTRIM(RTRIM(tc.nombres)))> 0 THEN tc.nombres ELSE ti.nombres END AS nombres,
		ti.fechnac AS fechaNacimiento,
		tp.tipodoc AS documentoTipo,
		ti.nrodoc AS documentoNumero,
		(SELECT tt.descripcion FROM tb_tabla tt WHERE tt.id = ti.idtablaestadocivil) AS estadoCivil,
		(SELECT tt.descripcion FROM tb_tabla tt WHERE tt.id = ti.idtablaniveleducativo) AS nivelEducativo,
		(SELECT tt.descripcion FROM tb_tabla tt WHERE tt.id = ti.idtablaotramarca) AS vendeOtraMarca,
		-- Datos del contacto
		ti.telefcasa AS telefono1,
		ti.telefcelular AS telefono2,
		ti.email,
		-- Dirección de la solicitante
		ti.solicdireccion AS solicitanteDireccion,
		ti.solicreferencia AS solicitanteReferencia,
		ti.soliccodpostal AS solicitanteCodigoPostal,
		ti.solicdivpolitica1 AS solicitantePueblo,
		ti.solicdivpolitica2 AS solicitanteEstado,
		-- Datos de entregas
		ti.entregdireccion AS entregaDireccion,
		ti.entregdivpolitica AS entregaPueblo,
		ti.entregcodpostal AS entregaCodigoPostal,
		-- Datos de referencia familiar
		ti.reffamapepaterno AS refFamiliarPaterno,
		ti.reffamapematerno AS refFamiliarMaterno,
		ti.reffamnombres AS refFamiliarNombres,
		ti.reffamdireccion AS refFamiliarDireccion,
		ti.reffamtelefono + ' ' + ti.reffamcelular AS refFamiliarTelefonos,
		-- ti.idtablareffamtipovinculo,
		tt1.descripcion AS refFamiliarTipoVinculo,
		-- Datos referencia no familiar
		ti.refnofamapepaterno AS refNoFamiliarPaterno,
		ti.refnofamapematerno AS refNoFamiliarMaterno,
		ti.refnofamnombres AS refNoFamiliarNombres,
		ti.refnofamdireccion AS refNoFamiliarDireccion,
		ti.refnofamtelefono + ' ' + ti.refnofamcelular AS refNoFamiliarTelefonos,
		-- ti.idtablarefnofamtipovinculo,
		tt2.descripcion AS refNoFamiliarTipoVinculo,
		tp.id AS PaisID,
		ti.adicprofesion AS adicprofesion,
		ti.adiclugartrab AS adiclugartrab,
		ti.adictelefonotrab AS adictelefonotrab,
		ti.adicnrohijos AS adicnrohijos,
		ti.adichoravisita AS adichoravisita
	FROM
		tb_incorporacion ti (NOLOCK)
		LEFT JOIN tb_gerentezona tg (NOLOCK)
		ON tg.id = ti.idgerentezona 
		LEFT JOIN tb_consultora tc (NOLOCK)
		ON tc.id = ti.idconsultora 
		LEFT JOIN tb_pais tp (NOLOCK)
		ON tp.id = ti.idpais 
		LEFT JOIN tb_tabla tt1
		ON ti.idtablareffamtipovinculo = tt1.id
		LEFT JOIN tb_tabla tt2
		ON ti.idtablarefnofamtipovinculo = tt2.id
	WHERE
		(ti.id = @incorporacionID OR @incorporacionID IS NULL OR @incorporacionID = '')
END
