USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_USUARIO_CARGAR]    Script Date: 01/19/2012 15:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_USUARIO_CARGAR]
	@usuarioID		int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		tu.id AS usuarioID,
		tu.id AS paisID,
		tp.nombre AS paisNombre,
		tu.idtablaperfil AS perfilID,
		tu.codigo AS usuario,
		tu.clave,
		tu.nombre AS nombres,
		tu.estado
		
	FROM 
		tb_usuario tu,
		tb_pais tp
	WITH (NOLOCK)
	WHERE
		tu.idpais = tp.id
	AND
		tu.id = @usuarioID
END

