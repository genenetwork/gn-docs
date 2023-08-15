# Probeset freeze metadata
## 'dump-gene-chip'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT GeneChip.Name, GeneChip.GeneChipName, GeneChip.Name, IF(GeneChip.GeneChipName != GeneChip.Title, Title, NULL) AS Title, GeneChip.Go_tree_value, Species.Fullname, GeneChip.GeoPlatform FROM GeneChip LEFT JOIN Species USING (SpeciesId)
```

The above query results to triples that have the form:

```text
gn:platform_genechip_name -> rdf:type -> gnc:geneChip 
gn:platform_genechip_name -> rdfs:label -> GeneChip(GeneChipName) 
gn:platform_genechip_name -> skos:prefLabel -> GeneChip(Name) 
gn:platform_genechip_name -> skos:altLabel -> Title 
gn:platform_genechip_name -> gnt:hasGOTreeValue -> GeneChip(Go_tree_value) 
gn:platform_genechip_name -> gnt:belongsToSpecies -> gn:Species_fullname 
gn:platform_genechip_name -> gnt:hasGeoSeriesId -> geoSeries:GeneChip(GeoPlatform) 
```
Here's an example query:

```sparql
PREFIX geoSeries: <http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 

SELECT * WHERE { 
    ?s rdf:type gnc:geneChip .
    ?s rdfs:label "Affy Mouse Genome U74Av2 (GPL81)" .
    ?s skos:prefLabel "MG_U74AV2" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:platform_mg_u74av2 rdf:type gnc:geneChip .
gn:platform_mg_u74av2 rdfs:label "Affy Mouse Genome U74Av2 (GPL81)" .
gn:platform_mg_u74av2 skos:prefLabel "MG_U74AV2" .
gn:platform_mg_u74av2 gnt:hasGOTreeValue "affy_mg_u74av2" .
gn:platform_mg_u74av2 gnt:belongsToSpecies gn:Mus_musculus .
gn:platform_mg_u74av2 gnt:hasGeoSeriesId geoSeries:GPL81 .
```


## 'dump-probesetfreeze'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT ProbeSetFreeze.Name, AvgMethod.Name AS AvgMethodName, AvgMethod.Name AS AvgMethodName, ProbeSetFreeze.FullName, ProbeSetFreeze.ShortName, ProbeSetFreeze.Name, ProbeSetFreeze.Name2, ProbeSetFreeze.CreateTime, ProbeSetFreeze.DataScale, Tissue.Short_Name, InbredSet.Name AS InbredSetName FROM ProbeSetFreeze LEFT JOIN InfoFiles ON InfoFiles.InfoPageName = ProbeSetFreeze.Name LEFT JOIN ProbeFreeze USING (ProbeFreezeId) LEFT JOIN AvgMethod ON AvgMethod.AvgMethodId = ProbeSetFreeze.AvgID LEFT JOIN InbredSet ON ProbeFreeze.InbredSetId = InbredSet.Id LEFT JOIN Tissue ON ProbeFreeze.TissueId = Tissue.TissueId WHERE ProbeSetFreeze.public > 0 AND InfoFiles.InfoPageName IS NULL GROUP BY ProbeFreeze.Id
```

The above query results to triples that have the form:

```text
gn:Probesetfreeze_name_ -> rdf:type -> gnc:probesetDataset 
gn:Probesetfreeze_name_ -> gnt:usesNormalization -> gn:avgmethod_avgmethod_avgmethodname 
gn:Probesetfreeze_name_ -> dct:title -> ProbeSetFreeze(FullName) 
gn:Probesetfreeze_name_ -> rdfs:label -> ProbeSetFreeze(ShortName) 
gn:Probesetfreeze_name_ -> skos:prefLabel -> ProbeSetFreeze(Name) 
gn:Probesetfreeze_name_ -> skos:altLabel -> ProbeSetFreeze(Name2) 
gn:Probesetfreeze_name_ -> dct:created -> "ProbeSetFreeze(CreateTime)"^^xsd:datetime 
gn:Probesetfreeze_name_ -> gnt:usesDataScale -> ProbeSetFreeze(DataScale) 
gn:Probesetfreeze_name_ -> gnt:hasTissue -> gn:tissue_tissue_short_name 
gn:Probesetfreeze_name_ -> gnt:belongsToInbredSet -> gn:inbredSet_inbredset_inbredsetname 
```
Here's an example query:

```sparql
PREFIX geoSeries: <http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 

SELECT * WHERE { 
    ?s rdf:type gnc:probesetDataset .
    ?s gnt:usesNormalization gn:avgmethod_rankinv .
    ?s dct:title "UBC/CMMT BXD P0 Cerebellum ILM Mouse WG-6 v2.0 (May13) RankInv" .
    ?s rdfs:label "UBC/CMMT BXD P0 Cerebellum ILM Mouse WG-6 v2.0 (May13) RankInv" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:Cmmtubcbxdp00cerilm0513 rdf:type gnc:probesetDataset .
gn:Cmmtubcbxdp00cerilm0513 gnt:usesNormalization gn:avgmethod_rankinv .
gn:Cmmtubcbxdp00cerilm0513 dct:title "UBC/CMMT BXD P0 Cerebellum ILM Mouse WG-6 v2.0 (May13) RankInv" .
gn:Cmmtubcbxdp00cerilm0513 rdfs:label "UBC/CMMT BXD P0 Cerebellum ILM Mouse WG-6 v2.0 (May13) RankInv" .
gn:Cmmtubcbxdp00cerilm0513 skos:prefLabel "CMMTUBCBXDP00CerILM0513" .
gn:Cmmtubcbxdp00cerilm0513 skos:altLabel "CMMTUBCBXDP00CerILMMay13" .
gn:Cmmtubcbxdp00cerilm0513 dct:created "2013-04-22"^^xsd:datetime .
gn:Cmmtubcbxdp00cerilm0513 gnt:usesDataScale "log2" .
gn:Cmmtubcbxdp00cerilm0513 gnt:hasTissue gn:tissue_cb .
gn:Cmmtubcbxdp00cerilm0513 gnt:belongsToInbredSet gn:inbredSet_bxd .
```

