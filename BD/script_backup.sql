USE [db_bcaribe]
GO
/****** Object:  Table [dbo].[tb_pais]    Script Date: 01/19/2012 16:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_pais](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[nomenclatura] [char](2) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[campanhaact] [char](6) NOT NULL,
	[medad] [int] NOT NULL,
	[tipodoc] [char](2) NOT NULL,
	[tipodivpolitica] [varchar](50) NOT NULL,
	[caducidad] [int] NOT NULL,
	[seguimientobb] [bit] NOT NULL,
	[reingresobb] [bit] NOT NULL,
	[adicionalsc] [bit] NOT NULL,
	[gpsbb] [bit] NOT NULL,
	[verificadoincorp] [bit] NOT NULL,
	[url] [varchar](100) NOT NULL,
	[version] [varchar](10) NOT NULL,
	[rutaimg] [varchar](70) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_PAIS_ID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tipotabla]    Script Date: 01/19/2012 16:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tipotabla](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[descripcion] [varchar](150) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_TIPOTABLA_ID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_gerentezona]    Script Date: 01/19/2012 16:28:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_gerentezona](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idpais] [int] NOT NULL,
	[codregion] [char](2) NOT NULL,
	[codzona] [char](6) NOT NULL,
	[codseccion] [char](2) NOT NULL,
	[codterritorio] [char](3) NOT NULL,
	[codcia] [char](2) NOT NULL,
	[codconsu] [char](15) NOT NULL,
	[pasarped] [char](2) NOT NULL,
	[motivoret] [char](2) NOT NULL,
	[apepaterno] [varchar](30) NOT NULL,
	[apematerno] [varchar](30) NOT NULL,
	[nombres] [varchar](30) NOT NULL,
	[nrodoc] [char](18) NOT NULL,
	[telefono] [char](15) NOT NULL,
	[email] [varchar](40) NOT NULL,
	[pin] [char](20) NOT NULL,
	[imsi] [char](20) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_GERENTEZONA_ID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nrodoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_gerentezona_crear]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_bel_gerentezona_crear]
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
GO
/****** Object:  Table [dbo].[tb_divpolitica]    Script Date: 01/19/2012 16:28:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_divpolitica](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idpais] [int] NOT NULL,
	[cod] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_DIVPOLITICA_ID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_consultora]    Script Date: 01/19/2012 16:28:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_consultora](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[idpais] [int] NOT NULL,
	[campanhainsc] [char](6) NOT NULL,
	[campanhaprico] [char](6) NOT NULL,
	[codregion] [char](2) NOT NULL,
	[codzona] [char](6) NOT NULL,
	[codseccion] [char](2) NOT NULL,
	[codterritorio] [char](3) NOT NULL,
	[codcia] [char](2) NOT NULL,
	[pasarped] [char](2) NOT NULL,
	[motivoret] [char](2) NOT NULL,
	[cod] [char](15) NOT NULL,
	[apepaterno] [varchar](30) NOT NULL,
	[apematerno] [varchar](30) NOT NULL,
	[nombres] [varchar](30) NOT NULL,
	[nrodoc] [char](18) NOT NULL,
	[telefono1] [char](15) NOT NULL,
	[telefono2] [char](15) NOT NULL,
	[email] [varchar](40) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_CONSULTORA_ID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nrodoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SP_PAIS_OBTENER_NOMBRES]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_PAIS_OBTENER_NOMBRES]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_PAIS_OBTENER]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_PAIS_OBTENER]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_PAIS_CARGAR]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_PAIS_CARGAR]
	@paisID		int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		tp.id AS paisID,
		tp.nomenclatura,
		tp.nombre,
		tp.campanhaact AS campaniaActual,
		tp.medad,
		tp.tipodoc AS documentoTipo,
		tp.tipodivpolitica AS divisionTipo,
		tp.caducidad,
		tp.seguimientobb AS seguimientoBB,
		tp.reingresobb AS reingresoBB,
		tp.adicionalsc AS adicionalSC,
		tp.gpsbb AS gpsBB,
		tp.verificadoincorp AS verificadoIncorp,
		tp.url,
		tp.version,
		tp.rutaimg,
		tp.estado
	FROM
		tb_pais tp
	WITH (NOLOCK)
	WHERE
		tp.id = @paisID;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PAIS_ACTUALIZAR]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_PAIS_ACTUALIZAR]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_MANT_REGISTRO_GERENTEZONA]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
EXEC SP_MANT_REGISTRO_GERENTEZONA
@IDPAIS = '8',
@CODCIA = '',
@CODCONSU = '',
@NRODOC = '1234567890',
@NOMBRE = '',
@CODREGION = '00',
@CODZONA = '1111',
@CODSECCION = '',
@CODTERRITORIO = '',
@TELEFONO = '',
@EMAIL = 'gzona@belcorp.biz',
@PASARPED = '',
@MOTIVORET = ''
*/

CREATE PROCEDURE [dbo].[SP_MANT_REGISTRO_GERENTEZONA]
@IDPAIS INT,
@CODCIA CHAR(2),
@CODCONSU CHAR(15),
@NRODOC CHAR(18),
@NOMBRE VARCHAR(30),
@CODREGION CHAR(2),
@CODZONA CHAR(6),
@CODSECCION CHAR(2),
@CODTERRITORIO CHAR(2),
@TELEFONO CHAR(15),
@EMAIL VARCHAR(40),
@PASARPED CHAR(2),
@MOTIVORET CHAR(2)
AS
SET NOCOUNT ON
BEGIN
	DECLARE @_TRUE BIT
	SET @_TRUE = 'true'
	DECLARE @_ERROR CHAR(2)
	SET @_ERROR = '0|'
	IF @NRODOC <> ''
		BEGIN
			IF @CODZONA <> ''
				BEGIN
					IF NOT EXISTS (SELECT 1 FROM tb_gerentezona WHERE (tb_gerentezona.codzona = @CODZONA) AND (tb_gerentezona.estado = @_TRUE))
						BEGIN
							IF NOT EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.nrodoc = @NRODOC)
								BEGIN
									DECLARE @_CERO INT
									SET @_CERO = '0'
									IF EXISTS (SELECT 1 FROM tb_pais WHERE (tb_pais.id = @IDPAIS) AND (tb_pais.id <> @_CERO) AND (tb_pais.estado = @_TRUE))
										BEGIN
											DECLARE @_EXITO CHAR(2)
											SET @_EXITO = '1|'
											DECLARE @_ESTADO BIT
											IF @EMAIL = ''
												BEGIN
													SET @_ESTADO = 'false'
												END
											ELSE
												BEGIN
													SET @_ESTADO = 'true'
												END
											INSERT INTO tb_gerentezona
											(
												idpais,
												codregion,
												codzona,
												codseccion,
												codterritorio,
												codcia,
												codconsu,
												pasarped,
												motivoret,
												nombreS,
												nrodoc,
												telefono,
												email,
												estado
											)
											VALUES
											(
												@IDPAIS,
												@CODREGION,
												@CODZONA,
												@CODSECCION,
												@CODTERRITORIO,
												@CODCIA,
												@CODCONSU,
												@PASARPED,
												@NOMBRE,
												@MOTIVORET,
												@NRODOC,
												@TELEFONO,
												@EMAIL,
												@_ESTADO
											)
											SELECT @_EXITO AS 'Mensaje','Grabación exitosa' AS 'Detalle'
										END
									ELSE
										BEGIN
											SELECT @_ERROR AS 'Mensaje','País incorrecto' AS 'Detalle'
										END
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','Documento de identidad ya existe' AS 'Detalle'
								END
						END
					ELSE
						BEGIN
							SELECT @_ERROR AS 'Mensaje','Código de zona ya existe' AS 'Detalle'
						END
				END
			ELSE
				BEGIN
					SELECT @_ERROR AS 'Mensaje','Código de zona vacío' AS 'Detalle'
				END
		END
	ELSE
		BEGIN
			SELECT @_ERROR AS 'Mensaje','Documento de identidad vacío' AS 'Detalle'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MANT_REGISTRO_CAMPANHA]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC SP_MANT_REGISTRO_CAMPANHA '8','201106'
CREATE PROCEDURE [dbo].[SP_MANT_REGISTRO_CAMPANHA]
@IDPAIS INT,
@CAMPANHA CHAR(6)
AS
SET NOCOUNT ON
BEGIN
	IF @CAMPANHA <> ''
		BEGIN
			DECLARE @_TRUE BIT
			SET @_TRUE = 'true'
			DECLARE @_ERROR CHAR(2)
			SET @_ERROR = '0|'
			DECLARE @_CERO INT
			SET @_CERO = '0'
			IF EXISTS (SELECT 1 FROM tb_pais WHERE (tb_pais.id = @IDPAIS) AND (tb_pais.id <> @_CERO) AND (tb_pais.estado = @_TRUE))
				BEGIN
					DECLARE @_EXITO CHAR(2)
					SET @_EXITO = '1|'
					DECLARE @_ESTADO BIT
					SET @_ESTADO = 'true'
					UPDATE tb_pais
					SET
					campanhaact = @CAMPANHA
					WHERE tb_pais.id = @IDPAIS
					SELECT @_EXITO AS 'Mensaje','Grabación exitosa' AS 'Detalle'
				END
			ELSE	
				BEGIN
					SELECT @_ERROR AS 'Mensaje','País incorrecto' AS 'Detalle'
				END
		END
	ELSE
		BEGIN
			SELECT @_ERROR AS 'Mensaje','Campanha vacía' AS 'Detalle'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GERENTEZONA_OBTENER]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GERENTEZONA_OBTENER]
	@nombres		varchar(30),
	@regionCodigo	varchar(2),
	@zonaCodgo		varchar(6)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		tg.id AS gerenteID,
		tg.nombres AS gerenteNombres,
		tg.codregion AS regionCodigo,
		tg.codzona AS zonaCodigo,
		tg.email AS email
	FROM
		tb_gerentezona tg
	WITH (NOLOCK)
	WHERE
		tg.nombres like '%' + @nombres + '%'
	AND
		tg.codregion like '%' + @regionCodigo + '%'
	AND
		tg.codzona like '%' + @zonaCodgo + '%'
	ORDER BY tg.nombres	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GERENTEZONA_CARGAR]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GERENTEZONA_CARGAR]
	@gerenteID		int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		tg.id AS gerenteID,
		tg.idpais AS paisID,
		tp.nombre AS paisNombre,
		tg.codregion AS regionCodigo,
		tg.codzona AS zonaCodigo,
		tg.pin,
		tg.imsi,
		tg.codconsu AS consultoraID,
		tg.nombres AS gerenteNombres,
		tg.apepaterno AS gerenteApePaterno,
		tg.apematerno AS gerenteApeMaterno,
		tg.nrodoc,
		tg.telefono,
		tg.email,
		tg.estado
	FROM
		tb_gerentezona tg,
		tb_pais tp
	WITH (NOLOCK)
	WHERE
		tg.idpais = tp.id
	AND
		tg.id = @gerenteID
	END
GO
/****** Object:  StoredProcedure [dbo].[SP_GERENTEZONA_ACTUALIZAR]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GERENTEZONA_ACTUALIZAR]
	@gerenteID		int,
	@pin			VARCHAR(20),
	@imsi			VARCHAR(20),
	@estado			bit
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE
		tb_gerentezona
	SET
		pin = @pin,
		imsi = @imsi,
		estado = @estado
	WHERE
		id = @gerenteID
END
GO
/****** Object:  Table [dbo].[tb_facturacion]    Script Date: 01/19/2012 16:28:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_facturacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idpais] [int] NOT NULL,
	[campanha] [char](6) NOT NULL,
	[codcia] [char](2) NOT NULL,
	[codregion] [char](2) NOT NULL,
	[codzona] [char](6) NOT NULL,
	[fecha] [smalldatetime] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_FACTURACION_ID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tabla]    Script Date: 01/19/2012 16:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tabla](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idtipotabla] [int] NOT NULL,
	[cod] [int] NOT NULL,
	[descripcion] [varchar](150) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_TABLA_ID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_seguimiento]    Script Date: 01/19/2012 16:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_seguimiento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idpais] [int] NOT NULL,
	[idgerentezona] [int] NOT NULL,
	[idconsultora] [int] NOT NULL,
	[campanha] [char](6) NOT NULL,
	[fechingr] [smalldatetime] NULL,
	[fecha] [smalldatetime] NULL,
	[observacion] [varchar](200) NULL,
	[recpin] [char](20) NOT NULL,
	[recimsi] [char](20) NOT NULL,
	[reclongitud] [varchar](20) NOT NULL,
	[reclatitud] [varchar](20) NOT NULL,
	[recmargen] [varchar](9) NOT NULL,
	[recnrosatelites] [int] NOT NULL,
	[recobservacion] [varchar](200) NOT NULL,
	[recfechvisita] [smalldatetime] NULL,
	[verifica] [bit] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_SEGUIMIENTO_ID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_reingreso]    Script Date: 01/19/2012 16:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_reingreso](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idpais] [int] NOT NULL,
	[idgerentezona] [int] NOT NULL,
	[campanha] [char](6) NOT NULL,
	[codconsu] [char](15) NULL,
	[apepaterno] [varchar](30) NOT NULL,
	[apematerno] [varchar](30) NOT NULL,
	[nombres] [varchar](30) NOT NULL,
	[nrodoc] [char](18) NULL,
	[recpin] [char](20) NOT NULL,
	[recimsi] [char](20) NOT NULL,
	[reclongitud] [varchar](20) NOT NULL,
	[reclatitud] [varchar](20) NOT NULL,
	[recmargen] [varchar](9) NOT NULL,
	[recnrosatelites] [int] NOT NULL,
	[recobservacion] [varchar](200) NOT NULL,
	[recfechvisita] [smalldatetime] NULL,
	[fecha] [smalldatetime] NULL,
	[verifica] [bit] NOT NULL,
	[estado] [bit] NOT NULL,
	[idconsultora] [int] NULL,
 CONSTRAINT [PK_REINGRESO_ID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nrodoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_incorporacion]    Script Date: 01/19/2012 16:28:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_incorporacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idpais] [int] NOT NULL,
	[idgerentezona] [int] NOT NULL,
	[idconsultora] [int] NULL,
	[idtablacontacto] [int] NOT NULL,
	[idtablaotramarca] [int] NOT NULL,
	[idtablaestadocivil] [int] NOT NULL,
	[idtablaniveleducativo] [int] NOT NULL,
	[idtablareffamtipovinculo] [int] NOT NULL,
	[idtablarefnofamtipovinculo] [int] NOT NULL,
	[codterritorio] [char](3) NOT NULL,
	[codconsurecom] [char](15) NOT NULL,
	[apepaterno] [varchar](30) NOT NULL,
	[apematerno] [varchar](30) NOT NULL,
	[nombres] [varchar](30) NOT NULL,
	[nrodoc] [char](18) NOT NULL,
	[telefcasa] [char](15) NOT NULL,
	[telefcelular] [char](15) NOT NULL,
	[email] [varchar](40) NOT NULL,
	[fechnac] [smalldatetime] NOT NULL,
	[solicdireccion] [varchar](100) NOT NULL,
	[soliccodpostal] [varchar](10) NOT NULL,
	[solicreferencia] [varchar](100) NOT NULL,
	[solicdivpolitica1] [varchar](50) NOT NULL,
	[solicdivpolitica2] [varchar](50) NOT NULL,
	[entregdireccion] [varchar](100) NOT NULL,
	[entregcodpostal] [varchar](10) NOT NULL,
	[entregreferencia] [varchar](100) NOT NULL,
	[entregdivpolitica] [varchar](50) NOT NULL,
	[reffamapepaterno] [varchar](30) NOT NULL,
	[reffamapematerno] [varchar](30) NOT NULL,
	[reffamnombres] [varchar](30) NOT NULL,
	[reffamdireccion] [varchar](100) NOT NULL,
	[reffamtelefono] [char](15) NOT NULL,
	[reffamcelular] [char](15) NOT NULL,
	[refnofamapepaterno] [varchar](30) NOT NULL,
	[refnofamapematerno] [varchar](30) NOT NULL,
	[refnofamnombres] [varchar](30) NOT NULL,
	[refnofamdireccion] [varchar](100) NOT NULL,
	[refnofamtelefono] [char](15) NOT NULL,
	[refnofamcelular] [char](15) NOT NULL,
	[adicprofesion] [varchar](100) NOT NULL,
	[adiclugartrab] [varchar](50) NOT NULL,
	[adictelefonotrab] [char](15) NOT NULL,
	[adichoravisita] [smalldatetime] NOT NULL,
	[adicnrohijos] [int] NOT NULL,
	[adicnroinfantes] [int] NOT NULL,
	[adicnroescolares] [int] NOT NULL,
	[adicnronivsuperior] [int] NOT NULL,
	[adicnroadultos] [int] NOT NULL,
	[recpin] [varchar](20) NOT NULL,
	[recimsi] [varchar](20) NOT NULL,
	[reclongitud] [varchar](20) NOT NULL,
	[reclatitud] [varchar](20) NOT NULL,
	[recmargen] [char](9) NOT NULL,
	[recnrosatelites] [int] NOT NULL,
	[recobservacion] [varchar](200) NOT NULL,
	[recfechvisita] [smalldatetime] NOT NULL,
	[fecha] [smalldatetime] NOT NULL,
	[graba] [bit] NOT NULL,
	[verifica] [bit] NOT NULL,
	[descarga] [bit] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_INCORPORACION_ID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nrodoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_empleado]    Script Date: 01/19/2012 16:28:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_empleado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idpais] [int] NOT NULL,
	[idtablaoperacion] [int] NOT NULL,
	[apepaterno] [varchar](30) NOT NULL,
	[apematerno] [varchar](30) NOT NULL,
	[nombres] [varchar](30) NOT NULL,
	[nrodoc] [char](18) NOT NULL,
	[email] [varchar](40) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_EMPLEADO_ID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nrodoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SP_DIVPOLITICA_OBTENER_POR_PAIS]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_DIVPOLITICA_OBTENER_POR_PAIS]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_DIVPOLITICA_ACTUALIZAR_ESTADO]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_DIVPOLITICA_ACTUALIZAR_ESTADO]
	@divisionID		int,
	@estado			bit
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE 
		tb_divpolitica
	SET
		estado = @estado
	WHERE
		id = @divisionID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTADO_REPORTE_SEGUIMIENTOS]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vsanchez
-- Create date: 18/05/2011
-- Description:	Obtiene listado de incorporaciones y/o consultoras de acuerdo a parámetros de búsqueda enviados.
-- =============================================
CREATE PROCEDURE [dbo].[SP_LISTADO_REPORTE_SEGUIMIENTOS] AS
BEGIN
	SET NOCOUNT ON;
SELECT 
		ts.id AS seguimientoID,
		tc.id AS consultoraID,
		tg.codregion AS region,
		tg.codzona AS zona,
		ts.fecha AS fechaIncorporacion,
		tc.campanhainsc AS campanhaInscripcion,
		CASE WHEN LTRIM(RTRIM(tc.nrodoc)) = 'No definido' THEN 'No definido' ELSE tc.nrodoc END AS numeroDocumento,
		CASE WHEN LEN(LTRIM(RTRIM(tc.apepaterno)))> 0 THEN tc.apepaterno ELSE 'No definido' END AS apellidoPaterno,
		CASE WHEN LEN(LTRIM(RTRIM(tc.apematerno)))> 0 THEN tc.apematerno ELSE 'No definido' END AS apellidoMaterno,
		CASE WHEN LEN(LTRIM(RTRIM(tc.nombres)))> 0 THEN tc.nombres ELSE 'No definido' END AS nombres,
		CASE WHEN LEN(LTRIM(RTRIM(tc.cod)))> 0 THEN tc.cod ELSE 'No definido' END AS consultoraCodigo,
		ts.verifica AS estadoVerificado,
		ts.estado AS estadoActivo
FROM tb_seguimiento ts (NOLOCK)
	LEFT JOIN tb_gerentezona tg (NOLOCK)
		ON tg.id = ts.idgerentezona
	LEFT JOIN tb_consultora tc (NOLOCK)
		ON tc.id = ts.idconsultora  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MANT_REGISTRO_FATURACION]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC SP_MANT_REGISTRO_FATURACION '8','','','','','' 
CREATE PROCEDURE [dbo].[SP_MANT_REGISTRO_FATURACION]
@IDPAIS INT,
@CODCIA CHAR(2),
@CAMPANHA CHAR(6),
@CODREGION CHAR(2),
@CODZONA CHAR(6),
@FECHA VARCHAR(12)
AS
SET NOCOUNT ON
BEGIN
	DECLARE @_ERROR CHAR(2)
	SET @_ERROR = '0|'
	IF @CAMPANHA <> ''
		BEGIN
			DECLARE @_TRUE BIT
			SET @_TRUE = 'true'
			DECLARE @_CERO INT
			SET @_CERO = '0'
			IF EXISTS (SELECT 1 FROM tb_pais WHERE (tb_pais.id = @IDPAIS) AND (tb_pais.id <> @_CERO) AND (tb_pais.estado = @_TRUE))
				BEGIN
					DECLARE @_EXITO CHAR(2)
					SET @_EXITO = '1|'
					IF @FECHA = ''
						BEGIN
							SET @FECHA = '199001010000'
						END	
					DECLARE @_FECHA SMALLDATETIME
					SET @_FECHA = CONVERT(SMALLDATETIME,SUBSTRING(@FECHA,1,8)+SPACE(1)+SUBSTRING(@FECHA,9,2) + ':' + SUBSTRING(@FECHA,11,2))										
					DECLARE @_ESTADO BIT
					SET @_ESTADO = 'true'
					INSERT INTO tb_facturacion
					(
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
						@IDPAIS,
						@CAMPANHA,
						@CODCIA,
						@CODREGION,
						@CODZONA,
						@_FECHA,
						@_ESTADO
					)
					SELECT @_EXITO AS 'Mensaje','Grabación exitosa' AS 'Detalle'
				END
			ELSE
				BEGIN
					SELECT @_ERROR AS 'Mensaje','País incorrecto' AS 'Detalle'
				END
		END
	ELSE
		BEGIN
			SELECT @_ERROR AS 'Mensaje','Campanha vacía' AS 'Detalle'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_WS_VALIDACION]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC SP_WS_VALIDACION '0xcc76ecb46671657aL','8','5738A3C7','DOM482683524852','001111'
CREATE PROCEDURE [dbo].[SP_WS_VALIDACION]
@APPID CHAR(19),
@IDPAIS INT,
@PIN CHAR(20) ,
@IMSI CHAR(20),
@CODIGO CHAR(6)    
AS  
SET NOCOUNT ON
BEGIN
	DECLARE @_TRUE BIT
	SET @_TRUE = 'true'
	DECLARE @_ERROR CHAR(2)
	SET @_ERROR = '0|'
	DECLARE @_TIPOTABLA_APPID INT
	SET @_TIPOTABLA_APPID = '1'
	DECLARE @_APPID CHAR(19)
	SET @_APPID = (SELECT tb_tabla.descripcion FROM tb_tabla WHERE (tb_tabla.id = @_TIPOTABLA_APPID) AND (tb_tabla.estado = @_TRUE))
	IF @APPID = @_APPID
		BEGIN
			IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE (tb_gerentezona.codregion + tb_gerentezona.codzona) = @CODIGO)
				BEGIN
					DECLARE @_UNO INT
					SET @_UNO = '1'
					DECLARE @_GERENTEZONA_CODIGO_CONTA INT
					SET @_GERENTEZONA_CODIGO_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona WHERE (tb_gerentezona.codregion + tb_gerentezona.codzona) = @CODIGO)
					IF @_GERENTEZONA_CODIGO_CONTA = @_UNO
						BEGIN
							DECLARE @_GERENTEZONA_ESTADO BIT
							SET @_GERENTEZONA_ESTADO = (SELECT tb_gerentezona.estado FROM tb_gerentezona WHERE (tb_gerentezona.codregion + tb_gerentezona.codzona) = @CODIGO)
							IF @_GERENTEZONA_ESTADO = @_TRUE
								BEGIN
									DECLARE @_CERO INT
									SET @_CERO = '0'
									IF EXISTS (SELECT 1 FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE ((tb_gerentezona.codregion + tb_gerentezona.codzona) = @CODIGO) AND (tb_gerentezona.idpais = @IDPAIS) AND (tb_pais.id <> @_CERO) AND (tb_pais.estado = @_TRUE))
										BEGIN
											DECLARE @_GERENTEZONA_PAIS_CONTA INT
											SET @_GERENTEZONA_PAIS_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE ((tb_gerentezona.codregion + tb_gerentezona.codzona) = @CODIGO) AND (tb_gerentezona.idpais = @IDPAIS) AND (tb_pais.estado = @_TRUE))
											IF @_GERENTEZONA_PAIS_CONTA = @_UNO
												BEGIN
													DECLARE @_VACIO CHAR
													SET @_VACIO = ''
													DECLARE @_PIN CHAR(20)
													SET @_PIN = (SELECT tb_gerentezona.pin FROM tb_gerentezona WHERE (tb_gerentezona.codregion + tb_gerentezona.codzona) = @CODIGO)
													DECLARE @_IMSI CHAR(20)
													SET @_IMSI = (SELECT tb_gerentezona.imsi FROM tb_gerentezona WHERE (tb_gerentezona.codregion + tb_gerentezona.codzona) = @CODIGO)
													IF ((@_PIN = @_VACIO) AND (@_IMSI = @_VACIO)) OR ((@_PIN = @PIN) AND (@_IMSI = @IMSI))
														BEGIN
															DECLARE @_DUPLICADO INT
															SET @_DUPLICADO = 0
															IF (@_PIN = @_VACIO) AND (@_IMSI = @_VACIO)
																BEGIN
																    SET @_DUPLICADO = (SELECT COUNT(tb_gerentezona.id) FROM  tb_gerentezona WHERE tb_gerentezona.pin = @PIN AND tb_gerentezona.imsi = @IMSI)
																    IF(@_DUPLICADO = 0)
																    BEGIN
																		UPDATE tb_gerentezona
																		SET tb_gerentezona.pin = @PIN,tb_gerentezona.imsi = @IMSI
																		WHERE (tb_gerentezona.codregion + tb_gerentezona.codzona) = @CODIGO
																	END
																END
															IF(@_DUPLICADO=0)	
																BEGIN
																	DECLARE @_DOCIDENTIDAD CHAR(2)
																	SET @_DOCIDENTIDAD = (SELECT tb_pais.tipodoc FROM tb_pais WHERE tb_pais.id = @IDPAIS) 
																	DECLARE @_FECHA SMALLDATETIME
																	SET @_FECHA = GETDATE()
																	DECLARE @_FECHA_yyyymmddHHMM CHAR(12) 
																	SET @_FECHA_yyyymmddHHMM  = REPLACE(REPLACE(REPLACE(CONVERT(CHAR(16),@_FECHA,20),'-',''),' ',''),':','') 
																	DECLARE @_CADUCIDAD_yyyymmddHHMM CHAR(12)
																	SET @_CADUCIDAD_yyyymmddHHMM = (SELECT REPLACE(REPLACE(REPLACE(CONVERT(CHAR(16),DATEADD(hh,tb_pais.caducidad,@_FECHA),20),'-',''),' ',''),':','') FROM tb_pais WHERE tb_pais.id = @IDPAIS)
																	SELECT 
																	tb_gerentezona.nombres,
																	tb_gerentezona.apepaterno,
																	tb_gerentezona.apematerno,
																	tb_gerentezona.codregion,
																	RTRIM(LTRIM(tb_gerentezona.codzona)) AS codzona,
																	tb_gerentezona.email,
																	@_DOCIDENTIDAD AS descripcion,
																	RTRIM(LTRIM(tb_gerentezona.nrodoc)) AS nrodoc,
																	RTRIM(LTRIM(tb_gerentezona.telefono)) AS telefono,
																	tb_pais.campanhaact,
																	@_FECHA_yyyymmddHHMM AS fecha, 
																	@_CADUCIDAD_yyyymmddHHMM AS caducidad,
																	CONVERT(INT,tb_pais.seguimientobb) AS seguimientobb,
																	CONVERT(INT,tb_pais.reingresobb) AS reingresobb,
																	CONVERT(INT,tb_pais.adicionalsc) AS adicionalsc,
																	CONVERT(INT,tb_pais.gpsbb) AS gpsbb,
																	CONVERT(INT,tb_pais.verificadoincorp) AS verificaincorp,
																	tb_pais.url,
																	tb_pais.version
																	FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id
																	WHERE (tb_gerentezona.codregion + tb_gerentezona.codzona) = @CODIGO
																END
															ELSE
																BEGIN
																	SELECT @_ERROR AS 'Mensaje','Ya existe otro Gerente de zona con IMSI/PIN registrado' AS 'Detalle'	
																END
														END
													ELSE
														BEGIN
															IF (@_PIN = @PIN)
																BEGIN
																	SELECT @_ERROR AS 'Mensaje','IMSI del BlackBerry de gerente de zona incorrecto' AS 'Detalle'	
																END
															ELSE
																BEGIN
																	IF (@_IMSI = @IMSI)
																		BEGIN
																			SELECT @_ERROR AS 'Mensaje','PIN del BlackBerry de gerente de zona incorrecto' AS 'Detalle'
																		END
																	ELSE
																		BEGIN
																			SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry de gerente de zona incorrectos' AS 'Detalle'
																		END	
																END	
														END
												END
											ELSE
												BEGIN
													SELECT @_ERROR AS 'Mensaje','Gerente de zona pertenece a más de un país' AS 'Detalle'
												END
										END
									ELSE
										BEGIN
											SELECT @_ERROR AS 'Mensaje','País de gerente de zona incorrecto' AS 'Detalle'
										END
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','Gerente de zona desactivada' AS 'Detalle'
								END	
						END
					ELSE
						BEGIN
							SELECT @_ERROR AS 'Mensaje','Existen más de una gerente de zona con el mismo código' AS 'Detalle'
						END					
				END
			ELSE
				BEGIN
					SELECT @_ERROR AS 'Mensaje','Código de gerente de zona incorrecto' AS 'Detalle'
				END
		END
	ELSE
		BEGIN
			SELECT @_ERROR AS 'Mensaje','Código APPID incorrecto' AS 'Detalle'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_WS_REGISTRO_SEGUIMIENTO]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
EXEC SP_WS_REGISTRO_SEGUIMIENTO
@APPID = '0xcc76ecb46671657aL', 
@IDPAIS = '8', 
@PIN = '5738A3C7', 
@IMSI = 'DOM482683524852', 
@CODIGOZONA = '1111', 
@CAMPANHA = '', 
@FECHA = '', 
@CODIGOCONSULTORA = '', 
@OBSERVACION = '', 
@FECHA_INGRESO = '', 
@RECORD_PIN = '', 
@RECORD_IMSI = '', 
@RECORD_LONGITUD = '', 
@RECORD_LATITUD = '', 
@RECORD_MARGEN = '', 
@RECORD_NROSATELITES = '', 
@RECORD_OBSERVACION = '',
@RECORD_FECHAVISITA = ''
*/

