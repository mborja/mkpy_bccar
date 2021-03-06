USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_reingreso_obtener_porID]    Script Date: 01/19/2012 15:15:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_bel_reingreso_obtener_porID]
	@reingresoID INT
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		ti.id AS incorporacionID,
		tc.id AS consultoraID,
		tr.id AS reingresoID,
		tc.cod AS codConsultora,
		--tg.id AS gerenteID,
		-- Datos de inscripcion
		SUBSTRING(RTRIM(LTRIM(tc.codzona)),0,3)+'-'+SUBSTRING(RTRIM(LTRIM(tc.codzona)),3,6)+RTRIM(LTRIM(tc.codseccion))+RTRIM(LTRIM(tc.codterritorio))  AS territorioCodigo,
		(SELECT tt.descripcion FROM tb_tabla tt WHERE tt.id = ti.idtablacontacto) AS contactoTipo,
		ti.codconsurecom AS consultoraRefiereID,
		-- Datos personales
		CASE WHEN LEN(LTRIM(RTRIM(tr.apepaterno)))> 0 THEN tr.apepaterno ELSE tc.apepaterno END AS apellidoPaterno,
		CASE WHEN LEN(LTRIM(RTRIM(tr.apematerno)))> 0 THEN tr.apematerno ELSE tc.apematerno END AS apellidoMaterno,
		CASE WHEN LEN(LTRIM(RTRIM(tr.nombres)))> 0 THEN tr.nombres ELSE tc.nombres END AS nombres,
		ti.fechnac AS fechaNacimiento,
		tp.tipodoc AS documentoTipo,
		CASE WHEN LTRIM(RTRIM(tc.nrodoc)) = 'No definido' THEN ti.nrodoc ELSE tc.nrodoc END AS documentoNumero,
		(SELECT tt.descripcion FROM tb_tabla tt WHERE tt.id = ti.idtablaestadocivil) AS estadoCivil,
		(SELECT tt.descripcion FROM tb_tabla tt WHERE tt.id = ti.idtablaniveleducativo) AS nivelEducativo,
		(SELECT tt.descripcion FROM tb_tabla tt WHERE tt.id = ti.idtablaotramarca) AS vendeOtraMarca,
		-- Datos del contacto
		tc.telefono1 AS telefono1,
		tc.telefono2 AS telefono2,
		ti.email,
		tr.recobservacion AS recObservacion
	FROM
	    tb_reingreso tr (NOLOCK)
		LEFT JOIN tb_consultora tc (NOLOCK)
		ON RTRIM(LTRIM(tr.nrodoc))  = RTRIM(LTRIM(tc.nrodoc))
		LEFT JOIN tb_incorporacion ti  (NOLOCK)
        ON RTRIM(LTRIM(ti.nrodoc))  = RTRIM(LTRIM(tc.nrodoc))
		LEFT JOIN tb_gerentezona tg (NOLOCK)
		ON tg.id = tr.idgerentezona
		LEFT JOIN tb_pais tp (NOLOCK)
		ON tp.id = tg.idpais
	WHERE
		tr.id = @reingresoID 
END


