# Genotype Metadata
## 'dump-genofreeze'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT GenoFreeze.Name, GenoFreeze.Name, GenoFreeze.FullName, GenoFreeze.ShortName, GenoFreeze.CreateTime, InbredSet.Name AS InbredSetName FROM GenoFreeze LEFT JOIN InfoFiles ON InfoFiles.InfoPageName = GenoFreeze.Name LEFT JOIN InbredSet ON GenoFreeze.InbredSetId = InbredSet.InbredSetId WHERE GenoFreeze.public > 0 AND GenoFreeze.confidentiality < 1 AND InfoFiles.InfoPageName IS NULL
```

The above query results to triples that have the form:

```text
gn:Genofreeze_name_ -> rdf:type -> gnc:genotypeDataset 
gn:Genofreeze_name_ -> rdfs:label -> GenoFreeze(Name) 
gn:Genofreeze_name_ -> skos:prefLabel -> GenoFreeze(FullName) 
gn:Genofreeze_name_ -> skos:altLabel -> GenoFreeze(ShortName) 
gn:Genofreeze_name_ -> dct:created -> "GenoFreeze(CreateTime)"^^xsd:date 
gn:Genofreeze_name_ -> gnt:belongsToInbredSet -> gn:_inbredset_inbredsetname 
```
Here's an example query:

```sparql
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 

SELECT * WHERE { 
    ?s rdf:type gnc:genotypeDataset .
    ?s rdfs:label "B6D2RIGeno" .
    ?s skos:prefLabel "B6D2RI Genotypes" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:B6d2rigeno rdf:type gnc:genotypeDataset .
gn:B6d2rigeno rdfs:label "B6D2RIGeno" .
gn:B6d2rigeno skos:prefLabel "B6D2RI Genotypes" .
gn:B6d2rigeno skos:altLabel "B6D2RIGeno" .
gn:B6d2rigeno dct:created "2022-10-24"^^xsd:date .
gn:B6d2rigeno gnt:belongsToInbredSet gn:_b6d2ri .
```


## 'dump-genotypes'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT CONCAT(IF(GenoFreeze.Name IS NULL, '', CONCAT(GenoFreeze.Name, '_')), Geno.Name) AS abbrev, Geno.Name, Geno.Chr, IFNULL(Geno.Mb, '') AS Mb, IFNULL(Geno.Mb_mm8, '') AS Mb_mm8, IFNULL(Geno.Mb_2016, '') AS Mb_2016, Geno.Sequence, Geno.Source, IF((Source2 = Source), NULL, Source2) AS Source2, IFNULL(GenoFreeze.Name, '') AS DatasetName, Geno.chr_num, Geno.Comments, GenoXRef.cM FROM Geno LEFT JOIN GenoXRef ON Geno.Id = GenoXRef.GenoId LEFT JOIN GenoFreeze ON GenoFreeze.Id = GenoXRef.GenoFreezeId LEFT JOIN InbredSet ON InbredSet.InbredSetId = GenoFreeze.InbredSetId LEFT JOIN InfoFiles ON InfoFiles.InfoPageName = GenoFreeze.Name
```

The above query results to triples that have the form:

```text
gn:Abbrev -> rdf:type -> gnc:genotype 
gn:Abbrev -> skos:prefLabel -> GenoName 
gn:Abbrev -> gnt:chr -> Geno(Chr) 
gn:Abbrev -> gnt:mb -> "Mb"^^xsd:double 
gn:Abbrev -> gnt:mbMm8 -> "Mb_mm8"^^xsd:double 
gn:Abbrev -> gnt:mb2016 -> "Mb_2016"^^xsd:double 
gn:Abbrev -> gnt:hasSequence -> Geno(Sequence) 
gn:Abbrev -> gnt:hasSource -> Geno(Source) 
gn:Abbrev -> gnt:hasAltSourceName -> Source2 
gn:Abbrev -> gnt:belongsToDataset -> gn:Datasetname 
gn:Abbrev -> gnt:chrNum -> "Geno(chr_num)"^^xsd:int 
gn:Abbrev -> rdfs:comments -> Geno(Comments) 
gn:Abbrev -> gnt:cM -> "GenoXRef(cM)"^^xsd:int 
```
Here's an example query:

```sparql
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 

SELECT * WHERE { 
    ?s rdf:type gnc:genotype .
    ?s skos:prefLabel "D1Mit118" .
    ?s gnt:chr "1" .
    ?s gnt:mb #{"3.968933"^^xsd:double}# .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:B6d2f2geno_d1mit118 rdf:type gnc:genotype .
gn:B6d2f2geno_d1mit118 skos:prefLabel "D1Mit118" .
gn:B6d2f2geno_d1mit118 gnt:chr "1" .
gn:B6d2f2geno_d1mit118 gnt:mb "3.968933"^^xsd:double .
gn:B6d2f2geno_d1mit118 gnt:mbMm8 "3.959096"^^xsd:double .
gn:B6d2f2geno_d1mit118 gnt:mb2016 "3.959014"^^xsd:double .
gn:B6d2f2geno_d1mit118 gnt:hasSequence "TAATACGACTCNCTATAGGGCGAATTGAGGCCCTCTAGATGCATGCTCGANCGGCCGCCAGTGTGCTGGAAAGCCAGCCTGGNCTACAGAGCTCAAGAGACCACATGTGATACTTGCCTTTCTGAGTCTAACATATATAGAATGATCTAATGGTCTCTAATCACACACTTTTTTTTGTGAATGAAACTTATTAAGAGTTTTATATTTGTGTGTGTGTGTGTGTGTGTGTGTGTCTGTGTGTCTCTGTGTGTGTGT" .
gn:B6d2f2geno_d1mit118 gnt:hasSource "Mit" .
gn:B6d2f2geno_d1mit118 gnt:belongsToDataset gn:B6d2f2geno .
gn:B6d2f2geno_d1mit118 gnt:chrNum "1"^^xsd:int .
gn:B6d2f2geno_d1mit118 gnt:cM "0.0"^^xsd:int .
```

