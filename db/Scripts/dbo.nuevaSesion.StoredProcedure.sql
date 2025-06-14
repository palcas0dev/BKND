USE [mptest]
GO
/****** Object:  StoredProcedure [dbo].[nuevaSesion]    Script Date: 8/06/2025 15:12:25 ******/
DROP PROCEDURE IF EXISTS [dbo].[nuevaSesion]
GO
/****** Object:  StoredProcedure [dbo].[nuevaSesion]    Script Date: 8/06/2025 15:12:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Diego Castellanos
-- Create date: 20250607
-- Description:	obtener usuarios
-- =============================================
CREATE PROCEDURE [dbo].[nuevaSesion] 
	-- Add the parameters for the stored procedure here
	@USR_ID INT,
	@TOKEN varchar(max),
	@USR_LOGIN VARCHAR(100)
	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO [dbo].[tbl_admin_sesion]
			   ([TAU_ID]
			   ,[tas_inicio]
			   ,[tas_final]
			   ,[tas_token]
			   ,[updatedAt]
			   ,[createdAt]
			   ,[updatedBy]
			   ,[createdBy])
		 VALUES
			   (@USR_ID
			   ,CURRENT_TIMESTAMP
			   ,null
			   ,@TOKEN
			   ,NULL
			   ,CURRENT_TIMESTAMP
			   ,NULL
			   ,@USR_LOGIN)

END
GO
