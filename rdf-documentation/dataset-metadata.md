# Info files / Investigators Metadata
## 'info-files'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT InfoFiles.InfoPageName, IF(GenoFreeze.Id IS NOT NULL, 'gnc:Genotype', IF(PublishFreeze.Id IS NOT NULL, 'gnc:Phenotype', IF(ProbeSetFreeze.Name IS NOT NULL, 'gnc:Probeset', ''))) AS DatasetType, InfoFiles.InfoPageName, IFNULL(GenoFreeze.FullName, IFNULL(PublishFreeze.FullName, '')) AS DatasetFullName, Datasets.DatasetName AS DatasetGroup, Datasets.PublicationTitle, InfoFiles.InfoFileTitle, IFNULL(GenoFreeze.CreateTime, IFNULL(PublishFreeze.CreateTime, IFNULL(ProbeSetFreeze.CreateTime, ''))) AS createTimeGenoFreeze, Investigators.FirstName, Investigators.LastName, Investigators.Email, Organizations.OrganizationName, InfoFiles.GN_AccesionId, DatasetStatus.DatasetStatusName, IFNULL(InbredSet.Name, IFNULL(PublishInbredSet.Name, GenoInbredSet.Name)) AS InbredSetName, Tissue.Short_Name, AvgMethod.Name AS AvgMethodName, AvgMethod.Name AS AvgMethodName, GeneChip.Name AS GeneChip, IFNULL(Datasets.GeoSeries, '') AS GeoSeries FROM InfoFiles LEFT JOIN PublishFreeze ON InfoFiles.InfoPageName = PublishFreeze.Name LEFT JOIN GenoFreeze ON InfoFiles.InfoPageName = GenoFreeze.Name LEFT JOIN ProbeSetFreeze ON InfoFiles.InfoPageName = ProbeSetFreeze.Name LEFT JOIN InbredSet ON InfoFiles.InbredSetId = InbredSet.InbredSetId LEFT JOIN Species ON InfoFiles.SpeciesId = Species.SpeciesId LEFT JOIN Datasets USING (DatasetId) LEFT JOIN DatasetStatus USING (DatasetStatusId) LEFT JOIN Tissue USING (TissueId) LEFT JOIN Investigators USING (InvestigatorId) LEFT JOIN AvgMethod USING (AvgMethodId) LEFT JOIN Organizations USING (OrganizationId) LEFT JOIN GeneChip USING (GeneChipId) LEFT JOIN InbredSet PublishInbredSet ON PublishFreeze.InbredSetId = PublishInbredSet.InbredSetId LEFT JOIN InbredSet GenoInbredSet ON GenoFreeze.InbredSetId = GenoInbredSet.InbredSetId  WHERE GN_AccesionId IS NOT NULL
```

The above query results to triples that have the form:

```text
gn:Infofiles_infopagename_ -> rdf:type -> dcat:Dataset 
gn:Infofiles_infopagename_ -> xkos:classifiedUnder -> DatasetType 
gn:Infofiles_infopagename_ -> rdfs:label -> InfoFiles(InfoPageName) 
gn:Infofiles_infopagename_ -> skos:prefLabel -> DatasetFullName 
gn:Infofiles_infopagename_ -> skos:altLabel -> Datasets(DatasetGroup) 
gn:Infofiles_infopagename_ -> dct:title -> Datasets(PublicationTitle) 
gn:Infofiles_infopagename_ -> dct:created -> createTimeGenoFreeze 
gn:Infofiles_infopagename_ -> dcat:contactPoint -> gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email 
gn:Infofiles_infopagename_ -> foaf:Organization -> Organizations(OrganizationName) 
gn:Infofiles_infopagename_ -> dct:identifier -> GNInfoFiles(GN_AccesionId) 
gn:Infofiles_infopagename_ -> dct:accessRights -> datasetstatus(datasetstatusname) 
gn:Infofiles_infopagename_ -> gnt:belongsToGroup -> gn:setInbredsetname 
gn:Infofiles_infopagename_ -> gnt:hasTissue -> gn:tissueTissue_short_name 
gn:Infofiles_infopagename_ -> gnt:usesNormalization -> gn:avgMethodAvgmethod_avgmethodname 
gn:Infofiles_infopagename_ -> gnt:hasSummary -> <https://git.genenetwork.org/gn-docs/tree/general/datasets/Infofiles_infopagename_/summary.rtf> 
gn:Infofiles_infopagename_ -> gnt:hasTissueInfo -> <https://git.genenetwork.org/gn-docs/tree/general/datasets/Infofiles_infopagename_/tissue.rtf> 
gn:Infofiles_infopagename_ -> gnt:hasCitation -> <https://git.genenetwork.org/gn-docs/tree/general/datasets/Infofiles_infopagename_/citation.rtf> 
gn:Infofiles_infopagename_ -> gnt:hasSpecifics -> <https://git.genenetwork.org/gn-docs/tree/general/datasets/Infofiles_infopagename_/specifics.rtf> 
gn:Infofiles_infopagename_ -> gnt:hasCaseInfo -> <https://git.genenetwork.org/gn-docs/tree/general/datasets/Infofiles_infopagename_/cases.rtf> 
gn:Infofiles_infopagename_ -> gnt:hasPlatformInfo -> <https://git.genenetwork.org/gn-docs/tree/general/datasets/Infofiles_infopagename_/platform.rtf> 
gn:Infofiles_infopagename_ -> gnt:hasDataProcessingInfo -> <https://git.genenetwork.org/gn-docs/tree/general/datasets/Infofiles_infopagename_/processing.rtf> 
gn:Infofiles_infopagename_ -> gnt:hasNotes -> <https://git.genenetwork.org/gn-docs/tree/general/datasets/Infofiles_infopagename_/notes.rtf> 
gn:Infofiles_infopagename_ -> gnt:hasExperimentType -> <https://git.genenetwork.org/gn-docs/tree/general/datasets/Infofiles_infopagename_/experiment-type.rtf> 
gn:Infofiles_infopagename_ -> gnt:hasExperimentDesign -> <https://git.genenetwork.org/gn-docs/tree/general/datasets/Infofiles_infopagename_/experiment-design.rtf> 
gn:Infofiles_infopagename_ -> gnt:hasContributors -> <https://git.genenetwork.org/gn-docs/tree/general/datasets/Infofiles_infopagename_/contributors.rtf> 
gn:Infofiles_infopagename_ -> gnt:hasAcknowledgement -> <https://git.genenetwork.org/gn-docs/tree/general/datasets/Infofiles_infopagename_/acknowledgment.rtf> 
gn:Infofiles_infopagename_ -> gnt:usesPlatform -> gn:platformGenechip_genechip 
gn:Infofiles_infopagename_ -> gnt:hasGeoSeriesId ->  
```
Here's an example query:

```sparql
PREFIX v: <http://www.w3.org/2006/vcard/ns#> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX dcat: <http://www.w3.org/ns/dcat#> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX xkos: <http://rdf-vocabulary.ddialliance.org/xkos#> 
PREFIX geoSeries: <http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 
PREFIX dct: <http://purl.org/dc/terms/> 

