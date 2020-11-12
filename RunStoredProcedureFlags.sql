ALTER TABLE OSHA.dbo.OCE
ALTER COLUMN [Last Note Text] nvarchar(4000);
ALTER TABLE OSHA.dbo.OCE
ALTER COLUMN [Medical Note] nvarchar(4000);
ALTER TABLE OSHA.dbo.OCE
ALTER COLUMN [Managed Care Progress Report Note] nvarchar(4000);

SET ANSI_WARNINGS OFF

EXEC [OSHA].[dbo].[AddRuleColumns];
EXEC [OSHA].[dbo].[ActiveAndAutoIO];
EXEC [OSHA].[dbo].[AnalystAndSupervisor];
EXEC [OSHA].[dbo].[OnPreviousFlag];
			PRINT '[RecordabilityNoteConflict]:'
 EXEC [OSHA].[dbo].[RecordabilityNoteConflict];
			PRINT '[WorkRelatedNoteConflict]:'
 EXEC [OSHA].[dbo].[WorkRelatedNoteConflict];
			PRINT '[PreviousIOs]:'
 EXEC [OSHA].[dbo].[PreviousIOs];
			PRINT '[MDandPRNoteCheck]: row 1 New PR Note, row 2 New MD Note'
 EXEC [OSHA].[dbo].[MDandPRNoteCheck];
			PRINT '[SignificantInjury]:'
 EXEC [OSHA].[dbo].[SignificantInjury];
			PRINT '[LossOfConsciousness]: row 1 Medical Note check, row 2 Event Description check, row 3 JURIS Nature/Result Description check'
 EXEC [OSHA].[dbo].[LossOfConsciousness];
			PRINT '[WoundCase]:'
 EXEC [OSHA].[dbo].[WoundCase];
			PRINT '[TTNote]:'
 EXEC [OSHA].[dbo].[TTNote];
			PRINT '[NoNoteAfterDenialAcceptance]: row 1 Check Denied, row 2 Check Acceptance'
 EXEC [OSHA].[dbo].[NoNoteAfterDenialAcceptance];
			PRINT '[PrivacyChecks]: row 1 Check, row 2 Uncheck'
 EXEC [OSHA].[dbo].[PrivacyChecks];
			PRINT '[OSHADetailCheck]: row 1 Object, row 2 Where did the case occur, row 3 What was EE doing'
 EXEC [OSHA].[dbo].[OSHADetailCheck];
			PRINT '[IllnessCodeCheck]:'
 EXEC [OSHA].[dbo].[IllnessCodeCheck];
			PRINT '[BodySideCheck]:'
 EXEC [OSHA].[dbo].[BodySideCheck];
			PRINT '[JurisFieldCheck]: row 1 JURIS Body Part/Target, row 2 JURIS Nature/Result, row 3 JURIS Cause Desc, row 4 Scabies check, row 5 Concussion not on brain, row 6 Soft tissue fracture'
 EXEC [OSHA].[dbo].[JurisFieldCheck];
			PRINT '[AnalystNoteCheck]:'
 EXEC [OSHA].[dbo].[AnalystNoteCheck];
			PRINT '[NoteTemplateCheck]:'
 EXEC [OSHA].[dbo].[NoteTemplateCheck];
			PRINT '[BlankOccupation]:'
 EXEC [OSHA].[dbo].[BlankOccupation];
			PRINT '[ExpiredBenefitDate]:'
 EXEC [OSHA].[dbo].[ExpiredBenefitDate];
			PRINT '[TimeTrackingChecks]: row 1 Days Away Missing, row 2 Days Restricted Missing, row 3 Days Away Mismatch, row 4 Days Restricted Mismatch'
 EXEC [OSHA].[dbo].[TimeTrackingChecks];
			PRINT '[HospitalAndPhysicianCheck]:'
 EXEC [OSHA].[dbo].[HospitalAndPhysicianCheck];
			PRINT '[TimeAndDateChecks]: row 1 Work Time Begin check, row 2 Event Time check, row 3 Event Time vs Work Begin check, row 4 Hire Date check, row 5 DoB Check, row 6 DoD check'
 EXEC [OSHA].[dbo].[TimeAndDateChecks];
			PRINT '[SexCode]:'
 EXEC [OSHA].[dbo].[SexCode];
			PRINT '[QCforIO]:'
 EXEC [OSHA].[dbo].[QCforIO];
			PRINT '[Overdue]:'
 EXEC [OSHA].[dbo].[Overdue];
 EXEC [OSHA].[dbo].[RemoveBeforeEffective];
 EXEC [OSHA].[dbo].[RemoveCaptive];
 EXEC [OSHA].[dbo].[QCPreventable];


--One-off QC items
SELECT 'Death Check' AS 'Death Check', * FROM OSHA.dbo.OCE WHERE
(GETDATE() - [Create Timestamp])>7 --Excludes claims created within the last 7 days
AND ([date of death check] IS NOT NULL AND [Active] = 'Yes')  --If the claim is a death claim without mentioning death in the note
;

SELECT 'Albertsons Covid Privacy' AS 'Albertsons Covid Privacy', * FROM OSHA.dbo.OCE WHERE --Send to Reva and Megan CC Caroline
(GETDATE() - [Create Timestamp])>7 --Excludes claims created within the last 7 days
AND ([Client Number] IN ('4054','5472','6400','6962') AND [Nature Description] LIKE '%Covid%' AND [OSHA Recordable Flag] = 'Y' AND [Privacy Case Flag] = 'N') --Albertsons Covid claims should all be marked privacy
;

SELECT 'Altres Not Recordable' AS 'Altres Not Recordable', * FROM OSHA.dbo.OCE WHERE --Send to Denise CC Caroline
(GETDATE() - [Create Timestamp])>7 --Excludes claims created within the last 7 days
AND ([Client Number] = '4829' AND [OSHA Recordable Flag] = 'N') --If an Altres claim is not marked Recordable
;

SELECT 'Brightspring Privacy' AS 'Brightspring Privacy', * FROM OSHA.dbo.OCE WHERE --Send to Caroline
(GETDATE() - [Create Timestamp])>7 --Excludes claims created within the last 7 days
AND ([Client Number] = '7000' AND [Privacy Case Flag] = 'N') --If a Brightspring claim is not marked Privacy
;

SELECT 'UHS Loc 607 Covid Privacy' AS 'UHS Loc 607 Covid Privacy', * FROM OSHA.dbo.OCE WHERE --Send to Shawna
(GETDATE() - [Create Timestamp])>7 --Excludes claims created within the last 7 days
AND ([Client Number] = '2576' AND [Location Code] = '607' AND [Privacy Case Flag] = 'N' AND [Nature Description] LIKE '%Covid%') --This UHS location wants all Covid claims marked privacy
;

SELECT 'Target Recordable Denied' AS 'Target Recordable Denied', * FROM OSHA.dbo.OCE WHERE --Send to Nikki CC Ray
(GETDATE() - [Create Timestamp])>7 --Excludes claims created within the last 7 days
AND ([Client Number] = '1639'
AND [OSHA Recordable Flag] = 'Y'
AND [Claim Substatus] = 'D'
AND [Create Timestamp] > 44071
	AND([Last Note Text] NOT LIKE '%Deny%' AND [Last Note Text] NOT LIKE '%Denial%' AND [Last Note Text] NOT LIKE '%Denied%'
		)
); --Target cases that are denied and recordable but do not mention denial in the note
