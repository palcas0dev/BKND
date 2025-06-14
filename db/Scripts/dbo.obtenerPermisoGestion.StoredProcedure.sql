USE [mptest]
GO
/****** Object:  StoredProcedure [dbo].[obtenerPermisoGestion]    Script Date: 8/06/2025 15:12:25 ******/
DROP PROCEDURE IF EXISTS [dbo].[obtenerPermisoGestion]
GO
/****** Object:  StoredProcedure [dbo].[obtenerPermisoGestion]    Script Date: 8/06/2025 15:12:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Diego Castellanos
-- Create date: 20250607
-- Description:	obtener usuarios
-- =============================================
CREATE PROCEDURE [dbo].[obtenerPermisoGestion] 
	-- Add the parameters for the stored procedure here
    @USR_ID						INT				,
    @TCG_ID						INT				= null,
	@TCG_CODIGO					varchar(10)		= null
    
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT	
			D.[TCG_ID] AS ID
		    ,D.[tcg_codigo] AS CODIGO
		    ,D.[tcg_nombre] AS NOMBRE
		    ,D.[tcg_descripcion] AS DESCRIPCION
		    ,D.[tcg_cambia_estado] AS ESTADO
		    ,D.[tcg_tipo] AS TIPO
	FROM	tbl_sec_perfil_gestion A
	JOIN	tbl_admin_perfiles B ON B.TAP_ID = A.TAP_ID
	JOIN	tbl_admin_usuarios C ON C.TAP_ID = A.TAP_ID AND C.TAP_ID = B.TAP_ID
	JOIN	tbl_cat_gestion D ON D.TCG_ID = A.TCG_ID
	WHERE	D.tcg_activa = 'S'
	AND		C.TAU_ID = @USR_ID
	AND		(@TCG_ID IS NULL OR D.TCG_ID = @TCG_ID)
	AND		(@TCG_CODIGO IS NULL OR D.tcg_codigo = @TCG_CODIGO)

END
GO
