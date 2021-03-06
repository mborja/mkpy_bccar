USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_PAIS_OBTENER_NOMBRES]    Script Date: 01/19/2012 15:08:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_PAIS_OBTENER_NOMBRES]
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		tp.id AS paisID,
		tp.nombre AS paisNombre
	FROM 
		tb_pais tp 
	WITH (NOLOCK)
	WHERE 
		tp.estado <> 1
	ORDER BY
		tp.nombre
END

