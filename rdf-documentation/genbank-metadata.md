# Genebank Metadata
## 'genbank'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT Genbank.Id, Genbank.Sequence, Species.Fullname FROM Genbank LEFT JOIN Species USING (SpeciesId)
```

The above query results to triples that have the form:

```text
genbank:Genbank(Id) -> gnt:hasSequence -> Genbank(Sequence) 
genbank:Genbank(Id) -> xkos:classifiedUnder -> gn:Species_fullname 
```
Here's an example query:

```sparql
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX xkos: <http://rdf-vocabulary.ddialliance.org/xkos#> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX pubmed: <http://rdf.ncbi.nlm.nih.gov/pubmed/> 
PREFIX ncbiTaxon: <https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=> 
PREFIX generif: <http://www.ncbi.nlm.nih.gov/gene?cmd=Retrieve&dopt=Graphics&list_uids=> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX genbank: <https://bioregistry.io/reference/genbank:> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 

SELECT * WHERE { 
    ?s gnt:hasSequence "GAAAAGGACGAGAGAAAATTATTTTTAAGATAATTAAACATAAAAACCCTGGTGCTTATTACATTATAAAGTACGTTTTTAAAAACCCACAAACTATTATACATACGTTTATGAATCAATTAAATACTCTGCACTTGTTAGGAACACGCATATCCCTTCTTTGTTGAGTTTAACGGAACGGGACAGCGGCGTGCGCCCGCGGCTGGGCTGCTCTGGCCGCGGGTCTCCCCAGGCG" .
    ?s xkos:classifiedUnder gn:Mus_musculus .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
genbank:AA002843 gnt:hasSequence "GAAAAGGACGAGAGAAAATTATTTTTAAGATAATTAAACATAAAAACCCTGGTGCTTATTACATTATAAAGTACGTTTTTAAAAACCCACAAACTATTATACATACGTTTATGAATCAATTAAATACTCTGCACTTGTTAGGAACACGCATATCCCTTCTTTGTTGAGTTTAACGGAACGGGACAGCGGCGTGCGCCCGCGGCTGGGCTGCTCTGGCCGCGGGTCTCCCCAGGCG" .
genbank:AA002843 xkos:classifiedUnder gn:Mus_musculus .
```

