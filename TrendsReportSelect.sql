SELECT [file number]                                  AS 'File Number',
       [occurrence date]                              AS 'Occurrence Date',
       [osha recordable flag]                         AS 'Osha Recordable Flag',
	   CONVERT (varchar(10), [create timestamp], 101) AS 'Create Timestamp',
       [client number]                                AS 'Client Number',
       [client name]                                  AS 'Client Name',
	   [claim type]                                   AS 'Claim Type'
FROM OSHA.dbo.OCE
WHERE [client number] NOT IN ('1954','1955','1969','1978','1987','2036','2044','2285','2326','2365','2473','2643','2905','6143','6163','6384','6396','6858','6907','6921','8523')
AND [Claim Type] IS NOT NULL
AND [Active] = 'Yes'
ORDER BY [create timestamp]
;