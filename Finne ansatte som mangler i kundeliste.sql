SELECT 
dbo.[Tbl_Kvotefiler fra Zalaris].Ansattnummer,
dbo.[Tbl_Kvotefiler fra Zalaris].Fornavn,
dbo.[Tbl_Kvotefiler fra Zalaris].Etternavn
FROM
dbo.[Tbl_Kvotefiler fra Zalaris]
LEFT JOIN dbo.tbl_kundeliste_med_forskjellige_nummer
ON dbo.[Tbl_Kvotefiler fra Zalaris].Ansattnummer = dbo.tbl_kundeliste_med_forskjellige_nummer.Ansattnr
WHERE dbo.tbl_kundeliste_med_forskjellige_nummer.Ansattnr IS NULL
GROUP BY dbo.[Tbl_Kvotefiler fra Zalaris].Ansattnummer, dbo.[Tbl_Kvotefiler fra Zalaris].Etternavn, dbo.[Tbl_Kvotefiler fra Zalaris].Fornavn
;