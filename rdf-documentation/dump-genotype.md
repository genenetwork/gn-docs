# Genotype Metadata
## 'dump-genofreeze'


## Generated Triples:

The following SQL query was executed:

```sql
SELECT GenoFreeze.Name, GenoFreeze.Name, GenoFreeze.FullName, GenoFreeze.ShortName, GenoFreeze.CreateTime, InbredSet.Name AS InbredSetName FROM GenoFreeze LEFT JOIN InfoFiles ON InfoFiles.InfoPageName = GenoFreeze.Name LEFT JOIN InbredSet ON GenoFreeze.InbredSetId = InbredSet.InbredSetId WHERE GenoFreeze.public > 0 AND GenoFreeze.confidentiality < 1 AND InfoFiles.InfoPageName IS NULL
```

The above query results to triples that have the form:

```text
gn:Genofreeze_name_ -> rdf:type -> gn:genotypeDataset 
gn:Genofreeze_name_ -> gn-term:name -> GenoFreeze(Name) 
gn:Genofreeze_name_ -> gn-term:fullName -> GenoFreeze(FullName) 
gn:Genofreeze_name_ -> gn-term:shortName -> GenoFreeze(ShortName) 
gn:Genofreeze_name_ -> dct:created -> "GenoFreeze(CreateTime)"^^xsd:date 
gn:Genofreeze_name_ -> gn-term:datasetOfInbredSet -> gn:_inbredset_inbredsetname 
```
Here's an example query:

```sparql
@prefix gn: <http://genenetwork.org/id/> .
@prefix gn-term: <http://genenetwork.org/term/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn:genotypeDataset .
    ?s gn-term:name "B6D2RIGeno" .
    ?s gn-term:fullName "B6D2RI Genotypes" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:B6d2rigeno rdf:type gn:genotypeDataset .
gn:B6d2rigeno gn-term:name "B6D2RIGeno" .
gn:B6d2rigeno gn-term:fullName "B6D2RI Genotypes" .
gn:B6d2rigeno gn-term:shortName "B6D2RIGeno" .
gn:B6d2rigeno dct:created "2022-10-24"^^xsd:date .
gn:B6d2rigeno gn-term:datasetOfInbredSet gn:_b6d2ri .
```


## 'dump-genotypes'


## Generated Triples:

The following SQL query was executed:

```sql
SELECT CONCAT(IF(GenoFreeze.Name IS NULL, '', CONCAT(GenoFreeze.Name, ':')), Geno.Name) AS abbrev, Geno.Name, Geno.Marker_Name, Geno.Chr, IFNULL(Geno.Mb, '') AS Mb, Geno.Sequence, Geno.Source, Geno.Source2, IFNULL(GenoFreeze.Name, '') AS DatasetName, IFNULL(Geno.chr_num, '') AS chr_num, CAST(CONVERT(BINARY CONVERT(Geno.Comments USING latin1) USING utf8) AS VARCHAR(255)) AS Comments, IFNULL(GenoXRef.cM, '') AS Chr_mm8 FROM Geno LEFT JOIN GenoXRef ON Geno.Id = GenoXRef.GenoId LEFT JOIN GenoFreeze ON GenoFreeze.Id = GenoXRef.GenoFreezeId LEFT JOIN InfoFiles ON InfoFiles.InfoPageName = GenoFreeze.Name
```

The above query results to triples that have the form:

```text
gn:Abbrev -> rdf:type -> gn:genotype 
gn:Abbrev -> gn-term:name -> GenoName 
gn:Abbrev -> gn-term:markerName -> GenoMarker_Name 
gn:Abbrev -> gn-term:chr -> Geno(Chr) 
gn:Abbrev -> gn-term:mb -> "Mb"^^xsd:double 
gn:Abbrev -> gn-term:sequence -> Geno(Sequence) 
gn:Abbrev -> gn-term:source -> Geno(Source) 
gn:Abbrev -> gn-term:source2 -> Geno(Source2) 
gn:Abbrev -> gn-term:genotypeOfDataset -> gn:Datasetname 
gn:Abbrev -> gn-term:chrNum -> "chr_num"^^xsd:int 
gn:Abbrev -> gn:comments -> Comments 
gn:Abbrev -> gn-term:cM -> "Chr_mm8"^^xsd:int 
```
Here's an example query:

```sparql
@prefix gn: <http://genenetwork.org/id/> .
@prefix gn-term: <http://genenetwork.org/term/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn:genotype .
    ?s gn-term:name "D1Mit296" .
    ?s gn-term:markerName "D1Mit296" .
    ?s gn-term:chr "1" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:Axbxageno:d1mit296 rdf:type gn:genotype .
gn:Axbxageno:d1mit296 gn-term:name "D1Mit296" .
gn:Axbxageno:d1mit296 gn-term:markerName "D1Mit296" .
gn:Axbxageno:d1mit296 gn-term:chr "1" .
gn:Axbxageno:d1mit296 gn-term:mb "9.749729"^^xsd:double .
gn:Axbxageno:d1mit296 gn-term:sequence "CTTGCATGCCTGCGGNTNCGNACTCTAGAGGATCTCCCTATTATTNTNACATNACTTTNAATTAAAATAATAATCAGATAACTTCAACNNNNTGNNCACTTCTGTCAAGTGGACAGAAATAAACATAGAGCCTAATTATCCTGAATTTNAGAGAAAAGAGTGTGTTTANCACAANAGAACAGTTATAGATCTACACACACACACACACACACACACACACACACATACAGTTTGAAAAATGCATCAGTTGAGACC" .
gn:Axbxageno:d1mit296 gn-term:source "Mit" .
gn:Axbxageno:d1mit296 gn-term:source2 "Mit" .
gn:Axbxageno:d1mit296 gn-term:genotypeOfDataset gn:Axbxageno .
gn:Axbxageno:d1mit296 gn-term:chrNum "1"^^xsd:int .
gn:Axbxageno:d1mit296 gn-term:cM "0"^^xsd:int .
```

