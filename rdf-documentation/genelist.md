# Gene Metadata
## 'genelist-rn33'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT GeneList_rn33.id AS GENE_UID, GeneList_rn33.geneSymbol, GeneList_rn33.chromosome, GeneList_rn33.txStart, GeneList_rn33.txEnd, GeneList_rn33.strand, GeneList_rn33.NM_ID, GeneList_rn33.kgID, GeneList_rn33.geneSymbol, GeneList_rn33.geneSymbol, GeneList_rn33.geneSymbol, GeneList_rn33.geneSymbol, GeneList_rn33.geneSymbol FROM GeneList_rn33
```

The above query results to triples that have the form:

```text
gn:gene_rn33Genelist_rn33_gene_uid -> rdf:type -> gnc:Gene 
gn:gene_rn33Genelist_rn33_gene_uid -> gnt:belongsToSpecies -> gn:Rattus_norvegicus 
gn:gene_rn33Genelist_rn33_gene_uid -> gnt:geneSymbol -> GeneList_rn33(geneSymbol) 
gn:gene_rn33Genelist_rn33_gene_uid -> gnt:chromosome -> GeneList_rn33(chromosome) 
gn:gene_rn33Genelist_rn33_gene_uid -> gnt:TxStart -> "GeneList_rn33(txStart)"^^xsd:double 
gn:gene_rn33Genelist_rn33_gene_uid -> gnt:TxEnd -> "GeneList_rn33(txEnd)"^^xsd:double 
gn:gene_rn33Genelist_rn33_gene_uid -> gnt:Strand -> GeneList_rn33(strand) 
gn:gene_rn33Genelist_rn33_gene_uid -> gnt:transcript -> transcript:GeneList_rn33(NM_ID) 
gn:gene_rn33Genelist_rn33_gene_uid -> gnt:hasKgID -> GeneList_rn33(kgID) 
gn:gene_rn33Genelist_rn33_gene_uid -> dct:references -> <http://www.pantherdb.org/genes/geneList.do?searchType=basic&fieldName=all&organism=all&listType=1&fieldValue=GeneList_rn33(geneSymbol)> .
<http://www.pantherdb.org/genes/geneList.do?searchType=basic&fieldName=all&organism=all&listType=1&fieldValue=GeneList_rn33(geneSymbol)> a gnc:PantherLink 
gn:gene_rn33Genelist_rn33_gene_uid -> dct:references -> <https://www.ebi.ac.uk/gwas/search?query=GeneList_rn33(geneSymbol)> .
<https://www.ebi.ac.uk/gwas/search?query=GeneList_rn33(geneSymbol)> a gnc:ebiGwasLink 
gn:gene_rn33Genelist_rn33_gene_uid -> dct:references -> <http://string-db.org/newstring_cgi/show_network_section.pl?identifier=GeneList_rn33%28geneSymbol%29> .
<http://string-db.org/newstring_cgi/show_network_section.pl?identifier=GeneList_rn33%28geneSymbol%29> a gnc:stringLink 
gn:gene_rn33Genelist_rn33_gene_uid -> dct:references -> <https://www.gtexportal.org/home/gene/GeneList_rn33%28geneSymbol%29> .
<https://www.gtexportal.org/home/gene/GeneList_rn33%28geneSymbol%29> a gnc:gtexLink 
gn:gene_rn33Genelist_rn33_gene_uid -> dct:references -> <http://www.proteinatlas.org/search/GeneList_rn33%28geneSymbol%29> .
<http://www.proteinatlas.org/search/GeneList_rn33%28geneSymbol%29> a gnc:proteinAtlasLink 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX probeset: <http://genenetwork.org/probeset/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX qb: <http://purl.org/linked-data/cube#> 
PREFIX gene: <http://www.ncbi.nlm.nih.gov/gene?cmd=Retrieve&dopt=Graphics&list_uids=> 
PREFIX sdmx-measure: <http://purl.org/linked-data/sdmx/2009/measure#> 
PREFIX transcript: <https://portals.broadinstitute.org/gpp/public/trans/details?transName=> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 

