USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_usuario_obtener]    Script Date: 01/19/2012 15:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_bel_usuario_obtener]
	@paisID		INT,
	@nombres	VARCHAR(90) = '',
	@perfil		INT,
	@estado		BIT
AS
BEGIN
	SET NOCOUNT ON;

    SELECT tu.id AS usuarioID,
		   tu.idpais AS paisID,
		   tu.idtablaperfil AS perfilID,
		   UPPER(LEFT(tt.descripcion, 1)) + LOWER(SUBSTRING(tt.descripcion, 2, LEN(tt.descripcion))) AS 
		   perfilDescripcion,
		   tu.codigo AS usuarioNombre,
		   tu.clave AS usuarioClave,
		   tu.nombre AS usuarioNombres,
		   tu.estado,
		   case tu.estado when 1 then 'Activo' else 'Inactivo' end as estado_descripcion
	FROM   tb_usuario tu
		   JOIN tb_tabla tt
				ON  tu.idtablaperfil = tt.cod AND tt.idtipotabla = 2
    WHERE
		(tu.idpais = @paisID OR @paisID IS NULL OR @paisID = '')
	AND
		(tu.nombre LIKE '%' + @nombres + '%' OR @nombres IS NULL OR @nombres = '')
	AND
		(tu.idtablaperfil = @perfil OR @perfil IS NULL OR @perfil = '')
	AND
		(tu.estado = @estado OR @estado IS NULL)
END
