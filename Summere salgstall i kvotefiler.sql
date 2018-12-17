SELECT
  dbo.[Tbl_Kvotefiler fra Zalaris].Ansattnummer,
  SUM(dbo.[Tbl_Kvotefiler fra Zalaris].Øl) AS Total,
  SUM(dbo.[Tbl_Kvotefiler fra Zalaris].Brus) AS TotalBrus,
  SUM(dbo.[Tbl_Kvotefiler fra Zalaris].Gratis) AS TotalGratis
  FROM dbo.[Tbl_Kvotefiler fra Zalaris]
  GROUP BY dbo.[Tbl_Kvotefiler fra Zalaris].Ansattnummer
  ORDER BY dbo.[Tbl_Kvotefiler fra Zalaris].Ansattnummer ASC
  ;