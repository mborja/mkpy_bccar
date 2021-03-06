USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_DIVPOLITICA_OBTENER_POR_PAIS]    Script Date: 01/19/2012 15:03:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_DIVPOLITICA_OBTENER_POR_PAIS]
	@paisID		int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		td.id AS divisionID,
		td.idpais AS paisID,
		td.nombre AS divisionNombre,
		td.estado
	FROM 
		tb_divpolitica td
	WITH (NOLOCK)
	WHERE
		td.idpais = @paisID;
END