CREATE PROCEDURE [dbo].[SP_WS_REGISTRO_SEGUIMIENTO]
@APPID CHAR(19),
@IDPAIS INT,
@PIN CHAR(20),
@IMSI CHAR(20),
@CODIGOZONA CHAR(6),
@CAMPANHA CHAR(6),
@FECHA CHAR(12),
@CODIGOCONSULTORA CHAR(20),
@NRODOC CHAR(20),
@OBSERVACION VARCHAR(200),
@FECHA_INGRESO CHAR(12),
@RECORD_PIN CHAR(20),
@RECORD_IMSI CHAR(20),
@RECORD_LONGITUD VARCHAR(20),
@RECORD_LATITUD VARCHAR(20),
@RECORD_MARGEN VARCHAR(9),
@RECORD_NROSATELITES INT,
@RECORD_OBSERVACION VARCHAR(200),
@RECORD_FECHAVISITA VARCHAR(12)
AS
SET NOCOUNT ON
BEGIN
	DECLARE @_TRUE BIT
	SET @_TRUE = 'true'
	DECLARE @_ERROR CHAR(2)
	SET @_ERROR = '0|'
	DECLARE @_TIPOTABLA_APPID INT
	SET @_TIPOTABLA_APPID = '1'
	DECLARE @_APPID CHAR(19)
	SET @_APPID = (SELECT tb_tabla.descripcion FROM tb_tabla WHERE tb_tabla.id = @_TIPOTABLA_APPID AND tb_tabla.estado = @_TRUE)
	IF @APPID = @_APPID
		BEGIN
			IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
				BEGIN
					DECLARE @_UNO INT
					SET @_UNO = '1'
					DECLARE @_GERENTEZONA_PIN_IMSI_CONTA INT
					SET @_GERENTEZONA_PIN_IMSI_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
					IF @_GERENTEZONA_PIN_IMSI_CONTA = @_UNO
						BEGIN
							DECLARE @_GERENTEZONA_ESTADO BIT
							SET @_GERENTEZONA_ESTADO = (SELECT tb_gerentezona.estado FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
							IF @_GERENTEZONA_ESTADO = @_TRUE
								BEGIN
									DECLARE @_CERO INT
									SET @_CERO = '0'
									IF EXISTS (SELECT 1 FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE (tb_gerentezona.idpais = @IDPAIS) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI) AND (tb_pais.id <> @_CERO) AND (tb_pais.estado = @_TRUE))
										BEGIN
											DECLARE @_GERENTEZONA_PAIS_CONTA INT
											SET @_GERENTEZONA_PAIS_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE (tb_gerentezona.idpais = @IDPAIS) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI) AND (tb_pais.estado = @_TRUE))
											IF @_GERENTEZONA_PAIS_CONTA = @_UNO
												BEGIN
													IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE (tb_gerentezona.codzona = SUBSTRING(@CODIGOZONA, 3, LEN(@CODIGOZONA))) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
														BEGIN
															DECLARE @_GERENTEZONA_CODZONA_CONTA INT
															SET @_GERENTEZONA_CODZONA_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona WHERE (tb_gerentezona.codzona = SUBSTRING(@CODIGOZONA, 3, LEN(@CODIGOZONA))) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
															IF @_GERENTEZONA_CODZONA_CONTA = @_UNO
																BEGIN
																	DECLARE @_IDGERENTEZONA INT
																	DECLARE @_CODIGOCONSULTORA CHAR(20)
																	SET @_CODIGOCONSULTORA = ''
																	SET @_IDGERENTEZONA = (SELECT tb_gerentezona.id FROM tb_gerentezona WHERE (tb_gerentezona.codzona = SUBSTRING(@CODIGOZONA, 3, LEN(@CODIGOZONA))) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))					
																	IF @NRODOC = ''
																		BEGIN
																			SET @_CODIGOCONSULTORA = @CODIGOCONSULTORA	
																		END
																	ELSE
																		BEGIN
																		   SET @_CODIGOCONSULTORA = (SELECT tb_consultora.cod FROM tb_consultora WHERE tb_consultora.nrodoc = @NRODOC)
																		END					
																	
																	IF EXISTS (SELECT 1 FROM tb_consultora WHERE tb_consultora.cod = @_CODIGOCONSULTORA)-- AND (tb_consultora.estado = @_TRUE))
																		BEGIN
																			DECLARE @_CONSULTORA_COD_CONTA INT
																			SET @_CONSULTORA_COD_CONTA = (SELECT COUNT(tb_consultora.id) FROM tb_consultora WHERE tb_consultora.cod = @_CODIGOCONSULTORA)-- AND (tb_consultora.estado = @_TRUE))
																			IF @_CONSULTORA_COD_CONTA <= @_UNO
																				BEGIN
																					DECLARE @_EXITO CHAR(2)
																					SET @_EXITO = '1|'
																					DECLARE @_IDCONSULTORA INT	
																					SET @_IDCONSULTORA = (SELECT tb_consultora.id FROM tb_consultora WHERE tb_consultora.cod = @_CODIGOCONSULTORA) --AND (tb_consultora.estado = @_TRUE))
																					DECLARE @_CAMPANHA CHAR(6)
																					SET @_CAMPANHA = (SELECT tb_pais.campanhaact FROM tb_pais WHERE tb_pais.id = @IDPAIS and tb_pais.estado = @_TRUE)
																					IF @RECORD_NROSATELITES = ''
																						BEGIN
																							SET @RECORD_NROSATELITES = '-1'
																						END
																						
																					-- asignando fecha ingreso
																					DECLARE @_FECHA_INGRESO SMALLDATETIME
																					IF @FECHA_INGRESO = ''
																						BEGIN
																							SET @FECHA_INGRESO = '199001010000'
																							SET @_FECHA_INGRESO = CONVERT(SMALLDATETIME,SUBSTRING(@FECHA_INGRESO,1,8)+SPACE(1)+SUBSTRING(@FECHA_INGRESO,9,2) + ':' + SUBSTRING(@FECHA_INGRESO,11,2))
																						END	
																					ELSE
																						BEGIN
																							SET @_FECHA_INGRESO = CAST(@FECHA_INGRESO AS DATETIME)
																						END
																					
																					-- asignando fecha
																					DECLARE @_FECHA SMALLDATETIME
																					IF @FECHA = ''
																						BEGIN
																							SET @FECHA = '199001010000'
																							SET @_FECHA = CONVERT(SMALLDATETIME,SUBSTRING(@FECHA,1,8)+SPACE(1)+SUBSTRING(@FECHA,9,2) + ':' + SUBSTRING(@FECHA,11,2))
																						END	
																					ELSE
																						BEGIN
																							SET @_FECHA = CAST(@FECHA AS DATETIME)
																						END
																					
																					-- asignando fecha de visita
																					DECLARE @_RECORD_FECHAVISITA SMALLDATETIME
																					IF @RECORD_FECHAVISITA = ''
																						BEGIN
																							SET @RECORD_FECHAVISITA = '199001010000'
																							SET @_RECORD_FECHAVISITA = CONVERT(SMALLDATETIME,SUBSTRING(@RECORD_FECHAVISITA,1,8)+SPACE(1)+SUBSTRING(@RECORD_FECHAVISITA,9,2) + ':' + SUBSTRING(@RECORD_FECHAVISITA,11,2))
																						END	
																					ELSE
																						BEGIN
																							SET @_RECORD_FECHAVISITA = CAST(@RECORD_FECHAVISITA AS DATETIME)
																						END
																					
																					DECLARE @_ESTADO BIT	
																					SET @_ESTADO = 'true'
																					INSERT INTO tb_seguimiento
																					(
																						idpais,
																						idgerentezona,
																						idconsultora,
																						campanha,
																						fechingr,
																						fecha,
																						observacion,
																						recpin,
																						recimsi,	
																						reclongitud,
																						reclatitud,	
																						recmargen,
																						recnrosatelites,
																						recobservacion,
																						recfechvisita,
																						estado
																					)
																					VALUES
																					(
																						@IDPAIS,
																						@_IDGERENTEZONA,
																						@_IDCONSULTORA,
																						@_CAMPANHA,
																						@_FECHA_INGRESO,
																						@_FECHA,
																						@OBSERVACION,
																						@RECORD_PIN,
																						@RECORD_IMSI,
																						@RECORD_LONGITUD,
																						@RECORD_LATITUD,
																						@RECORD_MARGEN,
																						@RECORD_NROSATELITES,
																						@RECORD_OBSERVACION,
																						@_RECORD_FECHAVISITA,
																						@_ESTADO
																					)
																					SELECT @_EXITO AS 'Mensaje','Grabación exitosa' AS 'Detalle'	
																				END
																			ELSE
																				BEGIN
																					SELECT @_ERROR AS 'Mensaje','Código asignado a más de una consultora' AS 'Detalle' 
																				END
																		END
																	ELSE
																		BEGIN
																			SELECT @_ERROR AS 'Mensaje','Código de consultora incorrecto' AS 'Detalle' 
																		END	
																END
															ELSE
																BEGIN
																	SELECT @_ERROR AS 'Mensaje','Código de zona asignado a más de una gerente de zona' AS 'Detalle'
																END
														END
													ELSE
														BEGIN
															SELECT @_ERROR AS 'Mensaje','´Código de gerente de zona incorrecto' AS 'Detalle'
														END
												END
											ELSE
												BEGIN
													SELECT @_ERROR AS 'Mensaje','Gerente de zona pertenece a más de un país' AS 'Detalle'
												END			
										END
									ELSE
										BEGIN
											SELECT @_ERROR AS 'Mensaje','País de gerente de zona incorrecto' AS 'Detalle'
										END
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','Gerente de zona desactivada' AS 'Detalle'
								END
						END
					ELSE
						BEGIN
							SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry asignados a más de una gerente de zona' AS 'Detalle'
						END
				END
			ELSE
				BEGIN
					IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.pin = @PIN)
						BEGIN
							SELECT @_ERROR AS 'Mensaje','IMSI del BlackBerry de gerente de zona incorrecto' AS 'Detalle'	
						END
					ELSE
						BEGIN
							IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.imsi = @IMSI)
								BEGIN
									SELECT @_ERROR AS 'Mensaje','PIN del BlackBerry de gerente de zona incorrecto' AS 'Detalle'
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry de gerente de zona incorrectos' AS 'Detalle'
								END	
						END	
				END
		END
	ELSE
		BEGIN
			SELECT @_ERROR AS 'Mensaje','Código APPID incorrecto' AS 'Detalle'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_WS_REGISTRO_REINGRESO]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_WS_REGISTRO_REINGRESO]
	@APPID CHAR(19),
	@IDPAIS INT,
	@PIN CHAR(20),
	@IMSI CHAR(20),
	@CODIGOZONA CHAR(6),
	@CAMPANHA CHAR(6),
	@FECHA CHAR(12),
	@CODIGOCONSULTORA CHAR(15),
	@NOMBRES VARCHAR(30),
	@APELLIDOPATERNO VARCHAR(30),
	@APELLIDOMATERNO VARCHAR(30),
	@NRODOCUMENTO CHAR(18),
	@RECORD_PIN CHAR(20),
	@RECORD_IMSI CHAR(20),
	@RECORD_LONGITUD VARCHAR(20),
	@RECORD_LATITUD VARCHAR(20),
	@RECORD_MARGEN CHAR(9),
	@RECORD_NROSATELITES INT,
	@RECORD_OBSERVACION VARCHAR(200),
	@RECORD_FECHAVISITA VARCHAR(12)
