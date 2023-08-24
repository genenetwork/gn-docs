# GeneRIF Metadata
## 'genewiki-symbols'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT GeneRIF_BASIC.GeneId, GROUP_CONCAT(DISTINCT symbol) AS symbol, GROUP_CONCAT(DISTINCT Species.SpeciesName) AS species, GROUP_CONCAT(DISTINCT TaxID) AS taxId FROM GeneRIF_BASIC LEFT JOIN Species USING (SpeciesId) GROUP BY GeneId ORDER BY BINARY symbol
```

The above query results to triples that have the form:

```text
generif:GeneRIF_BASIC(GeneId) -> gnt:symbol -> symbol 
generif:GeneRIF_BASIC(GeneId) -> gnt:belongsToSpecies -> species 
generif:GeneRIF_BASIC(GeneId) -> dct:relation -> ncbiTaxon:taxId 
```
Here's an example query:

```sparql
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX pubmed: <http://rdf.ncbi.nlm.nih.gov/pubmed/> 
PREFIX ncbiTaxon: <https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=> 
PREFIX generif: <http://www.ncbi.nlm.nih.gov/gene?cmd=Retrieve&dopt=Graphics&list_uids=> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 

SELECT * WHERE { 
    ?s gnt:belongsToSpecies "Human" .
    ?s dct:relation ncbiTaxon:9606 .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
generif:233 gnt:belongsToSpecies "Human" .
generif:233 dct:relation ncbiTaxon:9606 .
```


## 'gn-genewiki-entries'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT Species.FullName, GeneRIF.comment, GeneRIF.symbol, GeneRIF.createtime, GeneRIF.comment, GeneRIF.symbol, GROUP_CONCAT(DISTINCT GeneCategory.Name SEPARATOR '$$') AS GeneCategory, Species.Fullname, IFNULL(GeneRIF.PubMed_ID, '') AS PubMed_ID, GeneRIF.createtime, GeneRIF.email, Investigators.Email, Investigators.FirstName, Investigators.LastName, Investigators.Email, GeneRIF.weburl FROM GeneRIF LEFT JOIN Species ON Species.SpeciesId = GeneRIF.SpeciesId LEFT JOIN GeneRIFXRef ON GeneRIFXRef.GeneRIFId = GeneRIF.Id LEFT JOIN GeneCategory ON GeneRIFXRef.GeneCategoryId = GeneCategory.Id LEFT JOIN Investigators ON Investigators.Email = GeneRIF.email WHERE GeneRIF.display > 0 AND GeneRIF.VersionId = 0 AND GeneRIF.comment IS NOT NULL GROUP BY GeneRIF.comment, GeneRIF.createtime
```

The above query results to triples that have the form:

```text
gn:generif_e72e92f4-59b5-3bbd-ac46-a39a23f25e55 -> rdf:type -> gnc:GNWikiEntry 
gn:generif_e72e92f4-59b5-3bbd-ac46-a39a23f25e55 -> rdfs:label -> GeneRIFcomment 
gn:generif_e72e92f4-59b5-3bbd-ac46-a39a23f25e55 -> gnt:symbol -> GeneRIF(symbol) 
gn:generif_e72e92f4-59b5-3bbd-ac46-a39a23f25e55 -> gnt:belongsToSpecies -> gn:Species_fullname 
gn:generif_e72e92f4-59b5-3bbd-ac46-a39a23f25e55 -> dct:created ->  
gn:generif_e72e92f4-59b5-3bbd-ac46-a39a23f25e55 -> dct:creator -> gn:investigator_investigators_firstname_investigators_lastname_investigators_email 
gn:generif_e72e92f4-59b5-3bbd-ac46-a39a23f25e55 -> foaf:homepage -> GeneRIF(weburl) 
gn:generif_e72e92f4-59b5-3bbd-ac46-a39a23f25e55 -> gnt:belongsToCategory -> GeneCategory 
gn:generif_e72e92f4-59b5-3bbd-ac46-a39a23f25e55 -> dct:references -> pubmed:PubMed_ID 
```
Here's an example query:

```sparql
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX pubmed: <http://rdf.ncbi.nlm.nih.gov/pubmed/> 
PREFIX ncbiTaxon: <https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=> 
PREFIX generif: <http://www.ncbi.nlm.nih.gov/gene?cmd=Retrieve&dopt=Graphics&list_uids=> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 

SELECT * WHERE { 
    ?s rdf:type gnc:GNWikiEntry .
    ?s rdfs:label "Part 2 of the Slc9a1 wiki.\r\n\r\nThe human SLC9A1 gene was cloned and mapped to human chromosome 1p Lifton et al., 1990.\r\n\r\nThe mouse Slc9a1 gene maps to chromosome 4. Morahan et al., 1993. There are three common alleles of Slc9a1, originally detected by RFLP analyses. Each of these allelic SLC9A1 proteins have different levels of antiporter activity. Morahan et al. 1994  Remarkably, intracellular pH varies between strains based on their Slc9a1 alleles.  McClive et al. 1996." .
    ?s gnt:symbol "Slc9a1" .
    ?s gnt:belongsToSpecies gn:Mus_musculus .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:generif_beb6fe8c-d5bc-36b7-9a9f-9030f19e605f rdf:type gnc:GNWikiEntry .
gn:generif_beb6fe8c-d5bc-36b7-9a9f-9030f19e605f rdfs:label "Part 2 of the Slc9a1 wiki.\r\n\r\nThe human SLC9A1 gene was cloned and mapped to human chromosome 1p Lifton et al., 1990.\r\n\r\nThe mouse Slc9a1 gene maps to chromosome 4. Morahan et al., 1993. There are three common alleles of Slc9a1, originally detected by RFLP analyses. Each of these allelic SLC9A1 proteins have different levels of antiporter activity. Morahan et al. 1994  Remarkably, intracellular pH varies between strains based on their Slc9a1 alleles.  McClive et al. 1996." .
gn:generif_beb6fe8c-d5bc-36b7-9a9f-9030f19e605f gnt:symbol "Slc9a1" .
gn:generif_beb6fe8c-d5bc-36b7-9a9f-9030f19e605f gnt:belongsToSpecies gn:Mus_musculus .
gn:generif_beb6fe8c-d5bc-36b7-9a9f-9030f19e605f dct:created "2011-06-10T12:06:30"^^xsd:datetime .
gn:generif_beb6fe8c-d5bc-36b7-9a9f-9030f19e605f dct:creator gn:investigator_grant_morahan_gem_waimr.uwa.edu.au .
gn:generif_beb6fe8c-d5bc-36b7-9a9f-9030f19e605f gnt:belongsToCategory "Biochemistry" .
gn:generif_beb6fe8c-d5bc-36b7-9a9f-9030f19e605f gnt:belongsToCategory "Genetic variation and alleles" .
gn:generif_beb6fe8c-d5bc-36b7-9a9f-9030f19e605f gnt:belongsToCategory "Physiology and function" .
gn:generif_beb6fe8c-d5bc-36b7-9a9f-9030f19e605f dct:references pubmed:094369 .
gn:generif_beb6fe8c-d5bc-36b7-9a9f-9030f19e605f dct:references pubmed:8016086 .
gn:generif_beb6fe8c-d5bc-36b7-9a9f-9030f19e605f dct:references pubmed:8550102 .
```


## 'ncbi-genewiki-entries'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT GeneRIF_BASIC.GeneId, GeneRIF_BASIC.VersionId, GeneRIF_BASIC.comment, GeneRIF_BASIC.symbol, GeneRIF_BASIC.createtime, GeneRIF_BASIC.comment, GeneRIF_BASIC.symbol, GROUP_CONCAT(PubMed_ID) AS pmids, GeneRIF_BASIC.VersionId, GeneRIF_BASIC.createtime FROM GeneRIF_BASIC GROUP BY GeneId, comment, createtime
```

The above query results to triples that have the form:

```text
gn:generif_d6552bcc-c798-34ab-a533-e23323255d1b -> rdf:type -> gnc:NCBIWikiEntry 
gn:generif_d6552bcc-c798-34ab-a533-e23323255d1b -> rdfs:label -> "GeneRIF_BASIC(comment)"^^xsd:string 
gn:generif_d6552bcc-c798-34ab-a533-e23323255d1b -> gnt:symbol -> GeneRIF_BASIC(symbol) 
gn:generif_d6552bcc-c798-34ab-a533-e23323255d1b -> gnt:hasVersion -> GeneRIF_BASIC(VersionId) 
gn:generif_d6552bcc-c798-34ab-a533-e23323255d1b -> dct:created ->  
gn:generif_d6552bcc-c798-34ab-a533-e23323255d1b -> dct:references -> pubmed:pmids 
```
Here's an example query:

```sparql
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX pubmed: <http://rdf.ncbi.nlm.nih.gov/pubmed/> 
PREFIX ncbiTaxon: <https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=> 
PREFIX generif: <http://www.ncbi.nlm.nih.gov/gene?cmd=Retrieve&dopt=Graphics&list_uids=> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 

SELECT * WHERE { 
    ?s rdf:type gnc:NCBIWikiEntry .
    ?s rdfs:label #{"A1BG-cysteine-rich secretory protein 3 complex displays a similar function in protecting the circulation from a potentially harmful effect of free CRISP-3"^^xsd:string}# .
    ?s gnt:symbol "A1BG" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:generif_fc8da76d-e68e-3622-b23a-d5a5daf06c99 rdf:type gnc:NCBIWikiEntry .
gn:generif_fc8da76d-e68e-3622-b23a-d5a5daf06c99 rdfs:label "A1BG-cysteine-rich secretory protein 3 complex displays a similar function in protecting the circulation from a potentially harmful effect of free CRISP-3"^^xsd:string .
gn:generif_fc8da76d-e68e-3622-b23a-d5a5daf06c99 gnt:symbol "A1BG" .
gn:generif_fc8da76d-e68e-3622-b23a-d5a5daf06c99 gnt:hasVersion "1" .
gn:generif_fc8da76d-e68e-3622-b23a-d5a5daf06c99 dct:created "2010-01-20T18:00:00"^^xsd:datetime .
gn:generif_fc8da76d-e68e-3622-b23a-d5a5daf06c99 dct:references pubmed:15461460 .
```

