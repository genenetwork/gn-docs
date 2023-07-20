# Phenotypes Metadata
## 'dump-publishfreeze'


## Generated Triples:

The following SQL query was executed:

```sql
SELECT PublishFreeze.Name, PublishFreeze.Name, PublishFreeze.FullName, PublishFreeze.ShortName, PublishFreeze.CreateTime, InbredSet.Name AS InbredSetName FROM PublishFreeze LEFT JOIN InfoFiles ON InfoFiles.InfoPageName = PublishFreeze.Name LEFT JOIN InbredSet ON PublishFreeze.InbredSetId = InbredSet.InbredSetId WHERE PublishFreeze.public > 0 AND PublishFreeze.confidentiality < 1 AND InfoFiles.InfoPageName IS NULL
```

The above query results to triples that have the form:

```text
gn:Publishfreeze_name_ -> rdf:type -> gn:phenotypeDataset 
gn:Publishfreeze_name_ -> gn-term:name -> PublishFreeze(Name) 
gn:Publishfreeze_name_ -> gn-term:fullName -> PublishFreeze(FullName) 
gn:Publishfreeze_name_ -> gn-term:shortName -> PublishFreeze(ShortName) 
gn:Publishfreeze_name_ -> dc-termt:created -> "PublishFreeze(CreateTime)"^^xsd:date 
gn:Publishfreeze_name_ -> gn-term:datasetOfInbredSet -> gn:inbredSet_inbredset_inbredsetname 
```
Here's an example query:

```sparql
@prefix gn: <http://genenetwork.org/id/> .
@prefix gn-term: <http://genenetwork.org/terms/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .
@prefix pubmed: <http://rdf.ncbi.nlm.nih.gov/pubmed/> .

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn:phenotypeDataset .
    ?s gn-term:name "B6D2F2-PSUPublish" .
    ?s gn-term:fullName "B6D2F2 PSU Phenotypes" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:B6d2f2_psupublish rdf:type gn:phenotypeDataset .
gn:B6d2f2_psupublish gn-term:name "B6D2F2-PSUPublish" .
gn:B6d2f2_psupublish gn-term:fullName "B6D2F2 PSU Phenotypes" .
gn:B6d2f2_psupublish gn-term:shortName "B6D2F2 PSU Publish" .
gn:B6d2f2_psupublish dc-termt:created "2015-03-18"^^xsd:date .
gn:B6d2f2_psupublish gn-term:datasetOfInbredSet gn:inbredSet_b6d2f2-psu .
```


## 'dump-phenotypes'


## Generated Triples:

The following SQL query was executed:

```sql
SELECT CONCAT(IF(PublishFreeze.Name IS NULL, '', CONCAT(PublishFreeze.Name, '_')), IF(Phenotype.Post_publication_abbreviation IS NULL, IF(Phenotype.Pre_publication_abbreviation IS NULL, Phenotype.Id, Pre_publication_abbreviation), Phenotype.Post_publication_abbreviation)) AS abbrev, CAST(CONVERT(BINARY CONVERT(IF(Phenotype.Post_publication_abbreviation IS NULL, IF(Phenotype.Pre_publication_abbreviation IS NULL, Phenotype.Id, Phenotype.Pre_publication_abbreviation), Phenotype.Post_publication_abbreviation) USING latin1) USING utf8) AS VARCHAR(100)) AS PhenotypeName, CAST(CONVERT(BINARY CONVERT(Phenotype.Post_publication_description USING latin1) USING utf8) AS CHAR(10000)) AS postPubDescr, Phenotype.Original_description, CAST(CONVERT(BINARY CONVERT(Phenotype.Pre_publication_description USING latin1) USING utf8) AS VARCHAR(15000)) AS prePubDesc, Phenotype.Pre_publication_abbreviation, Phenotype.Post_publication_abbreviation, Phenotype.Lab_code, Phenotype.Submitter, Phenotype.Owner, IFNULL(PublishXRef.mean, '') AS mean, PublishXRef.Locus, IFNULL(PublishXRef.LRS, '') AS lrs, IFNULL(PublishXRef.additive, '') AS additive, PublishXRef.Sequence, IFNULL(InfoFiles.InfoPageName, IFNULL(PublishFreeze.Name, '')) AS DatasetName, IF(Publication.PubMed_ID IS NULL, '', CONVERT(Publication.PubMed_Id, INT)) AS pmid, Publication.Id FROM Phenotype LEFT JOIN PublishXRef ON Phenotype.Id = PublishXRef.PhenotypeId LEFT JOIN Publication ON Publication.Id = PublishXRef.PublicationId LEFT JOIN PublishFreeze ON PublishFreeze.InbredSetId = PublishXRef.InbredSetId LEFT JOIN InfoFiles ON InfoFiles.InfoPageName = PublishFreeze.Name
```