AS
SET NOCOUNT ON
BEGIN
	DECLARE @_TRUE BIT
	SET @_TRUE = 'true'
	DECLARE @_ERROR CHAR(2)
	SET @_ERROR = '0|'
	IF (@NRODOCUMENTO <> '' or @CODIGOCONSULTORA <> '')
		BEGIN
			IF NOT EXISTS (SELECT 1 FROM tb_reingreso WHERE (tb_reingreso.nrodoc = @NRODOCUMENTO or tb_reingreso.codconsu = @CODIGOCONSULTORA) AND (tb_reingreso.estado = @_TRUE))
				BEGIN
					DECLARE @_TIPOTABLA_APPID INT
					SET @_TIPOTABLA_APPID = '1'
					DECLARE @_APPID CHAR(19)
					SET @_APPID = (SELECT tb_tabla.descripcion FROM tb_tabla WHERE tb_tabla.id = @_TIPOTABLA_APPID AND tb_tabla.estado = @_TRUE)
					IF @APPID = @_APPID
						BEGIN
							IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
								BEGIN
									DECLARE @_UNO INT
									SET @_UNO = '1'
									DECLARE @_GERENTEZONA_PIN_IMSI_CONTA INT
									SET @_GERENTEZONA_PIN_IMSI_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
									IF @_GERENTEZONA_PIN_IMSI_CONTA = @_UNO
										BEGIN
											DECLARE @_GERENTEZONA_ESTADO BIT
											SET @_GERENTEZONA_ESTADO = (SELECT tb_gerentezona.estado FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
											IF @_GERENTEZONA_ESTADO = @_TRUE
												BEGIN
													DECLARE @_CERO INT
													SET @_CERO = '0'
													IF EXISTS (SELECT 1 FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE (tb_gerentezona.idpais = @IDPAIS) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI) AND (tb_pais.id <> @_CERO) AND (tb_pais.estado = @_TRUE))
														BEGIN
															DECLARE @_GERENTEZONA_PAIS_CONTA INT
															SET @_GERENTEZONA_PAIS_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE (tb_gerentezona.idpais = @IDPAIS) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI) AND (tb_pais.estado = @_TRUE))
															IF @_GERENTEZONA_PAIS_CONTA = @_UNO
																BEGIN
																	IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE (tb_gerentezona.codzona = SUBSTRING(@CODIGOZONA, 3, LEN(@CODIGOZONA))) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
																		BEGIN
																			DECLARE @_GERENTEZONA_CODZONA_CONTA INT
																			SET @_GERENTEZONA_CODZONA_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona WHERE (tb_gerentezona.codzona = SUBSTRING(@CODIGOZONA, 3, LEN(@CODIGOZONA))) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
																			IF @_GERENTEZONA_CODZONA_CONTA = @_UNO
																				BEGIN
																					DECLARE @_EXITO CHAR(2)
																					SET @_EXITO = '1|'
																					DECLARE @_IDGERENTEZONA INT
																					SET @_IDGERENTEZONA = (SELECT tb_gerentezona.id FROM tb_gerentezona WHERE (tb_gerentezona.codzona = SUBSTRING(@CODIGOZONA, 3, LEN(@CODIGOZONA))) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))					
																					DECLARE @_CAMPANHA CHAR(6)
																					SET @_CAMPANHA = (SELECT tb_pais.campanhaact FROM tb_pais WHERE tb_pais.id = @IDPAIS and tb_pais.estado = @_TRUE)
																					IF @RECORD_NROSATELITES = ''
																						BEGIN
																							SET @RECORD_NROSATELITES = '-1'
																						END
																						
																					-- convirtiendo fecha 
																					DECLARE @_FECHA SMALLDATETIME
																					IF @FECHA = ''
																						BEGIN
																							SET @FECHA = '199001010000'
																							SET @_FECHA = CONVERT(SMALLDATETIME,SUBSTRING(@FECHA,1,8)+SPACE(1)+SUBSTRING(@FECHA,9,2) + ':' + SUBSTRING(@FECHA,11,2))
																						END	
																					ELSE
																						BEGIN
																							SET @_FECHA = CONVERT(SMALLDATETIME,SUBSTRING(@FECHA,1,8)+SPACE(1)+SUBSTRING(@FECHA,9,2))
																						END
																					
																					-- convirtiendo fecha de record
																					DECLARE @_RECORD_FECHAVISITA SMALLDATETIME
																					
																					IF @RECORD_FECHAVISITA = ''
																						BEGIN
																							SET @RECORD_FECHAVISITA = '199001010000'
																							SET @_RECORD_FECHAVISITA = CONVERT(SMALLDATETIME,SUBSTRING(@RECORD_FECHAVISITA,1,8)+SPACE(1)+SUBSTRING(@RECORD_FECHAVISITA,9,2) + ':' + SUBSTRING(@RECORD_FECHAVISITA,11,2))
																						END	
																					ELSE
																						BEGIN
																							SET @_RECORD_FECHAVISITA = CONVERT(SMALLDATETIME,SUBSTRING(@RECORD_FECHAVISITA,1,8)+SPACE(1)+SUBSTRING(@RECORD_FECHAVISITA,9,2))
																						END
																						
																					DECLARE	@_CODIGOCONSULTORA CHAR(15)
																					DECLARE	@_NRODOCUMENTO CHAR(18)
																						
																					IF @CODIGOCONSULTORA = ''
																						BEGIN
																						   SET @_CODIGOCONSULTORA = (SELECT tb_consultora.cod FROM tb_consultora WHERE LTRIM(rtrim(tb_consultora.nrodoc)) = LTRIM(RTRIM(@NRODOCUMENTO)))
																						END
																					ELSE
																						BEGIN
																						   SET @_CODIGOCONSULTORA = @CODIGOCONSULTORA 
																						END
																					
																					IF @NRODOCUMENTO = ''
																						BEGIN
																						   SET @_NRODOCUMENTO = (SELECT tb_consultora.nrodoc FROM tb_consultora WHERE LTRIM(rtrim(tb_consultora.cod)) = LTRIM(RTRIM(@CODIGOCONSULTORA)))
																						END
																					ELSE
																						BEGIN
																						   SET @_NRODOCUMENTO = @NRODOCUMENTO
																						END
																						
																					IF (@_CODIGOCONSULTORA IS NOT NULL AND @_NRODOCUMENTO IS NOT NULL)
																						BEGIN
																						    DECLARE @_IDCONSULTORA INT
																						    SET @_IDCONSULTORA = (SELECT TOP 1 tb_consultora.id FROM tb_consultora WHERE LTRIM(rtrim(tb_consultora.nrodoc)) = LTRIM(RTRIM(@NRODOCUMENTO)) or LTRIM(rtrim(tb_consultora.cod)) = LTRIM(RTRIM(@CODIGOCONSULTORA))) 
																							DECLARE @_ESTADO BIT	
																							SET @_ESTADO = 'true'
																							INSERT INTO tb_reingreso
																							(
																								idpais,
																								idgerentezona,
																								campanha,
																								codconsu,
																								apepaterno,
																								apematerno,
																								nombres,
																								nrodoc,
																								recpin,
																								recimsi,	
																								reclongitud,
																								reclatitud,	
																								recmargen,
																								recnrosatelites,
																								recobservacion,
																								recfechvisita,
																								fecha,
																								estado,
																								idconsultora
																							)
																							VALUES
																							(
																								@IDPAIS,
																								@_IDGERENTEZONA,
																								@_CAMPANHA,
																								@_CODIGOCONSULTORA,
																								@APELLIDOPATERNO,
																								@APELLIDOMATERNO,
																								@NOMBRES,
																								@_NRODOCUMENTO,
																								@RECORD_PIN,
																								@RECORD_IMSI,
																								@RECORD_LONGITUD,
																								@RECORD_LATITUD,
																								@RECORD_MARGEN,
																								@RECORD_NROSATELITES,
																								@RECORD_OBSERVACION,
																								@_RECORD_FECHAVISITA,
																								@_FECHA,
																								@_ESTADO,
																								@_IDCONSULTORA
																							)
																							SELECT @_EXITO AS 'Mensaje','Grabación exitosa' AS 'Detalle'
																						END
																					ELSE
																						BEGIN
																							SELECT @_ERROR AS 'Mensaje','No se encuentra documento o código de consultora' AS 'Detalle'
																						END
																				END
																			ELSE
																				BEGIN
																					SELECT @_ERROR AS 'Mensaje','Código de zona asignado a más de una gerente de zona' AS 'Detalle'
																				END
																		END
																	ELSE
																		BEGIN
																			SELECT @_ERROR AS 'Mensaje','´Código de gerente de zona incorrecto' AS 'Detalle'
																		END
																END
															ELSE
																BEGIN
																	SELECT @_ERROR AS 'Mensaje','Gerente de zona pertenece a más de un país' AS 'Detalle'
																END			
														END
													ELSE
														BEGIN
															SELECT @_ERROR AS 'Mensaje','País de gerente de zona incorrecto' AS 'Detalle'
														END
												END
											ELSE
												BEGIN
													SELECT @_ERROR AS 'Mensaje','Gerente de zona desactivada' AS 'Detalle'
												END
										END
									ELSE
										BEGIN
											SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry asignados a más de una gerente de zona' AS 'Detalle'
										END
								END
							ELSE
								BEGIN
									IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.pin = @PIN)
										BEGIN
											SELECT @_ERROR AS 'Mensaje','IMSI del BlackBerry de gerente de zona incorrecto' AS 'Detalle'	
										END
									ELSE
										BEGIN
											IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.imsi = @IMSI)
												BEGIN
													SELECT @_ERROR AS 'Mensaje','PIN del BlackBerry de gerente de zona incorrecto' AS 'Detalle'
												END
											ELSE
												BEGIN
													SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry de gerente de zona incorrectos' AS 'Detalle'
												END	
										END	
								END
						END
					ELSE
						BEGIN
							SELECT @_ERROR AS 'Mensaje','Código APPID incorrecto' AS 'Detalle'
						END
				END
			ELSE
				BEGIN
					SELECT @_ERROR AS 'Mensaje','Documento de identidad o codigo de consultora ya existe' AS 'Detalle'
				END
		END
	ELSE
		BEGIN
			SELECT @_ERROR AS 'Mensaje','Documento de identidad y código de consulora vacíos' AS 'Detalle'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_consultora_crear]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_bel_consultora_crear]
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
GO
/****** Object:  Table [dbo].[tb_usuario]    Script Date: 01/19/2012 16:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idpais] [int] NOT NULL,
	[idtablaperfil] [int] NOT NULL,
	[codigo] [varchar](10) NOT NULL,
	[clave] [varchar](10) NOT NULL,
	[nombre] [varchar](90) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_USUARIO_ID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SP_WS_LISTADO_VINCULO]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC SP_WS_LISTADO_VINCULO '0xcc76ecb46671657aL','8','5738A3C7','DOM482683524852'
CREATE PROCEDURE [dbo].[SP_WS_LISTADO_VINCULO]
@APPID CHAR(19),
@IDPAIS INT,
@PIN CHAR(20) ,
@IMSI CHAR(20)
AS  
SET NOCOUNT ON
BEGIN
	DECLARE @_TRUE BIT
	SET @_TRUE = 'true'
	DECLARE @_ERROR CHAR(2)
	SET @_ERROR = '0|'
	DECLARE @_TIPOTABLA_APPID INT
	SET @_TIPOTABLA_APPID = '1'
	DECLARE @_APPID CHAR(19)
	SET @_APPID = (SELECT tb_tabla.descripcion FROM tb_tabla WHERE tb_tabla.id = @_TIPOTABLA_APPID AND tb_tabla.estado = @_TRUE)
	IF @APPID = @_APPID
		BEGIN
			IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
				BEGIN
					DECLARE @_UNO INT
					SET @_UNO = '1'
					DECLARE @_GERENTEZONA_PIN_IMSI_CONTA INT
					SET @_GERENTEZONA_PIN_IMSI_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
					IF @_GERENTEZONA_PIN_IMSI_CONTA = @_UNO
						BEGIN
							DECLARE @_GERENTEZONA_ESTADO BIT
							SET @_GERENTEZONA_ESTADO = (SELECT tb_gerentezona.estado FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
							IF @_GERENTEZONA_ESTADO = @_TRUE
								BEGIN
									DECLARE @_CERO INT
									SET  @_CERO = '0'
									IF EXISTS (SELECT 1 FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE (tb_gerentezona.idpais = @IDPAIS) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI) AND (tb_pais.id <> @_CERO) AND  (tb_pais.estado = @_TRUE))
										BEGIN
											DECLARE @_GERENTEZONA_PAIS_CONTA INT
											SET @_GERENTEZONA_PAIS_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE (tb_gerentezona.idpais = @IDPAIS) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI) AND (tb_pais.estado = @_TRUE))
											IF @_GERENTEZONA_PAIS_CONTA = @_UNO
												BEGIN
													DECLARE @_TIPOTABLA_CONTACTO INT
													SET @_TIPOTABLA_CONTACTO = '7'
													SELECT tb_tabla.cod,tb_tabla.descripcion 
													FROM tb_tabla 
													WHERE tb_tabla.idtipotabla = @_TIPOTABLA_CONTACTO AND tb_tabla.estado = @_TRUE	
												END
											ELSE
												BEGIN
													SELECT @_ERROR AS 'Mensaje','Gerente de zona pertenece a más de un país' AS 'Detalle'
												END			
										END
									ELSE
										BEGIN
											SELECT @_ERROR AS 'Mensaje','País de gerente de zona incorrecto' AS 'Detalle'
										END
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','Gerente de zona desactivada' AS 'Detalle'
								END
						END
					ELSE
						BEGIN
							SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry perteneces a más de una gerente de zona' AS 'Detalle'
						END
				END
			ELSE
				BEGIN
					IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.pin = @PIN)
						BEGIN
							SELECT @_ERROR AS 'Mensaje','IMSI del BlackBerry de gerente de zona incorrecto' AS 'Detalle'	
						END
					ELSE
						BEGIN
							IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.imsi = @IMSI)
								BEGIN
									SELECT @_ERROR AS 'Mensaje','PIN del BlackBerry de gerente de zona incorrecto' AS 'Detalle'
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry de gerente de zona incorrectos' AS 'Detalle'
								END	
						END	
				END
		END
	ELSE
		BEGIN
			SELECT @_ERROR AS 'Mensaje','Código APPID incorrecto' AS 'Detalle'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_WS_LISTADO_OTRA_MARCA]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC SP_WS_LISTADO_OTRA_MARCA '0xcc76ecb46671657aL','8','5738A3C7','DOM482683524852'
CREATE PROCEDURE [dbo].[SP_WS_LISTADO_OTRA_MARCA]
@APPID CHAR(19),
@IDPAIS INT,
@PIN CHAR(20) ,
@IMSI CHAR(20)
AS  
SET NOCOUNT ON
BEGIN
	DECLARE @_TRUE BIT
	SET @_TRUE = 'true'
	DECLARE @_ERROR CHAR(2)
	SET @_ERROR = '0|'
	DECLARE @_TIPOTABLA_APPID INT
	SET @_TIPOTABLA_APPID = '1'
	DECLARE @_APPID CHAR(19)
	SET @_APPID = (SELECT tb_tabla.descripcion FROM tb_tabla WHERE tb_tabla.id = @_TIPOTABLA_APPID AND tb_tabla.estado = @_TRUE)
	IF @APPID = @_APPID
		BEGIN
			IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
				BEGIN
					DECLARE @_UNO INT
					SET @_UNO = '1'
					DECLARE @_GERENTEZONA_PIN_IMSI_CONTA INT
					SET @_GERENTEZONA_PIN_IMSI_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
					IF @_GERENTEZONA_PIN_IMSI_CONTA = @_UNO
						BEGIN
							DECLARE @_GERENTEZONA_ESTADO BIT
							SET @_GERENTEZONA_ESTADO = (SELECT tb_gerentezona.estado FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
							IF @_GERENTEZONA_ESTADO = @_TRUE
								BEGIN
									DECLARE @_CERO INT
									SET @_CERO = '0'
									IF EXISTS (SELECT 1 FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE (tb_gerentezona.idpais = @IDPAIS) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI) AND (tb_pais.id <> @_CERO) AND (tb_pais.estado = @_TRUE))
										BEGIN
											DECLARE @_GERENTEZONA_PAIS_CONTA INT
											SET @_GERENTEZONA_PAIS_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE (tb_gerentezona.idpais = @IDPAIS) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI) AND (tb_pais.estado = @_TRUE))
											IF @_GERENTEZONA_PAIS_CONTA = @_UNO
												BEGIN
													DECLARE @_TIPOTABLA_CONTACTO INT
													SET @_TIPOTABLA_CONTACTO = '4'
													SELECT tb_tabla.cod,tb_tabla.descripcion 
													FROM tb_tabla 
													WHERE tb_tabla.idtipotabla = @_TIPOTABLA_CONTACTO AND tb_tabla.estado = @_TRUE	
												END
											ELSE
												BEGIN
													SELECT @_ERROR AS 'Mensaje','Gerente de zona pertenece a más de un país' AS 'Detalle'
												END			
										END
									ELSE
										BEGIN
											SELECT @_ERROR AS 'Mensaje','País de gerente de zona incorrecto' AS 'Detalle'
										END
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','Gerente de zona desactivada' AS 'Detalle'
								END
						END
					ELSE
						BEGIN
							SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry perteneces a más de una gerente de zona' AS 'Detalle'
						END
				END
			ELSE
				BEGIN
					IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.pin = @PIN)
						BEGIN
							SELECT @_ERROR AS 'Mensaje','IMSI del BlackBerry de gerente de zona incorrecto' AS 'Detalle'	
						END
					ELSE
						BEGIN
							IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.imsi = @IMSI)
								BEGIN
									SELECT @_ERROR AS 'Mensaje','PIN del BlackBerry de gerente de zona incorrecto' AS 'Detalle'
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry de gerente de zona incorrectos' AS 'Detalle'
								END	
						END	
				END
		END
	ELSE
		BEGIN
			SELECT @_ERROR AS 'Mensaje','Código APPID incorrecto' AS 'Detalle'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_WS_LISTADO_NIVEL_EDUCATIVO]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC SP_WS_LISTADO_NIVEL_EDUCATIVO '0xcc76ecb46671657aL','8','5738A3C7','DOM482683524852'
CREATE PROCEDURE [dbo].[SP_WS_LISTADO_NIVEL_EDUCATIVO]
@APPID CHAR(19),
@IDPAIS INT,
@PIN CHAR(20) ,
@IMSI CHAR(20)
AS  
SET NOCOUNT ON
BEGIN
	DECLARE @_TRUE BIT
	SET @_TRUE = 'true'
	DECLARE @_ERROR CHAR(2)
	SET @_ERROR = '0|'
	DECLARE @_TIPOTABLA_APPID INT
	SET @_TIPOTABLA_APPID = '1'
	DECLARE @_APPID CHAR(19)
	SET @_APPID = (SELECT tb_tabla.descripcion FROM tb_tabla WHERE tb_tabla.id = @_TIPOTABLA_APPID AND tb_tabla.estado = @_TRUE)
	IF @APPID = @_APPID
		BEGIN
			IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
				BEGIN
					DECLARE @_UNO INT
					SET @_UNO = '1'
					DECLARE @_GERENTEZONA_PIN_IMSI_CONTA INT
					SET @_GERENTEZONA_PIN_IMSI_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
					IF @_GERENTEZONA_PIN_IMSI_CONTA = @_UNO
						BEGIN
							DECLARE @_GERENTEZONA_ESTADO BIT
							SET @_GERENTEZONA_ESTADO = (SELECT tb_gerentezona.estado FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
							IF @_GERENTEZONA_ESTADO = @_TRUE
								BEGIN
									DECLARE @_CERO INT
									SET @_CERO = '0'
									IF EXISTS (SELECT 1 FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE (tb_gerentezona.idpais = @IDPAIS) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI) AND (tb_pais.id <> @_CERO) AND (tb_pais.estado = @_TRUE))
										BEGIN
											DECLARE @_GERENTEZONA_PAIS_CONTA INT
											SET @_GERENTEZONA_PAIS_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE (tb_gerentezona.idpais = @IDPAIS) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI) AND (tb_pais.estado = @_TRUE))
											IF @_GERENTEZONA_PAIS_CONTA = @_UNO
												BEGIN
													DECLARE @_TIPOTABLA_CONTACTO INT
													SET @_TIPOTABLA_CONTACTO = '6'
													SELECT tb_tabla.cod,tb_tabla.descripcion 
													FROM tb_tabla 
													WHERE tb_tabla.idtipotabla = @_TIPOTABLA_CONTACTO AND tb_tabla.estado = @_TRUE	
												END
											ELSE
												BEGIN
													SELECT @_ERROR AS 'Mensaje','Gerente de zona pertenece a más de un país' AS 'Detalle'
												END			
										END
									ELSE
										BEGIN
											SELECT @_ERROR AS 'Mensaje','País de gerente de zona incorrecto' AS 'Detalle'
										END
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','Gerente de zona desactivada' AS 'Detalle'
								END
						END
					ELSE
						BEGIN
							SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry perteneces a más de una gerente de zona' AS 'Detalle'
						END
				END
			ELSE
				BEGIN
					IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.pin = @PIN)
						BEGIN
							SELECT @_ERROR AS 'Mensaje','IMSI del BlackBerry de gerente de zona incorrecto' AS 'Detalle'	
						END
					ELSE
						BEGIN
							IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.imsi = @IMSI)
								BEGIN
									SELECT @_ERROR AS 'Mensaje','PIN del BlackBerry de gerente de zona incorrecto' AS 'Detalle'
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry de gerente de zona incorrectos' AS 'Detalle'
								END	
						END	
				END
		END
	ELSE
		BEGIN
			SELECT @_ERROR AS 'Mensaje','Código APPID incorrecto' AS 'Detalle'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_WS_LISTADO_ESTADO_CIVIL]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC SP_WS_LISTADO_ESTADO_CIVIL '0xcc76ecb46671657aL','8','5738A3C7','DOM482683524852'
CREATE PROCEDURE [dbo].[SP_WS_LISTADO_ESTADO_CIVIL]
@APPID CHAR(19),
@IDPAIS INT,
@PIN CHAR(20) ,
@IMSI CHAR(20)
AS  
SET NOCOUNT ON
BEGIN
	DECLARE @_TRUE BIT
	SET @_TRUE = 'true'
	DECLARE @_ERROR CHAR(2)
	SET @_ERROR = '0|'
	DECLARE @_TIPOTABLA_APPID INT
	SET @_TIPOTABLA_APPID = '1'
	DECLARE @_APPID CHAR(19)
	SET @_APPID = (SELECT tb_tabla.descripcion FROM tb_tabla WHERE tb_tabla.id = @_TIPOTABLA_APPID AND tb_tabla.estado = @_TRUE)
	IF @APPID = @_APPID
		BEGIN
			IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
				BEGIN
					DECLARE @_UNO INT
					SET @_UNO = '1'
					DECLARE @_GERENTEZONA_PIN_IMSI_CONTA INT
					SET @_GERENTEZONA_PIN_IMSI_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
					IF @_GERENTEZONA_PIN_IMSI_CONTA = @_UNO
						BEGIN
							DECLARE @_GERENTEZONA_ESTADO BIT
							SET @_GERENTEZONA_ESTADO = (SELECT tb_gerentezona.estado FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
							IF @_GERENTEZONA_ESTADO = @_TRUE
								BEGIN
									DECLARE @_CERO INT
									SET @_CERO = '0'
									IF EXISTS (SELECT 1 FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE (tb_gerentezona.idpais = @IDPAIS) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI) AND (tb_pais.id <> @_CERO) AND (tb_pais.estado = @_TRUE))
										BEGIN
											DECLARE @_GERENTEZONA_PAIS_CONTA INT
											SET @_GERENTEZONA_PAIS_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE (tb_gerentezona.idpais = @IDPAIS) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI) AND (tb_pais.estado = @_TRUE))
											IF @_GERENTEZONA_PAIS_CONTA = @_UNO
												BEGIN
													DECLARE @_TIPOTABLA_CONTACTO INT
													SET @_TIPOTABLA_CONTACTO = '5'
													SELECT tb_tabla.cod,tb_tabla.descripcion 
													FROM tb_tabla 
													WHERE tb_tabla.idtipotabla = @_TIPOTABLA_CONTACTO AND tb_tabla.estado = @_TRUE	
												END
											ELSE
												BEGIN
													SELECT @_ERROR AS 'Mensaje','Gerente de zona pertenece a más de un país' AS 'Detalle'
												END			
										END
									ELSE
										BEGIN
											SELECT @_ERROR AS 'Mensaje','País de gerente de zona incorrecto' AS 'Detalle'
										END
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','Gerente de zona desactivada' AS 'Detalle'
								END
						END
					ELSE
						BEGIN
							SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry perteneces a más de una gerente de zona' AS 'Detalle'
						END
				END
			ELSE
				BEGIN
					IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.pin = @PIN)
						BEGIN
							SELECT @_ERROR AS 'Mensaje','IMSI del BlackBerry de gerente de zona incorrecto' AS 'Detalle'	
						END
					ELSE
						BEGIN
							IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.imsi = @IMSI)
								BEGIN
									SELECT @_ERROR AS 'Mensaje','PIN del BlackBerry de gerente de zona incorrecto' AS 'Detalle'
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry de gerente de zona incorrectos' AS 'Detalle'
								END	
						END	
				END
		END
	ELSE
		BEGIN
			SELECT @_ERROR AS 'Mensaje','Código APPID incorrecto' AS 'Detalle'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_WS_LISTADO_DOC_IDENTIDAD]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC SP_WS_LISTADO_DOC_IDENTIDAD '0xcc76ecb46671657aL','8','5738A3C7','DOM482683524852'
CREATE PROCEDURE [dbo].[SP_WS_LISTADO_DOC_IDENTIDAD]
@APPID CHAR(19),
@IDPAIS INT,
@PIN CHAR(20) ,
@IMSI CHAR(20)
AS  
SET NOCOUNT ON
BEGIN
	DECLARE @_TRUE BIT
	SET @_TRUE = 'true'
	DECLARE @_ERROR CHAR(2)
	SET @_ERROR = '0|'
	DECLARE @_TIPOTABLA_APPID INT
	SET @_TIPOTABLA_APPID = '1'
	DECLARE @_APPID CHAR(19)
	SET @_APPID = (SELECT tb_tabla.descripcion FROM tb_tabla WHERE tb_tabla.id = @_TIPOTABLA_APPID AND tb_tabla.estado = @_TRUE)
	IF @APPID = @_APPID
		BEGIN
			IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
				BEGIN
					DECLARE @_UNO INT
					SET @_UNO = '1'
					DECLARE @_GERENTEZONA_PIN_IMSI_CONTA INT
					SET @_GERENTEZONA_PIN_IMSI_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
					IF @_GERENTEZONA_PIN_IMSI_CONTA = @_UNO
						BEGIN
							DECLARE @_GERENTEZONA_ESTADO BIT
							SET @_GERENTEZONA_ESTADO = (SELECT tb_gerentezona.estado FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
							IF @_GERENTEZONA_ESTADO = @_TRUE
								BEGIN
									DECLARE @_CERO INT
									SET @_CERO = '0'
									IF EXISTS (SELECT 1 FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE (tb_gerentezona.idpais = @IDPAIS) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI) AND (tb_pais.id <> @_CERO) AND (tb_pais.estado = @_TRUE))
										BEGIN
											DECLARE @_GERENTEZONA_PAIS_CONTA INT
											SET @_GERENTEZONA_PAIS_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE (tb_gerentezona.idpais = @IDPAIS) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI) AND (tb_pais.estado = @_TRUE))
											IF @_GERENTEZONA_PAIS_CONTA = @_UNO
												BEGIN
													SELECT tb_pais.id,tb_pais.tipodoc 
													FROM tb_pais 
													WHERE tb_pais.id = @IDPAIS AND tb_pais.estado = @_TRUE	
												END
											ELSE
												BEGIN
													SELECT @_ERROR AS 'Mensaje','Gerente de zona pertenece a más de un país' AS 'Detalle'
												END			
										END
									ELSE
										BEGIN
											SELECT @_ERROR AS 'Mensaje','País de gerente de zona incorrecto' AS 'Detalle'
										END
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','Gerente de zona desactivada' AS 'Detalle'
								END
						END
					ELSE
						BEGIN
							SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry perteneces a más de una gerente de zona' AS 'Detalle'
						END
				END
			ELSE
				BEGIN
					IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.pin = @PIN)
						BEGIN
							SELECT @_ERROR AS 'Mensaje','IMSI del BlackBerry de gerente de zona incorrecto' AS 'Detalle'	
						END
					ELSE
						BEGIN
							IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.imsi = @IMSI)
								BEGIN
									SELECT @_ERROR AS 'Mensaje','PIN del BlackBerry de gerente de zona incorrecto' AS 'Detalle'
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry de gerente de zona incorrectos' AS 'Detalle'
								END	
						END	
				END
		END
	ELSE
		BEGIN
			SELECT @_ERROR AS 'Mensaje','Código APPID incorrecto' AS 'Detalle'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_WS_LISTADO_CONTACTO]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC SP_WS_LISTADO_CONTACTO '0xcc76ecb46671657aL','8','5738A3C7','DOM482683524852'
CREATE PROCEDURE [dbo].[SP_WS_LISTADO_CONTACTO]
@APPID CHAR(19),
@IDPAIS INT,
@PIN CHAR(20) ,
@IMSI CHAR(20)
AS  
SET NOCOUNT ON
BEGIN
	DECLARE @_TRUE BIT
	SET @_TRUE = 'true'
	DECLARE @_ERROR CHAR(2)
	SET @_ERROR = '0|'
	DECLARE @_TIPOTABLA_APPID INT
	SET @_TIPOTABLA_APPID = '1'
	DECLARE @_APPID CHAR(19)
	SET @_APPID = (SELECT tb_tabla.descripcion FROM tb_tabla WHERE tb_tabla.id = @_TIPOTABLA_APPID AND tb_tabla.estado = @_TRUE)
	IF @APPID = @_APPID
		BEGIN
			IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
				BEGIN
					DECLARE @_UNO INT
					SET @_UNO = '1'
					DECLARE @_GERENTEZONA_PIN_IMSI_CONTA INT
					SET @_GERENTEZONA_PIN_IMSI_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
					IF @_GERENTEZONA_PIN_IMSI_CONTA = @_UNO
						BEGIN
							DECLARE @_GERENTEZONA_ESTADO BIT
							SET @_GERENTEZONA_ESTADO = (SELECT tb_gerentezona.estado FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
							IF @_GERENTEZONA_ESTADO = @_TRUE
								BEGIN
									DECLARE @_CERO INT
									SET @_CERO = '0'
									IF EXISTS (SELECT 1 FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE (tb_gerentezona.idpais = @IDPAIS) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI) AND (tb_pais.id <> @_CERO) AND (tb_pais.estado = @_TRUE))
										BEGIN
											DECLARE @_GERENTEZONA_PAIS_CONTA INT
											SET @_GERENTEZONA_PAIS_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE (tb_gerentezona.idpais = @IDPAIS) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI) AND (tb_pais.estado = @_TRUE))
											IF @_GERENTEZONA_PAIS_CONTA = @_UNO
												BEGIN
													DECLARE @_TIPOTABLA_CONTACTO INT
													SET @_TIPOTABLA_CONTACTO = '3'
													SELECT tb_tabla.cod,tb_tabla.descripcion 
													FROM tb_tabla 
													WHERE tb_tabla.idtipotabla = @_TIPOTABLA_CONTACTO AND tb_tabla.estado = @_TRUE	
												END
											ELSE
												BEGIN
													SELECT @_ERROR AS 'Mensaje','Gerente de zona pertenece a más de un país' AS 'Detalle'
												END			
										END
									ELSE
										BEGIN
											SELECT @_ERROR AS 'Mensaje','País de gerente de zona incorrecto' AS 'Detalle'
										END
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','Gerente de zona desactivada' AS 'Detalle'
								END
						END
					ELSE
						BEGIN
							SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry perteneces a más de una gerente de zona' AS 'Detalle'
						END
				END
			ELSE
				BEGIN
					IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.pin = @PIN)
						BEGIN
							SELECT @_ERROR AS 'Mensaje','IMSI del BlackBerry de gerente de zona incorrecto' AS 'Detalle'	
						END
					ELSE
						BEGIN
							IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.imsi = @IMSI)
								BEGIN
									SELECT @_ERROR AS 'Mensaje','PIN del BlackBerry de gerente de zona incorrecto' AS 'Detalle'
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry de gerente de zona incorrectos' AS 'Detalle'
								END	
						END	
				END
		END
	ELSE
		BEGIN
			SELECT @_ERROR AS 'Mensaje','Código APPID incorrecto' AS 'Detalle'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA_PERFIL_OBTENER]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_TABLA_PERFIL_OBTENER]
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		tt.id AS tablaID,
		tt.idtipotabla AS tipoTablaID,
		tt.cod AS perfilCodigo,
		UPPER(LEFT(tt.descripcion, 1)) + LOWER(SUBSTRING(tt.descripcion, 2, LEN(tt.descripcion))) AS perfilDescripcion,
		tt.estado AS perfilEstado
	FROM
		tb_tabla tt
	WHERE
		tt.idtipotabla = 2 -- tb_tipotabla.id 2 = Tipo perfil
	AND
		tt.estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA_OPERACION_OBTENER]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_TABLA_OPERACION_OBTENER]
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		tt.id AS tablaID,
		tt.idtipotabla AS tipoTablaID,
		tt.cod AS operacionCodigo,
		UPPER(LEFT(tt.descripcion, 1)) + LOWER(SUBSTRING(tt.descripcion, 2, LEN(tt.descripcion))) AS operacionDescripcion,
		tt.estado
	FROM
		tb_tabla tt
	WHERE
		tt.idtipotabla = 11; -- tb_tipotabla.id 11 = Operación
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SEGUIMIENTO_VERIFICAR]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SEGUIMIENTO_VERIFICAR]
@ID INT
AS
SET NOCOUNT ON
BEGIN
	IF EXISTS (SELECT 1 FROM tb_seguimiento WHERE tb_seguimiento.id = @ID)
		BEGIN
			UPDATE tb_seguimiento SET verifica = CASE verifica WHEN 0 THEN 1 ELSE 0 END  WHERE id = @ID; 
		END
	ELSE
		BEGIN
			RAISERROR ('El seguimiento no existe', 18, 101);
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_REINGRESO_VERIFICAR]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_REINGRESO_VERIFICAR]
@ID INT
AS
SET NOCOUNT ON
BEGIN
	IF EXISTS (SELECT 1 FROM tb_reingreso WHERE tb_reingreso.id = @ID)
		BEGIN
			UPDATE tb_reingreso SET verifica = CASE verifica WHEN 0 THEN 1 ELSE 0 END  WHERE id = @ID; 
		END
	ELSE
		BEGIN
			RAISERROR ('El reingreso no existe', 18, 101);
		END
END
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_reingreso_obtener_por_region_zona]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_bel_reingreso_obtener_por_region_zona]
	@regionCodigo		VARCHAR(2) = '',
	@zonaCodigo			VARCHAR(6) = '',
	@estadoVerificiado BIT	
AS
BEGIN
	SET NOCOUNT ON;

    SELECT DISTINCT
		   --tg.id AS gerenteID,
		   tg.codregion AS regionCodigo,
		   tg.codzona AS zonaCodigo,
		   tr.verifica AS estadoVerificado,
		   COUNT(tg.id) AS cantidad
	FROM   tb_reingreso tr(NOLOCK)
		  LEFT JOIN tb_gerentezona tg(NOLOCK)
				ON  tg.id = tr.idgerentezona
		LEFT JOIN tb_consultora tc(NOLOCK)
			ON  tc.id = tr.idconsultora
    WHERE
		( @regionCodigo IS NULL OR tg.codregion = @regionCodigo OR @regionCodigo = '')
	AND
		(@zonaCodigo IS NULL OR tg.codzona = @zonaCodigo OR  @zonaCodigo = '')
	AND
		(@estadoVerificiado IS NULL OR tr.verifica = @estadoVerificiado )
    GROUP BY
		tg.codregion, tg.codzona, tr.verifica
END
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_reingreso_obtener]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vsanchez
-- Create date: 23/05/2011
-- Description:	Obtiene listado de reingresos con estado 1 que coincidan con los parámetros de búsqueda indicados.
-- =============================================
CREATE PROCEDURE [dbo].[usp_bel_reingreso_obtener]
	@regionCodigo			VARCHAR(2) = '',
	@zonaCodigo				VARCHAR(6) = '',
	@fechaReingreso			SMALLDATETIME = '',
	@campanhaInscripcion	VARCHAR(6) = '',
	@campanhaFacturacion	VARCHAR(6) = '',
	@documentoNumero		VARCHAR(18) = '',
	@consultoraCodigo		VARCHAR(15)	= '',
	@apellidoPaterno		VARCHAR(30) = '',
	@apellidoMaterno		VARCHAR(30) = '',
	@nombres				VARCHAR(30) = '',
	@estadoVerificado		BIT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		tr.id AS reingresoID,
		tc.codregion AS regionCodigo,
		substring(tc.codzona,3,7) AS zonaCodigo,
		convert(varchar(10), tr.fecha, 103) AS fechaReingreso,
		tc.campanhainsc AS campanhaInscripcion,
		tc.campanhaprico AS campanhaPrimeraCompra,
		tr.nrodoc AS documentoNumero,
		tr.codconsu AS consultoraCodigo,
--		tc.cod AS consultoraCodigo,
		tr.apepaterno AS apellidoPaterno,
		tr.apematerno AS apellidoMaterno,
		tr.nombres AS nombres,
		tr.estado AS estadoActivo,
		tr.verifica AS estadoVerificado
	FROM 
		tb_reingreso tr(NOLOCK)
		LEFT JOIN tb_gerentezona tg(NOLOCK)
			ON  tg.id = tr.idgerentezona
		LEFT JOIN tb_consultora tc(NOLOCK)
			ON tc.id = tr.idconsultora
	WHERE
		(tg.codregion = @regionCodigo OR @regionCodigo IS NULL OR @regionCodigo = '') 
	AND
		(tg.codzona = @zonaCodigo OR @zonaCodigo IS NULL OR @zonaCodigo = '')
	AND
		(tr.fecha = @fechaReingreso OR @fechaReingreso IS NULL OR @fechaReingreso = '')
	AND
		(tc.campanhainsc = @campanhaInscripcion OR @campanhaInscripcion IS NULL OR @campanhaInscripcion = '')
	AND
		(tc.campanhaprico = @campanhaFacturacion OR @campanhaFacturacion IS NULL OR @campanhaFacturacion = '')
	AND
		(tr.nrodoc = @documentoNumero OR @documentoNumero IS NULL OR @documentoNumero = '')
	AND
		(tr.codconsu LIKE '%'+@consultoraCodigo+'%' OR @consultoraCodigo IS NULL OR @consultoraCodigo = '' )
	AND
		(tr.apepaterno LIKE '%'+@apellidoPaterno+'%' OR @apellidoPaterno IS NULL OR @apellidoPaterno = '')
	AND
		(tr.apematerno LIKE '%'+@apellidoMaterno+'%' OR @apellidoMaterno IS NULL OR @apellidoMaterno = '')
	AND
		(tr.nombres LIKE '%'+@nombres+'%' OR @nombres IS NULL OR @nombres = '')
	AND
		(@estadoVerificado IS NULL or tr.verifica = @estadoVerificado)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_facturacion_crear]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_bel_facturacion_crear]
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
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_seguimiento_obtener_por_region_zona]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_bel_seguimiento_obtener_por_region_zona]
	@regionCodigo		VARCHAR(2) = '',
	@zonaCodigo			VARCHAR(6) = '',
	@estadoVerificiado	BIT
AS
BEGIN
	SET NOCOUNT ON;

    SELECT DISTINCT
		   --tr.id AS gerenteID,
		   tg.codregion AS regionCodigo,
		   tg.codzona AS zonaCodigo,
		   --tr.verifica AS estadoVerificado,
			COUNT(tg.id) AS cantidad
	FROM   tb_seguimiento tr(NOLOCK)
		   JOIN tb_gerentezona tg(NOLOCK)
				ON  tg.id = tr.idgerentezona
    WHERE
		(tg.codregion = @regionCodigo OR @regionCodigo IS NULL OR @regionCodigo = '')
	AND
		(tg.codzona = @zonaCodigo OR @zonaCodigo IS NULL OR @zonaCodigo = '')
	AND
		(tr.verifica = @estadoVerificiado OR @estadoVerificiado IS NULL)
    GROUP BY
		tg.codregion, tg.codzona--, tr.verifica
END
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_seguimiento_obtener]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vsanchez
-- Create date: 18/05/2011
-- Description:	Obtiene listado de incorporaciones y/o consultoras de acuerdo a parámetros de búsqueda enviados.
-- =============================================
CREATE PROCEDURE [dbo].[usp_bel_seguimiento_obtener]
	@regionCodigo			CHAR(2) = '',
	@zonaCodigo				CHAR(6) = '',
	@fechaInscripcion		SMALLDATETIME = '',
	@campanhaInscripcion	VARCHAR(6) = '',
	@numeroDocumento		VARCHAR(18) = '',
	@consultoraCodigo		VARCHAR(15)	= '',
	@apellidoPaterno		VARCHAR(30) = '',
	@apellidoMaterno		VARCHAR(30) = '',
	@nombres				VARCHAR(30) = '',
	@estadoVerificado		BIT
AS
BEGIN
	SET NOCOUNT ON;
SELECT 
		ts.id AS seguimientoID,
		tc.id AS consultoraID,
		tg.codregion AS region,
		tg.codzona AS zona,
		ts.fecha AS fechaIncorporacion,
		tc.campanhainsc AS campanhaInscripcion,
		CASE WHEN LTRIM(RTRIM(tc.nrodoc)) = 'No definido' THEN 'No definido' ELSE tc.nrodoc END AS numeroDocumento,
		CASE WHEN LEN(LTRIM(RTRIM(tc.apepaterno)))> 0 THEN tc.apepaterno ELSE 'No definido' END AS apellidoPaterno,
		CASE WHEN LEN(LTRIM(RTRIM(tc.apematerno)))> 0 THEN tc.apematerno ELSE 'No definido' END AS apellidoMaterno,
		CASE WHEN LEN(LTRIM(RTRIM(tc.nombres)))> 0 THEN tc.nombres ELSE 'No definido' END AS nombres,
		CASE WHEN LEN(LTRIM(RTRIM(tc.cod)))> 0 THEN tc.cod ELSE 'No definido' END AS consultoraCodigo,
		ts.verifica AS estadoVerificado,
		ts.estado AS estadoActivo
FROM tb_seguimiento ts (NOLOCK)
	LEFT JOIN tb_gerentezona tg (NOLOCK)
		ON tg.id = ts.idgerentezona
	LEFT JOIN tb_consultora tc (NOLOCK)
		ON tc.id = ts.idconsultora  
    WHERE
		(tg.codregion = @regionCodigo OR @regionCodigo IS NULL OR @regionCodigo = '')
	AND
		(tg.codzona = @zonaCodigo OR @zonaCodigo IS NULL OR @zonaCodigo = '')
	AND
		(ts.fecha = @fechaInscripcion OR @fechaInscripcion IS NULL OR @fechaInscripcion = '')
	AND
		(tc.campanhainsc LIKE '%'+@campanhaInscripcion+'%' OR @campanhaInscripcion IS NULL OR @campanhaInscripcion = '')
	AND
		(tc.nrodoc = @numeroDocumento OR @numeroDocumento IS NULL OR @numeroDocumento = '')
	AND
		(tc.cod LIKE '%'+@consultoraCodigo+'%' OR @consultoraCodigo IS NULL OR @consultoraCodigo = '' )
	AND
		(tc.apepaterno LIKE '%'+@apellidoPaterno+'%' OR @apellidoPaterno IS NULL OR @apellidoPaterno = '') 
	AND
		(tc.apematerno LIKE '%'+@apellidoMaterno+'%' OR @apellidoMaterno IS NULL OR @apellidoMaterno = '')
	AND
		(tc.nombres LIKE '%'+@nombres+'%' OR @nombres IS NULL OR @nombres = '')
	AND
		(ts.verifica = @estadoVerificado OR @estadoVerificado IS NULL);
END
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_ws_listado_divpolitica]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_bel_ws_listado_divpolitica]
	@APPID CHAR(19),
	@IDPAIS INT,
	@PIN CHAR(20) ,
	@IMSI CHAR(20)
AS
BEGIN
	DECLARE @_TRUE BIT
	SET @_TRUE = 'true'
	DECLARE @_ERROR CHAR(2)
	SET @_ERROR = '0|'
	DECLARE @_TIPOTABLA_APPID INT
	SET @_TIPOTABLA_APPID = '1'
	DECLARE @_APPID CHAR(19)
	SET @_APPID = (SELECT tb_tabla.descripcion FROM tb_tabla WHERE tb_tabla.id = @_TIPOTABLA_APPID AND tb_tabla.estado = @_TRUE)
	IF @APPID = @_APPID
		BEGIN
			IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
				BEGIN
					DECLARE @_UNO INT
					SET @_UNO = '1'
					DECLARE @_GERENTEZONA_PIN_IMSI_CONTA INT
					SET @_GERENTEZONA_PIN_IMSI_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
					IF @_GERENTEZONA_PIN_IMSI_CONTA = @_UNO
						BEGIN
							DECLARE @_GERENTEZONA_ESTADO BIT
							SET @_GERENTEZONA_ESTADO = (SELECT tb_gerentezona.estado FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
							IF @_GERENTEZONA_ESTADO = @_TRUE
								BEGIN
									DECLARE @_CERO INT
									SET  @_CERO = '0'
									IF EXISTS (SELECT 1 FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE (tb_gerentezona.idpais = @IDPAIS) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI) AND (tb_pais.id <> @_CERO) AND  (tb_pais.estado = @_TRUE))
										BEGIN
											DECLARE @_GERENTEZONA_PAIS_CONTA INT
											SET @_GERENTEZONA_PAIS_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE (tb_gerentezona.idpais = @IDPAIS) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI) AND (tb_pais.estado = @_TRUE))
											IF @_GERENTEZONA_PAIS_CONTA = @_UNO
												BEGIN
													SELECT 
														   td.cod AS divisionCodigo,
														   td.nombre
													FROM   tb_divpolitica td
														   JOIN tb_pais tp (NOLOCK)
																ON  tp.id = td.idpais
													WHERE  td.idpais = @IDPAIS	
												END
											ELSE
												BEGIN
													SELECT @_ERROR AS 'Mensaje','Gerente de zona pertenece a más de un país' AS 'Detalle'
												END			
										END
									ELSE
										BEGIN
											SELECT @_ERROR AS 'Mensaje','País de gerente de zona incorrecto' AS 'Detalle'
										END
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','Gerente de zona desactivada' AS 'Detalle'
								END
						END
					ELSE
						BEGIN
							SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry perteneces a más de una gerente de zona' AS 'Detalle'
						END
				END
			ELSE
				BEGIN
					IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.pin = @PIN)
						BEGIN
							SELECT @_ERROR AS 'Mensaje','IMSI del BlackBerry de gerente de zona incorrecto' AS 'Detalle'	
						END
					ELSE
						BEGIN
							IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.imsi = @IMSI)
								BEGIN
									SELECT @_ERROR AS 'Mensaje','PIN del BlackBerry de gerente de zona incorrecto' AS 'Detalle'
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry de gerente de zona incorrectos' AS 'Detalle'
								END	
						END	
				END
		END
	ELSE
		BEGIN
			SELECT @_ERROR AS 'Mensaje','Código APPID incorrecto' AS 'Detalle'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_usuario_obtener]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_bel_usuario_obtener]
	@paisID		INT,
	@nombres	VARCHAR(90) = '',
	@perfil		INT,
	@estado		BIT
AS
BEGIN
	SET NOCOUNT ON;

    SELECT tu.id AS usuarioID,
		   tu.idpais AS paisID,
		   tu.idtablaperfil AS perfilID,
		   UPPER(LEFT(tt.descripcion, 1)) + LOWER(SUBSTRING(tt.descripcion, 2, LEN(tt.descripcion))) AS 
		   perfilDescripcion,
		   tu.codigo AS usuarioNombre,
		   tu.clave AS usuarioClave,
		   tu.nombre AS usuarioNombres,
		   tu.estado,
		   case tu.estado when 1 then 'Activo' else 'Inactivo' end as estado_descripcion
	FROM   tb_usuario tu
		   JOIN tb_tabla tt
				ON  tu.idtablaperfil = tt.cod AND tt.idtipotabla = 2
    WHERE
		(tu.idpais = @paisID OR @paisID IS NULL OR @paisID = '')
	AND
		(tu.nombre LIKE '%' + @nombres + '%' OR @nombres IS NULL OR @nombres = '')
	AND
		(tu.idtablaperfil = @perfil OR @perfil IS NULL OR @perfil = '')
	AND
		(tu.estado = @estado OR @estado IS NULL)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_usuario_autenticar]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_bel_usuario_autenticar]
	@nombreusuario	VARCHAR(15),
	@clave			VARCHAR(15),
	@paisID			int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		tu.id AS usuarioID,
		tu.idpais AS paisID,
		tp.nombre AS paisNombre,
		tp.rutaimg AS paisRutaImagen,
		tp.tipodoc AS paisTipoDocumento,
		tu.idtablaperfil AS perfilID,
		UPPER(LEFT(tt.descripcion, 1)) + LOWER(SUBSTRING(tt.descripcion, 2, LEN(tt.descripcion))) AS perfilDescripcion,
		tu.codigo AS usuarioNombre,
		tu.estado AS estado,
		tu.nombre AS usuarioNombres
	FROM
		tb_usuario tu,
		tb_pais tp,
		tb_tabla tt
	WITH (NOLOCK)
	WHERE
		tu.idpais = tp.id
	AND
		tt.cod = tu.idtablaperfil
	AND
		tt.idtipotabla = 2
	AND
		tu.codigo = @nombreusuario
	AND
		tu.clave = @clave
	AND
		tu.idpais = @paisID
	AND
		tu.estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_seguimiento_obtener_porID]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_bel_seguimiento_obtener_porID]
	@consultoraCodigo integer
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
    	ts.id AS seguimientoID,
		ti.id AS incorporacionID,
		tc.id AS consultoraID,
		tc.cod AS codConsultora,
		--tg.id AS gerenteID,
		-- Datos de inscripcion
		SUBSTRING(RTRIM(LTRIM(tc.codzona)),0,3)+'-'+SUBSTRING(RTRIM(LTRIM(tc.codzona)),3,6)+RTRIM(LTRIM(tc.codseccion))+RTRIM(LTRIM(tc.codterritorio)) AS territorioCodigo,
		(SELECT tt.descripcion FROM tb_tabla tt WHERE tt.id = ti.idtablacontacto) AS contactoTipo,
		ti.codconsurecom AS consultoraRefiereID,
		-- Datos personales
		CASE WHEN LEN(LTRIM(RTRIM(tc.apepaterno)))> 0 THEN tc.apepaterno ELSE ti.apepaterno END AS apellidoPaterno,
		CASE WHEN LEN(LTRIM(RTRIM(tc.apematerno)))> 0 THEN tc.apematerno ELSE ti.apematerno END AS apellidoMaterno,
		CASE WHEN LEN(LTRIM(RTRIM(tc.nombres)))> 0 THEN tc.nombres ELSE ti.nombres END AS nombres,
		ti.fechnac AS fechaNacimiento,
		tp.tipodoc AS documentoTipo,
		CASE WHEN LTRIM(RTRIM(tc.nrodoc)) = 'No definido' THEN ti.nrodoc ELSE tc.nrodoc END AS documentoNumero,
		(SELECT tt.descripcion FROM tb_tabla tt WHERE tt.id = ti.idtablaestadocivil) AS estadoCivil,
		(SELECT tt.descripcion FROM tb_tabla tt WHERE tt.id = ti.idtablaniveleducativo) AS nivelEducativo,
		(SELECT tt.descripcion FROM tb_tabla tt WHERE tt.id = ti.idtablaotramarca) AS vendeOtraMarca,
		-- Datos del contacto
		ti.telefcasa AS telefono1,
		ti.telefcelular AS telefono2,
		ti.email,
		-- Dirección de la solicitante
		ti.solicdireccion AS solicitanteDireccion,
		ti.solicreferencia AS solicitanteReferencia,
		ti.soliccodpostal AS solicitanteCodigoPostal,
		ti.solicdivpolitica1 AS solicitantePueblo,
		ti.solicdivpolitica2 AS solicitanteEstado,
		-- Datos de entregas
		ti.entregdireccion AS entregaDireccion,
		ti.entregdivpolitica AS entregaPueblo,
		ti.entregcodpostal AS entregaCodigoPostal,
		-- Datos de los seguimientos
		ts.campanha AS segCampanha,
		ts.fechingr AS segFechaIngreso,
		ts.fecha AS segFechaRegistro,
		ts.observacion AS segObservacion
	FROM
		tb_seguimiento ts (NOLOCK)
		LEFT JOIN tb_incorporacion ti  (NOLOCK)
		ON ts.idconsultora = ti.idconsultora
		LEFT JOIN tb_gerentezona tg (NOLOCK)
		ON tg.id = ts.idgerentezona
		LEFT JOIN tb_consultora tc (NOLOCK)
		ON tc.id = ts.idconsultora
		LEFT JOIN tb_pais tp (NOLOCK)
		ON tp.id = tg.idpais

	WHERE
		tc.cod =  @consultoraCodigo
END
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_reingreso_obtener_porID]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_bel_reingreso_obtener_porID]
	@reingresoID INT
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		ti.id AS incorporacionID,
		tc.id AS consultoraID,
		tr.id AS reingresoID,
		tc.cod AS codConsultora,
		--tg.id AS gerenteID,
		-- Datos de inscripcion
		SUBSTRING(RTRIM(LTRIM(tc.codzona)),0,3)+'-'+SUBSTRING(RTRIM(LTRIM(tc.codzona)),3,6)+RTRIM(LTRIM(tc.codseccion))+RTRIM(LTRIM(tc.codterritorio))  AS territorioCodigo,
		(SELECT tt.descripcion FROM tb_tabla tt WHERE tt.id = ti.idtablacontacto) AS contactoTipo,
		ti.codconsurecom AS consultoraRefiereID,
		-- Datos personales
		CASE WHEN LEN(LTRIM(RTRIM(tr.apepaterno)))> 0 THEN tr.apepaterno ELSE tc.apepaterno END AS apellidoPaterno,
		CASE WHEN LEN(LTRIM(RTRIM(tr.apematerno)))> 0 THEN tr.apematerno ELSE tc.apematerno END AS apellidoMaterno,
		CASE WHEN LEN(LTRIM(RTRIM(tr.nombres)))> 0 THEN tr.nombres ELSE tc.nombres END AS nombres,
		ti.fechnac AS fechaNacimiento,
		tp.tipodoc AS documentoTipo,
		CASE WHEN LTRIM(RTRIM(tc.nrodoc)) = 'No definido' THEN ti.nrodoc ELSE tc.nrodoc END AS documentoNumero,
		(SELECT tt.descripcion FROM tb_tabla tt WHERE tt.id = ti.idtablaestadocivil) AS estadoCivil,
		(SELECT tt.descripcion FROM tb_tabla tt WHERE tt.id = ti.idtablaniveleducativo) AS nivelEducativo,
		(SELECT tt.descripcion FROM tb_tabla tt WHERE tt.id = ti.idtablaotramarca) AS vendeOtraMarca,
		-- Datos del contacto
		tc.telefono1 AS telefono1,
		tc.telefono2 AS telefono2,
		ti.email,
		tr.recobservacion AS recObservacion
	FROM
	    tb_reingreso tr (NOLOCK)
		LEFT JOIN tb_consultora tc (NOLOCK)
		ON RTRIM(LTRIM(tr.nrodoc))  = RTRIM(LTRIM(tc.nrodoc))
		LEFT JOIN tb_incorporacion ti  (NOLOCK)
        ON RTRIM(LTRIM(ti.nrodoc))  = RTRIM(LTRIM(tc.nrodoc))
		LEFT JOIN tb_gerentezona tg (NOLOCK)
		ON tg.id = tr.idgerentezona
		LEFT JOIN tb_pais tp (NOLOCK)
		ON tp.id = tg.idpais
	WHERE
		tr.id = @reingresoID 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_descarga_sc]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_bel_descarga_sc] 
	@IDPAIS INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT
		RIGHT ('00000'+ CAST (ti.id AS varchar), 5) AS LOTE,
		--ti.idpais AS PAIS,
		tp.nomenclatura AS PAIS,
		'' AS CODEB,
		UPPER(RTRIM(LTRIM(tg.codregion)) + RTRIM(LTRIM(tg.codzona)) + RTRIM(LTRIM(ti.codterritorio)))  AS TERRI,
		(SELECT tb_tabla.cod FROM tb_tabla WHERE tb_tabla.id = ti.idtablacontacto AND tb_tabla.idtipotabla = 3) AS TIPCON,
		ti.codconsurecom AS RECOMMEN,
		CASE WHEN LEN(LTRIM(RTRIM(tc.apepaterno)))> 0 THEN tc.apepaterno ELSE ti.apepaterno END AS APPAT,
		CASE WHEN LEN(LTRIM(RTRIM(tc.apematerno)))> 0 THEN tc.apematerno ELSE ti.apematerno END AS APMAT,
		CASE WHEN LEN(LTRIM(RTRIM(tc.nombres)))> 0 THEN tc.nombres ELSE ti.nombres END AS NOMBRE,
		Convert (varchar(10), ti.fechnac, 112) AS FECNAC,
		'' AS DOCID,
		'' AS MONOT,
		'' AS CUIT,
		(SELECT tb_tabla.cod FROM tb_tabla WHERE tb_tabla.id = ti.idtablaestadocivil AND tb_tabla.idtipotabla = 5) AS ECIV,
		(SELECT tb_tabla.cod FROM tb_tabla WHERE tb_tabla.id = ti.idtablaniveleducativo AND tb_tabla.idtipotabla = 6) AS NIVED,
		ti.solicdireccion AS SOLDIR,
		ti.solicdivpolitica1 AS SOLBAR,
		ti.solicdivpolitica2 AS SOLLOC,
		'' AS SOLPROV,
		ti.soliccodpostal AS SOLCPOS,
		ti.telefcasa AS SOLTLF,
		ti.telefcelular AS SOLOTLF,
		(SELECT tb_tabla.cod FROM tb_tabla WHERE tb_tabla.id = ti.idtablaotramarca AND tb_tabla.idtipotabla = 4) AS VTADIR,
		'' AS EMAILX,
		UPPER(RTRIM(LTRIM(ti.reffamapepaterno + ' ' + ti.reffamapematerno + ' ' + ti.reffamnombres))) AS RFAMNOM,
		ti.reffamdireccion AS RFAMDIR,
		ti.reffamtelefono AS RFAMTEL,
		(SELECT tb_tabla.cod FROM tb_tabla WHERE tb_tabla.id = ti.idtablareffamtipovinculo AND tb_tabla.idtipotabla = 7) AS RFAMVIN,
		UPPER(RTRIM(LTRIM(ti.refnofamapepaterno + ' ' + ti.refnofamapematerno + ' ' + ti.refnofamnombres))) AS RNFAMNOM,
		ti.refnofamdireccion AS RNFAMDIR,
		ti.refnofamtelefono AS RNFAMTEL,
		(SELECT tb_tabla.cod FROM tb_tabla WHERE tb_tabla.id = ti.idtablarefnofamtipovinculo AND tb_tabla.idtipotabla = 7) AS RNFAMVIN,
		'' AS RGARNOM,
		'' AS RGARDIR,
		'' AS RGARTEL,
		'' AS RGARVIN,
		'' AS RGARDOC,
		ti.entregdireccion AS ENTDIR,
		ti.entregdivpolitica AS ENTLOC,
		'' AS ENTBAR,
		ti.entregcodpostal AS ENTCPOS,
		'' AS ENTTEL,
		'' AS CODERR,
		'' AS DESERR,
		ti.email AS EMAIL,
		ti.nrodoc AS SEGSOC,
		'B' AS CANAL,
		'' AS ENTPROV,
		ti.reclongitud AS RECLONG,
		ti.reclatitud AS RECLAT,
		ti.recmargen AS RECMGN,
		ti.recnrosatelites AS RECSAT,
		ti.recpin AS RECPIN,
		ti.recimsi AS RECIMSI,
		ti.adicprofesion AS PROFESIO,
		ti.adiclugartrab AS LUGTRA,
		ti.adictelefonotrab AS TELTRA,
		Convert (varchar(5), ti.adichoravisita, 108) AS HORVIS,
		ti.adicnrohijos AS NROHIJO,
		'0' AS NROINFA,
		'0' AS NROESCO,
		'0' AS NROSUPER,
		'0' AS NROADUL
	FROM
			tb_incorporacion ti (NOLOCK)
		JOIN tb_gerentezona tg (NOLOCK)
			ON tg.id = ti.idgerentezona
		LEFT JOIN tb_consultora tc (NOLOCK)
			ON tc.id = ti.idconsultora
		INNER JOIN tb_pais TP (NOLOCK)
			ON TI.idpais = TP.id
    WHERE
		ti.verifica = 1
		AND
		ti.graba = 1
		AND
		ti.idpais = @IDPAIS 
		
END
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_incorporacion_obtener_porID]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_bel_incorporacion_obtener_porID]
	@incorporacionID		INT
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		ti.id AS incorporacionID,
		-- Datos de inscripcion
		RTRIM(LTRIM(tg.codregion)) +'-'+ RTRIM(LTRIM(tg.codzona)) + RTRIM(LTRIM(ti.codterritorio)) AS territorioCodigo,
		(SELECT tt.descripcion FROM tb_tabla tt WHERE tt.id = ti.idtablacontacto) AS contactoTipo,
		ti.codconsurecom AS consultoraRefiereID,
		-- Datos personales
		CASE WHEN LEN(LTRIM(RTRIM(tc.apepaterno)))> 0 THEN tc.apepaterno ELSE ti.apepaterno END AS apellidoPaterno,
		CASE WHEN LEN(LTRIM(RTRIM(tc.apematerno)))> 0 THEN tc.apematerno ELSE ti.apematerno END AS apellidoMaterno,
		CASE WHEN LEN(LTRIM(RTRIM(tc.nombres)))> 0 THEN tc.nombres ELSE ti.nombres END AS nombres,
		ti.fechnac AS fechaNacimiento,
		tp.tipodoc AS documentoTipo,
		ti.nrodoc AS documentoNumero,
		(SELECT tt.descripcion FROM tb_tabla tt WHERE tt.id = ti.idtablaestadocivil) AS estadoCivil,
		(SELECT tt.descripcion FROM tb_tabla tt WHERE tt.id = ti.idtablaniveleducativo) AS nivelEducativo,
		(SELECT tt.descripcion FROM tb_tabla tt WHERE tt.id = ti.idtablaotramarca) AS vendeOtraMarca,
		-- Datos del contacto
		ti.telefcasa AS telefono1,
		ti.telefcelular AS telefono2,
		ti.email,
		-- Dirección de la solicitante
		ti.solicdireccion AS solicitanteDireccion,
		ti.solicreferencia AS solicitanteReferencia,
		ti.soliccodpostal AS solicitanteCodigoPostal,
		ti.solicdivpolitica1 AS solicitantePueblo,
		ti.solicdivpolitica2 AS solicitanteEstado,
		-- Datos de entregas
		ti.entregdireccion AS entregaDireccion,
		ti.entregdivpolitica AS entregaPueblo,
		ti.entregcodpostal AS entregaCodigoPostal,
		-- Datos de referencia familiar
		ti.reffamapepaterno AS refFamiliarPaterno,
		ti.reffamapematerno AS refFamiliarMaterno,
		ti.reffamnombres AS refFamiliarNombres,
		ti.reffamdireccion AS refFamiliarDireccion,
		ti.reffamtelefono + ' ' + ti.reffamcelular AS refFamiliarTelefonos,
		-- ti.idtablareffamtipovinculo,
		tt1.descripcion AS refFamiliarTipoVinculo,
		-- Datos referencia no familiar
		ti.refnofamapepaterno AS refNoFamiliarPaterno,
		ti.refnofamapematerno AS refNoFamiliarMaterno,
		ti.refnofamnombres AS refNoFamiliarNombres,
		ti.refnofamdireccion AS refNoFamiliarDireccion,
		ti.refnofamtelefono + ' ' + ti.refnofamcelular AS refNoFamiliarTelefonos,
		-- ti.idtablarefnofamtipovinculo,
		tt2.descripcion AS refNoFamiliarTipoVinculo,
		tp.id AS PaisID,
		ti.adicprofesion AS adicprofesion,
		ti.adiclugartrab AS adiclugartrab,
		ti.adictelefonotrab AS adictelefonotrab,
		ti.adicnrohijos AS adicnrohijos,
		ti.adichoravisita AS adichoravisita
	FROM
		tb_incorporacion ti (NOLOCK)
		LEFT JOIN tb_gerentezona tg (NOLOCK)
		ON tg.id = ti.idgerentezona 
		LEFT JOIN tb_consultora tc (NOLOCK)
		ON tc.id = ti.idconsultora 
		LEFT JOIN tb_pais tp (NOLOCK)
		ON tp.id = ti.idpais 
		LEFT JOIN tb_tabla tt1
		ON ti.idtablareffamtipovinculo = tt1.id
		LEFT JOIN tb_tabla tt2
		ON ti.idtablarefnofamtipovinculo = tt2.id
	WHERE
		(ti.id = @incorporacionID OR @incorporacionID IS NULL OR @incorporacionID = '')
END
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_incorporacion_obtener_por_region_zona]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_bel_incorporacion_obtener_por_region_zona]
	@regionCodigo VARCHAR(2) = '',
	@zonaCodigo VARCHAR(6) = '',
	@modoGrabacion BIT,
	@estadoVerifica BIT
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT DISTINCT
	       --tg.id AS gerenteID,
	       tg.codregion AS regionCodigo,
	       tg.codzona AS zonaCodigo,
	       ti.graba AS modoGrabacion,
	       ti.verifica AS estadoVerifica,
	       COUNT(ti.id) AS cantidad
--	       (
--	           SELECT COUNT(ti2.id)
--	           FROM   tb_incorporacion ti2(NOLOCK)
--	                  JOIN tb_gerentezona tg2(NOLOCK)
--	                       ON  tg2.id = ti2.idgerentezona
--	           WHERE  tg2.codregion = tg.codregion
--	                  AND tg2.codzona = tg.codzona
--	                  AND ti2.verifica = ti.verifica
--	       ) AS cantidad
	FROM   tb_incorporacion ti(NOLOCK)
	       JOIN tb_gerentezona tg(NOLOCK)
	            ON  tg.id = ti.idgerentezona
	WHERE  (
	           tg.codregion = @regionCodigo
	           OR @regionCodigo IS NULL
	           OR @regionCodigo = ''
	       )
	       AND (
	               tg.codzona = @zonaCodigo
	               OR @zonaCodigo IS NULL
	               OR @zonaCodigo = ''
	           )
	       AND (
	               ti.graba = @modoGrabacion
	               OR @modoGrabacion IS NULL
	           )
	       AND (
	               ti.verifica = @estadoVerifica
	               OR @estadoVerifica IS NULL
	           )
	GROUP BY 
	       tg.codregion,
	       tg.codzona,
	       ti.graba,
	       ti.verifica

END
GO
/****** Object:  StoredProcedure [dbo].[usp_bel_incorporacion_obtener]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery9.sql|7|0|C:\Users\prsbb\AppData\Local\Temp\1\~vsA190.sql
-- =============================================
-- Author:		vsanchez
-- Create date: 18/05/2011
-- Description:	Obtiene listado de incorporaciones y/o consultoras de acuerdo a parámetros de búsqueda enviados.
-- =============================================
CREATE PROCEDURE [dbo].[usp_bel_incorporacion_obtener]
	@regionCodigo			CHAR(2) = '',
	@zonaCodigo				CHAR(6) = '',
	@fechaInscripcion		SMALLDATETIME = '',
	@campanhaInscripcion	VARCHAR(6) = '',
	@numeroDocumento		VARCHAR(18) = '',
	@consultoraCodigo		VARCHAR(15)	= '',
	@apellidoPaterno		VARCHAR(30) = '',
	@apellidoMaterno		VARCHAR(30) = '',
	@nombres				VARCHAR(30) = '',
	@estadoVerificado		BIT,
	@modoGrabacion			BIT
AS
BEGIN
	SET NOCOUNT ON;
    SELECT
		ti.id AS incorporacionID,
		tc.id AS consultoraID,
		tg.codregion AS region,
		tg.codzona AS zona,
		convert(varchar(10), ti.fecha, 103) AS fechaIncorporacion,
		tc.campanhainsc AS campanhaInscripcion,
		ti.nrodoc AS numeroDocumento,
		ti.apepaterno AS apellidoPaterno,
		ti.apematerno AS apellidoMaterno,
		ti.nombres AS nombres,
		tc.cod AS consultoraCodigo,
		ti.verifica AS estadoVerificado,
		ti.estado AS estadoActivo,
		'I' AS tipo
	FROM [db_bcaribe].[dbo].[tb_incorporacion] ti (NOLOCK)
	JOIN [db_bcaribe].[dbo].[tb_gerentezona] tg (NOLOCK)
	  ON tg.id = ti.idgerentezona
	LEFT JOIN [db_bcaribe].[dbo].[tb_consultora] tc (NOLOCK)
		ON tc.nrodoc = ti.nrodoc
    WHERE
		(tg.codregion = @regionCodigo OR @regionCodigo IS NULL OR @regionCodigo = '')
	AND
		(tg.codzona = @zonaCodigo OR @zonaCodigo IS NULL OR @zonaCodigo = '')
	AND
		(ti.fecha = @fechaInscripcion OR @fechaInscripcion IS NULL OR @fechaInscripcion = '')
	AND
		(tc.campanhainsc LIKE '%'+@campanhaInscripcion+'%' OR @campanhaInscripcion IS NULL OR @campanhaInscripcion = '')
	AND
		(ti.nrodoc = @numeroDocumento OR @numeroDocumento IS NULL OR @numeroDocumento = '')
	AND
		(tc.cod LIKE '%'+@consultoraCodigo+'%' OR @consultoraCodigo IS NULL OR @consultoraCodigo = '' )
	AND
		(ti.apepaterno LIKE '%'+@apellidoPaterno+'%' or @apellidoPaterno is null) 
	AND
	    (ti.apematerno LIKE '%'+@apellidoMaterno+'%' or @apellidoMaterno is null) 
	AND
	    (ti.nombres LIKE '%'+@nombres+'%' or @nombres is null) 
	AND
		(ti.verifica = @estadoVerificado OR @estadoVerificado IS NULL)
	AND
		(ti.graba = @modoGrabacion OR @modoGrabacion IS NULL);

END
GO
/****** Object:  StoredProcedure [dbo].[SP_USUARIO_OBTENER]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_USUARIO_OBTENER]
	@paisID		INT,
	@nombres	VARCHAR(99),
	@perfil		INT,
	@estado		BIT -- valor booleano
AS
BEGIN
	SET NOCOUNT ON;

    IF @estado IS NOT NULL
		BEGIN
			IF @perfil <> 0
				BEGIN
					SELECT
						tu.id AS usuarioID,
						tu.idpais AS paisID,
						tu.idtablaperfil AS perfilID,
						UPPER(LEFT(tt.descripcion, 1)) + LOWER(SUBSTRING(tt.descripcion, 2, LEN(tt.descripcion))) AS perfilDescripcion,
						tu.codigo AS usuarioNombre,
						tu.clave AS usuarioClave,
						tu.nombre AS usuarioNombres,
						tu.estado AS estado
					FROM
						tb_usuario tu,
						tb_tabla tt
					WITH (NOLOCK)
					WHERE
						tt.id = tu.idtablaperfil
					AND
						tu.idpais = @paisID
					AND
						tu.nombre LIKE '%' + @nombres + '%'
					AND
						tu.idtablaperfil = @perfil
					AND
						tu.estado = @estado
				END
			ELSE
				BEGIN
					SELECT
						tu.id AS usuarioID,
						tu.idpais AS paisID,
						tu.idtablaperfil AS perfilID,
						UPPER(LEFT(tt.descripcion, 1)) + LOWER(SUBSTRING(tt.descripcion, 2, LEN(tt.descripcion))) AS perfilDescripcion,
						tu.codigo AS usuarioNombre,
						tu.clave AS usuarioClave,
						tu.nombre AS usuarioNombres,
						tu.estado AS estado
					FROM
						tb_usuario tu,
						tb_tabla tt
					WITH (NOLOCK)
					WHERE
						tt.id = tu.idtablaperfil
					AND
						tu.idpais = @paisID
					AND
						tu.nombre LIKE '%' + @nombres + '%'
					AND
						tu.estado = @estado
				END
		END
	ELSE
		BEGIN
			IF @perfil <> 0
				BEGIN
					SELECT
						tu.id AS usuarioID,
						tu.idpais AS paisID,
						tu.idtablaperfil AS perfilID,
						UPPER(LEFT(tt.descripcion, 1)) + LOWER(SUBSTRING(tt.descripcion, 2, LEN(tt.descripcion))) AS perfilDescripcion,
						tu.codigo AS usuarioNombre,
						tu.clave AS usuarioClave,
						tu.nombre AS usuarioNombres,
						tu.estado AS estado
					FROM
						tb_usuario tu,
						tb_tabla tt
					WITH (NOLOCK)
					WHERE
						tt.id = tu.idtablaperfil
					AND
						tu.idpais = @paisID
					AND
						tu.nombre LIKE '%' + @nombres + '%'
					AND
						tu.idtablaperfil = @perfil
				END
			ELSE
				BEGIN
					SELECT
						tu.id AS usuarioID,
						tu.idpais AS paisID,
						tu.idtablaperfil AS perfilID,
						UPPER(LEFT(tt.descripcion, 1)) + LOWER(SUBSTRING(tt.descripcion, 2, LEN(tt.descripcion))) AS perfilDescripcion,
						tu.codigo AS usuarioNombre,
						tu.clave AS usuarioClave,
						tu.nombre AS usuarioNombres,
						tu.estado AS estado
					FROM
						tb_usuario tu,
						tb_tabla tt
					WITH (NOLOCK)
					WHERE
						tt.id = tu.idtablaperfil
					AND
						tu.idpais = @paisID
					AND
						tu.nombre LIKE '%' + @nombres + '%'
				END
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_USUARIO_CREAR]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_USUARIO_CREAR]
	@paisID			int,
	@perfilID		int,
	@usuario		varchar(15),
	@clave			varchar(15),
	@nombres		varchar(100),
	@estado			bit
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO 
		tb_usuario
	VALUES
		(
			@paisID,
			@perfilID,
			@usuario,
			@clave,
			@nombres,
			@estado
		)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_USUARIO_CARGAR]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_USUARIO_CARGAR]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_USUARIO_ACTUALIZAR]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_USUARIO_ACTUALIZAR]
	@usuarioID		int,
	@perfilID		int,
	@nombres		varchar(100),
	@estado			bit
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE 
		tb_usuario
	SET
		idtablaperfil = @perfilID,
		nombre = @nombres,
		estado = @estado
	WHERE
		id = @usuarioID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_WS_REGISTRO_INCORPORACION]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
EXEC SP_WS_REGISTRO_INCORPORACION
@APPID = '0xcc76ecb46671657aL',
@IDPAIS = '8',
@PIN = '5738A3C7',
@IMSI = 'DOM482683524852',
@CODIGOZONA = '1111',
@CODIGOTERRITORIO = '',
@CODIGOCONSULTORARECOMIENDA = '',
@FECHA = '',
@PRIMERNOMBRE = 'nombre9a',  
@SEGUNDONOMBRE = 'nombre9b',
@APELLIDOPATERNO = 'apepaterno9',
@APELLIDOMATERNO = 'apematerno9',
@NRODOCUMENTO = '99999',
@TELEFONOCASA = '',
@TELEFONOCELULAR = '',
@CORREOELECTRONICO = '', 
@IDCONTACTO = '1', 
@IDOTRAMARCA = '1', 
@IDESTADOCIVIL = '1', 
@IDNIVELEDUCATIVO = '1', 
@FECHANACIMIENTO = '', 
@SOLICITANTE_DIRECCION = '', 
@SOLICITANTE_CODIGOPOSTAL = '', 
@SOLICITANTE_REFERENCIA = '', 
@SOLICITANTE_DIVISIONPOLITICA1 = '', 
@SOLICITANTE_DIVISIONPOLITICA2 = '', 
@ENTREGA_DIRECCION = '', 
@ENTREGA_CODIGOPOSTAL = '', 
@ENTREGA_REFERENCIA = '', 
@ENTREGA_DIVISIONPOLITICA = '', 
@REFFAM_NOMBRES = '', 
@REFFAM_APELLIDOPATERNO = '', 
@REFFAM_APELLIDOMATERNO = '', 
@REFFAM_DIRECCION = '', 
@REFFAM_TELEFONO = '', 
@REFFAM_CELULAR = '', 
@REFFAM_IDVINCULO = '1', 
@REFNOFAM_NOMBRES = '', 
@REFNOFAM_APELLIDOPATERNO = '', 
@REFNOFAM_APELLIDOMATERNO = '', 
@REFNOFAM_DIRECCION = '', 
@REFNOFAM_TELEFONO = '', 
@REFNOFAM_CELULAR = '', 
@REFNOFAM_IDVINCULO = '5', 
@ADICIONAL_PROFESION = '', 
@ADICIONAL_LUGARTRABAJO = '', 
@ADICIONAL_TELEFONOTRABAJO = '', 
@ADICIONAL_HORAVISITA = '', 
@ADICIONAL_NROHIJOS = '', 
@ADICIONAL_NROINFANTES = '', 
@ADICIONAL_NROESCOLARES = '', 
@ADICIONAL_NRONIVELSUPERIOR = '', 
@ADICIONAL_NROADULTOS = '', 
@RECORD_PIN = '', 
@RECORD_IMSI = '', 
@RECORD_LONGITUD = '', 
@RECORD_LATITUD = '', 
@RECORD_MARGEN = '', 
@RECORD_NROSATELITES = '', 
@RECORD_OBSERVACION = '', 
@RECORD_FECHAVISITA = '', 
@TIPOGRABACION = '1'
*/

