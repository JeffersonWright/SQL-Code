SELECT  [Client Number],
		[Client Name],
		[File Number],
		[OSHA Recordable Flag],
		[Claim Type],
		[OSHA Work Related],
		[Claim Substatus],
		[Claim Status],
		[Occurrence Date],
		CAST([Create Timestamp] AS DATE),
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
		[Accident Location],
		[Location Code],
		[Location Name],
		[Location State Code],
		[SHARPS Injury Case],
		[SHARPS Level],
		[Claim Paid - Medical]

FROM OSHA.dbo.OCE
WHERE
[Client Number] IN (
'7009',	--San Diego Unified School District
'7014',	--Alameda Contra Costa Transit District
'7020',	--Garvey Elementary School District
'7021',	--Whittier Area S.I.A.
'7082',	--Monroe Public Schools
'7267',	--California JPIA
'7272',	--City of Alhambra
'7273',	--City of Azusa
'7275',	--City of Monrovia
'7279',	--City of West Covina
'7280',	--City of West Hollywood
'7374',	--NCCSIF
'7385'	--

)
--AND [OSHA Recordable Flag] NOT LIKE 'Y'
--AND [OSHA Recordable Flag] NOT LIKE 'N'
ORDER BY [Client Number] ASC

