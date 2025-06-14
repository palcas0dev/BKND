USE [mptest]
GO
/****** Object:  StoredProcedure [dbo].[cerrarSesion]    Script Date: 8/06/2025 15:12:25 ******/
DROP PROCEDURE IF EXISTS [dbo].[cerrarSesion]
GO
/****** Object:  StoredProcedure [dbo].[cerrarSesion]    Script Date: 8/06/2025 15:12:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Diego Castellanos
-- Create date: 20250607
-- Description:	obtener usuarios
-- =============================================
CREATE PROCEDURE [dbo].[cerrarSesion] 
	-- Add the parameters for the stored procedure here
	@USR_ID INT,
	@USR_LOGIN VARCHAR(100)
	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[tbl_admin_sesion]
	   SET [tas_final] = CURRENT_TIMESTAMP
		  ,[updatedAt] = CURRENT_TIMESTAMP
		  ,[updatedBy] = @USR_LOGIN
	 WHERE TAU_ID = @USR_ID
	 AND	tas_final IS NULL


END
GO
