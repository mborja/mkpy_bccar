USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_usuario_autenticar]    Script Date: 01/19/2012 15:16:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_bel_usuario_autenticar]
	@nombreusuario	VARCHAR(15),
	@clave			VARCHAR(15),
	@paisID			int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		tu.id AS usuarioID,
		tu.idpais AS paisID,
		tp.nombre AS paisNombre,
		tp.rutaimg AS paisRutaImagen,
		tp.tipodoc AS paisTipoDocumento,
		tu.idtablaperfil AS perfilID,
		UPPER(LEFT(tt.descripcion, 1)) + LOWER(SUBSTRING(tt.descripcion, 2, LEN(tt.descripcion))) AS perfilDescripcion,
		tu.codigo AS usuarioNombre,
		tu.estado AS estado,
		tu.nombre AS usuarioNombres
	FROM
		tb_usuario tu,
		tb_pais tp,
		tb_tabla tt
	WITH (NOLOCK)
	WHERE
		tu.idpais = tp.id
	AND
		tt.cod = tu.idtablaperfil
	AND
		tt.idtipotabla = 2
	AND
		tu.codigo = @nombreusuario
	AND
		tu.clave = @clave
	AND
		tu.idpais = @paisID
	AND
		tu.estado = 1
END

