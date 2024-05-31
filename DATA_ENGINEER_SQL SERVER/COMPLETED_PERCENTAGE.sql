SELECT	session_id,
		start_time,
		status,
		blocking_session_id,
		wait_type,
		wait_time,
		percent_complete [Porcentaje completado],
		estimated_completion_time/1000/60 [Mins. restantes],
		total_elapsed_time/1000/60 [Mins. transcurridos]
FROM	sys.dm_exec_requests
WHERE	command LIKE '%Compact%';
