SELECT  [Client Number],
		[Client Name],
		[File Number],
		[Analyst],
		[Occurrence Date],
		[Create Timestamp],
		[Override Flag],
		[Cause Description],
--		[Juris Cause Description],
		[Nature Description],
--		[Juris Nature/Result Description],
		[Last Note Text],
		[Note Created Date],
		[Object],
		[What happened?],
		[Location Code],
		[Location Name],
		[Location State Code],
		[Medical Note],
		[Managed Care Progress Report Note],
--		[What was emp doing before the incident?],
		[OSHA Recordable Flag],
		[Claim Type],
		[OSHA Work Related],
		[Claim Substatus],
		[Claim Status],
--		[Employee First Name],
--		[Employee Last Name],
		[Body Part Desc],
--		[Juris Body Part/Target Description],
--		[Occupation],
		[Privacy Case Flag],
		[Date of Death],
		[Accident/Illness Type],
		[Classification of Case],
		[Recordable Days Away],
		[Recordable Days Restricted],
		[Work Status],
--		[Accident Location],
		[SHARPS Injury Case],
		[SHARPS Level],
		[Claim Paid - Medical]

FROM OSHA.dbo.OCE
WHERE
[Active] = 'Yes'
AND [Occurrence Date] > '12/31/2019'
--AND [Location State Code] = 'CA'
AND [What happened?] NOT LIKE '%case of corona%'
AND [What happened?] NOT LIKE '%corona extra%'
AND [What happened?] NOT LIKE '%corona familiar%'
AND
([Cause Description] LIKE '%Pandemic%'
OR [Cause Description] LIKE '%Covid%'
OR [Cause Description] LIKE '%Corona%'
OR [JURIS Cause Description] LIKE '%Pandemic%'
OR [JURIS Cause Description] LIKE '%Covid%'
OR [JURIS Cause Description] LIKE '%Corona%'

OR [Nature Description] LIKE '%Pandemic%'
OR [Nature Description] LIKE '%Covid%'
OR [Nature Description] LIKE '%Corona%'
OR [JURIS Nature/Result Description] LIKE '%Pandemic%'
OR [JURIS Nature/Result Description] LIKE '%Covid%'
OR [JURIS Nature/Result Description] LIKE '%Corona%'

OR [Object] LIKE '%Pandemic%'
OR [Object] LIKE '%Covid%'
OR [Object] LIKE '%Corona%'

OR [What happened?] LIKE '%Covid%'
OR [What happened?] LIKE '%Corona%'

OR [Last Note Text] LIKE '%Covid%'
OR [Last Note Text] LIKE '%Corona%'

OR ([Medical Note] LIKE '%Covid%' OR [Medical Note] LIKE '%Corona%' OR [Managed Care Progress Report Note] LIKE '%Covid%' OR [Managed Care Progress Report Note] LIKE '%Corona%'
	AND ([Cause Description] LIKE '%Pandemic%' OR [Cause Description] LIKE '%Covid%' OR [Cause Description] LIKE '%Corona%')
	)

OR [What was emp doing before the incident?] LIKE '%Covid%'
OR [What was emp doing before the incident?] LIKE '%Corona%')

ORDER BY [Client Number] ASC

