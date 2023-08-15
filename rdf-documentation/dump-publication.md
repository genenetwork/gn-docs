# Publications Metadata
## 'dump-publication'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT IF(Publication.PubMed_ID IS NULL, '', CONVERT(Publication.PubMed_Id, INT)) AS pmid, Publication.Id, IFNULL(PubMed_ID, '') AS pubmedId, Publication.Title, Publication.Journal, Publication.Volume, Publication.Pages, Publication.Month, IF(Publication.Year = 0, NULL, Publication.Year) AS Year, Publication.Authors, Publication.Abstract FROM Publication
```

The above query results to triples that have the form:

```text
pubmed:pmid -> rdf:type -> fabio:ResearchPaper 
pubmed:pmid -> fabio:hasPubMedId -> pubmed:pubmedId 
pubmed:pmid -> dct:title -> Publication(Title) 
pubmed:pmid -> fabio:Journal -> Publication(Journal) 
pubmed:pmid -> prism:volume -> Publication(Volume) 
pubmed:pmid -> fabio:page -> Publication(Pages) 
pubmed:pmid -> prism:publicationDate -> "Publication(Month)"^^xsd:gMonth 
pubmed:pmid -> fabio:hasPublicationYear -> "Year"^^xsd:gYear 
pubmed:pmid -> dct:abstract -> PublicationAbstract 
pubmed:pmid -> dct:creator -> PublicationAuthors 
```
Here's an example query:

```sparql
PREFIX gnt: <http://genenetwork.org/terms/> 
PREFIX fabio: <http://purl.org/spar/fabio/> 
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX prism: <http://prismstandard.org/namespaces/basic/2.0/> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX pubmed: <http://rdf.ncbi.nlm.nih.gov/pubmed/> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 

SELECT * WHERE { 
    ?s rdf:type fabio:ResearchPaper .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:unpublished_1 rdf:type fabio:ResearchPaper .
```

