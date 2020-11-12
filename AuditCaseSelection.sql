IF COL_LENGTH('OSHA.dbo.OCE','Audit Unusable') IS NULL
	ALTER TABLE OSHA.dbo.OCE ADD [Audit Unusable] varchar(40);
IF COL_LENGTH('OSHA.dbo.OCE','Number of Notes') IS NULL
	ALTER TABLE OSHA.dbo.OCE ADD [Number of Notes] varchar(40);
GO

UPDATE OSHA.dbo.OCE
SET OSHA.dbo.OCE.[Audit Unusable] = 'delete'
FROM OSHA.dbo.AuditUnusable
WHERE OSHA.dbo.OCE.[File Number] = OSHA.dbo.AuditUnusable.[File Number]
;
UPDATE OSHA.dbo.OCE
SET OSHA.dbo.OCE.[Number of Notes] = OSHA.dbo.NumberOfNotes.[Notes]
FROM OSHA.dbo.NumberOfNotes
WHERE OSHA.dbo.OCE.[File Number] = OSHA.dbo.NumberOfNotes.[File Number]
;

SELECT [Note Made By],[Note Created Date],[Last Note Text],[Number of Notes],
		[Client Number],[Client Name],[AutoIO],[Analyst],
		[File Number],[OSHA Recordable Flag],[Claim Type],[OSHA Work Related],
		[Claim Substatus],[Occurrence Date],[Create Timestamp],[Claim Open Date]
INTO OSHA.dbo.AuditBase --puts the results of this query into a table 
FROM OSHA.dbo.OCE
WHERE
[Active] = 'Yes'
AND [Note Made By] NOT IN ('SYSTEM SYSTEM','Morgan Rains','Dira Pelmore','Soha Athanasios','Kathy Famous','Amber Zollicoffer')
AND NOT (([Client Number] = 1911) AND ([Claim Type] = 'IO'))
AND [Note Made By] IS NOT NULL
AND (
		([AutoIO]='No'
		AND (GETDATE()-[create timestamp])>40
		AND (GETDATE()-[create timestamp])<70
		)
	OR
		(
		[AutoIO]='Yes'
		AND (GETDATE()-[claim open date])>40
		AND (GETDATE()-[claim open date])<70
		)
)
ORDER BY [Note Made By]
	  ,[Number of Notes] DESC
;
SELECT * FROM OSHA.dbo.AuditBase
;

SELECT [Note Made By]
      ,[Client Name]
	  ,COUNT([Client Name]) AS 'Number of Claims'
FROM OSHA.dbo.AuditBase
WHERE [Note Made By] IS NOT NULL
AND [Note Made By] NOT IN ('SYSTEM SYSTEM','Morgan Rains','Dira Pelmore')
GROUP BY [Note Made By],[Client Name]
ORDER BY [Note Made By]
	  ,COUNT([Client Name]) DESC
;

