Cuando no se puede truncar el LOG, lo primero es ver que no este corriendo ni 
backup full ni backup de log, ni ningun proceso sobre la base.
Si despues de todo esto sigue sin truncar el LOG, debe revisarse el campo log_rehuse_wait_desc 
de la tabla [sys.databases]. Si dice: ACTIVE_TRANSACTION es por que esta tomado,  hay que esperar
a que la instancia lo libere. Una vez liberado debe decir: NOTHING.


select log_rehuse_wait, log_rehuse_wait_desc from sys.databases where name = 'AusolCom'