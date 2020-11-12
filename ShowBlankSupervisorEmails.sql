SELECT [Examiner's Supervisor], [Supervisor Name], [SupervisorEmail], COUNT([Supervisor Name]) 
FROM OSHA.dbo.OCE
WHERE [Supervisoremail] IS NULL
AND [Supervisor Name] <> ''
GROUP BY [Supervisor Name], [Examiner's Supervisor], [SupervisorEmail]
ORDER BY COUNT([Supervisor Name]) DESC