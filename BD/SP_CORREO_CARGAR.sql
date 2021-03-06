USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_CORREO_CARGAR]    Script Date: 01/19/2012 15:01:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_CORREO_CARGAR] 
	@correoID	INT
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		te.id AS correoID,
		te.idpais AS paisID,
		te.idtablaoperacion AS operaciónID,
		UPPER(LEFT(tt.descripcion, 1)) + LOWER(SUBSTRING(tt.descripcion, 2, LEN(tt.descripcion))) AS operacionDescripcion,
		te.apepaterno AS apellidoPaterno,
		te.apematerno AS apellidoMaterno,
		te.nombres,
		te.nrodoc,
		te.email,
		te.estado
	FROM
		tb_empleado te,
		tb_tabla tt
	WITH (NOLOCK)
	WHERE
		te.idtablaoperacion = tt.id
	AND
		te.id = @correoID
END

