SELECT  [Client Number],
		[Client Name],
		[File Number],
		[Occurrence Date],
		[OSHA Recordable Flag],
		[OSHA Work Related],
		[Create Timestamp],
		[Accident Location],
		[Cause Description],
		[Juris Cause Description],
		[Nature Description],
		[Juris Nature/Result Description],
		[Object],
		[What happened?],
		[Last Note Text],
		[Medical Note],
		[Managed Care Progress Report Note],
		[What was emp doing before the incident?],
		[Claim Type],
		[Claim Substatus],
		[Claim Status],
		[Employee First Name],
		[Employee Last Name],
		[Body Part Desc],
		[Juris Body Part/Target Description],
		[Occupation],
		[Privacy Case Flag],
		[Date of Death],
		[Accident/Illness Type],
		[Classification of Case],
		[Recordable Days Away],
		[Recordable Days Restricted],
		[Work Status],
		[Location Code],
		[Location Name],
		[Location State Code]

FROM OSHA.dbo.LowesCovid
WHERE
--[Client Number] = '2807' AND
([OSHA Recordable Flag] = 'Y'
OR [OSHA Work Related] = 'Y')
AND(
[Cause Description] LIKE '%Pandemic%'
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
OR [What was emp doing before the incident?] LIKE '%Covid%'
OR [What was emp doing before the incident?] LIKE '%Corona%'
OR [Last Note Text] LIKE '%Pandemic%'
OR [Last Note Text] LIKE '%Covid%'
OR [Last Note Text] LIKE '%Corona%'
OR [What happened?] LIKE '%Covid%'
OR [What happened?] LIKE '%Corona%'
--OR ([Medical Note] LIKE '%Covid%' OR [Medical Note] LIKE '%Corona%' OR [Managed Care Progress Report Note] LIKE '%Covid%' OR [Managed Care Progress Report Note] LIKE '%Corona%')
)
AND [File Number] NOT IN (
'302045398350001',
'302051174430001',
'302047389840001',
'302047340840001',
'302047349580001',
'302048037490001',
'302048519550001',
'302049663650001',
'302049841320001',
'302051472900001',
'200512597940001',
'302053289880001',
'302053289160001',
'302053517160001',
'302054525970001',
'302057507130001',
'302057507110001',
'302055131400001',
'302059482530001',
'302055797120001',
'302050028790001',
'302057493160001',
'302058327200001',
'302061729950001',
'302062387060001'


)

ORDER BY [Occurrence Date] ASC