The above query results to triples that have the form:

```text
gn:Abbrev -> rdf:type -> gn:phenotype 
gn:Abbrev -> gn-term:name -> PhenotypeName 
gn:Abbrev -> gn-term:publicationDescription -> postPubDescr 
gn:Abbrev -> gn-term:originalDescription -> PhenotypeOriginal_description 
gn:Abbrev -> gn-term:prePublicationDescription -> prePubDesc 
gn:Abbrev -> gn-term:prePublicationAbbreviation -> PhenotypePre_publication_abbreviation 
gn:Abbrev -> gn-term:postPublicationAbbreviation -> PhenotypePost_publication_abbreviation 
gn:Abbrev -> gn-term:labCode -> Phenotype(Lab_code) 
gn:Abbrev -> gn-term:submitter -> PhenotypeSubmitter 
gn:Abbrev -> gn-term:owner -> PhenotypeOwner 
gn:Abbrev -> gn-term:mean -> "mean"^^xsd:double 
gn:Abbrev -> gn-term:locus -> PublishXRef(Locus) 
gn:Abbrev -> gn-term:LRS -> "lrs"^^xsd:float 
gn:Abbrev -> gn-term:additive -> "additive"^^xsd:decimal 
gn:Abbrev -> gn-term:sequence -> "PublishXRef(Sequence)"^^xsd:int 
gn:Abbrev -> gn-term:phenotypeOfDataset -> gn:Datasetname 
gn:Abbrev -> gn-term:phenotypeOfPublication -> pubmed:pmid 
```
Here's an example query:

```sparql
@prefix gn: <http://genenetwork.org/id/> .
@prefix gn-term: <http://genenetwork.org/terms/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .
@prefix pubmed: <http://rdf.ncbi.nlm.nih.gov/pubmed/> .

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn:phenotype .
    ?s gn-term:name "CBLWT2" .
    ?s gn-term:publicationDescription "Central nervous system, morphology: Cerebellum weight, whole, bilateral in adults of both sexes [mg]" .
    ?s gn-term:originalDescription "Cerebellum weight [mg]" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:Bxdpublish_cblwt2 rdf:type gn:phenotype .
gn:Bxdpublish_cblwt2 gn-term:name "CBLWT2" .
gn:Bxdpublish_cblwt2 gn-term:publicationDescription "Central nervous system, morphology: Cerebellum weight, whole, bilateral in adults of both sexes [mg]" .
gn:Bxdpublish_cblwt2 gn-term:originalDescription "Cerebellum weight [mg]" .
gn:Bxdpublish_cblwt2 gn-term:prePublicationDescription "Central nervous system, morphology: Cerebellum weight, whole, bilateral in adults of both sexes [mg]" .
gn:Bxdpublish_cblwt2 gn-term:postPublicationAbbreviation "CBLWT2" .
gn:Bxdpublish_cblwt2 gn-term:submitter "robwilliams" .
gn:Bxdpublish_cblwt2 gn-term:mean "52.13529418496525"^^xsd:double .
gn:Bxdpublish_cblwt2 gn-term:locus "rs48756159" .
gn:Bxdpublish_cblwt2 gn-term:LRS "13.4974911471087"^^xsd:float .
gn:Bxdpublish_cblwt2 gn-term:additive "2.39444435069444"^^xsd:decimal .
gn:Bxdpublish_cblwt2 gn-term:sequence "1"^^xsd:int .
gn:Bxdpublish_cblwt2 gn-term:phenotypeOfDataset gn:Bxdpublish .
gn:Bxdpublish_cblwt2 gn-term:phenotypeOfPublication pubmed:11438585 .
```

