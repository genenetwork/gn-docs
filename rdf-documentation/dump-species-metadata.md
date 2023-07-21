# Species Metadata
## 'dump-species'


## Generated Triples:

The following SQL query was executed:

```sql
SELECT Species.FullName, Species.SpeciesName, Species.MenuName, Species.FullName, Species.Family, Species.TaxonomyId FROM Species
```

The above query results to triples that have the form:

```text
gn:Species_fullname -> rdf:type -> gn:species 
gn:Species_fullname -> gn-term:name -> Species(SpeciesName) 
gn:Species_fullname -> gn-term:displayName -> Species(MenuName) 
gn:Species_fullname -> gn-term:binomialName -> Species(FullName) 
gn:Species_fullname -> gn-term:family -> Species(Family) 
gn:Species_fullname -> gn-term:organism -> taxon:Species(TaxonomyId) 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gn-term: <http://genenetwork.org/term/> 
PREFIX rdf: <https://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn:species .
    ?s gn-term:name "Mouse" .
    ?s gn-term:displayName "Mouse (Mus musculus, mm10)" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:Mus_musculus rdf:type gn:species .
gn:Mus_musculus gn-term:name "Mouse" .
gn:Mus_musculus gn-term:displayName "Mouse (Mus musculus, mm10)" .
gn:Mus_musculus gn-term:binomialName "Mus musculus" .
gn:Mus_musculus gn-term:family "Vertebrates" .
gn:Mus_musculus gn-term:organism taxon:10090 .
```


## 'dump-strain'


## Generated Triples:

The following SQL query was executed:

```sql
SELECT CAST(CONVERT(BINARY CONVERT(Strain.Name USING latin1) USING utf8) AS VARCHAR(15000)) AS StrainName, Species.FullName, Strain.Name, Strain.Name2, Strain.Alias, Strain.Symbol FROM Strain LEFT JOIN Species ON Strain.SpeciesId = Species.SpeciesId
```

The above query results to triples that have the form:

```text
gn:Strainname -> rdf:type -> gn:strain 
gn:Strainname -> gn-term:strainOfSpecies -> gn:Species_fullname 
gn:Strainname -> gn-term:name -> StrainName 
gn:Strainname -> gn-term:name2 -> StrainName2 
gn:Strainname -> gn-term:alias -> StrainAlias 
gn:Strainname -> gn-term:symbol -> Strain(Symbol) 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gn-term: <http://genenetwork.org/term/> 
PREFIX rdf: <https://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn:strain .
    ?s gn-term:strainOfSpecies gn:Mus_musculus .
    ?s gn-term:name "B6D2F1" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:B6d2f1 rdf:type gn:strain .
gn:B6d2f1 gn-term:strainOfSpecies gn:Mus_musculus .
gn:B6d2f1 gn-term:name "B6D2F1" .
gn:B6d2f1 gn-term:name2 "B6D2F1" .
```


## 'dump-mapping-method'


## Generated Triples:

The following SQL query was executed:

```sql
SELECT MappingMethod.Name FROM MappingMethod
```

The above query results to triples that have the form:

```text
gn:mappingMethod_mappingmethod_name -> rdf:type -> gn:mappingMethod 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gn-term: <http://genenetwork.org/term/> 
PREFIX rdf: <https://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn:mappingMethod .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:mappingMethod_qtlreaper rdf:type gn:mappingMethod .
```


## 'dump-avg-method'


## Generated Triples:

The following SQL query was executed:

```sql
SELECT AvgMethod.Name, AvgMethod.Normalization FROM AvgMethod
```

The above query results to triples that have the form:

```text
gn:avgmethod_avgmethod_name -> rdf:type -> gn:avgMethod 
gn:avgmethod_avgmethod_name -> gn-term:normalization -> AvgMethod(Normalization) 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gn-term: <http://genenetwork.org/term/> 
PREFIX rdf: <https://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn:avgMethod .
    ?s gn-term:normalization "MAS5" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:avgmethod_mas5 rdf:type gn:avgMethod .
gn:avgmethod_mas5 gn-term:normalization "MAS5" .
```

