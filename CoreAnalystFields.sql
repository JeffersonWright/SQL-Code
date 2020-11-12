SELECT [client number]                           AS 'Client Number',
       [client name]                             AS 'Client Name',
	   [file number]                             AS 'File Number',
	   [Analyst]                                 AS 'Current Analyst',
	   [osha recordable flag]                    AS 'Osha Recordable Flag',
	   [last note text]                          AS 'Last Note Text',
       [note created date]                       AS 'Note Created Date',
       [note created by]                         AS 'Note Created By',
       [occurrence date]                         AS 'Occurrence Date',
	   [claim type]                              AS 'Claim Type',
       [osha work related]                       AS 'Osha Work Related',
       [privacy case flag]                       AS 'Privacy Case Flag',
       [claim substatus]                         AS 'Claim Substatus',
       [claim status]                            AS 'Claim Status',
       [accident/illness type]                   AS 'Accident/Illness Type',
       [cause description]                       AS 'Cause Description',
       [body side]                               AS 'Body Side',
       [nature description]                      AS 'Nature Description',
       [body part desc]                          AS 'Body Part Desc',
       [object]                                  AS 'Object',
       [accident location]                       AS 'Accident Location',
       [create timestamp]                        AS 'Create Timestamp'
FROM OSHA.dbo.OCE
WHERE 
([Client Number] IN (1639,	1855,	1970,	2032,	2045,	2252,	2576,	2807,	4021,	4186,	4263,	4795,	5472,	6458,	6728,	8847,	9203)
AND [Analyst] IS NOT NULL

) 
;