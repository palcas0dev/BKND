USE [mptest]
GO
/****** Object:  StoredProcedure [dbo].[guardarGestionExpediente]    Script Date: 8/06/2025 15:12:25 ******/
DROP PROCEDURE IF EXISTS [dbo].[guardarGestionExpediente]
GO
/****** Object:  StoredProcedure [dbo].[guardarGestionExpediente]    Script Date: 8/06/2025 15:12:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Diego Castellanos
-- Create date: 20250607
-- Description:	obtener usuarios
-- =============================================
CREATE PROCEDURE [dbo].[guardarGestionExpediente] 
	-- Add the parameters for the stored procedure here
	@TNE_ID						INT				= null,
    @TCG_ID						INT				= null,
    @TAU_ID						INT				= null,
    @tneg_fecha_gestion		    DATETIME		= NULL,
    @tneg_mensaje				VARCHAR(MAX)	= NULL,
    @tneg_info					VARCHAR(MAX)	= NULL,
    @tneg_estado				VARCHAR(100)	= NULL,
	@USR_LOGIN					varchar(100)	= NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [dbo].[tbl_neg_expediente_gestion]
			   ([TNE_ID]
			   ,[TCG_ID]
			   ,[TAU_ID]
			   ,[tneg_fecha_gestion]
			   ,[tneg_mensaje]
			   ,[tneg_info]
			   ,[tneg_estado]
			   ,[updatedAt]
			   ,[createdAt]
			   ,[updatedBy]
			   ,[createdBy])
		 VALUES
			   (@TNE_ID
			   ,@TCG_ID
			   ,@TAU_ID
			   ,@tneg_fecha_gestion
			   ,@tneg_mensaje
			   ,@tneg_info
			   ,@tneg_estado
			   ,null
			   ,CURRENT_TIMESTAMP
			   ,null
			   ,@USR_LOGIN)

		SELECT * FROM tbl_neg_expediente_gestion WHERE TNEG_ID = SCOPE_IDENTITY()

END
GO
