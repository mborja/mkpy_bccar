USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_PAIS_CARGAR]    Script Date: 01/19/2012 15:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_PAIS_CARGAR]
	@paisID		int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		tp.id AS paisID,
		tp.nomenclatura,
		tp.nombre,
		tp.campanhaact AS campaniaActual,
		tp.medad,
		tp.tipodoc AS documentoTipo,
		tp.tipodivpolitica AS divisionTipo,
		tp.caducidad,
		tp.seguimientobb AS seguimientoBB,
		tp.reingresobb AS reingresoBB,
		tp.adicionalsc AS adicionalSC,
		tp.gpsbb AS gpsBB,
		tp.verificadoincorp AS verificadoIncorp,
		tp.url,
		tp.version,
		tp.rutaimg,
		tp.estado
	FROM
		tb_pais tp
	WITH (NOLOCK)
	WHERE
		tp.id = @paisID;
END

