
use MSDB
go


select job_id, name from sysjobs_view  where enabled <> 1 order by name
select job_id, a.name from sysjobs_view a where enabled = 1 order by name


select    convert(varchar(42), j.name) as Trabajo

,	case j.enabled	-- FOr when a job funs every few seconds, minutes or hours
		when 1    then 'Habilitado'
		when 0    then 'DesHabilitado' 
	end as Habilitacion

,    case freq_type  -- Daily, weekly, Monthly
		when 1    then 'una vez'
		when 4    then 'Diario'
		when 8    then 'Se ' -- For weekly, add in the days of the week
		+    case      freq_interval & 2 when 2 then 'L' else '' end  -- Monday
		+    case      freq_interval & 4 when 4 then 'Ma' else '' end -- Tuesday
		+    case      freq_interval & 8 when 8 then 'M' else '' end  -- etc
		+    case      freq_interval & 16 when 16 then 'Ju' else '' end
		+    case      freq_interval & 32 when 32 then 'V' else '' end
		+    case      freq_interval & 64 when 64 then 'Sa' else '' end
		+    case      freq_interval & 1 when 1 then 'Do' else '' end
		when 16   then 'Mens el dia ' + convert(varchar(2), freq_interval) -- Monthly on a particular day
		when 32   then 'Mens '  -- The most complicated one, "every third Friday of the month" for example
		+ case freq_relative_interval 
			when 1 then 'Cada Primer '
			when 2 then 'Cada Segundo '
			when 4 then 'Cada Tercer '
			when 8 then 'Cada Cuarto '
			when 16 then 'Cada Ultimo '
		end
		+ case freq_interval	
			when 1 then 'Domingo' 
			when 2 then 'Lunes'
			when 3 then 'Martes' 
			when 4 then 'Miercoles' 
			when 5 then 'Jueves' 
			when 6 then 'Viernes' 
			when 7 then 'Sabado' 
			when 8 then 'Día' 
			when 9 then 'Sem. día'
			when 10 then 'FinDe día'
		end	
	when 64   then 'Inicio'	-- When SQL Server starts
	when 128 then 'Idle'		-- Whenever SQL Server gets bored
	else 'Err'			-- This should never happen
	end as SeEjecuta

,	case h.enabled	-- FOr when a job funs every few seconds, minutes or hours
		when 1    then 'Habilitado'
		when 0    then 'DesHabilitado' 
	end as Programacion

,	case freq_subday_type		-- FOr when a job funs every few seconds, minutes or hours
		when 1    then 'Una vez a:'
		when 2    then 'cada ' + convert(varchar(3), freq_subday_interval) + ' segundos'
		when 4    then 'cada ' + convert(varchar(3), freq_subday_interval) + ' minutos'
		when 8    then 'cada ' + convert(varchar(3), freq_subday_interval) + ' horas'
	end as Frecuencia

	-- All the subsrings are because the times are stored as an integer with no leading zeroes
	-- i.e. 0 means midnight, 13000 means half past one in the morning (01:30:00)

,    	substring (right (stuff (' ', 1, 1, '000000') + convert(varchar(6),active_start_time), 6), 1, 2)
	+    ':'
	+ substring (
	right (stuff (' ', 1, 1, '000000') + convert(varchar(6), active_start_time), 6) ,3 ,2)
	+    ':'
	+ substring (
	right (stuff (' ', 1, 1, '000000') + convert(varchar(6),active_start_time), 6) ,5 ,2) as Inicia

,case	freq_subday_type
	when 1  then NULL  -- Ignore the end time if not a recurring job
	else	substring (right (stuff (' ', 1, 1, '000000') + convert(varchar(6), active_end_time), 6), 1, 2)
	+    ':'
	+ substring (
	right (stuff (' ', 1, 1, '000000') + convert(varchar(6), active_end_time), 6) ,3 ,2)
	+    ':'
	+ substring (
	right (stuff (' ', 1, 1, '000000') + convert(varchar(6), active_end_time), 6) ,5 ,2) end as Finaliza
from	sysjobs j
join 	sysJobSchedules s
on   	j.job_id = s.job_id
JOIN  
sysschedules h ON h.schedule_id = s.schedule_id  
order	by Habilitacion desc, j.name, inicia 


