# Phenotypes Metadata
## 'dump-publishfreeze'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT PublishFreeze.Name, PublishFreeze.Name, PublishFreeze.FullName, PublishFreeze.ShortName, PublishFreeze.CreateTime, InbredSet.Name FROM PublishFreeze LEFT JOIN InfoFiles ON InfoFiles.InfoPageName = PublishFreeze.Name LEFT JOIN InbredSet ON PublishFreeze.InbredSetId = InbredSet.InbredSetId WHERE PublishFreeze.public > 0 AND PublishFreeze.confidentiality < 1 AND InfoFiles.InfoFileId IS NULL
```

The above query results to triples that have the form:

```text
gn:Publishfreeze_name_ -> rdf:type -> gnc:phenotypeDataset 
gn:Publishfreeze_name_ -> rdfs:label -> PublishFreeze(Name) 
gn:Publishfreeze_name_ -> skos:prefLabel -> PublishFreeze(FullName) 
gn:Publishfreeze_name_ -> skos:altLabel -> PublishFreeze(ShortName) 
gn:Publishfreeze_name_ -> dct:created -> "PublishFreeze(CreateTime)"^^xsd:date 
gn:Publishfreeze_name_ -> gnt:belongsToInbredSet -> gn:Inbredset_name 
```
Here's an example query:

```sparql
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX gnt: <http://genenetwork.org/terms/> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX pubmed: <http://rdf.ncbi.nlm.nih.gov/pubmed/> 

SELECT * WHERE { 
    ?s rdf:type gnc:phenotypeDataset .
    ?s rdfs:label "B6D2F2-PSUPublish" .
    ?s skos:prefLabel "B6D2F2 PSU Phenotypes" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:B6d2f2_psupublish rdf:type gnc:phenotypeDataset .
gn:B6d2f2_psupublish rdfs:label "B6D2F2-PSUPublish" .
gn:B6d2f2_psupublish skos:prefLabel "B6D2F2 PSU Phenotypes" .
gn:B6d2f2_psupublish skos:altLabel "B6D2F2 PSU Publish" .
gn:B6d2f2_psupublish dct:created "2015-03-18"^^xsd:date .
gn:B6d2f2_psupublish gnt:belongsToInbredSet gn:B6d2f2-psupublish .
```


## 'dump-phenotypes'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT CONCAT(IF(PublishFreeze.Name IS NULL, '', CONCAT(PublishFreeze.Name, '_')), IF(Phenotype.Post_publication_abbreviation IS NULL, IF(Phenotype.Pre_publication_abbreviation IS NULL, Phenotype.Id, Pre_publication_abbreviation), Phenotype.Post_publication_abbreviation)) AS abbrev, IF(Phenotype.Post_publication_abbreviation IS NULL, IF(Phenotype.Pre_publication_abbreviation IS NULL, Phenotype.Id, Phenotype.Pre_publication_abbreviation), Phenotype.Post_publication_abbreviation) AS PhenotypeName, CONCAT(InbredSet.Name, '_', PublishXRef.Id) AS phenotypeAltName, Phenotype.Post_publication_description, Phenotype.Post_publication_abbreviation, Phenotype.Lab_code, Phenotype.Submitter, Phenotype.Owner, Phenotype.Owner, IFNULL(PublishXRef.mean, '') AS mean, PublishXRef.Locus, IFNULL(PublishXRef.LRS, '') AS lrs, IFNULL(PublishXRef.additive, '') AS additive, PublishXRef.Sequence, InfoFiles.InfoPageName, IF(Publication.PubMed_ID IS NULL, '', CONVERT(Publication.PubMed_Id, INT)) AS pmid, Publication.Id FROM Phenotype LEFT JOIN PublishXRef ON Phenotype.Id = PublishXRef.PhenotypeId LEFT JOIN Publication ON Publication.Id = PublishXRef.PublicationId LEFT JOIN InbredSet ON InbredSet.InbredSetId = PublishXRef.InbredSetId LEFT JOIN PublishFreeze ON PublishFreeze.InbredSetId = PublishXRef.InbredSetId LEFT JOIN InfoFiles ON InfoFiles.InfoPageName = PublishFreeze.Name WHERE PublishFreeze.public > 0 AND PublishFreeze.confidentiality < 1 AND PublishFreeze.Id IS NOT NULL
```

The above query results to triples that have the form:

```text
gn:Abbrev -> rdf:type -> gnc:phenotype 
gn:Abbrev -> skos:prefLabel -> PhenotypeName 
gn:Abbrev -> skos:altLabel -> phenotypeAltName 
gn:Abbrev -> dct:description -> PhenotypePost_publication_description 
gn:Abbrev -> gnt:abbreviation -> Phenotype(Post_publication_abbreviation) 
gn:Abbrev -> gnt:labCode -> Phenotype(Lab_code) 
gn:Abbrev -> gnt:submitter -> PhenotypeSubmitter 
gn:Abbrev -> dct:contributor -> PhenotypeOwner 
gn:Abbrev -> gnt:mean -> "mean"^^xsd:double 
gn:Abbrev -> gnt:locus -> PublishXRef(Locus) 
gn:Abbrev -> gnt:LRS -> "lrs"^^xsd:double 
gn:Abbrev -> gnt:additive -> "additive"^^xsd:double 
gn:Abbrev -> gnt:sequence -> "PublishXRef(Sequence)"^^xsd:integer 
gn:Abbrev -> gnt:belongsToDataset -> gn:Infofiles_infopagename_ 
gn:Abbrev -> dct:isReferencedBy -> pubmed:pmid 
gn:Abbrev -> dct:contributor -> PhenotypeOwner 
```
Here's an example query:

```sparql
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX gnt: <http://genenetwork.org/terms/> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX pubmed: <http://rdf.ncbi.nlm.nih.gov/pubmed/> 

SELECT * WHERE { 
    ?s rdf:type gnc:phenotype .
    ?s skos:prefLabel "CBLWT2" .
    ?s skos:altLabel "BXD_10001" .
    ?s dct:description "Central nervous system, morphology: Cerebellum weight, whole, bilateral in adults of both sexes [mg]" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:Bxdpublish_cblwt2 rdf:type gnc:phenotype .
gn:Bxdpublish_cblwt2 skos:prefLabel "CBLWT2" .
gn:Bxdpublish_cblwt2 skos:altLabel "BXD_10001" .
gn:Bxdpublish_cblwt2 dct:description "Central nervous system, morphology: Cerebellum weight, whole, bilateral in adults of both sexes [mg]" .
gn:Bxdpublish_cblwt2 gnt:abbreviation "CBLWT2" .
gn:Bxdpublish_cblwt2 gnt:submitter "robwilliams" .
gn:Bxdpublish_cblwt2 gnt:mean "52.13529418496525"^^xsd:double .
gn:Bxdpublish_cblwt2 gnt:locus "rs48756159" .
gn:Bxdpublish_cblwt2 gnt:LRS "13.4974911471087"^^xsd:double .
gn:Bxdpublish_cblwt2 gnt:additive "2.39444435069444"^^xsd:double .
gn:Bxdpublish_cblwt2 gnt:sequence "1"^^xsd:integer .
gn:Bxdpublish_cblwt2 gnt:belongsToDataset gn:Bxdpublish .
gn:Bxdpublish_cblwt2 dct:isReferencedBy pubmed:11438585 .
```

