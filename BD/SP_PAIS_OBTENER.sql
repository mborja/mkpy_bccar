USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_PAIS_OBTENER]    Script Date: 01/19/2012 15:07:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_PAIS_OBTENER]
	@nomenclatura	varchar(2),
	@nombre			varchar(200),
	@mayoriaEdad	int
AS
BEGIN
	SET NOCOUNT ON;

	IF @mayoriaEdad is not null
		BEGIN
			SELECT 
				tp.id AS paisID,
				tp.nomenclatura,
				tp.nombre,
				tp.medad AS mayoriaEdad
			FROM tb_pais tp
			WITH (NOLOCK)
			WHERE
				tp.nomenclatura like '%' + @nomenclatura + '%'
			AND
				tp.nombre like '%' + @nombre + '%'
			AND
				tp.medad = @mayoriaEdad
			AND
				tp.id <> 0
			ORDER BY
				tp.nombre
		END
	ELSE
		BEGIN
			SELECT 
				tp.id AS paisID,
				tp.nomenclatura,
				tp.nombre,
				tp.medad AS mayoriaEdad
			FROM tb_pais tp
			WITH (NOLOCK)
			WHERE
				tp.nomenclatura like '%' + @nomenclatura + '%'
			AND
				tp.nombre like '%' + @nombre + '%'
			AND
				tp.id <> 0
			ORDER BY
				tp.nombre
		END
END

