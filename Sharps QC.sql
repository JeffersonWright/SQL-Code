SELECT [client number]                           AS 'Client Number',
       [client name]                             AS 'Client Name',
	   [file number]                             AS 'File Number',
	   [Analyst]                                 AS 'Current Analyst',
	   [On Previous AQC]                         AS 'On Previous QC',
       [occurrence date]                         AS 'Occurrence Date',
       [employee last name]                      AS 'Employee Last Name',
       [employee first name]                     AS 'Employee First Name',
       [occupation]                              AS 'Occupation',
       [osha recordable flag]                    AS 'Osha Recordable Flag',
       [privacy case flag]                       AS 'Privacy Case Flag',
       [date of death]                           AS 'Date Of Death',
       [accident/illness type]                   AS 'Accident/Illness Type',
       [cause description]                       AS 'Cause Description',
       [body side]                               AS 'Body Side',
       [nature description]                      AS 'Nature Description',
       [body part desc]                          AS 'Body Part Desc',
       [object]                                  AS 'Object',
       [actual days away]                        AS 'Actual Days Away',
       [actual days restricted]                  AS 'Actual Days Restricted',
       [recordable days away]                    AS 'Recordable Days Away',
       [recordable days restricted]              AS 'Recordable Days Restricted', 
       [work status]                             AS 'Work Status',
       [ee date of birth]                        AS 'EE Date Of Birth',
       [sex code]                                AS 'Sex Code',
       [hire date]                               AS 'Hire Date',
       [work time begin]                         AS 'Work Time Begin',
       [event time]                              AS 'Event Time',
       [physician name]                          AS 'Physician Name',
       [hospital name]                           AS 'Hospital Name',
       [hospital address1]                       AS 'Hospital Address1',
       [hospital address2]                       AS 'Hospital Address2',
       [hospital city]                           AS 'Hospital City',
       [hospital state]                          AS 'Hospital State',
       [hospital zip]                            AS 'Hospital Zip',
       [accident location]                       AS 'Accident Location',
       [what was emp doing before the incident?] AS 'What Was Emp Doing Before The Incident?', 
       [what happened?]                          AS 'What Happened?',
       [last updated by]                         AS 'Last Updated By',
       [create timestamp]                        AS 'Create Timestamp',
       [location code]                           AS 'Location Code',
       [location state code]                     AS 'Location State',
       [last note text]                          AS 'Last Note Text',
       [note created date]                       AS 'Note Created Date',
       [note created by]                         AS 'Note Created By',
       [examiner login id/name]                  AS 'Examiner Login Id/Name',
LOWER( [examiner e-mail])                        AS 'Examiner E-Mail', 
       [calendar lost time days]                 AS 'Calendar Lost Time Days',
       [calendar restricted days]                AS 'Calendar Restricted Days',
       [calendar restricted-ntl days]            AS 'Calendar Restricted-Ntl Days', 
       [benefit end date]                        AS 'Benefit End Date',
       [examiner's office]                       AS 'Examiner’s Office',
       [examiner's supervisor]                   AS 'Examiner’s Supervisor',
       [supervisor name]                         AS 'Supervisor Name',
       [claim substatus]                         AS 'Claim Substatus',
       [claim status]                            AS 'Claim Status',
       [denial status date]                      AS 'Denial Status Date',
       [accepted status date]                    AS 'Accepted Status Date',
       [denied reason code]                      AS 'Denied Reason Code',
       [claim type]                              AS 'Claim Type',
       [osha work related]                       AS 'Osha Work Related',
       [date medical note created]               AS 'Date Medical Note Created',
       [medical note]                            AS 'Medical Note',
       [date mc progress report note created]    AS 'Date Mc Progress Report Note Created', 
       [managed care progress report note]       AS 'Managed Care Progress Report Note', 
       [juris nature/result description]         AS 'Juris Nature/Result Description', 
       [juris cause description]                 AS 'Juris Cause Description',
       [juris body part/target description]      AS 'Juris Body Part/Target Description', 
	   [claim open date]						 AS 'Claim Open Date'
FROM OSHA.dbo.OCE
WHERE [Active] = 'Yes'--Excluding Clients not handled by OSHA team
AND [Sharps] = 'Yes'
AND NOT ([AutoIO] = 'Yes'
		 AND [Claim Type] = 'IO'
		 AND [OSHA Recordable Flag] = 'N'
		 AND [Last Note Text] IS NULL) --Excluding not recordable IO claims from IO clients with blank notes
AND NOT (([Client Number] = 1911) AND ([Claim Type] = 'IO'))--Excluding IO claims from Office Depot
AND ([Last Note Text] NOT LIKE 'Pending%' OR [Last Note Text] IS NULL) --Excludes pending claims while keeping LNT nulls
AND (GETDATE() - [Create Timestamp])>10 --Excludes claims created within the last 10 days
AND
([SHARPS How Incident Occurred] IS NULL
OR [SHARPS Body Side] IS NULL
OR [Sharps Type] IS NULL
OR [SHARPS Brand] IS NULL
); 