# Tissue Metadata
## 'dump-tissue'

## Schema Triples:

```text
gn-term:name -> rdfs:range -> rdfs:Literal
```
## Generated Triples:

The following SQL query was executed:

```sql
SELECT Tissue.Short_Name, Tissue.Name FROM Tissue
```

The above query results to triples that have the form:

```text
gn-id:tissue_tissue_short_name -> rdf:type -> gn-id:tissue 
gn-id:tissue_tissue_short_name -> gn-term:name -> Tissue(Name) 
```
Here's an example query:

```sparql
@prefix gn-id: <http://genenetwork.org/terms/> .
@prefix gn-term: <http://genenetwork.org/terms/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn-id:tissue .
    ?s gn-term:name "Brain mRNA" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn-id:tissue_brn rdf:type gn-id:tissue .
gn-id:tissue_brn gn-term:name "Brain mRNA" .
```

