	SELECT 
	dbo.tbl_kundeliste_med_forskjellige_nummer.Ansattnr, dbo.tbl_kundeliste_med_forskjellige_nummer.T0E, 
	dbo.tbl_kundeliste_med_forskjellige_nummer.[T0E Navn], 
	dbo.tbl_kundeliste_med_forskjellige_nummer.Fornavn, 
	dbo.tbl_kundeliste_med_forskjellige_nummer.Etternavn,
	dbo.[Tbl_Kvotefiler fra Zalaris].Oppdatert_dato,
	dbo.[Tbl_kvotefiler fra Zalaris].Salgs_dato,
	dbo.[Tbl_Kvotefiler fra Zalaris].Kvotekode, 
	dbo.[Tbl_Kvotefiler fra Zalaris].Materialnummer, 
	dbo.Tbl_Material_master.Tekst,
	dbo.[Tbl_Kvotefiler fra Zalaris].Øl, 
	dbo.[Tbl_Kvotefiler fra Zalaris].Brus, 
	dbo.[Tbl_Kvotefiler fra Zalaris].Gratis,
	dbo.Tbl_Kvotedefinisjoner.Øl,
	dbo.Tbl_Kvotedefinisjoner.Brus,
	dbo.Tbl_Kvotedefinisjoner.Gratis
	FROM dbo.tbl_kundeliste_med_forskjellige_nummer 
	INNER JOIN dbo.[Tbl_kvotefiler fra Zalaris] 
	ON dbo.tbl_kundeliste_med_forskjellige_nummer.Ansattnr = dbo.[Tbl_kvotefiler fra Zalaris].Ansattnummer 
	LEFT JOIN dbo.Tbl_Kvotedefinisjoner 
	ON dbo.[Tbl_Kvotefiler fra Zalaris].Kvotekode = dbo.Tbl_Kvotedefinisjoner.Kvote
	LEFT JOIN dbo.Tbl_Material_Master
	ON dbo.[Tbl_Kvotefiler fra Zalaris].Materialnummer = dbo.Tbl_Material_Master.BSP1
	WHERE Ansattnr = 7363;