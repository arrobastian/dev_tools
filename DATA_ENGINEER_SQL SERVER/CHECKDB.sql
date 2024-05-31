SELECT name ,size/128.0 - CAST(FILEPROPERTY(name, 'SpaceUsed') AS int)/128.0 AS AvailableSpaceInMB  
FROM sys.database_files;  

DBCC SQLPERF(LOGSPACE);  

DBCC SQLPERF("sys.dm_os_wait_stats",CLEAR); 
DBCC CHECKDB
DBCC CHECKALLOC
