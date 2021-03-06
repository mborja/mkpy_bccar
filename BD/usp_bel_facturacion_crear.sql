USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_facturacion_crear]    Script Date: 01/19/2012 15:13:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_bel_facturacion_crear]
	@paisID				INT,
	@campanha			VARCHAR(6),
	@companhiaCodigo	VARCHAR(2),
	@regionCodigo		VARCHAR(2),
	@zonaCodigo			VARCHAR(6),
	@fecha				SMALLDATETIME,
	@estadoActivo		BIT
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO tb_facturacion
	(
		-- id -- this column value is auto-generated,
		idpais,
		campanha,
		codcia,
		codregion,
		codzona,
		fecha,
		estado
	)
	VALUES
	(
		@paisID,
		@campanha,
		@companhiaCodigo,
		@regionCodigo,
		@zonaCodigo,
		@fecha,
		@estadoActivo
	)
END
