SELECT [Claim Type], [Client Name], [Client Number], [SHARPS Level],	DATEPART(wk, [Create Timestamp]) AS 'Week of Year', CAST([Create Timestamp] AS DATE) AS 'Create', [File Number]
FROM OSHA.dbo.OCE
WHERE
[Active] = 'Yes'
AND [Create Timestamp] > '3/1/2020'
AND [Claim Type] IS NOT NULL
AND [Client Number] NOT IN ('1954','1955','1969','1978','1987','1995','2036','2044','2285','2326','2473','2635','2647','2905','6143','6163','6384','6396','6907','6921','7020','7021','7029','7062','7066','7082','8523') --Excluding clients handled by examiners 
AND	NOT ([Client Number] = 6858 AND [Create Timestamp] < '5/1/2020')
