USE [mptest]
GO
/****** Object:  StoredProcedure [dbo].[obtenerSesion]    Script Date: 8/06/2025 15:12:25 ******/
DROP PROCEDURE IF EXISTS [dbo].[obtenerSesion]
GO
/****** Object:  StoredProcedure [dbo].[obtenerSesion]    Script Date: 8/06/2025 15:12:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Diego Castellanos
-- Create date: 20250607
-- Description:	obtener usuarios
-- =============================================
CREATE PROCEDURE [dbo].[obtenerSesion] 
	-- Add the parameters for the stored procedure here
	@USR_ID INT,
	@TOKEN varchar(max)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT TOP 1
			   [TAU_ID]
			   ,[tas_inicio]
			   ,[tas_final]
			   ,[tas_token]
			   ,[updatedAt]
			   ,[createdAt]
			   ,[updatedBy]
			   ,[createdBy]
	FROM	[dbo].[tbl_admin_sesion]
	WHERE	tas_final IS NULL
	AND		TAU_ID = @USR_ID
	AND		tas_token = @TOKEN
END
GO