CREATE PROCEDURE [dbo].[SP_WS_REGISTRO_INCORPORACION]
@APPID CHAR(19),
@IDPAIS INT,
@PIN CHAR(20),
@IMSI CHAR(20),
@CODIGOZONA CHAR(6),
@CODIGOTERRITORIO CHAR(3),
@CODIGOCONSULTORARECOMIENDA CHAR(15),
@FECHA CHAR(12),
@PRIMERNOMBRE VARCHAR(30),
@SEGUNDONOMBRE VARCHAR(30),
@APELLIDOPATERNO VARCHAR(30),
@APELLIDOMATERNO VARCHAR(30),
@NRODOCUMENTO VARCHAR(18),
@TELEFONOCASA CHAR(15),
@TELEFONOCELULAR CHAR(15),
@CORREOELECTRONICO CHAR(40), 
@IDCONTACTO INT,
@IDOTRAMARCA INT,
@IDESTADOCIVIL INT,
@IDNIVELEDUCATIVO INT,
@FECHANACIMIENTO CHAR(12),
@SOLICITANTE_DIRECCION VARCHAR(100),
@SOLICITANTE_CODIGOPOSTAL VARCHAR(10),
@SOLICITANTE_REFERENCIA VARCHAR(100),
@SOLICITANTE_DIVISIONPOLITICA1 VARCHAR(50),
@SOLICITANTE_DIVISIONPOLITICA2 VARCHAR(50),
@ENTREGA_DIRECCION VARCHAR(100),
@ENTREGA_CODIGOPOSTAL VARCHAR(10),
@ENTREGA_REFERENCIA VARCHAR(100),
@ENTREGA_DIVISIONPOLITICA VARCHAR(50),
@REFFAM_NOMBRES VARCHAR(30),
@REFFAM_APELLIDOPATERNO VARCHAR(30),
@REFFAM_APELLIDOMATERNO VARCHAR(30),
@REFFAM_DIRECCION VARCHAR(100),
@REFFAM_TELEFONO CHAR(15),
@REFFAM_CELULAR CHAR(15),
@REFFAM_IDVINCULO INT,
@REFNOFAM_NOMBRES VARCHAR(30),
@REFNOFAM_APELLIDOPATERNO VARCHAR(30),
@REFNOFAM_APELLIDOMATERNO VARCHAR(30),
@REFNOFAM_DIRECCION VARCHAR(100),
@REFNOFAM_TELEFONO CHAR(15), 
@REFNOFAM_CELULAR CHAR(15),
@REFNOFAM_IDVINCULO INT,
@ADICIONAL_PROFESION VARCHAR(100),
@ADICIONAL_LUGARTRABAJO VARCHAR(50),
@ADICIONAL_TELEFONOTRABAJO CHAR(15),
@ADICIONAL_HORAVISITA CHAR(4),
@ADICIONAL_NROHIJOS INT,
@ADICIONAL_NROINFANTES INT,
@ADICIONAL_NROESCOLARES INT,
@ADICIONAL_NRONIVELSUPERIOR INT,
@ADICIONAL_NROADULTOS INT,
@RECORD_PIN CHAR(20),
@RECORD_IMSI CHAR(20),
@RECORD_LONGITUD VARCHAR(20),
@RECORD_LATITUD VARCHAR(20),
@RECORD_MARGEN CHAR(9),
@RECORD_NROSATELITES INT,
@RECORD_OBSERVACION VARCHAR(200),
@RECORD_FECHAVISITA VARCHAR(12),
@TIPOGRABACION BIT
AS
SET NOCOUNT ON
BEGIN
	DECLARE @_TRUE BIT
	SET @_TRUE = 'true'
	DECLARE @_ERROR CHAR(2)
	SET @_ERROR = '0|'
	IF @NRODOCUMENTO <> ''
		BEGIN
			DECLARE @_TIPOTABLA_APPID INT
			SET @_TIPOTABLA_APPID = '1'
			DECLARE @_APPID CHAR(19)
			SET @_APPID = (SELECT tb_tabla.descripcion FROM tb_tabla WHERE tb_tabla.id = @_TIPOTABLA_APPID AND tb_tabla.estado = @_TRUE)
			IF @APPID = @_APPID
				BEGIN
					IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
						BEGIN
							DECLARE @_UNO INT
							SET @_UNO = '1'
							DECLARE @_GERENTEZONA_PIN_IMSI_CONTA INT
							SET @_GERENTEZONA_PIN_IMSI_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
							IF @_GERENTEZONA_PIN_IMSI_CONTA = @_UNO
								BEGIN
									DECLARE @_GERENTEZONA_ESTADO BIT
									SET @_GERENTEZONA_ESTADO = (SELECT tb_gerentezona.estado FROM tb_gerentezona WHERE (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
									IF @_GERENTEZONA_ESTADO = @_TRUE
										BEGIN
											DECLARE @_CERO INT
											SET @_CERO = '0'
											IF EXISTS (SELECT 1 FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE (tb_gerentezona.idpais = @IDPAIS) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI) AND (tb_pais.id <> @_CERO) AND (tb_pais.estado = @_TRUE))
												BEGIN
													DECLARE @_GERENTEZONA_PAIS_CONTA INT
													SET @_GERENTEZONA_PAIS_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona INNER JOIN tb_pais ON tb_gerentezona.idpais = tb_pais.id WHERE (tb_gerentezona.idpais = @IDPAIS) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI) AND (tb_pais.estado = @_TRUE))
													IF @_GERENTEZONA_PAIS_CONTA = @_UNO
														BEGIN
															DECLARE @_EXITO CHAR(2)
															SET @_EXITO = '1|'
															IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE (tb_gerentezona.codzona = SUBSTRING(@CODIGOZONA, 3, LEN(@CODIGOZONA))) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
																BEGIN
																	DECLARE @_GERENTEZONA_CODZONA_CONTA INT
																	SET @_GERENTEZONA_CODZONA_CONTA = (SELECT COUNT(tb_gerentezona.id) FROM tb_gerentezona WHERE (tb_gerentezona.codzona = SUBSTRING(@CODIGOZONA, 3, LEN(@CODIGOZONA))) AND (tb_gerentezona.pin = @PIN) AND (tb_gerentezona.imsi = @IMSI))
																	IF @_GERENTEZONA_CODZONA_CONTA = @_UNO
																		BEGIN
																		    IF EXISTS (SELECT DISTINCT RTRIM(LTRIM(CODSECCION)) + RTRIM(LTRIM(CODTERRITORIO)) FROM db_bcaribe.dbo.TB_CONSULTORA WHERE CODZONA = @CODIGOZONA AND (RTRIM(LTRIM(CODSECCION)) + RTRIM(LTRIM(CODTERRITORIO))) = @CODIGOTERRITORIO)
																				BEGIN
																					DECLARE @_IDGERENTEZONA INT
																					SET @_IDGERENTEZONA = (SELECT tb_gerentezona.id FROM tb_gerentezona WHERE tb_gerentezona.codzona = SUBSTRING(@CODIGOZONA, 3, LEN(@CODIGOZONA)) AND tb_gerentezona.pin = @PIN AND tb_gerentezona.imsi = @IMSI)
																					DECLARE @_IDCONSULTORA INT	
																					SET @_IDCONSULTORA = @_CERO						
																					DECLARE @_TIPOTABLA_CONTACTO INT
																					SET @_TIPOTABLA_CONTACTO = '3'
																					DECLARE @_TIPOTABLA_OTRAMARCA INT
																					SET @_TIPOTABLA_OTRAMARCA = '4'
																					DECLARE @_TIPOTABLA_ESTADOCIVIL INT
																					SET @_TIPOTABLA_ESTADOCIVIL = '5'
																					DECLARE @_TIPOTABLA_NIVELEDUCATIVO INT
																					SET @_TIPOTABLA_NIVELEDUCATIVO = '6'
																					DECLARE @_TIPOTABLA_VINCULO INT
																					SET @_TIPOTABLA_VINCULO = '7'
																					DECLARE	@_IDCONTACTO INT
																					SET @_IDCONTACTO = (SELECT tb_tabla.id FROM tb_tabla WHERE tb_tabla.cod = @IDCONTACTO AND tb_tabla.idtipotabla = @_TIPOTABLA_CONTACTO)		
																					DECLARE @_IDOTRAMARCA INT
																					SET @_IDOTRAMARCA = (SELECT tb_tabla.id FROM tb_tabla WHERE tb_tabla.cod = @IDOTRAMARCA AND tb_tabla.idtipotabla = @_TIPOTABLA_OTRAMARCA)
																					DECLARE @_IDESTADOCIVIL INT
																					SET @_IDESTADOCIVIL = (SELECT tb_tabla.id FROM tb_tabla WHERE tb_tabla.cod = @IDESTADOCIVIL AND tb_tabla.idtipotabla = @_TIPOTABLA_ESTADOCIVIL)
																					DECLARE	@_IDNIVELEDUCATIVO INT
																					SET @_IDNIVELEDUCATIVO = (SELECT tb_tabla.id FROM tb_tabla WHERE tb_tabla.cod = @IDNIVELEDUCATIVO AND tb_tabla.idtipotabla = @_TIPOTABLA_NIVELEDUCATIVO)
																					DECLARE @_REFFAM_IDVINCULO INT
																					SET @_REFFAM_IDVINCULO = (SELECT tb_tabla.id FROM tb_tabla WHERE tb_tabla.cod = @REFFAM_IDVINCULO AND tb_tabla.idtipotabla = @_TIPOTABLA_VINCULO)
																					DECLARE @_REFNOFAM_IDVINCULO INT
																					SET @_REFNOFAM_IDVINCULO = (SELECT tb_tabla.id FROM tb_tabla WHERE tb_tabla.cod = @REFNOFAM_IDVINCULO AND tb_tabla.idtipotabla = @_TIPOTABLA_VINCULO)
																					DECLARE @_NOMBRES VARCHAR(30)
																					SET @_NOMBRES = @PRIMERNOMBRE + SPACE(1) + @SEGUNDONOMBRE
																					IF @ADICIONAL_NROHIJOS = ''
																						BEGIN
																							SET @ADICIONAL_NROHIJOS = '0'
																						END
																					IF @ADICIONAL_NROINFANTES = ''
																						BEGIN
																							SET @ADICIONAL_NROINFANTES = '0'
																						END
																					IF @ADICIONAL_NROESCOLARES = ''
																						BEGIN
																							SET @ADICIONAL_NROESCOLARES = '0'
																						END
																					IF @ADICIONAL_NRONIVELSUPERIOR = ''
																						BEGIN
																							SET @ADICIONAL_NRONIVELSUPERIOR = '0'
																						END
																					IF @ADICIONAL_NROADULTOS = ''
																						BEGIN
																							SET @ADICIONAL_NROADULTOS = '0'
																						END
																					IF @RECORD_NROSATELITES = ''
																						BEGIN
																							SET @RECORD_NROSATELITES = '0'
																						END
																						
																					-- asignando fecha de nacimiento
																					
																					DECLARE @_FECHANACIMIENTO SMALLDATETIME
																					IF @FECHANACIMIENTO = ''
																						BEGIN
																							SET @FECHANACIMIENTO = '199001010000'
																							SET @_FECHANACIMIENTO = CONVERT(SMALLDATETIME,SUBSTRING(@FECHANACIMIENTO,1,8)+SPACE(1)+SUBSTRING(@FECHANACIMIENTO,9,2) + ':' + SUBSTRING(@FECHANACIMIENTO,11,2))
																						END	
																					ELSE
																						BEGIN
																							SET @_FECHANACIMIENTO = CONVERT(SMALLDATETIME,SUBSTRING(@FECHANACIMIENTO,1,8)+SPACE(1)+SUBSTRING(@FECHANACIMIENTO,9,2))
																						END
																					
																					-- asignando fecha de visita
																					DECLARE @_RECORD_FECHAVISITA SMALLDATETIME
																					IF @RECORD_FECHAVISITA = ''
																						BEGIN
																							SET @RECORD_FECHAVISITA = '199001010000'
																							SET @_RECORD_FECHAVISITA = CONVERT(SMALLDATETIME,SUBSTRING(@RECORD_FECHAVISITA,1,8)+SPACE(1)+SUBSTRING(@RECORD_FECHAVISITA,9,2) + ':' + SUBSTRING(@RECORD_FECHAVISITA,11,2))
																						END	
																					ELSE
																						BEGIN
																							SET @_RECORD_FECHAVISITA = CONVERT(SMALLDATETIME,SUBSTRING(@RECORD_FECHAVISITA,1,8)+SPACE(1)+SUBSTRING(@RECORD_FECHAVISITA,9,2))
																						END
																					
																					--asignando hora
																					DECLARE @_ADICIONAL_HORAVISITA SMALLDATETIME
																					DECLARE @_ADICIONAL_HORAVISITA_yyyymmddHHMM CHAR(12)
																					
																					IF @ADICIONAL_HORAVISITA = ''
																						BEGIN
																							SET @ADICIONAL_HORAVISITA = '0000'
																							SET	@_ADICIONAL_HORAVISITA_yyyymmddHHMM = '19000101' + @ADICIONAL_HORAVISITA
																							SET @_ADICIONAL_HORAVISITA = CONVERT(SMALLDATETIME,SUBSTRING(@_ADICIONAL_HORAVISITA_yyyymmddHHMM,1,8)+SPACE(1)+SUBSTRING(@_ADICIONAL_HORAVISITA_yyyymmddHHMM,9,2) + ':' + SUBSTRING(@_ADICIONAL_HORAVISITA_yyyymmddHHMM,11,2))
																						END	
																					ELSE
																						BEGIN
																							SET	@_ADICIONAL_HORAVISITA_yyyymmddHHMM = '19000101' + @ADICIONAL_HORAVISITA
																							SET @_ADICIONAL_HORAVISITA = CONVERT(SMALLDATETIME,SUBSTRING(@_ADICIONAL_HORAVISITA_yyyymmddHHMM,1,8)+SPACE(1)+SUBSTRING(@_ADICIONAL_HORAVISITA_yyyymmddHHMM,9,2) + ':' + SUBSTRING(@_ADICIONAL_HORAVISITA_yyyymmddHHMM,11,2))
																						END
																					
																					-- asignando fecha
																					DECLARE @_FECHA SMALLDATETIME
																					
																					IF @FECHA = ''
																						BEGIN
																							SET @FECHA = '190001010000'
																							SET @_FECHA = CONVERT(SMALLDATETIME,SUBSTRING(@FECHA,1,8)+SPACE(1)+SUBSTRING(@FECHA,9,2) + ':' + SUBSTRING(@FECHA,11,2))
																						END	
																					ELSE
																						BEGIN
																							SET @_FECHA = CONVERT(SMALLDATETIME,SUBSTRING(@FECHA,1,8)+SPACE(1)+SUBSTRING(@FECHA,9,2))
																						END
																					
																					DECLARE @_ESTADO BIT
																					IF @TIPOGRABACION = @_TRUE
																						BEGIN
																							SET @_ESTADO = 'true'
																						END
																					ELSE
																						BEGIN
																							SET @_ESTADO = 'false'
																						END	
																						
																				    DECLARE @_ERROR_CONS_OBLI BIT
																				    SET @_ERROR_CONS_OBLI = 'false'
																						
																					IF (@_IDCONTACTO=1 AND EXISTS (SELECT 1 FROM tb_consultora where tb_consultora.cod = @CODIGOCONSULTORARECOMIENDA))
																						BEGIN
																						     SET @_ERROR_CONS_OBLI = 'true'
																						END	
																						
																					IF @_ERROR_CONS_OBLI = 'false'
																						BEGIN	
																							
																							IF NOT EXISTS (SELECT 1 FROM tb_consultora WHERE tb_consultora.nrodoc = @NRODOCUMENTO)
																								BEGIN
																									IF NOT EXISTS (SELECT 1 FROM tb_incorporacion WHERE tb_incorporacion.nrodoc = @NRODOCUMENTO)
																										BEGIN
																											INSERT INTO tb_incorporacion 
																											(
																												idpais,
																												idgerentezona,
																												idconsultora,
																												idtablacontacto,
																												idtablaotramarca,
																												idtablaestadocivil,
																												idtablaniveleducativo,
																												idtablareffamtipovinculo,
																												idtablarefnofamtipovinculo,
																												codterritorio,
																												codconsurecom,
																												apepaterno,
																												apematerno,
																												nombres,
																												nrodoc,
																												telefcasa,
																												telefcelular,
																												email,
																												fechnac,
																												solicdireccion,
																												soliccodpostal,
																												solicreferencia,
																												solicdivpolitica1,
																												solicdivpolitica2,
																												entregdireccion,
																												entregcodpostal,
																												entregreferencia,
																												entregdivpolitica,
																												reffamapepaterno,
																												reffamapematerno,
																												reffamnombres,
																												reffamdireccion,
																												reffamtelefono,
																												reffamcelular,
																												refnofamapepaterno,
																												refnofamapematerno,
																												refnofamnombres,
																												refnofamdireccion,
																												refnofamtelefono,
																												refnofamcelular,
																												adicprofesion,
																												adiclugartrab,
																												adictelefonotrab,
																												adichoravisita,
																												adicnrohijos,
																												adicnroinfantes,
																												adicnroescolares,
																												adicnronivsuperior,
																												adicnroadultos, 
																												recpin,
																												recimsi,
																												reclongitud,
																												reclatitud,
																												recmargen,
																												recnrosatelites,
																												recobservacion,
																												recfechvisita,
																												fecha,
																												graba,	
																												estado
																											)
																											VALUES
																											(
																												@IDPAIS,
																												@_IDGERENTEZONA,
																												null, --@_IDCONSULTORA,
																												@_IDCONTACTO,
																												@_IDOTRAMARCA,
																												@_IDESTADOCIVIL,
																												@_IDNIVELEDUCATIVO,
																												@_REFFAM_IDVINCULO,
																												@_REFNOFAM_IDVINCULO,
																												@CODIGOTERRITORIO,
																												@CODIGOCONSULTORARECOMIENDA,
																												@APELLIDOPATERNO,
																												@APELLIDOMATERNO,
																												@_NOMBRES,
																												@NRODOCUMENTO,
																												@TELEFONOCASA,
																												@TELEFONOCELULAR,
																												@CORREOELECTRONICO,
																												@_FECHANACIMIENTO,
																												@SOLICITANTE_DIRECCION,
																												@SOLICITANTE_CODIGOPOSTAL,
																												@SOLICITANTE_REFERENCIA,
																												@SOLICITANTE_DIVISIONPOLITICA1,
																												@SOLICITANTE_DIVISIONPOLITICA2,
																												@ENTREGA_DIRECCION,
																												@ENTREGA_CODIGOPOSTAL,
																												@ENTREGA_REFERENCIA, 
																												@ENTREGA_DIVISIONPOLITICA, 
																												@REFFAM_APELLIDOPATERNO,
																												@REFFAM_APELLIDOMATERNO,
																												@REFFAM_NOMBRES,
																												@REFFAM_DIRECCION,
																												@REFFAM_TELEFONO,
																												@REFFAM_CELULAR,
																												@REFNOFAM_APELLIDOPATERNO,
																												@REFNOFAM_APELLIDOMATERNO,
																												@REFNOFAM_NOMBRES,
																												@REFNOFAM_DIRECCION,
																												@REFNOFAM_TELEFONO,
																												@REFNOFAM_CELULAR,
																												@ADICIONAL_PROFESION,
																												@ADICIONAL_LUGARTRABAJO,
																												@ADICIONAL_TELEFONOTRABAJO,
																												@_ADICIONAL_HORAVISITA,
																												@ADICIONAL_NROHIJOS,
																												@ADICIONAL_NROINFANTES,
																												@ADICIONAL_NROESCOLARES,
																												@ADICIONAL_NRONIVELSUPERIOR,
																												@ADICIONAL_NROADULTOS,
																												@RECORD_PIN,
																												@RECORD_IMSI,								
																												@RECORD_LONGITUD,
																												@RECORD_LATITUD,
																												@RECORD_MARGEN,
																												@RECORD_NROSATELITES,
																												@RECORD_OBSERVACION, 
																												@_RECORD_FECHAVISITA, 
																												@_FECHA,
																												@TIPOGRABACION,
																												@_ESTADO	
																											)
																											SELECT @_EXITO AS 'Mensaje','Grabación exitosa' AS 'Detalle'
																										END
																									ELSE
																										BEGIN
																											DECLARE @_TIPOGRABACION BIT
																											SET @_TIPOGRABACION = (SELECT tb_incorporacion.graba FROM tb_incorporacion WHERE tb_incorporacion.nrodoc = @NRODOCUMENTO)	
																											IF @_TIPOGRABACION <> @_TRUE
																												BEGIN
																													UPDATE tb_incorporacion
																													SET
																													idpais = @IDPAIS,
																													idgerentezona = @_IDGERENTEZONA,
																													idconsultora = @_IDCONSULTORA,
																													idtablacontacto = @_IDCONTACTO,
																													idtablaotramarca = @_IDOTRAMARCA,
																													idtablaestadocivil = @_IDESTADOCIVIL,
																													idtablaniveleducativo = @_IDNIVELEDUCATIVO,
																													idtablareffamtipovinculo = @_REFFAM_IDVINCULO,
																													idtablarefnofamtipovinculo = @_REFNOFAM_IDVINCULO,
																													codterritorio = @CODIGOTERRITORIO,
																													codconsurecom = @CODIGOCONSULTORARECOMIENDA,
																													apepaterno = @APELLIDOPATERNO,
																													apematerno = @APELLIDOMATERNO,
																													nombres = @_NOMBRES,
																													nrodoc = @NRODOCUMENTO,
																													telefcasa = @TELEFONOCASA,
																													telefcelular = @TELEFONOCELULAR,
																													email = @CORREOELECTRONICO,
																													fechnac = @_FECHANACIMIENTO,
																													solicdireccion = @SOLICITANTE_DIRECCION,
																													soliccodpostal = @SOLICITANTE_CODIGOPOSTAL,
																													solicreferencia = @SOLICITANTE_REFERENCIA,
																													solicdivpolitica1 = @SOLICITANTE_DIVISIONPOLITICA1,
																													solicdivpolitica2 = @SOLICITANTE_DIVISIONPOLITICA2,
																													entregdireccion = @ENTREGA_DIRECCION,
																													entregcodpostal = @ENTREGA_CODIGOPOSTAL,
																													entregreferencia = @ENTREGA_REFERENCIA, 
																													entregdivpolitica = @ENTREGA_DIVISIONPOLITICA, 
																													reffamapepaterno = @REFFAM_APELLIDOPATERNO,
																													reffamapematerno = @REFFAM_APELLIDOMATERNO,
																													reffamnombres = @REFFAM_NOMBRES,
																													reffamdireccion = @REFFAM_DIRECCION,
																													reffamtelefono = @REFFAM_TELEFONO,
																													reffamcelular = @REFFAM_CELULAR,
																													refnofamapepaterno = @REFNOFAM_APELLIDOPATERNO,
																													refnofamapematerno = @REFNOFAM_APELLIDOMATERNO,
																													refnofamnombres = @REFNOFAM_NOMBRES,
																													refnofamdireccion = @REFNOFAM_DIRECCION,
																													refnofamtelefono = @REFNOFAM_TELEFONO,
																													refnofamcelular = @REFNOFAM_CELULAR,
																													adicprofesion = @ADICIONAL_PROFESION,
																													adiclugartrab = @ADICIONAL_LUGARTRABAJO,
																													adictelefonotrab = @ADICIONAL_TELEFONOTRABAJO,
																													adichoravisita = @_ADICIONAL_HORAVISITA,
																													adicnrohijos = @ADICIONAL_NROHIJOS,
																													adicnroinfantes = @ADICIONAL_NROINFANTES,
																													adicnroescolares = @ADICIONAL_NROESCOLARES,
																													adicnronivsuperior = @ADICIONAL_NRONIVELSUPERIOR,
																													adicnroadultos = @ADICIONAL_NROADULTOS,
																													recpin = @RECORD_PIN,
																													recimsi = @RECORD_IMSI,
																													reclongitud = @RECORD_LONGITUD,
																													reclatitud = @RECORD_LATITUD,
																													recmargen = @RECORD_MARGEN,
																													recnrosatelites = @RECORD_NROSATELITES,
																													recobservacion = @RECORD_OBSERVACION, 
																													recfechvisita = @_RECORD_FECHAVISITA, 
																													fecha = @_FECHA,
																													graba = @TIPOGRABACION,
																													estado = @_ESTADO
																													WHERE nrodoc = @NRODOCUMENTO
																													SELECT @_EXITO AS 'Mensaje','Grabación exitosa' AS 'Detalle'
																												END
																											ELSE
																												BEGIN
																													SELECT @_ERROR AS 'Mensaje','No se puede modificar un grabación hecha en modo real' AS 'Detalle'
																												END
																										END	
																								END
																					
																					ELSE
																						BEGIN
																							SELECT @_ERROR AS 'Mensaje','El documento ya está registrado como consultora' AS 'Detalle'
																						END
																					
																						END
																					ELSE
																					    BEGIN
																							SELECT @_ERROR AS 'Mensaje','El código de  la consultora de referencia' AS 'Detalle'
																					    END
																						
																				END
																			ELSE
																				BEGIN
																					SELECT @_ERROR AS 'Mensaje','El código de territorio no es correcto' AS 'Detalle'
																				END
																		END
																	ELSE
																		BEGIN
																			SELECT @_ERROR AS 'Mensaje','Código de zona asignado a más de una gerente de zona' AS 'Detalle'
																		END
																END
															ELSE
																BEGIN
																	SELECT @_ERROR AS 'Mensaje','´Código de gerente de zona incorrecto' AS 'Detalle'
																END
														END
													ELSE
														BEGIN
															SELECT @_ERROR AS 'Mensaje','Gerente de zona pertenece a más de un país' AS 'Detalle'
														END			
												END
											ELSE
												BEGIN
													SELECT @_ERROR AS 'Mensaje','País de gerente de zona incorrecto' AS 'Detalle'
												END
										END
									ELSE
										BEGIN
											SELECT @_ERROR AS 'Mensaje','Gerente de zona desactivada' AS 'Detalle'
										END
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry asignados a más de una gerente de zona' AS 'Detalle'
								END
						END
					ELSE
						BEGIN
							IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.pin = @PIN)
								BEGIN
									SELECT @_ERROR AS 'Mensaje','IMSI del BlackBerry de gerente de zona incorrecto' AS 'Detalle'	
								END
							ELSE
								BEGIN
									IF EXISTS (SELECT 1 FROM tb_gerentezona WHERE tb_gerentezona.imsi = @IMSI)
										BEGIN
											SELECT @_ERROR AS 'Mensaje','PIN del BlackBerry de gerente de zona incorrecto' AS 'Detalle'
										END
									ELSE
										BEGIN
											SELECT @_ERROR AS 'Mensaje','PIN e IMSI del BlackBerry de gerente de zona incorrectos' AS 'Detalle'
										END	
								END	
						END
				END
			ELSE
				BEGIN
					SELECT @_ERROR AS 'Mensaje','Código APPID incorrecto' AS 'Detalle'
				END		
		END
	ELSE
		BEGIN
			SELECT @_ERROR AS 'Mensaje','Documento de identidad vacío' AS 'Detalle'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MANT_REGISTRO_CONSULTORA]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
