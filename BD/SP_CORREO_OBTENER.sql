USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_CORREO_OBTENER]    Script Date: 01/19/2012 15:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_CORREO_OBTENER]
	@nombres		VARCHAR(30),
	@email			VARCHAR(40),
	@operacionID	INT
AS
BEGIN
	SET NOCOUNT ON;
	IF @operacionID <> 0
		BEGIN
			SELECT
				te.id AS empleadoID,
				te.idpais AS paisID,
				te.idtablaoperacion AS operacionID,
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
				te.nombres LIKE '%' + @nombres + '%'
			AND
				te.email LIKE '%' + @email + '%'
			AND
				te.idtablaoperacion = @operacionID
		END
	ELSE
		BEGIN
			SELECT
				te.id AS empleadoID,
				te.idpais AS paisID,
				te.idtablaoperacion AS operacionID,
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
				te.nombres LIKE '%' + @nombres + '%'
			AND
				te.email LIKE '%' + @email + '%'
		END
END

