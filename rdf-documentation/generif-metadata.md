# GeneRIF Metadata
## 'genewiki-symbols'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT GeneRIF_BASIC.symbol, GeneRIF_BASIC.symbol FROM GeneRIF_BASIC GROUP BY BINARY symbol
```

The above query results to triples that have the form:

```text
gn:symbolGeneRIF_BASIC_symbol_ -> rdfs:label -> GeneRIF_BASIC(symbol) 
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
PREFIX taxon: <https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=> 
PREFIX generif: <http://www.ncbi.nlm.nih.gov/gene?cmd=Retrieve&dopt=Graphics&list_uids=> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 

SELECT * WHERE { 
    ?s ?p ?o .
}
```

Expected Result:

```rdf
```


## 'gn-genewiki-entries'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT GeneRIF.symbol, GeneRIF.comment, GeneRIF.createtime AS EntryCreateTime, GeneRIF.PubMed_ID AS PMID, GeneRIF.weburl, Species.Fullname, GROUP_CONCAT(DISTINCT GeneCategory.Name SEPARATOR '$$') AS GeneCategory, GeneRIF.email, Investigators.Email, Investigators.FirstName, Investigators.LastName, Investigators.Email FROM GeneRIF LEFT JOIN Species ON Species.SpeciesId = GeneRIF.SpeciesId LEFT JOIN GeneRIFXRef ON GeneRIFXRef.GeneRIFId = GeneRIF.Id LEFT JOIN GeneCategory ON GeneRIFXRef.GeneCategoryId = GeneCategory.Id LEFT JOIN Investigators ON Investigators.Email = GeneRIF.email WHERE GeneRIF.display > 0 AND GeneRIF.VersionId = 0 AND GeneRIF.comment IS NOT NULL GROUP BY GeneRIF.comment, BINARY GeneRIF.symbol
```

The above query results to triples that have the form:

```text
gn:symbolGeneRIF_symbol_ -> rdfs:comment -> [ rdf:type gnc:GNWikiEntry ; xkos:classifiedUnder gn:Species_fullname ; rdfs:comment "GeneRIFcomment"^^xsd:string ; dct:references pubmed:GeneRIF(PMID) ; dct:creator gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email ; gnt:belongsToCategory "GeneCategory" ; foaf:homepage "GeneRIF(weburl)" ;  ]  
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
PREFIX taxon: <https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=> 
PREFIX generif: <http://www.ncbi.nlm.nih.gov/gene?cmd=Retrieve&dopt=Graphics&list_uids=> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 

SELECT * WHERE { 
    ?s rdfs:comment #{\x5b; rdf:type gnc:GNWikiEntry ; xkos:classifiedUnder gn:Mus_musculus ; rdfs:comment "Part 2 of the Slc9a1 wiki.\\r\\n\\r\\nThe human SLC9A1 gene was cloned and mapped to human chromosome 1p Lifton et al., 1990.\\r\\n\\r\\nThe mouse Slc9a1 gene maps to chromosome 4. Morahan et al., 1993. There are three common alleles of Slc9a1, originally detected by RFLP analyses. Each of these allelic SLC9A1 proteins have different levels of antiporter activity. Morahan et al. 1994  Remarkably, intracellular pH varies between strains based on their Slc9a1 alleles.  McClive et al. 1996."^^xsd:string ; dct:created "2011-06-10T12:06:30"^^xsd:datetime ; dct:references pubmed:094369 ; dct:references pubmed:8016086 ; dct:references pubmed:8550102 ; dct:creator gn:investigatorGrant_morahan_gem_waimr.uwa.edu.au ; gnt:belongsToCategory "Biochemistry" ; gnt:belongsToCategory "Genetic variation and alleles" ; gnt:belongsToCategory "Physiology and function" ;  \x5d; }# .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:symbolSlc9a1 rdfs:comment [ rdf:type gnc:GNWikiEntry ; xkos:classifiedUnder gn:Mus_musculus ; rdfs:comment "Part 2 of the Slc9a1 wiki.\\r\\n\\r\\nThe human SLC9A1 gene was cloned and mapped to human chromosome 1p Lifton et al., 1990.\\r\\n\\r\\nThe mouse Slc9a1 gene maps to chromosome 4. Morahan et al., 1993. There are three common alleles of Slc9a1, originally detected by RFLP analyses. Each of these allelic SLC9A1 proteins have different levels of antiporter activity. Morahan et al. 1994  Remarkably, intracellular pH varies between strains based on their Slc9a1 alleles.  McClive et al. 1996."^^xsd:string ; dct:created "2011-06-10T12:06:30"^^xsd:datetime ; dct:references pubmed:094369 ; dct:references pubmed:8016086 ; dct:references pubmed:8550102 ; dct:creator gn:investigatorGrant_morahan_gem_waimr.uwa.edu.au ; gnt:belongsToCategory "Biochemistry" ; gnt:belongsToCategory "Genetic variation and alleles" ; gnt:belongsToCategory "Physiology and function" ;  ]  .
```


