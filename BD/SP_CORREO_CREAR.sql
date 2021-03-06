USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_CORREO_CREAR]    Script Date: 01/19/2012 15:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_CORREO_CREAR]
	@paisID				INT,
	@tablaID			INT,
	@apellidoPaterno	VARCHAR(30),
	@apellidoMaterno	VARCHAR(30),
	@nombres			VARCHAR(30),
	@numeroDocumento	CHAR(18),
	@email				VARCHAR(40),
	@estado				BIT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO tb_empleado
	(
		-- id -- this column value is auto-generated,
		idpais,
		idtablaoperacion,
		apepaterno,
		apematerno,
		nombres,
		nrodoc,
		email,
		estado
	)
	VALUES
	(
		@paisID,
		@tablaID,
		@apellidoPaterno,
		@apellidoMaterno,
		@nombres,
		@numeroDocumento,
		@email,
		@estado
	)
END

