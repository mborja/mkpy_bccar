USE [db_bcaribe]
GO
/****** Object:  StoredProcedure [dbo].[SP_USUARIO_OBTENER]    Script Date: 01/19/2012 15:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_USUARIO_OBTENER]
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