EXEC SP_MANT_REGISTRO_CONSULTORA
@IDPAIS = '8',
@CODCIA = '',
@CODIGO = 'DD',
@NRODOC = '44444',
@NOMBRES = '',
@APEPATERNO = '',
@APEMATERNO = '',
@TELEFONO1 = '',
@TELEFONO2 = '',
@EMAIL = '',
@PASARPED = '',
@MOTIVORET = '',
@CODREGION = '',
@CODZONA = '',
@CODSECCION = '',
@CODTERRITORIO = '',
@CAMPANHAINSC = '',
@CAMPANHAPRICO = ''
*/

CREATE PROCEDURE [dbo].[SP_MANT_REGISTRO_CONSULTORA]
@IDPAIS INT,
@CODCIA CHAR(2),
@CODIGO CHAR(15),
@NRODOC CHAR(18),
@NOMBRES VARCHAR(30),
@APEPATERNO VARCHAR(30),
@APEMATERNO VARCHAR(30),
@TELEFONO1 CHAR(15),
@TELEFONO2 CHAR(15),
@EMAIL VARCHAR(40),
@PASARPED CHAR(2),
@MOTIVORET CHAR(2),
@CODREGION CHAR(2),
@CODZONA CHAR(6),
@CODSECCION CHAR(2),
@CODTERRITORIO CHAR(2),
@CAMPANHAINSC CHAR(6),
@CAMPANHAPRICO CHAR(6)
AS
SET NOCOUNT ON
BEGIN
	DECLARE @_TRUE BIT
	SET @_TRUE = 'true'
	DECLARE @_ERROR CHAR(2)
	SET @_ERROR = '0|'
	IF @NRODOC <> ''
		BEGIN
			IF @CODIGO <> ''
				BEGIN
					IF NOT EXISTS (SELECT 1 FROM tb_consultora WHERE (tb_consultora.cod = @CODIGO) AND (tb_consultora .estado = @_TRUE))
						BEGIN
							IF NOT EXISTS (SELECT 1 FROM tb_consultora WHERE tb_consultora.nrodoc = @NRODOC)
								BEGIN
									DECLARE @_CERO INT
									SET @_CERO = '0'
									IF EXISTS (SELECT 1 FROM tb_pais WHERE (tb_pais.id = @IDPAIS) AND (tb_pais.id <> @_CERO) AND (tb_pais.estado = @_TRUE))
										BEGIN
											DECLARE @_EXITO CHAR(2)
											SET @_EXITO = '1|'
											DECLARE @_ESTADO BIT
											SET @_ESTADO = 'true'
											INSERT INTO tb_consultora
											(
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
												@IDPAIS,
												@CAMPANHAINSC,
												@CAMPANHAPRICO,
												@CODREGION,
												@CODZONA,
												@CODSECCION,
												@CODTERRITORIO,
												@CODCIA,
												@PASARPED,
												@MOTIVORET,
												@CODIGO,
												@APEPATERNO,
												@APEMATERNO,
												@NOMBRES,
												@NRODOC,
												@TELEFONO1,
												@TELEFONO2,
												@EMAIL,
												@_ESTADO
											)
											UPDATE tb_incorporacion
											SET idconsultora = (SELECT tb_consultora.id FROM tb_consultora WHERE tb_consultora.cod = @CODIGO)
											WHERE tb_incorporacion.nrodoc =  @NRODOC
											SELECT @_EXITO AS 'Mensaje','Grabación exitosa' AS 'Detalle'
										END
									ELSE
										BEGIN
											SELECT @_ERROR AS 'Mensaje','País incorrecto' AS 'Detalle'
										END
								END
							ELSE
								BEGIN
									SELECT @_ERROR AS 'Mensaje','Documento de identidad ya existe' AS 'Detalle'
								END
						END
					ELSE
						BEGIN
							SELECT @_ERROR AS 'Mensaje','Código de consultora ya existe' AS 'Detalle'
						END
				END
			ELSE
				BEGIN
					SELECT @_ERROR AS 'Mensaje','Código de consultora vacío' AS 'Detalle'
				END
		END
	ELSE
		BEGIN
			SELECT @_ERROR AS 'Mensaje','Documento de identidad vacío' AS 'Detalle'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTADO_REPORTE_INCORPORACIONES]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery9.sql|7|0|C:\Users\prsbb\AppData\Local\Temp\1\~vsA190.sql
