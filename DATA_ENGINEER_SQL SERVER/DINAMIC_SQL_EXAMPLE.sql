CREATE OR ALTER PROCEDURE [dbo].[D_SQL_EXAMPLE]

AS

	DECLARE @TSQL1 varchar(8000)		--EXECUTION VARIABLE
	DECLARE @FECDES_O AS VARCHAR(17)	--PARAMETER VALUE
	DECLARE @FECHAS_O AS VARCHAR(17)    --PARAMETER VALUE

	SELECT @FECDES_O = CAST(DATEPART(YEAR, MAX(CAST(GETDATE() AS DATETIME) -5)) AS VARCHAR) + 
						 CASE LEN(CAST(DATEPART(MONTH, MAX(CAST(GETDATE() AS DATETIME) -5)) AS VARCHAR))
						 WHEN 1 THEN '0'+ CAST(DATEPART(MONTH, MAX(CAST(GETDATE() AS DATETIME) -5)) AS VARCHAR) 
						 ELSE CAST(DATEPART(MONTH, MAX(CAST(GETDATE() AS DATETIME) -5)) AS VARCHAR) END +
						 CASE LEN(CAST(DATEPART(DAY, MAX(CAST(GETDATE() AS DATETIME) -5)) AS VARCHAR))
						 WHEN 1 THEN '0' + CAST(DATEPART(DAY, MAX(CAST(GETDATE() AS DATETIME) -5)) AS VARCHAR)
						 ELSE CAST(DATEPART(DAY, MAX(CAST(GETDATE() AS DATETIME) -5)) AS VARCHAR) END
		

	SELECT @FECHAS_O = CAST(DATEPART(YEAR, (GETDATE() -1)) AS VARCHAR) +  
						 CASE LEN(CAST(DATEPART(MONTH, (GETDATE() -1)) AS VARCHAR))
						 WHEN 1 THEN '0'+ CAST(DATEPART(MONTH, (GETDATE() -1)) AS VARCHAR)
						 ELSE CAST(DATEPART(MONTH, (GETDATE() -1)) AS VARCHAR) END +
						  CASE LEN(CAST(DATEPART(DAY, MAX(GETDATE() -1)) AS VARCHAR))
						 WHEN 1 THEN '0' + CAST(DATEPART(DAY, MAX(GETDATE() -1)) AS VARCHAR)
						 ELSE CAST(DATEPART(DAY, MAX(GETDATE() -1)) AS VARCHAR) END
					


SELECT  @TSQL1 ='SELECT * FROM YOURTABLE WHERE FECHA BETWEEN ''''' + @FECDES_O +  ''''' AND ''''' + @FECHAS_O +  ''''''')'


EXEC (@TSQL1)