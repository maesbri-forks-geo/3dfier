:: rename the files
move bgt_begroeidterreindeel.gml bgt_begroeidterreindeel_org.gml
move bgt_onbegroeidterreindeel.gml bgt_onbegroeidterreindeel_org.gml

:: add the srsDimension to the posList for the kruinlijn
powershell -Command "(gc 'bgt_begroeidterreindeel_org.gml') -replace '<gml:posList>', '<gml:posList srsDimension=\"2\">' | Out-File bgt_begroeidterreindeel.gml" -Encoding ASCII
powershell -Command "(gc 'bgt_onbegroeidterreindeel_org.gml') -replace '<gml:posList>', '<gml:posList srsDimension=\"2\">' | Out-File bgt_onbegroeidterreindeel.gml" -Encoding ASCII

:: convert the files to GPKG, filter eindregistratie and stroke geometries
ogr2ogr -nlt CONVERT_TO_LINEAR -where "eindregistratie is NULL" --config GML_GFS_TEMPLATE bgt_ondersteunendwegdeel.gfs -f GPKG bgt_ondersteunendwegdeel.gpkg bgt_ondersteunendwegdeel.gml
ogr2ogr -nlt CONVERT_TO_LINEAR -where "eindregistratie is NULL" --config GML_GFS_TEMPLATE bgt_wegdeel.gfs -f GPKG bgt_wegdeel.gpkg bgt_wegdeel.gml
ogr2ogr -nlt CONVERT_TO_LINEAR -where "eindregistratie is NULL" --config GML_GFS_TEMPLATE bgt_begroeidterreindeel.gfs -f GPKG bgt_begroeidterreindeel.gpkg bgt_begroeidterreindeel.gml
ogr2ogr -nlt CONVERT_TO_LINEAR -where "eindregistratie is NULL" --config GML_GFS_TEMPLATE bgt_pand.gfs -f GPKG bgt_pand.gpkg bgt_pand.gml
ogr2ogr -nlt CONVERT_TO_LINEAR -where "eindregistratie is NULL" --config GML_GFS_TEMPLATE bgt_onbegroeidterreindeel.gfs -f GPKG bgt_onbegroeidterreindeel.gpkg bgt_onbegroeidterreindeel.gml
ogr2ogr -nlt CONVERT_TO_LINEAR -where "eindregistratie is NULL and OGR_GEOMETRY='CURVEPOLYGON'" --config GML_GFS_TEMPLATE bgt_overbruggingsdeel.gfs -f GPKG bgt_overbruggingsdeel.gpkg bgt_overbruggingsdeel.gml
ogr2ogr -nlt CONVERT_TO_LINEAR -where "eindregistratie is NULL and OGR_GEOMETRY='CURVEPOLYGON'" --config GML_GFS_TEMPLATE bgt_ondersteunendwaterdeel.gfs -f GPKG bgt_ondersteunendwaterdeel.gpkg bgt_ondersteunendwaterdeel.gml
ogr2ogr -nlt CONVERT_TO_LINEAR -where "eindregistratie is NULL and OGR_GEOMETRY='CURVEPOLYGON'" --config GML_GFS_TEMPLATE bgt_overigbouwwerk.gfs -f GPKG bgt_overigbouwwerk.gpkg bgt_overigbouwwerk.gml
ogr2ogr -nlt CONVERT_TO_LINEAR -where "eindregistratie is NULL and OGR_GEOMETRY='CURVEPOLYGON'" --config GML_GFS_TEMPLATE bgt_scheiding.gfs -f GPKG bgt_scheiding.gpkg bgt_scheiding.gml
ogr2ogr -nlt CONVERT_TO_LINEAR -where "eindregistratie is NULL and OGR_GEOMETRY='CURVEPOLYGON'" --config GML_GFS_TEMPLATE bgt_waterdeel.gfs -f GPKG bgt_waterdeel.gpkg bgt_waterdeel.gml
ogr2ogr -nlt CONVERT_TO_LINEAR -where "eindregistratie is NULL and OGR_GEOMETRY='CURVEPOLYGON'" --config GML_GFS_TEMPLATE bgt_tunneldeel.gfs -f GPKG bgt_tunneldeel.gpkg bgt_tunneldeel.gml
ogr2ogr -nlt CONVERT_TO_LINEAR -where "eindregistratie is NULL and OGR_GEOMETRY='CURVEPOLYGON'" --config GML_GFS_TEMPLATE bgt_kunstwerkdeel.gfs -f GPKG bgt_kunstwerkdeel.gpkg bgt_kunstwerkdeel.gml