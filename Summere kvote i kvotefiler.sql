	SELECT 
	dbo.[Tbl_Kvotefiler fra Zalaris].Ansattnummer,
	sum(dbo.Tbl_Kvotedefinisjoner.ÿl) AS TotaltÿlKvote,
	sum(dbo.Tbl_Kvotedefinisjoner.Brus) AS TotaltBrusKvote,
	sum(dbo.Tbl_Kvotedefinisjoner.Gratis) AS TotaltGratisKvote
	FROM dbo.[Tbl_Kvotefiler fra Zalaris]
	LEFT JOIN dbo.Tbl_Kvotedefinisjoner 
	ON dbo.[Tbl_Kvotefiler fra Zalaris].Kvotekode = dbo.Tbl_Kvotedefinisjoner.Kvote
	GROUP BY dbo.[Tbl_Kvotefiler fra Zalaris].Ansattnummer
	ORDER BY dbo.[Tbl_Kvotefiler fra Zalaris].Ansattnummer ASC
	;