-- =============================================
-- Author:		vsanchez
-- Create date: 18/05/2011
-- Description:	Obtiene listado de incorporaciones y/o consultoras de acuerdo a parámetros de búsqueda enviados.
-- =============================================
CREATE PROCEDURE [dbo].[SP_LISTADO_REPORTE_INCORPORACIONES] AS
BEGIN
	SET NOCOUNT ON;
    SELECT
		ti.id AS incorporacionID,
		tc.id AS consultoraID,
		tg.codregion AS region,
		tg.codzona AS zona,
		convert(varchar(10), ti.fecha, 103) AS fechaIncorporacion,
		tc.campanhainsc AS campanhaInscripcion,
		ti.nrodoc AS numeroDocumento,
		ti.apepaterno AS apellidoPaterno,
		ti.apematerno AS apellidoMaterno,
		ti.nombres AS nombres,
		tc.cod AS consultoraCodigo,
		ti.verifica AS estadoVerificado,
		ti.estado AS estadoActivo,
		'I' AS tipo
	FROM [db_bcaribe].[dbo].[tb_incorporacion] ti (NOLOCK)
	JOIN [db_bcaribe].[dbo].[tb_gerentezona] tg (NOLOCK)
	  ON tg.id = ti.idgerentezona
	LEFT JOIN [db_bcaribe].[dbo].[tb_consultora] tc (NOLOCK)
		ON tc.id = ti.idconsultora;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_INCORPORACION_VERIFICAR]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INCORPORACION_VERIFICAR]
