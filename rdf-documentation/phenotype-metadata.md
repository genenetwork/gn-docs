# Phenotypes Metadata
## 'phenotypes'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT CONCAT(IFNULL(InbredSet.InbredSetCode, PublishXRef.InbredSetId), '_', PublishXRef.Id) AS Phenotype, InbredSet.Name AS InbredSetName, PublishXRef.Id, CONCAT(IFNULL(InbredSet.InbredSetCode, PublishXRef.InbredSetId), '_', PublishXRef.Id) AS Phenotype, Phenotype.Post_publication_description, Phenotype.Post_publication_abbreviation, Phenotype.Lab_code, Phenotype.Submitter, Phenotype.Owner, IFNULL(PublishXRef.mean, '') AS mean, PublishXRef.Locus, IFNULL((PublishXRef.LRS/4.604), '') AS lrs, IFNULL(PublishXRef.additive, '') AS additive, PublishXRef.Sequence, IF(Publication.PubMed_ID IS NULL, '', CONVERT(Publication.PubMed_Id, INT)) AS pmid, Publication.Id AS PublicationId FROM PublishXRef LEFT JOIN InbredSet ON InbredSet.InbredSetId = PublishXRef.InbredSetId LEFT JOIN Publication ON Publication.Id = PublishXRef.PublicationId LEFT JOIN Phenotype ON Phenotype.Id = PublishXRef.PhenotypeId
```

The above query results to triples that have the form:

```text
gn:traitPhenotype -> rdf:type -> gnc:Phenotype 
gn:traitPhenotype -> gnt:belongsToGroup -> gn:setInbredset_inbredsetname 
gn:traitPhenotype -> rdfs:label -> PublishXRef(Id) 
gn:traitPhenotype -> skos:altLabel -> Phenotype 
gn:traitPhenotype -> dct:description -> PhenotypePost_publication_description 
gn:traitPhenotype -> gnt:abbreviation -> Phenotype(Post_publication_abbreviation) 
gn:traitPhenotype -> gnt:labCode -> Phenotype(Lab_code) 
gn:traitPhenotype -> gnt:submitter -> PhenotypeSubmitter 
gn:traitPhenotype -> dct:contributor -> PhenotypeOwner 
gn:traitPhenotype -> gnt:mean -> "mean"^^xsd:double 
gn:traitPhenotype -> gnt:locus -> gn:Publishxreflocus 
gn:traitPhenotype -> gnt:lodScore -> "lrs"^^xsd:double 
gn:traitPhenotype -> gnt:additive -> "additive"^^xsd:double 
gn:traitPhenotype -> gnt:sequence -> "PublishXRef(Sequence)"^^xsd:integer 
gn:traitPhenotype -> dct:isReferencedBy -> pubmed:pmid 
```
Here's an example query:

```sparql
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX sdmx-measure: <http://purl.org/linked-data/sdmx/2009/measure#> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX qb: <http://purl.org/linked-data/cube#> 
PREFIX xkos: <http://rdf-vocabulary.ddialliance.org/xkos#> 
PREFIX pubmed: <http://rdf.ncbi.nlm.nih.gov/pubmed/> 

SELECT * WHERE { 
    ?s rdf:type gnc:Phenotype .
    ?s gnt:belongsToGroup gn:setBxd .
    ?s rdfs:label "10001" .
    ?s skos:altLabel "BXD_10001" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:traitBxd_10001 rdf:type gnc:Phenotype .
gn:traitBxd_10001 gnt:belongsToGroup gn:setBxd .
gn:traitBxd_10001 rdfs:label "10001" .
gn:traitBxd_10001 skos:altLabel "BXD_10001" .
gn:traitBxd_10001 dct:description "Central nervous system, morphology: Cerebellum weight, whole, bilateral in adults of both sexes [mg]" .
gn:traitBxd_10001 gnt:abbreviation "CBLWT2" .
gn:traitBxd_10001 gnt:submitter "robwilliams" .
gn:traitBxd_10001 gnt:mean "52.13529418496525"^^xsd:double .
gn:traitBxd_10001 gnt:locus gn:Rs48756159 .
gn:traitBxd_10001 gnt:lodScore "2.9316879120566246"^^xsd:double .
gn:traitBxd_10001 gnt:additive "2.39444435069444"^^xsd:double .
gn:traitBxd_10001 gnt:sequence "1"^^xsd:integer .
gn:traitBxd_10001 dct:isReferencedBy pubmed:11438585 .
```

