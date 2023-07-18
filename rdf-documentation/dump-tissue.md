# Tissue Metadata
## 'dump-tissue'

## Schema Triples:

```text
gn:name -> rdfs:range -> rdfs:Literal
```
## Generated Triples:

The following SQL query was executed:

```sql
SELECT Tissue.Short_Name, Tissue.Name FROM Tissue
```

The above query results to triples that have the form:

```text
gn:tissue_tissue_short_name_ -> rdf:type -> gn:tissue 
gn:tissue_tissue_short_name_ -> gn:name -> Tissue(Name) 
```
Here's an example query:

```sparql
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX gn: <http://genenetwork.org/terms/> 

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn:tissue .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:tissue_brn rdf:type gn:tissue .
gn:tissue_brn gn:name "Brain mRNA" .
```

