use master
go

sp_configure 'allow updates',0
go
reconfigure with override
go
sp_resetstatus consolidado


sp_configure 'allow updates',0
go

reconfigure with override
go