# Species Metadata
## 'classification-scheme-species'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT Species.Fullname FROM Species
```

The above query results to triples that have the form:

```text
gnc:Species -> skos:member -> gn:Species_fullname 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX xkos: <http://rdf-vocabulary.ddialliance.org/xkos#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 

SELECT * WHERE { 
    ?s skos:member gn:Mus_musculus .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gnc:Species skos:member gn:Mus_musculus .
```


## 'classification-scheme-set'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT InbredSet.Name AS InbredSetName FROM InbredSet
```

The above query results to triples that have the form:

```text
gnc:Set -> skos:member -> gn:setInbredset_inbredsetname 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX xkos: <http://rdf-vocabulary.ddialliance.org/xkos#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 

SELECT * WHERE { 
    ?s skos:member gn:setBxd .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gnc:Set skos:member gn:setBxd .
```


## 'species'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT Species.Fullname, Species.Fullname, Species.MenuName, Species.SpeciesName, Species.Name, Species.Family, Species.TaxonomyId FROM Species
```

The above query results to triples that have the form:

```text
gn:Species_fullname -> skos:inScheme -> gnc:ResourceClassificationScheme 
gn:Species_fullname -> rdfs:label -> Species(Fullname) 
gn:Species_fullname -> skos:prefLabel -> Species(MenuName) 
gn:Species_fullname -> skos:altLabel -> Species(SpeciesName) 
gn:Species_fullname -> gnt:shortName -> Species(Name) 
gn:Species_fullname -> gnt:family -> Species(Family) 
gn:Species_fullname -> skos:notation -> taxon:Species(TaxonomyId) 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX xkos: <http://rdf-vocabulary.ddialliance.org/xkos#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 

SELECT * WHERE { 
    ?s skos:inScheme gnc:ResourceClassificationScheme .
    ?s rdfs:label "Mus musculus" .
    ?s skos:prefLabel "Mouse (Mus musculus, mm10)" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:Mus_musculus skos:inScheme gnc:ResourceClassificationScheme .
gn:Mus_musculus rdfs:label "Mus musculus" .
gn:Mus_musculus skos:prefLabel "Mouse (Mus musculus, mm10)" .
gn:Mus_musculus skos:altLabel "Mouse" .
gn:Mus_musculus gnt:shortName "mouse" .
gn:Mus_musculus gnt:family "Vertebrates" .
gn:Mus_musculus skos:notation taxon:10090 .
```


## 'inbred-set'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT InbredSet.Name AS InbredSetName, InbredSet.FullName, InbredSet.Name AS InbredSetName, InbredSet.GeneticType, InbredSet.Family, MappingMethod.Name, InbredSet.InbredSetCode, Species.Fullname FROM InbredSet LEFT JOIN Species ON InbredSet.SpeciesId=Species.Id LEFT JOIN MappingMethod ON InbredSet.MappingMethodId=MappingMethod.Id
```

The above query results to triples that have the form:

```text
gn:setInbredset_inbredsetname -> skos:inScheme -> gnc:ResourceClassificationScheme 
gn:setInbredset_inbredsetname -> rdfs:label -> InbredSet(FullName) 
gn:setInbredset_inbredsetname -> skos:prefLabel -> InbredSet(InbredSetName) 
gn:setInbredset_inbredsetname -> gnt:geneticType -> InbredSet(GeneticType) 
gn:setInbredset_inbredsetname -> gnt:family -> InbredSet(Family) 
gn:setInbredset_inbredsetname -> gnt:mappingMethod -> MappingMethod(Name) 
gn:setInbredset_inbredsetname -> gnt:code -> InbredSet(InbredSetCode) 
gn:setInbredset_inbredsetname -> xkos:generalizes -> gn:Species_fullname 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX xkos: <http://rdf-vocabulary.ddialliance.org/xkos#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 

SELECT * WHERE { 
    ?s skos:inScheme gnc:ResourceClassificationScheme .
    ?s rdfs:label "BXD Family" .
    ?s skos:prefLabel "BXD" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:setBxd skos:inScheme gnc:ResourceClassificationScheme .
gn:setBxd rdfs:label "BXD Family" .
gn:setBxd skos:prefLabel "BXD" .
gn:setBxd gnt:geneticType "riset" .
gn:setBxd gnt:family "Reference Populations (replicate average, SE, N)" .
gn:setBxd gnt:mappingMethod "qtlreaper" .
gn:setBxd gnt:code "BXD" .
gn:setBxd xkos:generalizes gn:Mus_musculus .
```

