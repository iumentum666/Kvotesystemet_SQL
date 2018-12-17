-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alexander Nyg�rd
-- Create date: 17.12.2018
-- Description:	Finner kvoter pr ansatt
-- =============================================
CREATE PROCEDURE FinneKvoter 
	-- Add the parameters for the stored procedure here
	@Ansattnummer FLOAT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		dbo.tbl_kundeliste_med_forskjellige_nummer.Ansattnr, 
		dbo.tbl_kundeliste_med_forskjellige_nummer.T0E, 
		dbo.tbl_kundeliste_med_forskjellige_nummer.[T0E Navn], 
		dbo.tbl_kundeliste_med_forskjellige_nummer.Fornavn, 
		dbo.tbl_kundeliste_med_forskjellige_nummer.Etternavn,
		sum(isnull(dbo.Tbl_Kvotedefinisjoner.�l,0) - isnull(dbo.[Tbl_Kvotefiler fra Zalaris].�l,0)) AS Totalt�l, 
		sum(isnull(dbo.Tbl_Kvotedefinisjoner.Brus,0) - isnull(dbo.[Tbl_Kvotefiler fra Zalaris].Brus,0)) AS TotaltBrus, 
		sum(isnull(dbo.Tbl_Kvotedefinisjoner.Gratis,0) - isnull(dbo.[Tbl_Kvotefiler fra Zalaris].Gratis,0)) AS TotaltGratis
	FROM dbo.tbl_kundeliste_med_forskjellige_nummer 
		
	INNER JOIN dbo.[Tbl_kvotefiler fra Zalaris] 
		ON dbo.tbl_kundeliste_med_forskjellige_nummer.Ansattnr = dbo.[Tbl_kvotefiler fra Zalaris].Ansattnummer 
	
	LEFT JOIN dbo.Tbl_Kvotedefinisjoner 
		ON dbo.[Tbl_Kvotefiler fra Zalaris].Kvotekode = dbo.Tbl_Kvotedefinisjoner.Kvote
	
	LEFT JOIN dbo.Tbl_Material_Master
		ON dbo.[Tbl_Kvotefiler fra Zalaris].Materialnummer = dbo.Tbl_Material_Master.BSP1
	WHERE dbo.tbl_kundeliste_med_forskjellige_nummer.Ansattnr = @Ansattnummer
	GROUP BY 
		dbo.tbl_kundeliste_med_forskjellige_nummer.Ansattnr, 
		dbo.tbl_kundeliste_med_forskjellige_nummer.T0E, 
		dbo.tbl_kundeliste_med_forskjellige_nummer.[T0E Navn], 
		dbo.tbl_kundeliste_med_forskjellige_nummer.Fornavn, 
		dbo.tbl_kundeliste_med_forskjellige_nummer.Etternavn
	ORDER BY dbo.tbl_kundeliste_med_forskjellige_nummer.Ansattnr ASC
	;
	
END
GO
