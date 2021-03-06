USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_seguimiento_obtener_porID]    Script Date: 01/19/2012 15:16:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_bel_seguimiento_obtener_porID]
	@consultoraCodigo integer
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
    	ts.id AS seguimientoID,
		ti.id AS incorporacionID,
		tc.id AS consultoraID,
		tc.cod AS codConsultora,
		--tg.id AS gerenteID,
		-- Datos de inscripcion
		SUBSTRING(RTRIM(LTRIM(tc.codzona)),0,3)+'-'+SUBSTRING(RTRIM(LTRIM(tc.codzona)),3,6)+RTRIM(LTRIM(tc.codseccion))+RTRIM(LTRIM(tc.codterritorio)) AS territorioCodigo,
		(SELECT tt.descripcion FROM tb_tabla tt WHERE tt.id = ti.idtablacontacto) AS contactoTipo,
		ti.codconsurecom AS consultoraRefiereID,
		-- Datos personales
		CASE WHEN LEN(LTRIM(RTRIM(tc.apepaterno)))> 0 THEN tc.apepaterno ELSE ti.apepaterno END AS apellidoPaterno,
		CASE WHEN LEN(LTRIM(RTRIM(tc.apematerno)))> 0 THEN tc.apematerno ELSE ti.apematerno END AS apellidoMaterno,
		CASE WHEN LEN(LTRIM(RTRIM(tc.nombres)))> 0 THEN tc.nombres ELSE ti.nombres END AS nombres,
		ti.fechnac AS fechaNacimiento,
		tp.tipodoc AS documentoTipo,
		CASE WHEN LTRIM(RTRIM(tc.nrodoc)) = 'No definido' THEN ti.nrodoc ELSE tc.nrodoc END AS documentoNumero,
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
		-- Datos de los seguimientos
		ts.campanha AS segCampanha,
		ts.fechingr AS segFechaIngreso,
		ts.fecha AS segFechaRegistro,
		ts.observacion AS segObservacion
	FROM
		tb_seguimiento ts (NOLOCK)
		LEFT JOIN tb_incorporacion ti  (NOLOCK)
		ON ts.idconsultora = ti.idconsultora
		LEFT JOIN tb_gerentezona tg (NOLOCK)
		ON tg.id = ts.idgerentezona
		LEFT JOIN tb_consultora tc (NOLOCK)
		ON tc.id = ts.idconsultora
		LEFT JOIN tb_pais tp (NOLOCK)
		ON tp.id = tg.idpais

	WHERE
		tc.cod =  @consultoraCodigo
END
