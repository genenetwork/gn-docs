# Species Metadata
## 'dump-species'

## Schema Triples:

```text
gn:name -> rdfs:range -> rdfs:Literal
gn:displayName -> rdfs:range -> rdfs:Literal
gn:binomialName -> rdfs:range -> rdfs:Literal
gn:family -> rdfs:range -> rdfs:Literal
```
## Generated Triples:

The following SQL query was executed:

```sql
SELECT Species.FullName, Species.SpeciesName, Species.MenuName, Species.FullName, Species.Family, Species.TaxonomyId FROM Species
```

The above query results to triples that have the form:

```text
gn:species_species_fullname_ -> rdf:type -> gn:species 
gn:species_species_fullname_ -> gn:name -> Species(SpeciesName) 
gn:species_species_fullname_ -> gn:displayName -> Species(MenuName) 
gn:species_species_fullname_ -> gn:binomialName -> Species(FullName) 
gn:species_species_fullname_ -> gn:family -> Species(Family) 
gn:species_species_fullname_ -> gn:organism -> #{taxon:Species\x28;TaxonomyId\x29;}# 
```
Here's an example query:

```sparql
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX gn: <http://genenetwork.org/terms/> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn:species .
    ?s gn:name "Mouse" .
    ?s gn:displayName "Mouse (Mus musculus, mm10)" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:species_mus_musculus rdf:type gn:species .
gn:species_mus_musculus gn:name "Mouse" .
gn:species_mus_musculus gn:displayName "Mouse (Mus musculus, mm10)" .
gn:species_mus_musculus gn:binomialName "Mus musculus" .
gn:species_mus_musculus gn:family "Vertebrates" .
gn:species_mus_musculus gn:organism taxon:10090 .
```


## 'dump-strain'

## Schema Triples:

```text
gn:strainOfSpecies -> rdfs:domain -> gn:strain
gn:strainOfSpecies -> rdfs:range -> gn:species
gn:name -> rdfs:range -> rdfs:Literal
gn:alias -> rdfs:range -> rdfs:Literal
gn:symbol -> rdfs:range -> rdfs:Literal
```
## Generated Triples:

The following SQL query was executed:

```sql
SELECT CAST(CONVERT(BINARY CONVERT(Strain.Name USING latin1) USING utf8) AS VARCHAR(15000)) AS StrainName, Species.FullName, Strain.Name, Strain.Name2, Strain.Alias, Strain.Symbol FROM Strain LEFT JOIN Species ON Strain.SpeciesId = Species.SpeciesId
```

The above query results to triples that have the form:

```text
gn:strain_strainname -> rdf:type -> gn:strain 
gn:strain_strainname -> gn:strainOfSpecies -> gn:species_species_fullname_ 
gn:strain_strainname -> gn:name -> StrainName 
gn:strain_strainname -> gn:name -> StrainName2 
gn:strain_strainname -> gn:alias -> StrainAlias 
gn:strain_strainname -> gn:symbol -> Strain(Symbol) 
```
Here's an example query:

```sparql
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX gn: <http://genenetwork.org/terms/> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn:strain .
    ?s gn:strainOfSpecies gn:species_mus_musculus .
    ?s gn:name "B6D2F1" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:strain_b6d2f1 rdf:type gn:strain .
gn:strain_b6d2f1 gn:strainOfSpecies gn:species_mus_musculus .
gn:strain_b6d2f1 gn:name "B6D2F1" .
gn:strain_b6d2f1 gn:name "B6D2F1" .
```


## 'dump-mapping-method'

## Schema Triples:

```text
```
## Generated Triples:

The following SQL query was executed:

```sql
SELECT MappingMethod.Name FROM MappingMethod
```

The above query results to triples that have the form:

```text
gn:mappingMethod_mappingmethod_name_ -> rdf:type -> gn:mappingMethod 
```
Here's an example query:

```sparql
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX gn: <http://genenetwork.org/terms/> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 

SELECT ?s ?p ?o WHERE { 
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:mappingMethod_qtlreaper rdf:type gn:mappingMethod .
```


## 'dump-avg-method'

## Schema Triples:

```text
gn:name -> rdfs:range -> rdfs:Literal
```
## Generated Triples:

The following SQL query was executed:

```sql
SELECT AvgMethod.Name, AvgMethod.Name FROM AvgMethod
```

The above query results to triples that have the form:

```text
gn:avgmethod_avgmethod_name_ -> rdf:type -> gn:avgMethod 
gn:avgmethod_avgmethod_name_ -> gn:name -> AvgMethod(Name) 
```
Here's an example query:

```sparql
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX gn: <http://genenetwork.org/terms/> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn:avgMethod .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:avgmethod_mas5 rdf:type gn:avgMethod .
gn:avgmethod_mas5 gn:name "MAS5" .
```

