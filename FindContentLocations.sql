SELECT 
    Pkg.PackageID,
    Pkg.Name AS PackageName,
    Pkg.SourceVersion,
    Pkg.PkgSourcePath AS ContentLocation
FROM 
    dbo.v_Package AS Pkg
    JOIN dbo.v_PackageStatusDistPointsSumm AS DistPointSumm ON Pkg.PackageID = DistPointSumm.PackageID
WHERE 
    DistPointSumm.ServerNALPath IS NOT NULL