@ID INT
AS
SET NOCOUNT ON
BEGIN
	IF EXISTS (SELECT 1 FROM tb_incorporacion WHERE tb_incorporacion.id = @ID AND tb_incorporacion.graba = 1)
		BEGIN
			UPDATE tb_incorporacion SET verifica = CASE verifica WHEN 0 THEN 1 ELSE 0 END  WHERE id = @ID AND graba = 1; 
		END
	ELSE
		BEGIN
			RAISERROR ('La incorporacion no existe o no está en modo real', 18, 101);
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_HC_BUSQUEDA_INCORPORACIONES]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC SP_HC_BUSQUEDA_INCORPORACIONES '','','','','','','','','','-1'
CREATE PROCEDURE [dbo].[SP_HC_BUSQUEDA_INCORPORACIONES]
@CODREGION CHAR(2),
@CODZONA CHAR(6),
@FECHINSC CHAR(10), 
@CAMPANHAINSC CHAR(6),
@NRODOC CHAR(18),
@CODCONSU VARCHAR(15),
@APEPATERNO VARCHAR(30),
@APEMATERNO VARCHAR(30),
@NOMBRES VARCHAR(30),
@VERIFICA INT
AS
SET NOCOUNT ON
BEGIN
	DECLARE @_TRUE BIT
	SET @_TRUE = 'true'
	DECLARE @_UNO INT
	SET @_UNO = '1'
	DECLARE @_NEGATIVO INT
	SET @_NEGATIVO = '-1'
	DECLARE @_CAMPANHAINSC CHAR(11)	
	SET @_CAMPANHAINSC = 'No definida'
	DECLARE @_CODCONSU CHAR(11)	
	SET @_CODCONSU = 'No definido'
	IF @FECHINSC = ''
		BEGIN
			IF @VERIFICA = @_NEGATIVO
				BEGIN
					SELECT tb_gerentezona.codregion AS 'Región',tb_gerentezona.codzona AS 'Zona',tb_incorporacion.fecha AS 'Fecha inscripción','@_CAMPANHAINSC' AS 'Campaña inscripción',tb_incorporacion.nrodoc AS 'Documento identidad','@_CODCONSU' AS 'Código consultora',tb_incorporacion.apepaterno AS 'Apellido paterno',tb_incorporacion.apematerno AS 'Apellido materno',tb_incorporacion.nombres AS 'Nombres',tb_incorporacion.verifica AS 'Estado'
					FROM tb_incorporacion INNER JOIN tb_gerentezona ON tb_incorporacion.idgerentezona = tb_gerentezona.id 
					WHERE tb_gerentezona.codregion = @CODREGION AND tb_gerentezona.codzona = @CODZONA AND tb_incorporacion.nrodoc = @NRODOC AND tb_incorporacion.apepaterno = @APEPATERNO AND tb_incorporacion.apematerno = @APEMATERNO AND tb_incorporacion.nombres = @NOMBRES AND tb_gerentezona.estado = @_TRUE AND tb_incorporacion.idconsultora <> @_UNO
					UNION
					SELECT tb_gerentezona.codregion AS 'Región',tb_gerentezona.codzona AS 'Zona',tb_incorporacion.fecha AS 'Fecha inscripción',tb_consultora.campanhainsc AS 'Campaña inscripción',tb_consultora.nrodoc AS 'Documento identidad',tb_consultora.cod AS 'Código consultora',tb_consultora.apepaterno AS 'Apellido paterno',tb_consultora.apematerno AS 'Apellido materno',tb_consultora.nombres AS 'Nombres',tb_incorporacion.verifica AS 'Estado'
					FROM tb_incorporacion INNER JOIN tb_gerentezona ON tb_incorporacion.idgerentezona = tb_gerentezona.id INNER JOIN tb_consultora ON tb_incorporacion.idconsultora = tb_consultora.id
					WHERE tb_gerentezona.codregion = @CODREGION AND tb_gerentezona.codzona = @CODZONA AND tb_consultora.campanhainsc = @CAMPANHAINSC  AND tb_consultora.nrodoc = @NRODOC AND tb_consultora.cod = @CODCONSU AND tb_consultora.apepaterno = @APEPATERNO AND tb_consultora.apematerno = @APEMATERNO AND tb_consultora.nombres = @NOMBRES AND tb_consultora.estado = @_TRUE AND tb_gerentezona.estado = @_TRUE 
					ORDER BY 'Región','Zona','Fecha inscripción','Campaña inscripción','Documento identidad','Código consultora','Apellido paterno','Apellido materno','Nombres','Estado'
				END
			ELSE
				BEGIN
					SELECT tb_gerentezona.codregion AS 'Región',tb_gerentezona.codzona AS 'Zona',tb_incorporacion.fecha AS 'Fecha inscripción',@_CAMPANHAINSC AS 'Campaña inscripción',tb_incorporacion.nrodoc AS 'Documento identidad',@_CODCONSU AS 'Código consultora',tb_incorporacion.apepaterno AS 'Apellido paterno',tb_incorporacion.apematerno AS 'Apellido materno',tb_incorporacion.nombres AS 'Nombres',tb_incorporacion.verifica AS 'Estado'
					FROM tb_incorporacion INNER JOIN tb_gerentezona ON tb_incorporacion.idgerentezona = tb_gerentezona.id 
					WHERE tb_gerentezona.codregion = @CODREGION AND tb_gerentezona.codzona = @CODZONA AND tb_incorporacion.nrodoc = @NRODOC AND tb_incorporacion.apepaterno = @APEPATERNO AND tb_incorporacion.apematerno = @APEMATERNO AND tb_incorporacion.nombres = @NOMBRES AND tb_incorporacion.verifica = @VERIFICA AND tb_gerentezona.estado = @_TRUE 
					UNION
					SELECT tb_gerentezona.codregion AS 'Región',tb_gerentezona.codzona AS 'Zona',tb_incorporacion.fecha AS 'Fecha inscripción',tb_consultora.campanhainsc AS 'Campaña inscripción',tb_consultora.nrodoc AS 'Documento identidad',tb_consultora.cod AS 'Código consultora',tb_consultora.apepaterno AS 'Apellido paterno',tb_consultora.apematerno AS 'Apellido materno',tb_consultora.nombres AS 'Nombres',tb_incorporacion.verifica AS 'Estado'
					FROM tb_incorporacion INNER JOIN tb_gerentezona ON tb_incorporacion.idgerentezona = tb_gerentezona.id INNER JOIN tb_consultora ON tb_incorporacion.idconsultora = tb_consultora.id
					WHERE tb_gerentezona.codregion = @CODREGION AND tb_gerentezona.codzona = @CODZONA AND tb_consultora.campanhainsc = @CAMPANHAINSC  AND tb_consultora.nrodoc = @NRODOC AND tb_consultora.cod = @CODCONSU AND tb_consultora.apepaterno = @APEPATERNO AND tb_consultora.apematerno = @APEMATERNO AND tb_consultora.nombres = @NOMBRES AND tb_incorporacion.verifica = @VERIFICA AND tb_consultora.estado = @_TRUE AND tb_gerentezona.estado = @_TRUE 
					ORDER BY 'Región','Zona','Fecha inscripción','Campaña inscripción','Documento identidad','Código consultora','Apellido paterno','Apellido materno','Nombres','Estado'					
				END
		END
	ELSE
		BEGIN
			IF @VERIFICA = @_NEGATIVO
				BEGIN
					SELECT tb_gerentezona.codregion AS 'Región',tb_gerentezona.codzona AS 'Zona',tb_incorporacion.fecha AS 'Fecha inscripción',@_CAMPANHAINSC AS 'Campaña inscripción',tb_incorporacion.nrodoc AS 'Documento identidad',@_CODCONSU AS 'Código consultora',tb_incorporacion.apepaterno AS 'Apellido paterno',tb_incorporacion.apematerno AS 'Apellido materno',tb_incorporacion.nombres AS 'Nombres',tb_incorporacion.verifica AS 'Estado'
					FROM tb_incorporacion INNER JOIN tb_gerentezona ON tb_incorporacion.idgerentezona = tb_gerentezona.id 
					WHERE tb_gerentezona.codregion = @CODREGION AND tb_gerentezona.codzona = @CODZONA AND tb_incorporacion.fecha = @FECHINSC AND tb_incorporacion.nrodoc = @NRODOC AND tb_incorporacion.apepaterno = @APEPATERNO AND tb_incorporacion.apematerno = @APEMATERNO AND tb_incorporacion.nombres = @NOMBRES AND tb_gerentezona.estado = @_TRUE 
					UNION
					SELECT tb_gerentezona.codregion AS 'Región',tb_gerentezona.codzona AS 'Zona',tb_incorporacion.fecha AS 'Fecha inscripción',tb_consultora.campanhainsc AS 'Campaña inscripción',tb_consultora.nrodoc AS 'Documento identidad',tb_consultora.cod AS 'Código consultora',tb_consultora.apepaterno AS 'Apellido paterno',tb_consultora.apematerno AS 'Apellido materno',tb_consultora.nombres AS 'Nombres',tb_incorporacion.verifica AS 'Estado'
					FROM tb_incorporacion INNER JOIN tb_gerentezona ON tb_incorporacion.idgerentezona = tb_gerentezona.id INNER JOIN tb_consultora ON tb_incorporacion.idconsultora = tb_consultora.id
					WHERE tb_gerentezona.codregion = @CODREGION AND tb_gerentezona.codzona = @CODZONA AND tb_incorporacion.fecha = @FECHINSC AND tb_consultora.campanhainsc = @CAMPANHAINSC  AND tb_consultora.nrodoc = @NRODOC AND tb_consultora.cod = @CODCONSU AND tb_consultora.apepaterno = @APEPATERNO AND tb_consultora.apematerno = @APEMATERNO AND tb_consultora.nombres = @NOMBRES AND tb_consultora.estado = @_TRUE AND tb_gerentezona.estado = @_TRUE 
					ORDER BY 'Región','Zona','Fecha inscripción','Campaña inscripción','Documento identidad','Código consultora','Apellido paterno','Apellido materno','Nombres','Estado'
				END
			ELSE
				BEGIN
					SELECT tb_gerentezona.codregion AS 'Región',tb_gerentezona.codzona AS 'Zona',tb_incorporacion.fecha AS 'Fecha inscripción',@_CAMPANHAINSC AS 'Campaña inscripción',tb_incorporacion.nrodoc AS 'Documento identidad',@_CODCONSU AS 'Código consultora',tb_incorporacion.apepaterno AS 'Apellido paterno',tb_incorporacion.apematerno AS 'Apellido materno',tb_incorporacion.nombres AS 'Nombres',tb_incorporacion.verifica AS 'Estado'
					FROM tb_incorporacion INNER JOIN tb_gerentezona ON tb_incorporacion.idgerentezona = tb_gerentezona.id 
					WHERE tb_gerentezona.codregion = @CODREGION AND tb_gerentezona.codzona = @CODZONA AND tb_incorporacion.fecha = @FECHINSC AND tb_incorporacion.nrodoc = @NRODOC AND tb_incorporacion.apepaterno = @APEPATERNO AND tb_incorporacion.apematerno = @APEMATERNO AND tb_incorporacion.nombres = @NOMBRES AND tb_incorporacion.verifica = @VERIFICA AND tb_gerentezona.estado = @_TRUE 
					UNION
					SELECT tb_gerentezona.codregion AS 'Región',tb_gerentezona.codzona AS 'Zona',tb_incorporacion.fecha AS 'Fecha inscripción',tb_consultora.campanhainsc AS 'Campaña inscripción',tb_consultora.nrodoc AS 'Documento identidad',tb_consultora.cod AS 'Código consultora',tb_consultora.apepaterno AS 'Apellido paterno',tb_consultora.apematerno AS 'Apellido materno',tb_consultora.nombres AS 'Nombres',tb_incorporacion.verifica AS 'Estado'
					FROM tb_incorporacion INNER JOIN tb_gerentezona ON tb_incorporacion.idgerentezona = tb_gerentezona.id INNER JOIN tb_consultora ON tb_incorporacion.idconsultora = tb_consultora.id
					WHERE tb_gerentezona.codregion = @CODREGION AND tb_gerentezona.codzona = @CODZONA AND tb_incorporacion.fecha = @FECHINSC AND tb_consultora.campanhainsc = @CAMPANHAINSC  AND tb_consultora.nrodoc = @NRODOC AND tb_consultora.cod = @CODCONSU AND tb_consultora.apepaterno = @APEPATERNO AND tb_consultora.apematerno = @APEMATERNO AND tb_consultora.nombres = @NOMBRES AND tb_incorporacion.verifica = @VERIFICA AND tb_consultora.estado = @_TRUE AND tb_gerentezona.estado = @_TRUE 
					ORDER BY 'Región','Zona','Fecha inscripción','Campaña inscripción','Documento identidad','Código consultora','Apellido paterno','Apellido materno','Nombres','Estado'
				END
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CORREO_OBTENER_POR_PAIS]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CORREO_OBTENER_POR_PAIS]
	@nombres		VARCHAR(30),
	@email			VARCHAR(40),
	@operacionID	INT,
	@paisID			INT
AS
BEGIN
	SET NOCOUNT ON;
	IF @operacionID <> 0
		BEGIN
			SELECT
				te.id AS empleadoID,
				te.idpais AS paisID,
				te.idtablaoperacion AS operacionID,
				UPPER(LEFT(tt.descripcion, 1)) + LOWER(SUBSTRING(tt.descripcion, 2, LEN(tt.descripcion))) AS operacionDescripcion,
				te.apepaterno AS apellidoPaterno,
				te.apematerno AS apellidoMaterno,
				te.nombres AS nombre,
				(te.nombres + ' ' + te.apepaterno + ' ' + te.apematerno) AS nombres,
				te.nrodoc,
				te.email,
				te.estado
			FROM
				tb_empleado te,
				tb_tabla tt
			WITH (NOLOCK)
			WHERE
				te.idtablaoperacion = tt.id
			AND
				te.nombres LIKE '%' + @nombres + '%'
			AND
				te.email LIKE '%' + @email + '%'
			AND
				te.idtablaoperacion = @operacionID
			AND
				te.idpais = @paisID
		END
	ELSE
		BEGIN
			SELECT
				te.id AS empleadoID,
				te.idpais AS paisID,
				te.idtablaoperacion AS operacionID,
				UPPER(LEFT(tt.descripcion, 1)) + LOWER(SUBSTRING(tt.descripcion, 2, LEN(tt.descripcion))) AS operacionDescripcion,
				te.apepaterno AS apellidoPaterno,
				te.apematerno AS apellidoMaterno,
				te.nombres AS nombre,
				(te.nombres + ' ' + te.apepaterno + ' ' + te.apematerno) AS nombres,
				te.nrodoc,
				te.email,
				te.estado
			FROM
				tb_empleado te,
				tb_tabla tt
			WITH (NOLOCK)
			WHERE
				te.idtablaoperacion = tt.id
			AND
				te.nombres LIKE '%' + @nombres + '%'
			AND
				te.email LIKE '%' + @email + '%'
			AND
				te.idpais = @paisID
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CORREO_OBTENER]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CORREO_OBTENER]
	@nombres		VARCHAR(30),
	@email			VARCHAR(40),
	@operacionID	INT
