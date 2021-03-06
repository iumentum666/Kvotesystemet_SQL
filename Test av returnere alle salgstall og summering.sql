	SELECT 
		dbo.tbl_kundeliste_med_forskjellige_nummer.Ansattnr, 
		dbo.tbl_kundeliste_med_forskjellige_nummer.T0E, 
		dbo.tbl_kundeliste_med_forskjellige_nummer.[T0E Navn], 
		dbo.tbl_kundeliste_med_forskjellige_nummer.Fornavn, 
		dbo.tbl_kundeliste_med_forskjellige_nummer.Etternavn,
		sum(isnull(dbo.Tbl_Kvotedefinisjoner.Øl,0) - isnull(dbo.[Tbl_Kvotefiler fra Zalaris].Øl,0)) AS TotaltØl, 
		sum(isnull(dbo.Tbl_Kvotedefinisjoner.Brus,0) - isnull(dbo.[Tbl_Kvotefiler fra Zalaris].Brus,0)) AS TotaltBrus, 
		sum(isnull(dbo.Tbl_Kvotedefinisjoner.Gratis,0) - isnull(dbo.[Tbl_Kvotefiler fra Zalaris].Gratis,0)) AS TotaltGratis
	FROM dbo.tbl_kundeliste_med_forskjellige_nummer 
		
	INNER JOIN dbo.[Tbl_kvotefiler fra Zalaris] 
		ON dbo.tbl_kundeliste_med_forskjellige_nummer.Ansattnr = dbo.[Tbl_kvotefiler fra Zalaris].Ansattnummer 
	
	LEFT JOIN dbo.Tbl_Kvotedefinisjoner 
		ON dbo.[Tbl_Kvotefiler fra Zalaris].Kvotekode = dbo.Tbl_Kvotedefinisjoner.Kvote
	
	LEFT JOIN dbo.Tbl_Material_Master
		ON dbo.[Tbl_Kvotefiler fra Zalaris].Materialnummer = dbo.Tbl_Material_Master.BSP1
	WHERE dbo.tbl_kundeliste_med_forskjellige_nummer.Ansattnr = 7363
	GROUP BY 
		dbo.tbl_kundeliste_med_forskjellige_nummer.Ansattnr, 
		dbo.tbl_kundeliste_med_forskjellige_nummer.T0E, 
		dbo.tbl_kundeliste_med_forskjellige_nummer.[T0E Navn], 
		dbo.tbl_kundeliste_med_forskjellige_nummer.Fornavn, 
		dbo.tbl_kundeliste_med_forskjellige_nummer.Etternavn
	ORDER BY dbo.tbl_kundeliste_med_forskjellige_nummer.Ansattnr ASC
	;