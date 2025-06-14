USE [mptest]
GO
/****** Object:  StoredProcedure [dbo].[obtenerExpedientes]    Script Date: 8/06/2025 15:12:25 ******/
DROP PROCEDURE IF EXISTS [dbo].[obtenerExpedientes]
GO
/****** Object:  StoredProcedure [dbo].[obtenerExpedientes]    Script Date: 8/06/2025 15:12:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Diego Castellanos
-- Create date: 20250607
-- Description:	obtener usuarios
-- =============================================
CREATE PROCEDURE [dbo].[obtenerExpedientes] 
	-- Add the parameters for the stored procedure here
	@TNE_ID INT = null,
	@TAU_ID INT = null,
	@tne_nombre_fiscal VARCHAR(MAX) = null,
	@tne_codigo VARCHAR(100) = null,
	@tne_fecha_recepcion_inicial DATETIME = null,
	@tne_fecha_recepcion_final DATETIME = null,
	@tne_titulo varchar(MAX)= null,
	@tne_descripcion VARCHAR(MAX)= null,
	@tne_estado VARCHAR(100)= null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT 
			 [TNE_ID] AS ID
			,[TAU_ID] AS USR_ID
			,[tne_nombre_fiscal] AS FISCAL
			,[tne_codigo] AS CODIGO
			,[tne_fecha_recepcion] AS RECEPCION
			,[tne_titulo] AS TITULO
			,[tne_descripcion] AS DESCRIPCION
			,[tne_estado] AS ESTADO
	FROM	[mptest].[dbo].[tbl_neg_expediente]
	WHERE	(@TNE_ID IS NULL OR @TNE_ID = TNE_ID)
	AND		(@TAU_ID IS NULL OR @TAU_ID = TAU_ID)
	AND		(@tne_nombre_fiscal IS NULL OR @tne_nombre_fiscal = tne_nombre_fiscal)
	AND		(@tne_codigo IS NULL OR @tne_codigo = tne_codigo)
	AND		(@tne_fecha_recepcion_inicial IS NULL OR @tne_fecha_recepcion_inicial <= tne_fecha_recepcion)
	AND		(@tne_fecha_recepcion_final IS NULL OR @tne_fecha_recepcion_final >= tne_fecha_recepcion)
	AND		(@tne_titulo IS NULL OR @tne_titulo = tne_titulo)
	AND		(@tne_descripcion IS NULL OR @tne_descripcion = tne_descripcion)
	AND		(@tne_estado IS NULL OR @tne_estado = tne_estado)
END
GO
