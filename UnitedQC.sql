ALTER TABLE OSHA.dbo.UALOCE ALTER COLUMN [Last Note Text] nvarchar(4000)
;
IF COL_LENGTH('OSHA.dbo.UALOCE','UALQC') IS NULL
	ALTER TABLE OSHA.dbo.UALOCE ADD [UALQC] varchar(40);
IF COL_LENGTH('OSHA.dbo.UALOCE','OSHA Code') IS NULL
	ALTER TABLE OSHA.dbo.UALOCE ADD [OSHA Code] varchar(40);
IF COL_LENGTH('OSHA.dbo.UALOCE','SIF') IS NULL
	ALTER TABLE OSHA.dbo.UALOCE ADD [SIF] varchar(40);
IF COL_LENGTH('OSHA.dbo.UALOCE','Site of the Injury - Other') IS NULL
	ALTER TABLE OSHA.dbo.UALOCE ADD [Site of the Injury - Other] varchar(40);
IF COL_LENGTH('OSHA.dbo.UALOCE','Work related hearing loss report?') IS NULL
	ALTER TABLE OSHA.dbo.UALOCE ADD [Work related hearing loss report?] varchar(40);

EXEC [OSHA].[dbo].[UALQC]
;
SELECT 
--	   [client number]                           AS 'Client Number',
       [client name]                             AS 'Client Name',
	   [file number]                             AS 'File Number',
	   [UALQC]									 AS 'UAL QC',
       [occurrence date]                         AS 'Occurrence Date',
	   [Create Timestamp]						 AS 'Date Created',
--       [employee last name]                      AS 'Employee Last Name',
--       [employee first name]                     AS 'Employee First Name',
	   [OSHA Code]								 AS 'OSHA Code',
	   [SIF]									 AS 'SIF',
	   [Site of the Injury - Other]				 AS 'Site of the Injury - Other',
	   [Work related hearing loss report?]       AS 'Work related hearing loss report?',
	   [Classification of Case]					 AS 'Classification of Case',
	   [osha recordable flag]                    AS 'Osha Recordable Flag',
	   [claim type]                              AS 'Claim Type',
       [osha work related]                       AS 'Osha Work Related',
       [occupation]                              AS 'Occupation',
       [cause description]                       AS 'Cause Description',
       [nature description]                      AS 'Nature Description',
       [body part desc]                          AS 'Body Part Desc',
       [object]                                  AS 'Object',
	   [last note text]                          AS 'Last Note Text',
       [note created date]                       AS 'Note Created Date',
       [note created by]                         AS 'Note Created By',
       [actual days away]                        AS 'Actual Days Away',
       [actual days restricted]                  AS 'Actual Days Restricted',
       [recordable days away]                    AS 'Recordable Days Away',
       [recordable days restricted]              AS 'Recordable Days Restricted', 
	   [calendar lost time days]                 AS 'Calendar Lost Time Days',
       [calendar restricted days]                AS 'Calendar Restricted Days',
       [calendar restricted-ntl days]            AS 'Calendar Restricted-Ntl Days', 
       [accident location]                       AS 'Accident Location',
       [what was emp doing before the incident?] AS 'What Was Emp Doing Before The Incident?', 
       [what happened?]                          AS 'What Happened?',
       [location code]                           AS 'Location Code',
       [location state code]                     AS 'Location State',
LOWER( [examiner e-mail])                        AS 'Examiner E-Mail', 
	   [work status]                             AS 'Work Status',
	   [benefit end date]                        AS 'Benefit End Date',
       [claim substatus]                         AS 'Claim Substatus',
       [claim status]                            AS 'Claim Status',
       [juris nature/result description]         AS 'Juris Nature/Result Description', 
       [juris cause description]                 AS 'Juris Cause Description',
       [juris body part/target description]      AS 'Juris Body Part/Target Description', 
	   [Claim Paid - Medical]					 AS 'Claim Paid - Medical'
FROM OSHA.dbo.UALOCE
WHERE [UALQC] IS NOT NULL
AND NOT ([UALQC] LIKE 'MCF' AND [OSHA CODE] IN ('4','5'))
AND [UALQC] NOT LIKE 'Restricted > 90'
AND [File Number] NOT IN
(
'301928371570001',
'395815OIS395259',
'301925510370001',
'401194OIS400610',
'401394OIS400810',
'402762OIS402161',
'404697OIS404026',
'395792OIS395236',
'302053408270001',
'395815OIS395259',
'301925510370001',
'301941577220001',
'302045779410001',
'403732OIS403118',
'405003OIS404329',
'401194OIS400610',
'401394OIS400810'	

)
ORDER BY [UALQC] ASC, [OSHA Code] ASC
;
SELECT 
--	   [client number]                           AS 'Client Number',
       [client name]                             AS 'Client Name',
	   [file number]                             AS 'File Number',
	   [UALQC]									 AS 'UAL QC',
       [occurrence date]                         AS 'Occurrence Date',
