# Probeset freeze metadata
## 'dump-gene-chip'


## Generated Triples:

The following SQL query was executed:

```sql
SELECT GeneChip.Name, GeneChip.GeneChipName, GeneChip.GeoPlatform FROM GeneChip
```

The above query results to triples that have the form:

```text
gn:platform_genechip_name -> rdf:type -> gn:platform 
gn:platform_genechip_name -> gn-term:name -> GeneChip(GeneChipName) 
gn:platform_genechip_name -> gn-term:geoPlatform -> geoSeries:GeneChip(GeoPlatform) 
```
Here's an example query:

```sparql
PREFIX geoSeries: <http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX dct: <> 
PREFIX gn-term: <http://genenetwork.org/term/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn:platform .
    ?s gn-term:name "Affy Mouse Genome U74Av2 (GPL81)" .
    ?s gn-term:geoPlatform geoSeries:GPL81 .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:platform_mg_u74av2 rdf:type gn:platform .
gn:platform_mg_u74av2 gn-term:name "Affy Mouse Genome U74Av2 (GPL81)" .
gn:platform_mg_u74av2 gn-term:geoPlatform geoSeries:GPL81 .
```


## 'dump-probesetfreeze'


## Generated Triples:

The following SQL query was executed:

```sql
SELECT ProbeSetFreeze.Name, AvgMethod.Name, ProbeSetFreeze.FullName, ProbeSetFreeze.ShortName, ProbeSetFreeze.CreateTime, ProbeSetFreeze.DataScale, Tissue.Short_Name, InbredSet.Name AS InbredSetName FROM ProbeSetFreeze LEFT JOIN InfoFiles ON InfoFiles.InfoPageName = ProbeSetFreeze.Name LEFT JOIN ProbeFreeze USING (ProbeFreezeId) LEFT JOIN AvgMethod ON AvgMethod.AvgMethodId = ProbeSetFreeze.AvgID LEFT JOIN InbredSet ON ProbeFreeze.InbredSetId = InbredSet.Id LEFT JOIN Tissue ON ProbeFreeze.TissueId = Tissue.TissueId WHERE ProbeSetFreeze.public > 0 AND InfoFiles.InfoPageName IS NULL GROUP BY ProbeFreeze.Id
```

The above query results to triples that have the form:

```text
gn:Probesetfreeze_name_ -> rdf:type -> gn:probesetDataset 
gn:Probesetfreeze_name_ -> gn-term:avgMethod -> gn:avgmethod_avgmethod_name 
gn:Probesetfreeze_name_ -> gn-term:fullName -> ProbeSetFreeze(FullName) 
gn:Probesetfreeze_name_ -> gn-term:shortName -> ProbeSetFreeze(ShortName) 
gn:Probesetfreeze_name_ -> dct:created -> "ProbeSetFreeze(CreateTime)"^^xsd:datetime 
gn:Probesetfreeze_name_ -> gn-term:dataScale -> ProbeSetFreeze(DataScale) 
gn:Probesetfreeze_name_ -> gn-term:tissueName -> gn:tissue_tissue_short_name 
gn:Probesetfreeze_name_ -> gn-term:datasetOfInbredSet -> gn:inbredSet_inbredset_inbredsetname 
```
Here's an example query:

```sparql
PREFIX geoSeries: <http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX dct: <> 
PREFIX gn-term: <http://genenetwork.org/term/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn:probesetDataset .
    ?s gn-term:avgMethod gn:avgmethod_cmmtubcbxdp00cerilm0513 .
    ?s gn-term:fullName "UBC/CMMT BXD P0 Cerebellum ILM Mouse WG-6 v2.0 (May13) RankInv" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:Cmmtubcbxdp00cerilm0513 rdf:type gn:probesetDataset .
gn:Cmmtubcbxdp00cerilm0513 gn-term:avgMethod gn:avgmethod_cmmtubcbxdp00cerilm0513 .
gn:Cmmtubcbxdp00cerilm0513 gn-term:fullName "UBC/CMMT BXD P0 Cerebellum ILM Mouse WG-6 v2.0 (May13) RankInv" .
gn:Cmmtubcbxdp00cerilm0513 gn-term:shortName "UBC/CMMT BXD P0 Cerebellum ILM Mouse WG-6 v2.0 (May13) RankInv" .
gn:Cmmtubcbxdp00cerilm0513 dct:created "2013-04-22"^^xsd:datetime .
gn:Cmmtubcbxdp00cerilm0513 gn-term:dataScale "log2" .
gn:Cmmtubcbxdp00cerilm0513 gn-term:tissueName gn:tissue_cb .
gn:Cmmtubcbxdp00cerilm0513 gn-term:datasetOfInbredSet gn:inbredSet_bxd .
```

