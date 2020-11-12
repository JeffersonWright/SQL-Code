SELECT [File Number], [Occurrence Date], [Employee First Name], [Employee Last Name], [Client Name], [Client Number], [Osha Recordable Flag], [Claim Type]
FROM OSHA.dbo.OCE
WHERE [Claim Type] IS NULL
ORDER BY [Analyst]