AS
BEGIN
	SET NOCOUNT ON;
	IF @operacionID <> 0
		BEGIN
			SELECT
				te.id AS empleadoID,
				te.idpais AS paisID,
				te.idtablaoperacion AS operacionID,
				UPPER(LEFT(tt.descripcion, 1)) + LOWER(SUBSTRING(tt.descripcion, 2, LEN(tt.descripcion))) AS operacionDescripcion,
				te.apepaterno AS apellidoPaterno,
				te.apematerno AS apellidoMaterno,
				te.nombres,
				te.nrodoc,
				te.email,
				te.estado
			FROM
				tb_empleado te,
				tb_tabla tt
			WITH (NOLOCK)
			WHERE
				te.idtablaoperacion = tt.id
			AND
				te.nombres LIKE '%' + @nombres + '%'
			AND
				te.email LIKE '%' + @email + '%'
			AND
				te.idtablaoperacion = @operacionID
		END
	ELSE
		BEGIN
			SELECT
				te.id AS empleadoID,
				te.idpais AS paisID,
				te.idtablaoperacion AS operacionID,
				UPPER(LEFT(tt.descripcion, 1)) + LOWER(SUBSTRING(tt.descripcion, 2, LEN(tt.descripcion))) AS operacionDescripcion,
				te.apepaterno AS apellidoPaterno,
				te.apematerno AS apellidoMaterno,
				te.nombres,
				te.nrodoc,
				te.email,
				te.estado
			FROM
				tb_empleado te,
				tb_tabla tt
			WITH (NOLOCK)
			WHERE
				te.idtablaoperacion = tt.id
			AND
				te.nombres LIKE '%' + @nombres + '%'
			AND
				te.email LIKE '%' + @email + '%'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CORREO_CREAR]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CORREO_CREAR]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_CORREO_CARGAR]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CORREO_CARGAR] 
	@correoID	INT
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		te.id AS correoID,
		te.idpais AS paisID,
		te.idtablaoperacion AS operaciónID,
		UPPER(LEFT(tt.descripcion, 1)) + LOWER(SUBSTRING(tt.descripcion, 2, LEN(tt.descripcion))) AS operacionDescripcion,
		te.apepaterno AS apellidoPaterno,
		te.apematerno AS apellidoMaterno,
		te.nombres,
		te.nrodoc,
		te.email,
		te.estado
	FROM
		tb_empleado te,
		tb_tabla tt
	WITH (NOLOCK)
	WHERE
		te.idtablaoperacion = tt.id
	AND
		te.id = @correoID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CORREO_ACTUALIZAR]    Script Date: 01/19/2012 16:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CORREO_ACTUALIZAR]
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
GO
/****** Object:  Default [DF__tb_consul__campa__4277DAAA]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_consultora] ADD  DEFAULT ('') FOR [campanhainsc]
GO
/****** Object:  Default [DF__tb_consul__campa__436BFEE3]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_consultora] ADD  DEFAULT ('') FOR [campanhaprico]
GO
/****** Object:  Default [DF__tb_consul__codre__4460231C]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_consultora] ADD  DEFAULT ('') FOR [codregion]
GO
/****** Object:  Default [DF__tb_consul__codzo__45544755]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_consultora] ADD  DEFAULT ('') FOR [codzona]
GO
/****** Object:  Default [DF__tb_consul__codse__46486B8E]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_consultora] ADD  DEFAULT ('') FOR [codseccion]
GO
/****** Object:  Default [DF__tb_consul__codte__473C8FC7]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_consultora] ADD  DEFAULT ('') FOR [codterritorio]
GO
/****** Object:  Default [DF__tb_consul__codci__4830B400]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_consultora] ADD  DEFAULT ('') FOR [codcia]
GO
/****** Object:  Default [DF__tb_consul__pasar__4924D839]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_consultora] ADD  DEFAULT ('') FOR [pasarped]
GO
/****** Object:  Default [DF__tb_consul__motiv__4A18FC72]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_consultora] ADD  DEFAULT ('') FOR [motivoret]
GO
/****** Object:  Default [DF__tb_consulto__cod__4B0D20AB]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_consultora] ADD  DEFAULT ('') FOR [cod]
GO
/****** Object:  Default [DF__tb_consul__apepa__4C0144E4]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_consultora] ADD  DEFAULT ('') FOR [apepaterno]
GO
/****** Object:  Default [DF__tb_consul__apema__4CF5691D]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_consultora] ADD  DEFAULT ('') FOR [apematerno]
GO
/****** Object:  Default [DF__tb_consul__nombr__4DE98D56]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_consultora] ADD  DEFAULT ('') FOR [nombres]
GO
/****** Object:  Default [DF__tb_consul__telef__4EDDB18F]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_consultora] ADD  DEFAULT ('') FOR [telefono1]
GO
/****** Object:  Default [DF__tb_consul__telef__4FD1D5C8]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_consultora] ADD  DEFAULT ('') FOR [telefono2]
GO
/****** Object:  Default [DF__tb_consul__email__50C5FA01]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_consultora] ADD  DEFAULT ('') FOR [email]
GO
/****** Object:  Default [DF__tb_consul__estad__51BA1E3A]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_consultora] ADD  DEFAULT ('0') FOR [estado]
GO
/****** Object:  Default [DF__tb_divpolit__cod__36B12243]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_divpolitica] ADD  DEFAULT ('-1') FOR [cod]
GO
/****** Object:  Default [DF__tb_divpol__nombr__37A5467C]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_divpolitica] ADD  DEFAULT ('') FOR [nombre]
GO
/****** Object:  Default [DF__tb_divpol__estad__38996AB5]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_divpolitica] ADD  DEFAULT ('0') FOR [estado]
GO
/****** Object:  Default [DF__tb_emplea__apepa__2C3393D0]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_empleado] ADD  DEFAULT ('') FOR [apepaterno]
GO
/****** Object:  Default [DF__tb_emplea__apema__2D27B809]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_empleado] ADD  DEFAULT ('') FOR [apematerno]
GO
/****** Object:  Default [DF__tb_emplea__nombr__2E1BDC42]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_empleado] ADD  DEFAULT ('') FOR [nombres]
GO
/****** Object:  Default [DF__tb_emplea__email__300424B4]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_empleado] ADD  DEFAULT ('') FOR [email]
GO
/****** Object:  Default [DF__tb_emplea__estad__30F848ED]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_empleado] ADD  DEFAULT ('0') FOR [estado]
GO
/****** Object:  Default [DF__tb_factur__campa__22AA2996]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_facturacion] ADD  DEFAULT ('') FOR [campanha]
GO
/****** Object:  Default [DF__tb_factur__codci__239E4DCF]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_facturacion] ADD  DEFAULT ('') FOR [codcia]
GO
/****** Object:  Default [DF__tb_factur__codre__24927208]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_facturacion] ADD  DEFAULT ('') FOR [codregion]
GO
/****** Object:  Default [DF__tb_factur__codzo__25869641]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_facturacion] ADD  DEFAULT ('') FOR [codzona]
GO
/****** Object:  Default [DF__tb_factur__fecha__267ABA7A]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_facturacion] ADD  DEFAULT ('19000101 00:00') FOR [fecha]
GO
/****** Object:  Default [DF__tb_factur__estad__276EDEB3]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_facturacion] ADD  DEFAULT ('0') FOR [estado]
GO
/****** Object:  Default [DF__tb_incorp__codte__7167D3BD]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [codterritorio]
GO
/****** Object:  Default [DF__tb_incorp__codco__725BF7F6]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [codconsurecom]
GO
/****** Object:  Default [DF__tb_incorp__apepa__73501C2F]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [apepaterno]
GO
/****** Object:  Default [DF__tb_incorp__apema__74444068]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [apematerno]
GO
/****** Object:  Default [DF__tb_incorp__nombr__753864A1]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [nombres]
GO
/****** Object:  Default [DF__tb_incorp__telef__762C88DA]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [telefcasa]
GO
/****** Object:  Default [DF__tb_incorp__telef__7720AD13]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [telefcelular]
GO
/****** Object:  Default [DF__tb_incorp__email__7814D14C]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [email]
GO
/****** Object:  Default [DF__tb_incorp__fechn__7908F585]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('19000101 00:00') FOR [fechnac]
GO
/****** Object:  Default [DF__tb_incorp__solic__79FD19BE]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [solicdireccion]
GO
/****** Object:  Default [DF__tb_incorp__solic__7AF13DF7]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [soliccodpostal]
GO
/****** Object:  Default [DF__tb_incorp__solic__7BE56230]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [solicreferencia]
GO
/****** Object:  Default [DF__tb_incorp__solic__7CD98669]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [solicdivpolitica1]
GO
/****** Object:  Default [DF__tb_incorp__solic__7DCDAAA2]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [solicdivpolitica2]
GO
/****** Object:  Default [DF__tb_incorp__entre__7EC1CEDB]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [entregdireccion]
GO
/****** Object:  Default [DF__tb_incorp__entre__7FB5F314]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [entregcodpostal]
GO
/****** Object:  Default [DF__tb_incorp__entre__00AA174D]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [entregreferencia]
GO
/****** Object:  Default [DF__tb_incorp__entre__019E3B86]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [entregdivpolitica]
GO
/****** Object:  Default [DF__tb_incorp__reffa__02925FBF]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [reffamapepaterno]
GO
/****** Object:  Default [DF__tb_incorp__reffa__038683F8]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [reffamapematerno]
GO
/****** Object:  Default [DF__tb_incorp__reffa__047AA831]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [reffamnombres]
GO
/****** Object:  Default [DF__tb_incorp__reffa__056ECC6A]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [reffamdireccion]
GO
/****** Object:  Default [DF__tb_incorp__reffa__0662F0A3]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [reffamtelefono]
GO
/****** Object:  Default [DF__tb_incorp__reffa__075714DC]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [reffamcelular]
GO
/****** Object:  Default [DF__tb_incorp__refno__084B3915]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [refnofamapepaterno]
GO
/****** Object:  Default [DF__tb_incorp__refno__093F5D4E]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [refnofamapematerno]
GO
/****** Object:  Default [DF__tb_incorp__refno__0A338187]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [refnofamnombres]
GO
/****** Object:  Default [DF__tb_incorp__refno__0B27A5C0]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [refnofamdireccion]
GO
/****** Object:  Default [DF__tb_incorp__refno__0C1BC9F9]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [refnofamtelefono]
GO
/****** Object:  Default [DF__tb_incorp__refno__0D0FEE32]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [refnofamcelular]
GO
/****** Object:  Default [DF__tb_incorp__adicp__0E04126B]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [adicprofesion]
GO
/****** Object:  Default [DF__tb_incorp__adicl__0EF836A4]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [adiclugartrab]
GO
/****** Object:  Default [DF__tb_incorp__adict__0FEC5ADD]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [adictelefonotrab]
GO
/****** Object:  Default [DF__tb_incorp__adich__10E07F16]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [adichoravisita]
GO
/****** Object:  Default [DF__tb_incorp__adicn__11D4A34F]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('-1') FOR [adicnrohijos]
GO
/****** Object:  Default [DF__tb_incorp__adicn__12C8C788]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('-1') FOR [adicnroinfantes]
GO
/****** Object:  Default [DF__tb_incorp__adicn__13BCEBC1]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('-1') FOR [adicnroescolares]
GO
/****** Object:  Default [DF__tb_incorp__adicn__14B10FFA]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('-1') FOR [adicnronivsuperior]
GO
/****** Object:  Default [DF__tb_incorp__adicn__15A53433]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('-1') FOR [adicnroadultos]
GO
/****** Object:  Default [DF__tb_incorp__recpi__1699586C]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [recpin]
GO
/****** Object:  Default [DF__tb_incorp__recim__178D7CA5]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [recimsi]
GO
/****** Object:  Default [DF__tb_incorp__reclo__1881A0DE]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [reclongitud]
GO
/****** Object:  Default [DF__tb_incorp__recla__1975C517]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [reclatitud]
GO
/****** Object:  Default [DF__tb_incorp__recma__1A69E950]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [recmargen]
GO
/****** Object:  Default [DF__tb_incorp__recnr__1B5E0D89]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('-1') FOR [recnrosatelites]
GO
/****** Object:  Default [DF__tb_incorp__recob__1C5231C2]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('') FOR [recobservacion]
GO
/****** Object:  Default [DF__tb_incorp__recfe__1D4655FB]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('19000101 00:00') FOR [recfechvisita]
GO
/****** Object:  Default [DF__tb_incorp__fecha__1E3A7A34]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('19000101 00:00') FOR [fecha]
GO
/****** Object:  Default [DF__tb_incorp__graba__1F2E9E6D]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('0') FOR [graba]
GO
/****** Object:  Default [DF__tb_incorp__verif__2022C2A6]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('0') FOR [verifica]
GO
/****** Object:  Default [DF__tb_incorp__desca__2116E6DF]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('0') FOR [descarga]
GO
/****** Object:  Default [DF__tb_incorp__estad__220B0B18]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion] ADD  DEFAULT ('0') FOR [estado]
GO
/****** Object:  Default [DF__tb_pais__nomencl__014935CB]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_pais] ADD  DEFAULT ('') FOR [nomenclatura]
GO
/****** Object:  Default [DF__tb_pais__nombre__023D5A04]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_pais] ADD  DEFAULT ('') FOR [nombre]
GO
/****** Object:  Default [DF__tb_pais__campanh__03317E3D]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_pais] ADD  DEFAULT ('') FOR [campanhaact]
GO
/****** Object:  Default [DF__tb_pais__medad__0519C6AF]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_pais] ADD  DEFAULT ('-1') FOR [medad]
GO
/****** Object:  Default [DF__tb_pais__tipodoc__060DEAE8]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_pais] ADD  DEFAULT ('') FOR [tipodoc]
GO
/****** Object:  Default [DF__tb_pais__tipodiv__07020F21]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_pais] ADD  DEFAULT ('') FOR [tipodivpolitica]
GO
/****** Object:  Default [DF__tb_pais__caducid__08EA5793]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_pais] ADD  DEFAULT ('-1') FOR [caducidad]
GO
/****** Object:  Default [DF__tb_pais__seguimi__09DE7BCC]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_pais] ADD  DEFAULT ('0') FOR [seguimientobb]
GO
/****** Object:  Default [DF__tb_pais__reingre__0AD2A005]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_pais] ADD  DEFAULT ('0') FOR [reingresobb]
GO
/****** Object:  Default [DF__tb_pais__adicion__0BC6C43E]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_pais] ADD  DEFAULT ('0') FOR [adicionalsc]
GO
/****** Object:  Default [DF__tb_pais__gpsbb__0CBAE877]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_pais] ADD  DEFAULT ('0') FOR [gpsbb]
GO
/****** Object:  Default [DF__tb_pais__verific__0DAF0CB0]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_pais] ADD  DEFAULT ('0') FOR [verificadoincorp]
GO
/****** Object:  Default [DF__tb_pais__url__0EA330E9]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_pais] ADD  DEFAULT ('') FOR [url]
GO
/****** Object:  Default [DF__tb_pais__version__0F975522]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_pais] ADD  DEFAULT ('') FOR [version]
GO
/****** Object:  Default [DF__tb_pais__rutaimg__108B795B]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_pais] ADD  DEFAULT ('') FOR [rutaimg]
GO
/****** Object:  Default [DF__tb_pais__estado__117F9D94]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_pais] ADD  DEFAULT ('0') FOR [estado]
GO
/****** Object:  Default [DF__tb_reingr__campa__0CDAE408]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_reingreso] ADD  DEFAULT ('') FOR [campanha]
GO
/****** Object:  Default [DF__tb_reingr__codco__0DCF0841]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_reingreso] ADD  DEFAULT ('') FOR [codconsu]
GO
/****** Object:  Default [DF__tb_reingr__apepa__0EC32C7A]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_reingreso] ADD  DEFAULT ('') FOR [apepaterno]
GO
/****** Object:  Default [DF__tb_reingr__apema__0FB750B3]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_reingreso] ADD  DEFAULT ('') FOR [apematerno]
GO
/****** Object:  Default [DF__tb_reingr__nombr__10AB74EC]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_reingreso] ADD  DEFAULT ('') FOR [nombres]
GO
/****** Object:  Default [DF__tb_reingr__recpi__119F9925]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_reingreso] ADD  DEFAULT ('') FOR [recpin]
GO
/****** Object:  Default [DF__tb_reingr__recim__1293BD5E]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_reingreso] ADD  DEFAULT ('') FOR [recimsi]
GO
/****** Object:  Default [DF__tb_reingr__reclo__1387E197]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_reingreso] ADD  DEFAULT ('') FOR [reclongitud]
GO
/****** Object:  Default [DF__tb_reingr__recla__147C05D0]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_reingreso] ADD  DEFAULT ('') FOR [reclatitud]
GO
/****** Object:  Default [DF__tb_reingr__recma__15702A09]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_reingreso] ADD  DEFAULT ('') FOR [recmargen]
GO
/****** Object:  Default [DF__tb_reingr__recnr__16644E42]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_reingreso] ADD  DEFAULT ('-1') FOR [recnrosatelites]
GO
/****** Object:  Default [DF__tb_reingr__recob__1758727B]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_reingreso] ADD  DEFAULT ('') FOR [recobservacion]
GO
/****** Object:  Default [DF__tb_reingr__recfe__184C96B4]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_reingreso] ADD  DEFAULT ('19000101 00:00') FOR [recfechvisita]
GO
/****** Object:  Default [DF__tb_reingr__fecha__1940BAED]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_reingreso] ADD  DEFAULT ('19000101 00:00') FOR [fecha]
GO
/****** Object:  Default [DF__tb_reingr__verif__1A34DF26]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_reingreso] ADD  DEFAULT ('0') FOR [verifica]
GO
/****** Object:  Default [DF__tb_reingr__estad__1B29035F]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_reingreso] ADD  DEFAULT ('0') FOR [estado]
GO
/****** Object:  Default [DF__tb_seguim__campa__6F4A8121]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_seguimiento] ADD  DEFAULT ('') FOR [campanha]
GO
/****** Object:  Default [DF__tb_seguim__fechi__703EA55A]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_seguimiento] ADD  DEFAULT ('19000101 00:00') FOR [fechingr]
GO
/****** Object:  Default [DF__tb_seguim__fecha__7132C993]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_seguimiento] ADD  DEFAULT ('19000101 00:00') FOR [fecha]
GO
/****** Object:  Default [DF__tb_seguim__obser__7226EDCC]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_seguimiento] ADD  DEFAULT ('') FOR [observacion]
GO
/****** Object:  Default [DF__tb_seguim__recpi__731B1205]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_seguimiento] ADD  DEFAULT ('') FOR [recpin]
GO
/****** Object:  Default [DF__tb_seguim__recim__740F363E]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_seguimiento] ADD  DEFAULT ('') FOR [recimsi]
GO
/****** Object:  Default [DF__tb_seguim__reclo__75035A77]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_seguimiento] ADD  DEFAULT ('') FOR [reclongitud]
GO
/****** Object:  Default [DF__tb_seguim__recla__75F77EB0]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_seguimiento] ADD  DEFAULT ('') FOR [reclatitud]
GO
/****** Object:  Default [DF__tb_seguim__recma__76EBA2E9]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_seguimiento] ADD  DEFAULT ('') FOR [recmargen]
GO
/****** Object:  Default [DF__tb_seguim__recnr__77DFC722]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_seguimiento] ADD  DEFAULT ('-1') FOR [recnrosatelites]
GO
/****** Object:  Default [DF__tb_seguim__recob__78D3EB5B]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_seguimiento] ADD  DEFAULT ('') FOR [recobservacion]
GO
/****** Object:  Default [DF__tb_seguim__recfe__79C80F94]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_seguimiento] ADD  DEFAULT ('19000101 00:00') FOR [recfechvisita]
GO
/****** Object:  Default [DF__tb_seguim__verif__7ABC33CD]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_seguimiento] ADD  DEFAULT ('0') FOR [verifica]
GO
/****** Object:  Default [DF__tb_seguim__estad__7BB05806]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_seguimiento] ADD  DEFAULT ('0') FOR [estado]
GO
/****** Object:  Default [DF__tb_tabla__cod__15502E78]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_tabla] ADD  DEFAULT ('-1') FOR [cod]
GO
/****** Object:  Default [DF__tb_tabla__descri__164452B1]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_tabla] ADD  DEFAULT ('') FOR [descripcion]
GO
/****** Object:  Default [DF__tb_tabla__estado__173876EA]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_tabla] ADD  DEFAULT ('0') FOR [estado]
GO
/****** Object:  Default [DF__tb_tipota__descr__7D78A4E7]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_tipotabla] ADD  DEFAULT ('') FOR [descripcion]
GO
/****** Object:  Default [DF__tb_tipota__estad__7E6CC920]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_tipotabla] ADD  DEFAULT ('0') FOR [estado]
GO
/****** Object:  Default [DF__tb_usuari__codig__1B0907CE]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_usuario] ADD  DEFAULT ('') FOR [codigo]
GO
/****** Object:  Default [DF__tb_usuari__clave__1BFD2C07]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_usuario] ADD  DEFAULT ('') FOR [clave]
GO
/****** Object:  Default [DF__tb_usuari__nombr__1CF15040]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_usuario] ADD  DEFAULT ('') FOR [nombre]
GO
/****** Object:  Default [DF__tb_usuari__estad__1DE57479]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_usuario] ADD  DEFAULT ('0') FOR [estado]
GO
/****** Object:  Check [CK__tb_consul__nrodo__4183B671]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_consultora]  WITH CHECK ADD CHECK  (([nrodoc]<>''))
GO
/****** Object:  Check [CK__tb_emplea__nrodo__2F10007B]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_empleado]  WITH CHECK ADD CHECK  (([nrodoc]<>''))
GO
/****** Object:  Check [CK__tb_incorp__nrodo__7073AF84]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion]  WITH CHECK ADD CHECK  (([nrodoc]<>''))
GO
/****** Object:  Check [CK__tb_pais__caducid__07F6335A]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_pais]  WITH CHECK ADD CHECK  (([caducidad]=(-1) OR [caducidad]>=(0)))
GO
/****** Object:  Check [CK__tb_pais__medad__0425A276]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_pais]  WITH CHECK ADD CHECK  (([medad]=(-1) OR [medad]>=(0)))
GO
/****** Object:  Check [CK__tb_reingr__recnr__0AF29B96]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_reingreso]  WITH NOCHECK ADD CHECK  (([recnrosatelites]=(-1) OR [recnrosatelites]>=(0)))
GO
/****** Object:  Check [CK__tb_reingreso__0BE6BFCF]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_reingreso]  WITH NOCHECK ADD CHECK  (([nrodoc]<>'' OR [codconsu]<>''))
GO
/****** Object:  Check [CK__tb_seguim__recnr__6E565CE8]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_seguimiento]  WITH CHECK ADD CHECK  (([recnrosatelites]=(-1) OR [recnrosatelites]>=(0)))
GO
/****** Object:  Check [CK__tb_tabla__cod__145C0A3F]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_tabla]  WITH CHECK ADD CHECK  (([cod]=(-1) OR [cod]>=(0)))
GO
/****** Object:  ForeignKey [FK_CONSULTORA_PAIS_ID]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_consultora]  WITH CHECK ADD  CONSTRAINT [FK_CONSULTORA_PAIS_ID] FOREIGN KEY([idpais])
REFERENCES [dbo].[tb_pais] ([id])
GO
ALTER TABLE [dbo].[tb_consultora] CHECK CONSTRAINT [FK_CONSULTORA_PAIS_ID]
GO
/****** Object:  ForeignKey [FK_DIVPOLITICA_PAIS_ID]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_divpolitica]  WITH CHECK ADD  CONSTRAINT [FK_DIVPOLITICA_PAIS_ID] FOREIGN KEY([idpais])
REFERENCES [dbo].[tb_pais] ([id])
GO
ALTER TABLE [dbo].[tb_divpolitica] CHECK CONSTRAINT [FK_DIVPOLITICA_PAIS_ID]
GO
/****** Object:  ForeignKey [FK_EMPLEADO_PAIS_ID]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_empleado]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADO_PAIS_ID] FOREIGN KEY([idpais])
REFERENCES [dbo].[tb_pais] ([id])
GO
ALTER TABLE [dbo].[tb_empleado] CHECK CONSTRAINT [FK_EMPLEADO_PAIS_ID]
GO
/****** Object:  ForeignKey [FK_EMPLEADO_TABLA_IDOPERACION]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_empleado]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADO_TABLA_IDOPERACION] FOREIGN KEY([idtablaoperacion])
REFERENCES [dbo].[tb_tabla] ([id])
GO
ALTER TABLE [dbo].[tb_empleado] CHECK CONSTRAINT [FK_EMPLEADO_TABLA_IDOPERACION]
GO
/****** Object:  ForeignKey [FK_FACTURACION_PAIS_ID]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_facturacion]  WITH CHECK ADD  CONSTRAINT [FK_FACTURACION_PAIS_ID] FOREIGN KEY([idpais])
REFERENCES [dbo].[tb_pais] ([id])
GO
ALTER TABLE [dbo].[tb_facturacion] CHECK CONSTRAINT [FK_FACTURACION_PAIS_ID]
GO
/****** Object:  ForeignKey [FK_INCORPORACION_PAIS_ID]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion]  WITH CHECK ADD  CONSTRAINT [FK_INCORPORACION_PAIS_ID] FOREIGN KEY([idpais])
REFERENCES [dbo].[tb_pais] ([id])
GO
ALTER TABLE [dbo].[tb_incorporacion] CHECK CONSTRAINT [FK_INCORPORACION_PAIS_ID]
GO
/****** Object:  ForeignKey [FK_INCORPORACION_TABLA_IDCONTACTO]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion]  WITH CHECK ADD  CONSTRAINT [FK_INCORPORACION_TABLA_IDCONTACTO] FOREIGN KEY([idtablacontacto])
REFERENCES [dbo].[tb_tabla] ([id])
GO
ALTER TABLE [dbo].[tb_incorporacion] CHECK CONSTRAINT [FK_INCORPORACION_TABLA_IDCONTACTO]
GO
/****** Object:  ForeignKey [FK_INCORPORACION_TABLA_IDESTADOCIVIL]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion]  WITH CHECK ADD  CONSTRAINT [FK_INCORPORACION_TABLA_IDESTADOCIVIL] FOREIGN KEY([idtablaestadocivil])
REFERENCES [dbo].[tb_tabla] ([id])
GO
ALTER TABLE [dbo].[tb_incorporacion] CHECK CONSTRAINT [FK_INCORPORACION_TABLA_IDESTADOCIVIL]
GO
/****** Object:  ForeignKey [FK_INCORPORACION_TABLA_IDNIVELEDUCATIVO]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion]  WITH CHECK ADD  CONSTRAINT [FK_INCORPORACION_TABLA_IDNIVELEDUCATIVO] FOREIGN KEY([idtablaniveleducativo])
REFERENCES [dbo].[tb_tabla] ([id])
GO
ALTER TABLE [dbo].[tb_incorporacion] CHECK CONSTRAINT [FK_INCORPORACION_TABLA_IDNIVELEDUCATIVO]
GO
/****** Object:  ForeignKey [FK_INCORPORACION_TABLA_IDOTRAMARCA]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion]  WITH CHECK ADD  CONSTRAINT [FK_INCORPORACION_TABLA_IDOTRAMARCA] FOREIGN KEY([idtablaotramarca])
REFERENCES [dbo].[tb_tabla] ([id])
GO
ALTER TABLE [dbo].[tb_incorporacion] CHECK CONSTRAINT [FK_INCORPORACION_TABLA_IDOTRAMARCA]
GO
/****** Object:  ForeignKey [FK_INCORPORACION_TABLA_IDREFFAMTIPOVINCULO]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion]  WITH CHECK ADD  CONSTRAINT [FK_INCORPORACION_TABLA_IDREFFAMTIPOVINCULO] FOREIGN KEY([idtablareffamtipovinculo])
REFERENCES [dbo].[tb_tabla] ([id])
GO
ALTER TABLE [dbo].[tb_incorporacion] CHECK CONSTRAINT [FK_INCORPORACION_TABLA_IDREFFAMTIPOVINCULO]
GO
/****** Object:  ForeignKey [FK_INCORPORACION_TABLA_IDREFNOFAMTIPOVINCULO]    Script Date: 01/19/2012 16:28:32 ******/
ALTER TABLE [dbo].[tb_incorporacion]  WITH CHECK ADD  CONSTRAINT [FK_INCORPORACION_TABLA_IDREFNOFAMTIPOVINCULO] FOREIGN KEY([idtablarefnofamtipovinculo])
REFERENCES [dbo].[tb_tabla] ([id])
GO
ALTER TABLE [dbo].[tb_incorporacion] CHECK CONSTRAINT [FK_INCORPORACION_TABLA_IDREFNOFAMTIPOVINCULO]
GO
/****** Object:  ForeignKey [FK_REINGRESO_GERENTEZONA_ID]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_reingreso]  WITH NOCHECK ADD  CONSTRAINT [FK_REINGRESO_GERENTEZONA_ID] FOREIGN KEY([idgerentezona])
REFERENCES [dbo].[tb_gerentezona] ([id])
GO
ALTER TABLE [dbo].[tb_reingreso] NOCHECK CONSTRAINT [FK_REINGRESO_GERENTEZONA_ID]
GO
/****** Object:  ForeignKey [FK_REINGRESO_PAIS_ID]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_reingreso]  WITH NOCHECK ADD  CONSTRAINT [FK_REINGRESO_PAIS_ID] FOREIGN KEY([idpais])
REFERENCES [dbo].[tb_pais] ([id])
GO
ALTER TABLE [dbo].[tb_reingreso] NOCHECK CONSTRAINT [FK_REINGRESO_PAIS_ID]
GO
/****** Object:  ForeignKey [FK_SEGUIMIENTO_PAIS_ID]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_seguimiento]  WITH CHECK ADD  CONSTRAINT [FK_SEGUIMIENTO_PAIS_ID] FOREIGN KEY([idpais])
REFERENCES [dbo].[tb_pais] ([id])
GO
ALTER TABLE [dbo].[tb_seguimiento] CHECK CONSTRAINT [FK_SEGUIMIENTO_PAIS_ID]
GO
/****** Object:  ForeignKey [FK_TABLA_TIPOTABLA_ID]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_tabla]  WITH CHECK ADD  CONSTRAINT [FK_TABLA_TIPOTABLA_ID] FOREIGN KEY([idtipotabla])
REFERENCES [dbo].[tb_tipotabla] ([id])
GO
ALTER TABLE [dbo].[tb_tabla] CHECK CONSTRAINT [FK_TABLA_TIPOTABLA_ID]
GO
/****** Object:  ForeignKey [FK_USUARIO_PAIS_ID]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_usuario]  WITH CHECK ADD  CONSTRAINT [FK_USUARIO_PAIS_ID] FOREIGN KEY([idpais])
REFERENCES [dbo].[tb_pais] ([id])
GO
ALTER TABLE [dbo].[tb_usuario] CHECK CONSTRAINT [FK_USUARIO_PAIS_ID]
GO
/****** Object:  ForeignKey [FK_USUARIO_TABLA_IDPERFIL]    Script Date: 01/19/2012 16:28:33 ******/
ALTER TABLE [dbo].[tb_usuario]  WITH CHECK ADD  CONSTRAINT [FK_USUARIO_TABLA_IDPERFIL] FOREIGN KEY([idtablaperfil])
REFERENCES [dbo].[tb_tabla] ([id])
GO
ALTER TABLE [dbo].[tb_usuario] CHECK CONSTRAINT [FK_USUARIO_TABLA_IDPERFIL]
GO