SELECT * WHERE { 
    ?s rdf:type gnc:Gene .
    ?s gnt:belongsToSpecies gn:Rattus_norvegicus .
    ?s gnt:geneSymbol "0610031j06rik" .
    ?s gnt:chromosome "2" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:gene_rn331 rdf:type gnc:Gene .
gn:gene_rn331 gnt:belongsToSpecies gn:Rattus_norvegicus .
gn:gene_rn331 gnt:geneSymbol "0610031j06rik" .
gn:gene_rn331 gnt:chromosome "2" .
gn:gene_rn331 gnt:TxStart "180.388175"^^xsd:double .
gn:gene_rn331 gnt:TxEnd "180.391765"^^xsd:double .
gn:gene_rn331 gnt:Strand "+" .
gn:gene_rn331 gnt:transcript transcript:NM_001004226 .
gn:gene_rn331 dct:references <http://www.pantherdb.org/genes/geneList.do?searchType=basic&fieldName=all&organism=all&listType=1&fieldValue=0610031j06rik> .
<http://www.pantherdb.org/genes/geneList.do?searchType=basic&fieldName=all&organism=all&listType=1&fieldValue=0610031j06rik> a gnc:PantherLink .
gn:gene_rn331 dct:references <https://www.ebi.ac.uk/gwas/search?query=0610031j06rik> .
<https://www.ebi.ac.uk/gwas/search?query=0610031j06rik> a gnc:ebiGwasLink .
gn:gene_rn331 dct:references <http://string-db.org/newstring_cgi/show_network_section.pl?identifier=0610031j06rik> .
<http://string-db.org/newstring_cgi/show_network_section.pl?identifier=0610031j06rik> a gnc:stringLink .
gn:gene_rn331 dct:references <https://www.gtexportal.org/home/gene/0610031j06rik> .
<https://www.gtexportal.org/home/gene/0610031j06rik> a gnc:gtexLink .
gn:gene_rn331 dct:references <http://www.proteinatlas.org/search/0610031j06rik> .
<http://www.proteinatlas.org/search/0610031j06rik> a gnc:proteinAtlasLink .
```


## 'genelist'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT CONCAT_WS('_', GeneSymbol, GeneID, AlignID) AS GENE_UID, GeneList.GeneSymbol, GeneList.GeneDescription, GeneList.GeneId, GeneList.GeneSymbol, GeneList.GeneSymbol, GeneList.GeneID, Species.Name, GeneList.GeneSymbol, Species.Name, GeneList.GeneID, Species.Name, GeneList.GeneID, GeneList.GeneSymbol, Species.FullName, GeneList.GeneSymbol, GeneList.GeneSymbol, GeneList.GeneSymbol, GeneList.GeneSymbol, GeneList.Chromosome, GeneList.TxStart, GeneList.TxEnd, GeneList.Strand, Species.Name, GeneList.NM_ID, GeneList.kgID, GeneList.UnigenID, GeneList.ProteinID, GeneList.AlignID, IFNULL(RGD_ID, '') AS RGD_ID FROM GeneList LEFT JOIN Species USING (SpeciesId)
```

The above query results to triples that have the form:

```text
gn:geneGENE_UID -> rdf:type -> gnc:Gene 
gn:geneGENE_UID -> gnt:geneSymbol -> GeneList(GeneSymbol) 
gn:geneGENE_UID -> dct:description -> GeneListGeneDescription 
gn:geneGENE_UID -> gnt:hasGeneId -> gene:GeneList(GeneId) 
gn:geneGENE_UID -> dct:references -> <https://www.ebi.ac.uk/gwas/search?query=GeneList%28GeneSymbol%29> .
<https://www.ebi.ac.uk/gwas/search?query=GeneList%28GeneSymbol%29> a gnc:ebiGwasLink 
gn:geneGENE_UID -> dct:references ->  
gn:geneGENE_UID -> dct:references ->  
gn:geneGENE_UID -> dct:references ->  
gn:geneGENE_UID -> dct:references -> <http://www.chibi.ubc.ca/Gemma/gene/showGene.html?ncbiid=GeneList(GeneID)> .
<http://www.chibi.ubc.ca/Gemma/gene/showGene.html?ncbiid=GeneList(GeneID)> a gnc:gemmaLink 
gn:geneGENE_UID -> dct:references ->  
gn:geneGENE_UID -> dct:references -> <http://www.pantherdb.org/genes/geneList.do?searchType=basic&fieldName=all&organism=all&listType=1&fieldValue=GeneList%28GeneSymbol%29> .
<http://www.pantherdb.org/genes/geneList.do?searchType=basic&fieldName=all&organism=all&listType=1&fieldValue=GeneList%28GeneSymbol%29> a gnc:pantherLink 
gn:geneGENE_UID -> dct:references -> <http://string-db.org/newstring_cgi/show_network_section.pl?identifier=GeneList%28GeneSymbol%29> .
<http://string-db.org/newstring_cgi/show_network_section.pl?identifier=GeneList%28GeneSymbol%29> a gnc:stringLink 
gn:geneGENE_UID -> dct:references -> <https://www.gtexportal.org/home/gene/GeneList%28GeneSymbol%29> .
<https://www.gtexportal.org/home/gene/GeneList%28GeneSymbol%29> a gnc:gtexLink 
gn:geneGENE_UID -> dct:references -> <http://www.proteinatlas.org/search/GeneList%28GeneSymbol%29> .
<http://www.proteinatlas.org/search/GeneList%28GeneSymbol%29> a gnc:proteinAtlasLink 
gn:geneGENE_UID -> gnt:chromosome -> GeneList(Chromosome) 
gn:geneGENE_UID -> gnt:TxStart -> "GeneList(TxStart)"^^xsd:double 
gn:geneGENE_UID -> gnt:TxEnd -> "GeneList(TxEnd)"^^xsd:double 
gn:geneGENE_UID -> gnt:Strand -> GeneList(Strand) 
gn:geneGENE_UID -> gnt:belongsToSpecies -> gn:Species_name 
gn:geneGENE_UID -> gnt:transcript -> transcript:GeneList(NM_ID) 
gn:geneGENE_UID -> gnt:hasKgID -> GeneList(kgID) 
gn:geneGENE_UID -> gnt:hasUnigenID -> GeneList(UnigenID) 
gn:geneGENE_UID -> gnt:hasProteinID -> GeneList(ProteinID) 
gn:geneGENE_UID -> gnt:hasAlignID -> GeneList(AlignID) 
gn:geneGENE_UID -> gnt:hasRgdID -> RGD_ID 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX probeset: <http://genenetwork.org/probeset/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX qb: <http://purl.org/linked-data/cube#> 
PREFIX gene: <http://www.ncbi.nlm.nih.gov/gene?cmd=Retrieve&dopt=Graphics&list_uids=> 
PREFIX sdmx-measure: <http://purl.org/linked-data/sdmx/2009/measure#> 
PREFIX transcript: <https://portals.broadinstitute.org/gpp/public/trans/details?transName=> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 

SELECT * WHERE { 
    ?s rdf:type gnc:Gene .
    ?s gnt:geneSymbol "OTTMUSG00000007" .
    ?s dct:description "predicted gene, OTTMUSG00000007987" .
    ?s gnt:hasGeneId gene:100137011 .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:geneOTTMUSG00000007_100137011_G211062 rdf:type gnc:Gene .
gn:geneOTTMUSG00000007_100137011_G211062 gnt:geneSymbol "OTTMUSG00000007" .
gn:geneOTTMUSG00000007_100137011_G211062 dct:description "predicted gene, OTTMUSG00000007987" .
gn:geneOTTMUSG00000007_100137011_G211062 gnt:hasGeneId gene:100137011 .
gn:geneOTTMUSG00000007_100137011_G211062 dct:references <https://www.ebi.ac.uk/gwas/search?query=OTTMUSG00000007> .
<https://www.ebi.ac.uk/gwas/search?query=OTTMUSG00000007> a gnc:ebiGwasLink .
gn:geneOTTMUSG00000007_100137011_G211062 dct:references <http://mouse.brain-map.org/search/show?search_type=gene&search_term=> .
<http://mouse.brain-map.org/search/show?search_type=gene&search_term=> a gnc:abaLink .
gn:geneOTTMUSG00000007_100137011_G211062 dct:references <https://rgd.mcw.edu/rgdweb/elasticResults.html?term=OTTMUSG00000007&category=Gene&species=Mouse> .
<https://rgd.mcw.edu/rgdweb/elasticResults.html?term=OTTMUSG00000007&category=Gene&species=Mouse> a gnc:rgdLink .
gn:geneOTTMUSG00000007_100137011_G211062 dct:references <http://biogps.org/?org=mouse#goto=genereport&id=100137011> .
<http://biogps.org/?org=mouse#goto=genereport&id=100137011> a gnc:biogpsLink .
gn:geneOTTMUSG00000007_100137011_G211062 dct:references <http://www.chibi.ubc.ca/Gemma/gene/showGene.html?ncbiid=100137011> .
<http://www.chibi.ubc.ca/Gemma/gene/showGene.html?ncbiid=100137011> a gnc:gemmaLink .
gn:geneOTTMUSG00000007_100137011_G211062 dct:references <https://genemania.org/search/mus-musculus/OTTMUSG00000007> .
<https://genemania.org/search/mus-musculus/OTTMUSG00000007> a gnc:genemaniaLink .
gn:geneOTTMUSG00000007_100137011_G211062 dct:references <http://www.pantherdb.org/genes/geneList.do?searchType=basic&fieldName=all&organism=all&listType=1&fieldValue=OTTMUSG00000007> .
<http://www.pantherdb.org/genes/geneList.do?searchType=basic&fieldName=all&organism=all&listType=1&fieldValue=OTTMUSG00000007> a gnc:pantherLink .
gn:geneOTTMUSG00000007_100137011_G211062 dct:references <http://string-db.org/newstring_cgi/show_network_section.pl?identifier=OTTMUSG00000007> .
<http://string-db.org/newstring_cgi/show_network_section.pl?identifier=OTTMUSG00000007> a gnc:stringLink .
gn:geneOTTMUSG00000007_100137011_G211062 dct:references <https://www.gtexportal.org/home/gene/OTTMUSG00000007> .
<https://www.gtexportal.org/home/gene/OTTMUSG00000007> a gnc:gtexLink .
gn:geneOTTMUSG00000007_100137011_G211062 dct:references <http://www.proteinatlas.org/search/OTTMUSG00000007> .
<http://www.proteinatlas.org/search/OTTMUSG00000007> a gnc:proteinAtlasLink .
gn:geneOTTMUSG00000007_100137011_G211062 gnt:chromosome "11" .
gn:geneOTTMUSG00000007_100137011_G211062 gnt:TxStart "60.630829"^^xsd:double .
gn:geneOTTMUSG00000007_100137011_G211062 gnt:TxEnd "60.632734"^^xsd:double .
gn:geneOTTMUSG00000007_100137011_G211062 gnt:belongsToSpecies gn:Mouse .
gn:geneOTTMUSG00000007_100137011_G211062 gnt:transcript transcript:AK046412 .
gn:geneOTTMUSG00000007_100137011_G211062 gnt:hasProteinID "Q8BQU9" .
gn:geneOTTMUSG00000007_100137011_G211062 gnt:hasAlignID "G211062" .
```

