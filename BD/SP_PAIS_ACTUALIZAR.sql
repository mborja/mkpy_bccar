USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_PAIS_ACTUALIZAR]    Script Date: 01/19/2012 15:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_PAIS_ACTUALIZAR]
	@paisID				int,
	@nomenclatura		char(2),
	@medad				int,
	@seguimientoBB		bit,
	@reingresoBB		bit,
	@adicionalSC		bit,
	@gpsBB				bit,
	@verificadoIncorp	bit,
	@estado				BIT,
	@caducidad          int
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE 
		tb_pais
	SET
		nomenclatura = @nomenclatura,
		medad = @medad,
		seguimientobb = @seguimientoBB,
		reingresobb = @reingresoBB,
		adicionalsc = @adicionalSC,
		gpsbb = @gpsBB,
		verificadoincorp = @verificadoIncorp,
		estado = @estado,
		caducidad = @caducidad
	WHERE
		id = @paisID;
END

