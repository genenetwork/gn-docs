# Species Metadata
## 'strain'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT Strain.Name, Species.Fullname, Strain.Name, IF ((Strain.Name2 != Strain.Name), Strain.Name2, '') AS Name2, IF ((Strain.Alias != Strain.Name), Strain.Alias, '') AS Alias, IF ((Strain.Symbol != Strain.Name), Strain.Symbol, '') AS Symbol FROM Strain LEFT JOIN Species ON Strain.SpeciesId = Species.SpeciesId
```

The above query results to triples that have the form:

```text
gn:Strain_name_ -> rdf:type -> gnc:strain 
gn:Strain_name_ -> gnt:belongsToSpecies -> gn:Species_fullname 
gn:Strain_name_ -> rdfs:label -> StrainName 
gn:Strain_name_ -> skos:altLabel -> Name2 
gn:Strain_name_ -> gnt:alias -> Alias 
gn:Strain_name_ -> gnt:symbol -> Symbol 
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
    ?s rdf:type gnc:strain .
    ?s gnt:belongsToSpecies gn:Mus_musculus .
    ?s rdfs:label "B6D2F1" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:B6d2f1 rdf:type gnc:strain .
gn:B6d2f1 gnt:belongsToSpecies gn:Mus_musculus .
gn:B6d2f1 rdfs:label "B6D2F1" .
```


## 'mapping-method'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT MappingMethod.Name, MappingMethod.Name FROM MappingMethod
```

The above query results to triples that have the form:

```text
gn:mappingMethodMappingmethod_name -> rdf:type -> gnc:mappingMethod 
gn:mappingMethodMappingmethod_name -> rdfs:label -> MappingMethod(Name) 
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
    ?s rdf:type gnc:mappingMethod .
    ?s rdfs:label "qtlreaper" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:mappingMethodQtlreaper rdf:type gnc:mappingMethod .
gn:mappingMethodQtlreaper rdfs:label "qtlreaper" .
```


## 'avg-method'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT AvgMethod.Name AS AvgMethodName, AvgMethod.Normalization FROM AvgMethod
```

The above query results to triples that have the form:

```text
gn:avgMethodAvgmethod_avgmethodname -> rdf:type -> gnc:avgMethod 
gn:avgMethodAvgmethod_avgmethodname -> rdfs:label -> AvgMethod(Normalization) 
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
    ?s rdf:type gnc:avgMethod .
    ?s rdfs:label "MAS5" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:avgMethodMas5 rdf:type gnc:avgMethod .
gn:avgMethodMas5 rdfs:label "MAS5" .
```

