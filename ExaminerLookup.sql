SELECT [Analyst], [Client Name], [Examiner Login Id/Name], [Examiner E-Mail], COUNT([Examiner Login Id/Name]) FROM OSHA.dbo.OCE WHERE
[Examiner E-Mail] IN ('michelle.hernandez@sedgwick.com')
--[Examiner Login Id/Name] IN ('MHERNAN0')
GROUP BY [Analyst], [Client Name], [Examiner Login Id/Name],[Examiner E-Mail]
ORDER BY [Examiner Login Id/Name] ASC