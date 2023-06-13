IF EXISTS (SELECT 1 from SYS.PROCEDURES WHERE NAME = 'GetSQLServerVersionInfo')
BEGIN
DROP PROC [GetSQLServerVersionInfo]
END
GO

CREATE PROC [GetSQLServerVersionInfo]
AS
BEGIN
SET NOCOUNT ON

SELECT @@VERSION [SQL Server Version & Edition];

SELECT SERVERPROPERTY('productversion') [Build Number] , SERVERPROPERTY ('productlevel') [Service Pack], SERVERPROPERTY ('edition') Edition;

/* extended system sproc that returns version info along with info about the server env */ 
EXEC master.dbo.xp_msver;
END
