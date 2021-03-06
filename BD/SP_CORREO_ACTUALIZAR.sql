USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_CORREO_ACTUALIZAR]    Script Date: 01/19/2012 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_CORREO_ACTUALIZAR]
	@correoID			INT,
	@operacionID		INT,
	@apellidoPaterno	VARCHAR(30),
	@apellidoMaterno	VARCHAR(30),
	@nombres			VARCHAR(30),
	@numeroDocumento	CHAR(18),
	@email				VARCHAR(40),
	@estado				BIT
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE tb_empleado
	SET
		idtablaoperacion = @operacionID,
		apepaterno = @apellidoPaterno,
		apematerno = @apellidoMaterno,
		nombres = @nombres,
		nrodoc = @numeroDocumento,
		email = @email,
		estado = @estado
	WHERE
		id = @correoID
END

