# Publications Metadata
## 'dump-publication'


## Generated Triples:

The following SQL query was executed:

```sql
SELECT IF(Publication.PubMed_ID IS NULL, '', CONVERT(Publication.PubMed_Id, INT)) AS pmid, Publication.Id, IFNULL(PubMed_ID, '') AS pubmedId, Publication.Title, Publication.Journal, Publication.Volume, Publication.Pages, Publication.Month, Publication.Year, Publication.Authors, CAST(CONVERT(BINARY CONVERT(Publication.Abstract USING latin1) USING utf8) AS VARCHAR(100)) AS Abstract FROM Publication
```

The above query results to triples that have the form:

```text
pubmed:pmid -> rdf:type -> gn:publication 
pubmed:pmid -> gn-term:pubMedId -> pubmed:pubmedId 
pubmed:pmid -> gn-term:title -> Publication(Title) 
pubmed:pmid -> gn-term:journal -> Publication(Journal) 
pubmed:pmid -> gn-term:volume -> Publication(Volume) 
pubmed:pmid -> gn-term:pages -> Publication(Pages) 
pubmed:pmid -> gn-term:month -> Publication(Month) 
pubmed:pmid -> gn-term:year -> Publication(Year) 
pubmed:pmid -> gn:abstract -> Abstract 
pubmed:pmid -> gn:author -> PublicationAuthors 
```
Here's an example query:

```sparql
PREFIX gn-term: <http://genenetwork.org/terms/> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX pubmed: <http://rdf.ncbi.nlm.nih.gov/pubmed/> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn:publication .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:unpublished_1 rdf:type gn:publication .
gn:unpublished_1 gn-term:year "0" .
```

