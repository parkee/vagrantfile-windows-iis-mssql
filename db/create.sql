USE [master]
GO

RESTORE DATABASE [Activity] FROM  DISK = N'C:\vagrant\activity2.bak' WITH  FILE = 1,  MOVE N'Activity' TO N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Activity.mdf',  MOVE N'Activity_log' TO N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Activity_log.ldf',  NOUNLOAD,  STATS = 5
GO

CREATE LOGIN activiti 
    WITH PASSWORD = 'activiti',
	CHECK_POLICY = OFF;
GO

USE [Activity]
GO

-- Creates a database user for the login created above.
CREATE USER activiti FOR LOGIN activiti;
GO

EXEC sp_addrolemember N'db_owner', N'activiti'
EXEC sp_addrolemember N'db_datareader', N'activiti'
EXEC sp_addrolemember N'db_datawriter', N'activiti'

GO

ALTER SERVER ROLE [sysadmin] ADD MEMBER [activiti]
GO
