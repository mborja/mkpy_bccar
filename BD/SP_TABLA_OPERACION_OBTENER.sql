USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA_OPERACION_OBTENER]    Script Date: 01/19/2012 15:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_TABLA_OPERACION_OBTENER]
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		tt.id AS tablaID,
		tt.idtipotabla AS tipoTablaID,
		tt.cod AS operacionCodigo,
		UPPER(LEFT(tt.descripcion, 1)) + LOWER(SUBSTRING(tt.descripcion, 2, LEN(tt.descripcion))) AS operacionDescripcion,
		tt.estado
	FROM
		tb_tabla tt
	WHERE
		tt.idtipotabla = 11; -- tb_tipotabla.id 11 = Operación
END

