# Tissue Metadata
## 'dump-tissue'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT Tissue.Short_Name, Tissue.Name FROM Tissue
```

The above query results to triples that have the form:

```text
gn:tissue_tissue_short_name -> rdf:type -> gnc:tissue 
gn:tissue_tissue_short_name -> rdfs:label -> Tissue(Name) 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnt: <http://genenetwork.org/terms/> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 

SELECT * WHERE { 
    ?s rdf:type gnc:tissue .
    ?s rdfs:label "Brain mRNA" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:tissue_brn rdf:type gnc:tissue .
gn:tissue_brn rdfs:label "Brain mRNA" .
```

