USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_gerentezona_crear]    Script Date: 01/19/2012 15:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_bel_gerentezona_crear]
	@paisID				INT,
	@regionCodigo		VARCHAR(2),
	@zonaCodigo			VARCHAR(6),
	@seccionCodigo		VARCHAR(2),
	@territorioCodigo	VARCHAR(2),
	@companhiaCodigo	VARCHAR(2), --codcia
	@consultoraCodigo	VARCHAR(15),
	@pasarped			VARCHAR(2),
	@motivoRetiro		VARCHAR(2),
	@apellidoPaterno	VARCHAR(30),
	@apellidoMaterno	VARCHAR(30),
	@nombres			VARCHAR(30),
	@documentoNumero	VARCHAR(18),
	@telefono			VARCHAR(15),
	@email				VARCHAR(40),
	@pin				VARCHAR(20),
	@imsi				VARCHAR(20),
	@estadoActivo		BIT
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE LTRIM(RTRIM(nrodoc))=LTRIM(RTRIM(@documentoNumero)))
		BEGIN
		
			UPDATE tb_gerentezona SET 
				idpais=@paisID,
				codregion=@regionCodigo,
				codzona=@zonaCodigo,
				codseccion=@seccionCodigo,
				codterritorio=@territorioCodigo,
				codcia=@companhiaCodigo,
				codconsu=@consultoraCodigo,
				pasarped=@pasarped,
				motivoret=@motivoRetiro,
				apepaterno=@apellidoPaterno,
				apematerno=@apellidoMaterno,
				nombres=@nombres,
				nrodoc=@documentoNumero,
				telefono=@telefono,
				email=@email,
				pin=@pin,
				imsi=@imsi,
				estado=@estadoActivo
				WHERE LTRIM(RTRIM(nrodoc))=LTRIM(RTRIM(@documentoNumero))
		
		END
	ELSE
		BEGIN

			INSERT INTO tb_gerentezona
			(
				-- id -- this column value is auto-generated,
				idpais,
				codregion,
				codzona,
				codseccion,
				codterritorio,
				codcia,
				codconsu,
				pasarped,
				motivoret,
				apepaterno,
				apematerno,
				nombres,
				nrodoc,
				telefono,
				email,
				pin,
				imsi,
				estado
			)
			VALUES
			(
				@paisID,
				@regionCodigo,
				@zonaCodigo,
				@seccionCodigo,
				@territorioCodigo,
				@companhiaCodigo,
				@consultoraCodigo,
				@pasarped,
				@motivoRetiro,
				@apellidoPaterno,
				@apellidoMaterno,
				@nombres,
				@documentoNumero,
				@telefono,
				@email,
				@pin,
				@imsi,
				@estadoActivo
			)
		END
END
