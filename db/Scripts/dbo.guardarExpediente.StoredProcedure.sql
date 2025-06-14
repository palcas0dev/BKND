USE [mptest]
GO
/****** Object:  StoredProcedure [dbo].[guardarExpediente]    Script Date: 8/06/2025 15:12:25 ******/
DROP PROCEDURE IF EXISTS [dbo].[guardarExpediente]
GO
/****** Object:  StoredProcedure [dbo].[guardarExpediente]    Script Date: 8/06/2025 15:12:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Diego Castellanos
-- Create date: 20250607
-- Description:	obtener usuarios
-- =============================================
CREATE PROCEDURE [dbo].[guardarExpediente] 
	-- Add the parameters for the stored procedure here
	@TAU_ID							INT				= null,
	@tne_nombre_fiscal				VARCHAR(MAX)	= null,
	@tne_codigo						VARCHAR(100)	= null,
	@tne_fecha_recepcion			DATETIME		= null,
	@tne_titulo						varchar(MAX)	= null,
	@tne_descripcion				VARCHAR(MAX)	= null,
	@tne_estado						VARCHAR(100)	= null,
	@USR_LOGIN						VARCHAR(100)	= NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO [dbo].[tbl_neg_expediente]
           ([TAU_ID]
           ,[tne_nombre_fiscal]
           ,[tne_codigo]
           ,[tne_fecha_recepcion]
           ,[tne_titulo]
           ,[tne_descripcion]
           ,[tne_estado]
           ,[updatedAt]
           ,[createdAt]
           ,[updatedBy]
           ,[createdBy])
     VALUES
           (@TAU_ID
           ,@tne_nombre_fiscal
           ,@tne_codigo
           ,@tne_fecha_recepcion
           ,@tne_titulo
           ,@tne_descripcion
           ,@tne_estado
           ,NULL
           ,CURRENT_TIMESTAMP
           ,NULL
           ,@USR_LOGIN)
	
	SELECT * FROM tbl_neg_expediente WHERE  TNE_ID = SCOPE_IDENTITY()
END
GO
