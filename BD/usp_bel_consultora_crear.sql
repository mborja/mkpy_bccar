USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_consultora_crear]    Script Date: 01/19/2012 15:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_bel_consultora_crear]
	@paisID			INT,
	@campanhaInscripcion	VARCHAR(6),
	@campanhaPrimeraCompra	VARCHAR(6),
	@regionCodigo			VARCHAR(2),
	@zonaCodigo				VARCHAR(6),
	@seccionCodigo			VARCHAR(2),
	@territorioCodigo		VARCHAR(2),
	@companhiaCodigo		VARCHAR(2),
	@pasarped				VARCHAR(2),
	@motivoRetiro			VARCHAR(2),
	@codigo					VARCHAR(15),
	@apellidoPaterno		VARCHAR(30),
	@apellidoMaterno		VARCHAR(30),
	@nombres				VARCHAR(30),
	@numeroDocumento		VARCHAR(18),
	@telefono1				VARCHAR(15),
	@telefono2				VARCHAR(15),
	@email					VARCHAR(40),
	@estadoActivo			BIT
AS
BEGIN
	SET NOCOUNT ON;
	
	IF EXISTS (SELECT 1 FROM tb_consultora WHERE LTRIM(RTRIM(nrodoc))=LTRIM(RTRIM(@numeroDocumento)))
		BEGIN
			UPDATE tb_consultora SET
				idpais=@paisID,
				campanhainsc=@campanhaInscripcion,
				campanhaprico=@campanhaPrimeraCompra,
				codregion=@regionCodigo,
				codzona=@zonaCodigo,
				codseccion=@seccionCodigo,
				codterritorio=@territorioCodigo,
				codcia=@companhiaCodigo,
				pasarped=@pasarped,
				motivoret=@motivoRetiro,
				apepaterno=@apellidoPaterno,
				apematerno=@apellidoMaterno,
				nombres=@nombres,
				telefono1=@telefono1,
				telefono2=@telefono2,
				email=@email,
				estado=@estadoActivo
			WHERE		
				nrodoc=@numeroDocumento
		END
	ELSE
		BEGIN
			INSERT INTO tb_consultora
			(
				-- id -- this column value is auto-generated,
				idpais,
				campanhainsc,
				campanhaprico,
				codregion,
				codzona,
				codseccion,
				codterritorio,
				codcia,
				pasarped,
				motivoret,
				cod,
				apepaterno,
				apematerno,
				nombres,
				nrodoc,
				telefono1,
				telefono2,
				email,
				estado
			)
			VALUES
			(
				@paisID,
				@campanhaInscripcion,
				@campanhaPrimeraCompra,
				@regionCodigo,
				@zonaCodigo,
				@seccionCodigo,
				@territorioCodigo,
				@companhiaCodigo,
				@pasarped,
				@motivoRetiro,
				@codigo,
				@apellidoPaterno,
				@apellidoMaterno,
				@nombres,
				@numeroDocumento,
				@telefono1,
				@telefono2,
				@email,
				@estadoActivo
			)
		END
END
