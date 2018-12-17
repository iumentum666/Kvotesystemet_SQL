SELECT
  dbo.[Tbl_Kvotefiler fra Zalaris].Ansattnummer,
  SUM(dbo.[Tbl_Kvotefiler fra Zalaris].ÿl) AS TotalÿlSalg,
  SUM(dbo.[Tbl_Kvotefiler fra Zalaris].Brus) AS TotalBrusSalg,
  SUM(dbo.[Tbl_Kvotefiler fra Zalaris].Gratis) AS TotalGratisSalg
  FROM dbo.[Tbl_Kvotefiler fra Zalaris]
  GROUP BY dbo.[Tbl_Kvotefiler fra Zalaris].Ansattnummer
  ORDER BY dbo.[Tbl_Kvotefiler fra Zalaris].Ansattnummer ASC
  ;