SELECT * WHERE { 
    ?s rdf:type dcat:Dataset .
    ?s xkos:classifiedUnder gnc:Phenotype .
    ?s rdfs:label "GITrMetPublish" .
    ?s skos:prefLabel "GI Tract Metagenome Phenotypes" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:Gitrmetpublish rdf:type dcat:Dataset .
gn:Gitrmetpublish xkos:classifiedUnder gnc:Phenotype .
gn:Gitrmetpublish rdfs:label "GITrMetPublish" .
gn:Gitrmetpublish skos:prefLabel "GI Tract Metagenome Phenotypes" .
gn:Gitrmetpublish skos:altLabel "GI Tract Metagenome Phenotypes" .
gn:Gitrmetpublish dct:title "GI Tract Metagenome Phenotypes" .
gn:Gitrmetpublish dct:created "2016-10-27" .
gn:Gitrmetpublish dcat:contactPoint gn:investigatorByron_jones_bjone129_uthsc.edu .
gn:Gitrmetpublish foaf:Organization "University of Tennessee Health Science Center" .
gn:Gitrmetpublish dct:identifier "GN658" .
gn:Gitrmetpublish dct:accessRights "private" .
gn:Gitrmetpublish gnt:belongsToGroup gn:setBxd .
gn:Gitrmetpublish gnt:hasTissue gn:tissueGut .
gn:Gitrmetpublish gnt:usesNormalization gn:avgMethodRma .
gn:Gitrmetpublish gnt:usesPlatform gn:platformMogene-1_0-st-v1 .
```


## 'publishfreeze'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT PublishFreeze.Name, PublishFreeze.FullName, PublishFreeze.Name, PublishFreeze.ShortName, PublishFreeze.CreateTime, InbredSet.Name AS InbredSetName FROM PublishFreeze LEFT JOIN InfoFiles ON InfoFiles.InfoPageName = PublishFreeze.Name LEFT JOIN InbredSet ON PublishFreeze.InbredSetId = InbredSet.InbredSetId WHERE PublishFreeze.public > 0 AND PublishFreeze.confidentiality < 1 AND InfoFiles.InfoFileId IS NULL
```

The above query results to triples that have the form:

```text
gn:Publishfreeze_name_ -> rdf:type -> dcat:Dataset 
gn:Publishfreeze_name_ -> xkos:classifiedUnder -> gnc:Phenotype 
gn:Publishfreeze_name_ -> dct:title -> PublishFreeze(FullName) 
gn:Publishfreeze_name_ -> rdfs:label -> PublishFreeze(Name) 
gn:Publishfreeze_name_ -> skos:altLabel -> PublishFreeze(ShortName) 
gn:Publishfreeze_name_ -> dct:created -> "PublishFreeze(CreateTime)"^^xsd:date 
gn:Publishfreeze_name_ -> gnt:belongsToGroup -> gn:setInbredset_inbredsetname 
```
Here's an example query:

```sparql
PREFIX v: <http://www.w3.org/2006/vcard/ns#> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX dcat: <http://www.w3.org/ns/dcat#> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX xkos: <http://rdf-vocabulary.ddialliance.org/xkos#> 
PREFIX geoSeries: <http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 
PREFIX dct: <http://purl.org/dc/terms/> 

SELECT * WHERE { 
    ?s rdf:type dcat:Dataset .
    ?s xkos:classifiedUnder gnc:Phenotype .
    ?s dct:title "B6D2F2 PSU Phenotypes" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:B6d2f2_psupublish rdf:type dcat:Dataset .
gn:B6d2f2_psupublish xkos:classifiedUnder gnc:Phenotype .
gn:B6d2f2_psupublish dct:title "B6D2F2 PSU Phenotypes" .
gn:B6d2f2_psupublish rdfs:label "B6D2F2-PSUPublish" .
gn:B6d2f2_psupublish skos:altLabel "B6D2F2 PSU Publish" .
gn:B6d2f2_psupublish dct:created "2015-03-18"^^xsd:date .
gn:B6d2f2_psupublish gnt:belongsToGroup gn:setB6d2f2-psu .
```


## 'genofreeze'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT GenoFreeze.Name, GenoFreeze.Name, GenoFreeze.FullName, GenoFreeze.ShortName, GenoFreeze.CreateTime, InbredSet.Name AS InbredSetName FROM GenoFreeze LEFT JOIN InfoFiles ON InfoFiles.InfoPageName = GenoFreeze.Name LEFT JOIN InbredSet ON GenoFreeze.InbredSetId = InbredSet.InbredSetId WHERE GenoFreeze.public > 0 AND GenoFreeze.confidentiality < 1 AND InfoFiles.InfoPageName IS NULL
```

The above query results to triples that have the form:

```text
gn:Genofreeze_name_ -> rdf:type -> dcat:Dataset 
gn:Genofreeze_name_ -> xkos:classifiedUnder -> gnc:Genotype 
gn:Genofreeze_name_ -> rdfs:label -> GenoFreeze(Name) 
gn:Genofreeze_name_ -> dct:title -> GenoFreeze(FullName) 
gn:Genofreeze_name_ -> skos:altLabel -> GenoFreeze(ShortName) 
gn:Genofreeze_name_ -> dct:created -> "GenoFreeze(CreateTime)"^^xsd:date 
gn:Genofreeze_name_ -> gnt:belongsToGroup -> gn:setInbredset_inbredsetname 
```
Here's an example query:

```sparql
PREFIX v: <http://www.w3.org/2006/vcard/ns#> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX dcat: <http://www.w3.org/ns/dcat#> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX xkos: <http://rdf-vocabulary.ddialliance.org/xkos#> 
PREFIX geoSeries: <http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 
PREFIX dct: <http://purl.org/dc/terms/> 

SELECT * WHERE { 
    ?s rdf:type dcat:Dataset .
    ?s xkos:classifiedUnder gnc:Genotype .
    ?s rdfs:label "B6D2RIGeno" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:B6d2rigeno rdf:type dcat:Dataset .
gn:B6d2rigeno xkos:classifiedUnder gnc:Genotype .
gn:B6d2rigeno rdfs:label "B6D2RIGeno" .
gn:B6d2rigeno dct:title "B6D2RI Genotypes" .
gn:B6d2rigeno skos:altLabel "B6D2RIGeno" .
gn:B6d2rigeno dct:created "2022-10-24"^^xsd:date .
gn:B6d2rigeno gnt:belongsToGroup gn:setB6d2ri .
```


## 'probesetfreeze'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT ProbeSetFreeze.Name, AvgMethod.Name AS AvgMethodName, AvgMethod.Name AS AvgMethodName, ProbeSetFreeze.FullName, ProbeSetFreeze.ShortName, ProbeSetFreeze.Name, ProbeSetFreeze.Name2, ProbeSetFreeze.CreateTime, ProbeSetFreeze.DataScale, Tissue.Short_Name, InbredSet.Name AS InbredSetName FROM ProbeSetFreeze LEFT JOIN InfoFiles ON InfoFiles.InfoPageName = ProbeSetFreeze.Name LEFT JOIN ProbeFreeze USING (ProbeFreezeId) LEFT JOIN AvgMethod ON AvgMethod.AvgMethodId = ProbeSetFreeze.AvgID LEFT JOIN InbredSet ON ProbeFreeze.InbredSetId = InbredSet.Id LEFT JOIN Tissue ON ProbeFreeze.TissueId = Tissue.TissueId WHERE ProbeSetFreeze.public > 0 AND InfoFiles.InfoPageName IS NULL GROUP BY ProbeFreeze.Id
```

The above query results to triples that have the form:

```text
gn:Probesetfreeze_name_ -> rdf:type -> dcat:Dataset 
gn:Probesetfreeze_name_ -> xkos:classifiedUnder -> gnc:Probeset 
gn:Probesetfreeze_name_ -> gnt:usesNormalization -> gn:avgMethodAvgmethod_avgmethodname 
gn:Probesetfreeze_name_ -> dct:title -> ProbeSetFreeze(FullName) 
gn:Probesetfreeze_name_ -> rdfs:label -> ProbeSetFreeze(ShortName) 
gn:Probesetfreeze_name_ -> skos:prefLabel -> ProbeSetFreeze(Name) 
gn:Probesetfreeze_name_ -> skos:altLabel -> ProbeSetFreeze(Name2) 
gn:Probesetfreeze_name_ -> dct:created -> "ProbeSetFreeze(CreateTime)"^^xsd:datetime 
gn:Probesetfreeze_name_ -> gnt:usesDataScale -> ProbeSetFreeze(DataScale) 
gn:Probesetfreeze_name_ -> gnt:hasTissue -> gn:tissueTissue_short_name 
gn:Probesetfreeze_name_ -> gnt:belongsToGroup -> gn:setInbredset_inbredsetname 
```
Here's an example query:

```sparql
PREFIX v: <http://www.w3.org/2006/vcard/ns#> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX dcat: <http://www.w3.org/ns/dcat#> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX xkos: <http://rdf-vocabulary.ddialliance.org/xkos#> 
PREFIX geoSeries: <http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 
PREFIX dct: <http://purl.org/dc/terms/> 

SELECT * WHERE { 
    ?s rdf:type dcat:Dataset .
    ?s xkos:classifiedUnder gnc:Probeset .
    ?s gnt:usesNormalization gn:avgMethodRankinv .
    ?s dct:title "UBC/CMMT BXD P0 Cerebellum ILM Mouse WG-6 v2.0 (May13) RankInv" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:Cmmtubcbxdp00cerilm0513 rdf:type dcat:Dataset .
gn:Cmmtubcbxdp00cerilm0513 xkos:classifiedUnder gnc:Probeset .
gn:Cmmtubcbxdp00cerilm0513 gnt:usesNormalization gn:avgMethodRankinv .
gn:Cmmtubcbxdp00cerilm0513 dct:title "UBC/CMMT BXD P0 Cerebellum ILM Mouse WG-6 v2.0 (May13) RankInv" .
gn:Cmmtubcbxdp00cerilm0513 rdfs:label "UBC/CMMT BXD P0 Cerebellum ILM Mouse WG-6 v2.0 (May13) RankInv" .
gn:Cmmtubcbxdp00cerilm0513 skos:prefLabel "CMMTUBCBXDP00CerILM0513" .
gn:Cmmtubcbxdp00cerilm0513 skos:altLabel "CMMTUBCBXDP00CerILMMay13" .
gn:Cmmtubcbxdp00cerilm0513 dct:created "2013-04-22"^^xsd:datetime .
gn:Cmmtubcbxdp00cerilm0513 gnt:usesDataScale "log2" .
gn:Cmmtubcbxdp00cerilm0513 gnt:hasTissue gn:tissueCb .
gn:Cmmtubcbxdp00cerilm0513 gnt:belongsToGroup gn:setBxd .
```


## 'investigators'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT Investigators.FirstName, Investigators.LastName, Investigators.Email, Investigators.FirstName, Investigators.LastName, Investigators.FirstName, Investigators.LastName, Investigators.Url, Investigators.Address, Investigators.City, Investigators.State, Investigators.ZipCode, Investigators.Country FROM Investigators GROUP BY Email
```

The above query results to triples that have the form:

```text
gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email -> rdf:type -> foaf:Person 
gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email -> foaf:name -> Investigators(FirstName) Investigators(LastName) 
gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email -> foaf:givenName -> Investigators(FirstName) 
gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email -> foaf:familyName -> Investigators(LastName) 
gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email -> foaf:homepage -> Investigators(Url) 
gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email -> v:adr -> Investigators(Address) 
gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email -> v:locality -> Investigators(City) 
gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email -> v:region -> Investigators(State) 
gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email -> v:postal-code -> Investigators(ZipCode) 
gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email -> v:country-name -> Investigators(Country) 
```
Here's an example query:

```sparql
PREFIX v: <http://www.w3.org/2006/vcard/ns#> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX dcat: <http://www.w3.org/ns/dcat#> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX xkos: <http://rdf-vocabulary.ddialliance.org/xkos#> 
PREFIX geoSeries: <http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 
PREFIX dct: <http://purl.org/dc/terms/> 

SELECT * WHERE { 
    ?s rdf:type foaf:Person .
    ?s foaf:name "Evan Williams" .
    ?s foaf:givenName "Evan" .
    ?s foaf:familyName "Williams" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:investigatorEvan_williams_ rdf:type foaf:Person .
gn:investigatorEvan_williams_ foaf:name "Evan Williams" .
gn:investigatorEvan_williams_ foaf:givenName "Evan" .
gn:investigatorEvan_williams_ foaf:familyName "Williams" .
gn:investigatorEvan_williams_ v:country-name "Switzerland" .
```


## 'gene-chip'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT GeneChip.Name, GeneChip.GeneChipName, GeneChip.Name, IF(GeneChip.GeneChipName != GeneChip.Title, Title, NULL) AS Title, GeneChip.Go_tree_value, Species.Fullname, GeneChip.GeoPlatform FROM GeneChip LEFT JOIN Species USING (SpeciesId)
```

The above query results to triples that have the form:

```text
gn:platformGenechip_name -> rdf:type -> gnc:geneChip 
gn:platformGenechip_name -> rdfs:label -> GeneChip(GeneChipName) 
gn:platformGenechip_name -> skos:prefLabel -> GeneChip(Name) 
gn:platformGenechip_name -> skos:altLabel -> Title 
gn:platformGenechip_name -> gnt:hasGOTreeValue -> GeneChip(Go_tree_value) 
gn:platformGenechip_name -> xkos:classifiedUnder -> gn:Species_fullname 
gn:platformGenechip_name -> gnt:hasGeoSeriesId -> geoSeries:GeneChip(GeoPlatform) 
```
Here's an example query:

```sparql
PREFIX v: <http://www.w3.org/2006/vcard/ns#> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX dcat: <http://www.w3.org/ns/dcat#> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX xkos: <http://rdf-vocabulary.ddialliance.org/xkos#> 
PREFIX geoSeries: <http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 
PREFIX dct: <http://purl.org/dc/terms/> 

SELECT * WHERE { 
    ?s rdf:type gnc:geneChip .
    ?s rdfs:label "Affy Mouse Genome U74Av2 (GPL81)" .
    ?s skos:prefLabel "MG_U74AV2" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:platformMg_u74av2 rdf:type gnc:geneChip .
gn:platformMg_u74av2 rdfs:label "Affy Mouse Genome U74Av2 (GPL81)" .
gn:platformMg_u74av2 skos:prefLabel "MG_U74AV2" .
gn:platformMg_u74av2 gnt:hasGOTreeValue "affy_mg_u74av2" .
gn:platformMg_u74av2 xkos:classifiedUnder gn:Mus_musculus .
gn:platformMg_u74av2 gnt:hasGeoSeriesId geoSeries:GPL81 .
```

