# Publications Metadata
## 'dump-publication'

## Schema Triples:

```text
gn:pubMedId -> rdfs:range -> rdfs:Literal
gn:title -> rdfs:range -> rdfs:Literal
gn:journal -> rdfs:range -> rdfs:Literal
gn:volume -> rdfs:range -> rdfs:Literal
gn:pages -> rdfs:range -> rdfs:Literal
gn:month -> rdfs:range -> rdfs:Literal
gn:year -> rdfs:range -> rdfs:Literal
gn:author -> rdfs:range -> rdfs:Literal
gn:abstract -> rdfs:range -> rdfs:Literal
```
## Generated Triples:

The following SQL query was executed:

```sql
SELECT IF(Publication.PubMed_ID IS NULL, '', CONVERT(Publication.PubMed_Id, INT)) AS pmid, Publication.Id, IFNULL(PubMed_ID, '') AS pubmedId, Publication.Title, Publication.Journal, Publication.Volume, Publication.Pages, Publication.Month, Publication.Year, Publication.Authors, CAST(CONVERT(BINARY CONVERT(Publication.Abstract USING latin1) USING utf8) AS VARCHAR(100)) AS Abstract FROM Publication
```

The above query results to triples that have the form:

```text
publication:pmid -> rdf:type -> gn:publication 
publication:pmid -> gn:pubMedId -> pubmed:pubmedId 
publication:pmid -> gn:title -> Publication(Title) 
publication:pmid -> gn:journal -> Publication(Journal) 
publication:pmid -> gn:volume -> Publication(Volume) 
publication:pmid -> gn:pages -> Publication(Pages) 
publication:pmid -> gn:month -> Publication(Month) 
publication:pmid -> gn:year -> Publication(Year) 
publication:pmid -> gn:abstract -> Abstract 
publication:pmid -> gn:author -> PublicationAuthors 
```
Here's an example query:

```sparql
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX gn: <http://genenetwork.org/terms/> 
PREFIX publication: <http://genenetwork.org/publication/> 
PREFIX pubmed: <http://rdf.ncbi.nlm.nih.gov/pubmed/> 

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn:publication .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:unpublished_1 rdf:type gn:publication .
gn:unpublished_1 gn:year "0" .
```

