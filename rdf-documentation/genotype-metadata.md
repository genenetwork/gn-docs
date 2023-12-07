# Genotype Metadata
## 'genotypes'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT Geno.Name, Geno.Name, Geno.Chr, IFNULL(Geno.Mb, '') AS Mb, IFNULL(Geno.Mb_mm8, '') AS Mb_mm8, IFNULL(Geno.Mb_2016, '') AS Mb_2016, Geno.Sequence, Geno.Source, IF((Source2 = Source), NULL, Source2) AS Source2, Species.Fullname, Geno.chr_num, Geno.Comments FROM Geno LEFT JOIN Species USING (SpeciesId)
```

The above query results to triples that have the form:

```text
gn:Geno_name_ -> rdf:type -> gnc:Genotype 
gn:Geno_name_ -> rdfs:label -> GenoName 
gn:Geno_name_ -> gnt:chr -> Geno(Chr) 
gn:Geno_name_ -> gnt:mb -> "Mb"^^xsd:double 
gn:Geno_name_ -> gnt:mbMm8 -> "Mb_mm8"^^xsd:double 
gn:Geno_name_ -> gnt:mb2016 -> "Mb_2016"^^xsd:double 
gn:Geno_name_ -> gnt:hasSequence -> Geno(Sequence) 
gn:Geno_name_ -> gnt:hasSource -> Geno(Source) 
gn:Geno_name_ -> gnt:hasAltSourceName -> Source2 
gn:Geno_name_ -> gnt:belongsToSpecies -> gn:Species_fullname 
gn:Geno_name_ -> gnt:chrNum -> "Geno(chr_num)"^^xsd:int 
gn:Geno_name_ -> rdfs:comments -> Geno(Comments) 
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
PREFIX xkos: <http://rdf-vocabulary.ddialliance.org/xkos#> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 

SELECT * WHERE { 
    ?s rdf:type gnc:Genotype .
    ?s rdfs:label "D1Mit296" .
    ?s gnt:chr "1" .
    ?s gnt:mb #{"9.749729"^^xsd:double}# .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:D1mit296 rdf:type gnc:Genotype .
gn:D1mit296 rdfs:label "D1Mit296" .
gn:D1mit296 gnt:chr "1" .
gn:D1mit296 gnt:mb "9.749729"^^xsd:double .
gn:D1mit296 gnt:mbMm8 "9.734943"^^xsd:double .
gn:D1mit296 gnt:mb2016 "9.73981"^^xsd:double .
gn:D1mit296 gnt:hasSequence "CTTGCATGCCTGCGGNTNCGNACTCTAGAGGATCTCCCTATTATTNTNACATNACTTTNAATTAAAATAATAATCAGATAACTTCAACNNNNTGNNCACTTCTGTCAAGTGGACAGAAATAAACATAGAGCCTAATTATCCTGAATTTNAGAGAAAAGAGTGTGTTTANCACAANAGAACAGTTATAGATCTACACACACACACACACACACACACACACACACATACAGTTTGAAAAATGCATCAGTTGAGACC" .
gn:D1mit296 gnt:hasSource "Mit" .
gn:D1mit296 gnt:belongsToSpecies gn:Mus_musculus .
gn:D1mit296 gnt:chrNum "1"^^xsd:int .
```

