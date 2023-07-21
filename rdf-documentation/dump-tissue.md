# Tissue Metadata
## 'dump-tissue'


## Generated Triples:

The following SQL query was executed:

```sql
SELECT Tissue.Short_Name, Tissue.Name FROM Tissue
```

The above query results to triples that have the form:

```text
gn:tissue_tissue_short_name -> rdf:type -> gn:tissue 
gn:tissue_tissue_short_name -> gn-term:name -> Tissue(Name) 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gn-term: <http://genenetwork.org/terms/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn:tissue .
    ?s gn-term:name "Brain mRNA" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:tissue_brn rdf:type gn:tissue .
gn:tissue_brn gn-term:name "Brain mRNA" .
```

