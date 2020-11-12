SELECT [client number]                           AS 'Client Number',
       [client name]                             AS 'Client Name',
	   [file number]                             AS 'File Number',
	   [cause description]                       AS 'Cause Description',
	   [juris cause description]                 AS 'Juris Cause Description',
       [nature description]                      AS 'Nature Description',
	   [juris nature/result description]         AS 'Juris Nature/Result Description', 
       [body part desc]                          AS 'Body Part Desc',
       [juris body part/target description]      AS 'Juris Body Part/Target Description',
       [object]                                  AS 'Object',
	   [what was emp doing before the incident?] AS 'What Was Emp Doing Before The Incident?', 
       [what happened?]                          AS 'What Happened?',
	   [occurrence date]                         AS 'Occurrence Date',
       [employee last name]                      AS 'Employee Last Name',
       [employee first name]                     AS 'Employee First Name',
	   [occupation]                              AS 'Occupation',
       [osha recordable flag]                    AS 'Osha Recordable Flag',
       [privacy case flag]                       AS 'Privacy Case Flag',
	   [claim type]                              AS 'Claim Type',
       [osha work related]                       AS 'Osha Work Related',
       [create timestamp]                        AS 'Create Timestamp',
       [last note text]                          AS 'Last Note Text',
       [note created date]                       AS 'Note Created Date',
       [note created by]                         AS 'Note Created By',
LOWER( [examiner e-mail])                        AS 'Examiner E-Mail'

--INTO OSHA.dbo._QC_Genesis --puts the results of this query into a table 
FROM OSHA.dbo.OCE
WHERE [client number] = 9288 --Genesis
AND(
	(--1
		[Cause Description] LIKE 'Bitten'
		AND [what happened?] NOT LIKE '%patient%'
		AND [what happened?] NOT LIKE '%resident%'
	)
	OR(--2
		([juris cause description] LIKE '%Mold%' OR [Cause Description] LIKE '%Mildew%')
		AND [Object] NOT LIKE '%mold%'
	)
	OR(--3
		[juris cause description] LIKE 'Struck/Injured By Fellow Worker, Patient'
		AND (
			[what happened?] LIKE '%patient%'
			OR [what happened?] LIKE '%resident%'
		)
	)
	OR(--4
		[juris cause description] LIKE 'Struck/Injured By Patient'
		AND [what happened?] LIKE '%coworker%'
		AND [what happened?] NOT LIKE '%patient%'
		AND [what happened?] NOT LIKE '%resident%'
	)
/*	OR(--5
		([what happened?] LIKE '%elevator%'
		OR [what happened?] LIKE '%cart%'
		OR [what happened?] LIKE '%wheelchair%'
		)
		AND [Object] NOT LIKE '%elevator%'
		AND [Object] NOT LIKE '%cart%'
		AND [Object] NOT LIKE '%wheelchair%'
		AND [Object] NOT LIKE '%wheel_chair%'	 
	)
*/
)
ORDER BY [Cause Description] ASC