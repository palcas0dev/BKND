USE [mptest]
GO
/****** Object:  StoredProcedure [dbo].[actualizarEstadoExpediente]    Script Date: 8/06/2025 15:12:25 ******/
DROP PROCEDURE IF EXISTS [dbo].[actualizarEstadoExpediente]
GO
/****** Object:  StoredProcedure [dbo].[actualizarEstadoExpediente]    Script Date: 8/06/2025 15:12:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Diego Castellanos
-- Create date: 20250607
-- Description:	obtener usuarios
-- =============================================
CREATE PROCEDURE [dbo].[actualizarEstadoExpediente] 
	-- Add the parameters for the stored procedure here
	@TNE_ID							INT				= null,
	@tne_estado						VARCHAR(100)	= null,
	@USR_LOGIN						VARCHAR(100)	= NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[tbl_neg_expediente]
	   SET [tne_estado] = @tne_estado
		  ,[updatedAt] = CURRENT_TIMESTAMP
		  ,[updatedBy] = @USR_LOGIN
	 WHERE TNE_ID = @TNE_ID

END
GO
