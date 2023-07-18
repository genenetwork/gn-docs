# Species Metadata
## 'dump-species'

## Schema Triples:

```text
gn-term:name -> rdfs:range -> rdfs:Literal
gn-term:displayName -> rdfs:range -> rdfs:Literal
gn-term:binomialName -> rdfs:range -> rdfs:Literal
gn-term:family -> rdfs:range -> rdfs:Literal
```
## Generated Triples:

The following SQL query was executed:

```sql
SELECT Species.FullName, Species.SpeciesName, Species.MenuName, Species.FullName, Species.Family, Species.TaxonomyId FROM Species
```

The above query results to triples that have the form:

```text
gn-id:Species_fullname -> rdf:type -> gn-id:species 
gn-id:Species_fullname -> gn-term:name -> Species(SpeciesName) 
gn-id:Species_fullname -> gn-term:displayName -> Species(MenuName) 
gn-id:Species_fullname -> gn-term:binomialName -> Species(FullName) 
gn-id:Species_fullname -> gn-term:family -> Species(Family) 
gn-id:Species_fullname -> gn-term:organism -> taxon:Species(TaxonomyId) 
```
Here's an example query:

```sparql
@prefix gn-id: <http://genenetwork.org/terms/> .
@prefix gn-term: <http://genenetwork.org/terms/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix taxon: <http://purl.uniprot.org/taxonomy/> .

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn-id:species .
    ?s gn-term:name "Mouse" .
    ?s gn-term:displayName "Mouse (Mus musculus, mm10)" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn-id:Mus_musculus rdf:type gn-id:species .
gn-id:Mus_musculus gn-term:name "Mouse" .
gn-id:Mus_musculus gn-term:displayName "Mouse (Mus musculus, mm10)" .
gn-id:Mus_musculus gn-term:binomialName "Mus musculus" .
gn-id:Mus_musculus gn-term:family "Vertebrates" .
gn-id:Mus_musculus gn-term:organism taxon:10090 .
```


## 'dump-strain'

## Schema Triples:

```text
gn-term:strainOfSpecies -> rdfs:domain -> gn-term:strain
gn-term:strainOfSpecies -> rdfs:range -> gn-term:species
gn-term:name -> rdfs:range -> rdfs:Literal
gn-term:alias -> rdfs:range -> rdfs:Literal
gn-term:symbol -> rdfs:range -> rdfs:Literal
```
## Generated Triples:

The following SQL query was executed:

```sql
SELECT CAST(CONVERT(BINARY CONVERT(Strain.Name USING latin1) USING utf8) AS VARCHAR(15000)) AS StrainName, Species.FullName, Strain.Name, Strain.Name2, Strain.Alias, Strain.Symbol FROM Strain LEFT JOIN Species ON Strain.SpeciesId = Species.SpeciesId
```

The above query results to triples that have the form:

```text
gn-id:Strainname -> rdf:type -> gn-id:strain 
gn-id:Strainname -> gn-term:strainOfSpecies -> gn-id:Species_fullname 
gn-id:Strainname -> gn-term:name -> StrainName 
gn-id:Strainname -> gn-term:name2 -> StrainName2 
gn-id:Strainname -> gn-term:alias -> StrainAlias 
gn-id:Strainname -> gn-term:symbol -> Strain(Symbol) 
```
Here's an example query:

```sparql
@prefix gn-id: <http://genenetwork.org/terms/> .
@prefix gn-term: <http://genenetwork.org/terms/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix taxon: <http://purl.uniprot.org/taxonomy/> .

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn-id:strain .
    ?s gn-term:strainOfSpecies gn-id:Mus_musculus .
    ?s gn-term:name "B6D2F1" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn-id:B6d2f1 rdf:type gn-id:strain .
gn-id:B6d2f1 gn-term:strainOfSpecies gn-id:Mus_musculus .
gn-id:B6d2f1 gn-term:name "B6D2F1" .
gn-id:B6d2f1 gn-term:name2 "B6D2F1" .
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
gn-id:mappingMethod_mappingmethod_name -> rdf:type -> gn-id:mappingMethod 
```
Here's an example query:

```sparql
@prefix gn-id: <http://genenetwork.org/terms/> .
@prefix gn-term: <http://genenetwork.org/terms/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix taxon: <http://purl.uniprot.org/taxonomy/> .

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn-id:mappingMethod .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn-id:mappingMethod_qtlreaper rdf:type gn-id:mappingMethod .
```


## 'dump-avg-method'

## Schema Triples:

```text
gn-term:normalization -> rdfs:range -> rdfs:Literal
```
## Generated Triples:

The following SQL query was executed:

```sql
SELECT AvgMethod.Name, AvgMethod.Normalization FROM AvgMethod
```

The above query results to triples that have the form:

```text
gn-id:avgmethod_avgmethod_name -> rdf:type -> gn-id:avgMethod 
gn-id:avgmethod_avgmethod_name -> gn-term:normalization -> AvgMethod(Normalization) 
```
Here's an example query:

```sparql
@prefix gn-id: <http://genenetwork.org/terms/> .
@prefix gn-term: <http://genenetwork.org/terms/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix taxon: <http://purl.uniprot.org/taxonomy/> .

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn-id:avgMethod .
    ?s gn-term:normalization "MAS5" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn-id:avgmethod_mas5 rdf:type gn-id:avgMethod .
gn-id:avgmethod_mas5 gn-term:normalization "MAS5" .
```