## 'ncbi-genewiki-entries'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT GeneRIF_BASIC.symbol AS GeneRIFSymbol, GeneRIF_BASIC.comment, Species.Fullname AS SpeciesFullName, GeneRIF_BASIC.TaxID AS TaxonomicId, GeneRIF_BASIC.createtime AS EntryCreateTime, GeneRIF_BASIC.PubMed_ID AS PMID, GeneRIF_BASIC.GeneId, GeneRIF_BASIC.VersionId FROM GeneRIF_BASIC LEFT JOIN Species USING (SpeciesId) WHERE GeneRIF_BASIC.comment IS NOT NULL AND TRIM(GeneRIF_BASIC.comment) != '' AND TRIM(GeneRIF_BASIC.symbol) != '' GROUP BY GeneRIF_BASIC.comment, GeneRIF_BASIC.createtime, GeneRIF_BASIC.VersionId, GeneRIF_BASIC.SpeciesId, GeneRIF_BASIC.TaxID
```

The above query results to triples that have the form:

```text
gn:symbolGeneRIF_BASIC_GeneRIFSymbol_ -> rdfs:comment -> [ rdf:type gnc:NCBIWikiEntry ; rdfs:comment "GeneRIF_BASICcomment"^^xsd:string ; xkos:classifiedUnder gn:Species_speciesfullname ; skos:notation taxon:GeneRIF_BASIC(TaxonomicId) ; gnt:hasGeneId generif:GeneRIF_BASIC(GeneId) ; gnt:hasVersionId 'GeneRIF_BASIC(VersionId)'^^xsd:integer ; dct:references pubmed:GeneRIF_BASIC(PMID) ;  ] 
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
PREFIX taxon: <https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=> 
PREFIX generif: <http://www.ncbi.nlm.nih.gov/gene?cmd=Retrieve&dopt=Graphics&list_uids=> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 

SELECT * WHERE { 
    ?s rdfs:comment #{\x5b; rdf:type gnc:NCBIWikiEntry ; rdfs:comment "he results demonstrate that apoM-S1P inhibits ox-LDL-induced inflammation in HUVECs via the S1PR2-mediated PI3K/Akt signaling pathway."^^xsd:string ; xkos:classifiedUnder gn:Homo_sapiens ; skos:notation taxon:9606 ; gnt:hasGeneId generif:55937 ; gnt:hasVersionId '1'^^xsd:integer ; dct:created "2019-08-03T07:43:00"^^xsd:datetime ;  \x5d;}# .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:symbolAPOM rdfs:comment [ rdf:type gnc:NCBIWikiEntry ; rdfs:comment "he results demonstrate that apoM-S1P inhibits ox-LDL-induced inflammation in HUVECs via the S1PR2-mediated PI3K/Akt signaling pathway."^^xsd:string ; xkos:classifiedUnder gn:Homo_sapiens ; skos:notation taxon:9606 ; gnt:hasGeneId generif:55937 ; gnt:hasVersionId '1'^^xsd:integer ; dct:created "2019-08-03T07:43:00"^^xsd:datetime ;  ] .
```

