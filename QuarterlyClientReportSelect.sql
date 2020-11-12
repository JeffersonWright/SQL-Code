SELECT 
       [client number]                                AS 'Client Number',
--     [client name]                                  AS 'Client Name',
	   [claim type]                                   AS 'Claim Type',
       [osha recordable flag]                         AS 'Osha Recordable Flag',
	   [classification of case]						  AS 'Classification of Case',
	   [Occupation]                                   AS 'Occupation',
	   [Nature Description]                           AS 'Nature',
	   [Cause Description]                            AS 'Cause',
	   [Object]                                       AS 'Object',
	   [Location Name]                                AS 'Location Name',
--	   [Accident Location]                            AS 'Accident Location',
--	   [occurrence date]                              AS 'Occurrence Date',
	   CONVERT (varchar(10), [create timestamp], 101) AS 'Create Timestamp'
FROM OSHA.dbo.OCE
WHERE [Claim Type] IS NOT NULL
AND [create timestamp] IS NOT NULL
AND [Active] = 'Yes'
ORDER BY [client number] DESC
;