USE [mptest]
GO
/****** Object:  StoredProcedure [dbo].[obtenerUsuarios]    Script Date: 8/06/2025 15:12:25 ******/
DROP PROCEDURE IF EXISTS [dbo].[obtenerUsuarios]
GO
/****** Object:  StoredProcedure [dbo].[obtenerUsuarios]    Script Date: 8/06/2025 15:12:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Diego Castellanos
-- Create date: 20250607
-- Description:	obtener usuarios
-- =============================================
CREATE PROCEDURE [dbo].[obtenerUsuarios] 
	-- Add the parameters for the stored procedure here
	@USR_ID INT = NULL,
	@PERFIL_ID INT = NULL,
	@USR_LOGIN VARCHAR(100) = NULL,
	@USR_NOMBRE VARCHAR(500) = NULL,
	@USR_ESTADO VARCHAR(1) = NULL

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	
			A.TAU_ID AS USR_ID,
			A.TAP_ID AS PERFIL_ID,
			B.tap_nombre AS PERFIL,
			A.tau_login AS USR_LOGIN,
			A.tau_nombre AS USR_NOMBRE,
			A.tau_activo AS USR_ESTADO,
			A.tau_pass AS USR_PASS
	FROM	tbl_admin_usuarios  A 
	JOIN	tbl_admin_perfiles	B ON B.TAP_ID = A.TAP_ID
	WHERE	(@USR_ID		IS NULL OR A.TAU_ID		= @USR_ID	 )
	AND		(@PERFIL_ID 	IS NULL OR A.TAP_ID		= @PERFIL_ID )
	AND		(@USR_LOGIN 	IS NULL OR A.TAU_LOGIN	= @USR_LOGIN )
	AND		(@USR_NOMBRE	IS NULL OR A.TAU_NOMBRE = @USR_NOMBRE)
	AND		(@USR_ESTADO	IS NULL OR A.TAU_ACTIVO = @USR_ESTADO)


END
GO
