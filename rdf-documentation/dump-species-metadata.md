# Species Metadata## 'dump-species'


## Generated Triples:

The following SQL query was executed:

```sql
SELECT Species.Fullname, Species.SpeciesName, Species.MenuName, Species.FullName, Species.Family, Species.TaxonomyId FROM Species
```

The above query results to triples that have the form:

```text
gn:Species_fullname -> rdf:type -> gnc:species 
gn:Species_fullname -> gnt:name -> Species(SpeciesName) 
gn:Species_fullname -> rdfs:label -> Species(MenuName) 
gn:Species_fullname -> gnt:binomialName -> Species(FullName) 
gn:Species_fullname -> gnt:family -> Species(Family) 
gn:Species_fullname -> gnt:organism -> taxon:Species(TaxonomyId) 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 

SELECT * WHERE { 
    ?s rdf:type gnc:species .
    ?s gnt:name "Mouse" .
    ?s rdfs:label "Mouse (Mus musculus, mm10)" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:Mus_musculus rdf:type gnc:species .
gn:Mus_musculus gnt:name "Mouse" .
gn:Mus_musculus rdfs:label "Mouse (Mus musculus, mm10)" .
gn:Mus_musculus gnt:binomialName "Mus musculus" .
gn:Mus_musculus gnt:family "Vertebrates" .
gn:Mus_musculus gnt:organism taxon:10090 .
```

## 'dump-strain'


## Generated Triples:

The following SQL query was executed:

```sql
SELECT CAST(CONVERT(BINARY CONVERT(Strain.Name USING latin1) USING utf8) AS VARCHAR(15000)) AS StrainName, Species.Fullname, Strain.Name, IF ((Strain.Name2 != Strain.Name), Strain.Name2, '') AS Name2, IF ((Strain.Alias != Strain.Name), Strain.Alias, '') AS Alias, IF ((Strain.Symbol != Strain.Name), Strain.Alias, '') AS Symbol FROM Strain LEFT JOIN Species ON Strain.SpeciesId = Species.SpeciesId
```

The above query results to triples that have the form:

```text
gn:Strainname -> rdf:type -> gnc:strain 
gn:Strainname -> gnt:species -> gn:Species_fullname 
gn:Strainname -> rdfs:label -> StrainName 
gn:Strainname -> rdfs:label -> Name2 
gn:Strainname -> gnt:alias -> Alias 
gn:Strainname -> gnt:symbol -> Symbol 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 

SELECT * WHERE { 
    ?s rdf:type gnc:strain .
    ?s gnt:species gn:Mus_musculus .
    ?s rdfs:label "B6D2F1" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:B6d2f1 rdf:type gnc:strain .
gn:B6d2f1 gnt:species gn:Mus_musculus .
gn:B6d2f1 rdfs:label "B6D2F1" .
```

## 'dump-mapping-method'


## Generated Triples:

The following SQL query was executed:

```sql
SELECT MappingMethod.Name, MappingMethod.Name FROM MappingMethod
```

The above query results to triples that have the form:

```text
gn:mappingMethod_mappingmethod_name -> rdf:type -> gnc:mappingMethod 
gn:mappingMethod_mappingmethod_name -> rdfs:label -> MappingMethod(Name) 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX gnt: <http://genenetwork.org/term/> 
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
gn:mappingMethod_qtlreaper rdf:type gnc:mappingMethod .
gn:mappingMethod_qtlreaper rdfs:label "qtlreaper" .
```

## 'dump-avg-method'


## Generated Triples:

The following SQL query was executed:

```sql
SELECT AvgMethod.Name, AvgMethod.Normalization FROM AvgMethod
```

The above query results to triples that have the form:

```text
gn:avgmethod_avgmethod_name -> rdf:type -> gnc:avgMethod 
gn:avgmethod_avgmethod_name -> rdfs:label -> AvgMethod(Normalization) 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX gnt: <http://genenetwork.org/term/> 
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
gn:avgmethod_mas5 rdf:type gnc:avgMethod .
gn:avgmethod_mas5 rdfs:label "MAS5" .
```