--       [employee last name]                      AS 'Employee Last Name',
--       [employee first name]                     AS 'Employee First Name',
	   [OSHA Code]								 AS 'OSHA Code',
	   [SIF]									 AS 'SIF',
	   [Site of the Injury - Other]				 AS 'Site of the Injury - Other',
	   [Work related hearing loss report?]       AS 'Work related hearing loss report?',
	   [Classification of Case]					 AS 'Classification of Case',
	   [osha recordable flag]                    AS 'Osha Recordable Flag',
	   [claim type]                              AS 'Claim Type',
       [osha work related]                       AS 'Osha Work Related',
       [occupation]                              AS 'Occupation',
       [cause description]                       AS 'Cause Description',
       [nature description]                      AS 'Nature Description',
       [body part desc]                          AS 'Body Part Desc',
       [object]                                  AS 'Object',
	   [last note text]                          AS 'Last Note Text',
       [note created date]                       AS 'Note Created Date',
       [note created by]                         AS 'Note Created By',
       [actual days away]                        AS 'Actual Days Away',
       [actual days restricted]                  AS 'Actual Days Restricted',
       [recordable days away]                    AS 'Recordable Days Away',
       [recordable days restricted]              AS 'Recordable Days Restricted', 
	   [calendar lost time days]                 AS 'Calendar Lost Time Days',
       [calendar restricted days]                AS 'Calendar Restricted Days',
       [calendar restricted-ntl days]            AS 'Calendar Restricted-Ntl Days', 
       [accident location]                       AS 'Accident Location',
       [what was emp doing before the incident?] AS 'What Was Emp Doing Before The Incident?', 
       [what happened?]                          AS 'What Happened?',
       [location code]                           AS 'Location Code',
       [location state code]                     AS 'Location State',
LOWER( [examiner e-mail])                        AS 'Examiner E-Mail', 
	   [work status]                             AS 'Work Status',
	   [benefit end date]                        AS 'Benefit End Date',
       [claim substatus]                         AS 'Claim Substatus',
       [claim status]                            AS 'Claim Status',
       [juris nature/result description]         AS 'Juris Nature/Result Description', 
       [juris cause description]                 AS 'Juris Cause Description',
       [juris body part/target description]      AS 'Juris Body Part/Target Description', 
	   [Claim Paid - Medical]					 AS 'Claim Paid - Medical'
FROM OSHA.dbo.UALOCE
WHERE [UALQC] = 'MCF'
AND [OSHA Code] IN ('4','5')
ORDER BY [UALQC] ASC, [OSHA Code] ASC
;
SELECT 
--	   [client number]                           AS 'Client Number',
       [client name]                             AS 'Client Name',
	   [file number]                             AS 'File Number',
	   [UALQC]									 AS 'UAL QC',
       [occurrence date]                         AS 'Occurrence Date',
--       [employee last name]                      AS 'Employee Last Name',
--       [employee first name]                     AS 'Employee First Name',
	   [OSHA Code]								 AS 'OSHA Code',
	   [SIF]									 AS 'SIF',
	   [Site of the Injury - Other]				 AS 'Site of the Injury - Other',
	   [Work related hearing loss report?]       AS 'Work related hearing loss report?',
	   [Classification of Case]					 AS 'Classification of Case',
	   [osha recordable flag]                    AS 'Osha Recordable Flag',
	   [claim type]                              AS 'Claim Type',
       [osha work related]                       AS 'Osha Work Related',
       [occupation]                              AS 'Occupation',
       [cause description]                       AS 'Cause Description',
       [nature description]                      AS 'Nature Description',
       [body part desc]                          AS 'Body Part Desc',
       [object]                                  AS 'Object',
	   [last note text]                          AS 'Last Note Text',
       [note created date]                       AS 'Note Created Date',
       [note created by]                         AS 'Note Created By',
       [actual days away]                        AS 'Actual Days Away',
       [actual days restricted]                  AS 'Actual Days Restricted',
       [recordable days away]                    AS 'Recordable Days Away',
       [recordable days restricted]              AS 'Recordable Days Restricted', 
	   [calendar lost time days]                 AS 'Calendar Lost Time Days',
       [calendar restricted days]                AS 'Calendar Restricted Days',
       [calendar restricted-ntl days]            AS 'Calendar Restricted-Ntl Days', 
       [accident location]                       AS 'Accident Location',
       [what was emp doing before the incident?] AS 'What Was Emp Doing Before The Incident?', 
       [what happened?]                          AS 'What Happened?',
       [location code]                           AS 'Location Code',
       [location state code]                     AS 'Location State',
LOWER( [examiner e-mail])                        AS 'Examiner E-Mail', 
	   [work status]                             AS 'Work Status',
	   [benefit end date]                        AS 'Benefit End Date',
       [claim substatus]                         AS 'Claim Substatus',
       [claim status]                            AS 'Claim Status',
       [juris nature/result description]         AS 'Juris Nature/Result Description', 
       [juris cause description]                 AS 'Juris Cause Description',
       [juris body part/target description]      AS 'Juris Body Part/Target Description', 
	   [Claim Paid - Medical]					 AS 'Claim Paid - Medical'
FROM OSHA.dbo.UALOCE
WHERE [UALQC] LIKE 'Restricted > 90'
ORDER BY [UALQC] ASC, [OSHA Code] ASC