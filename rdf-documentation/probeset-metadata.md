# ProbeSet Metadata
## 'probeset'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT IF(NULLIF(TRIM(ProbeSet.Name), '') IS NULL, '', TRIM(ProbeSet.Name)) AS ProbeSetIdName, ProbeSet.Id, ProbeSet.Name, ProbeSet.alias, IFNULL(GeneChip.Name, '') AS GeneChipName, NULLIF(TRIM(ProbeSet.TargetId), '') AS TargetId, ProbeSet.Symbol, ProbeSet.description, NULLIF(TRIM(ProbeSet.Probe_set_target_region), '') AS Probe_set_target_region, ProbeSet.Chr, IFNULL(ProbeSet.Mb, '') AS Mb, ProbeSet.Mb, ProbeSet.Chr, ProbeSet.Strand_Probe, ProbeSet.GeneId, ProbeSet.OMIM, ProbeSet.HomoloGeneID, ProbeSet.UniProtID, ProbeSet.Symbol, ProbeSet.Symbol, ProbeSet.Symbol, ProbeSet.Symbol, ProbeSet.Symbol, Species.Name, ProbeSet.RefSeq_TranscriptId, GeneList_rn33.kgId, (GeneList.txStart * 1000000) AS TranscriptStartMm10, (GeneList_rn33.txStart * 1000000) AS TranscriptStartRn7, GeneList.Chromosome, GeneList_rn33.Chromosome, (GeneList.txEnd * 1000000) AS TranscriptEndMm10, (GeneList_rn33.txEnd * 1000000) AS TranscriptEndRn7, ProbeSet.Symbol, ProbeSet.GeneId, Species.FullName, ProbeSet.Symbol, ProbeSet.GeneId, Species.name, ProbeSet.GeneId, ProbeSet.GeneId, Species.Name, ProbeSet.Strand_Probe, IFNULL(ProbeSet.Probe_set_specificity, '') AS Probe_set_specificity, IFNULL(ProbeSet.Probe_set_BLAT_score, '') AS Probe_set_BLAT_score, IFNULL(ProbeSet.Probe_set_Blat_Mb_start, '') AS Probe_set_Blat_Mb_start, IFNULL(ProbeSet.Probe_set_Blat_Mb_end, '') AS Probe_set_Blat_Mb_end, ProbeSet.BlatSeq, ProbeSet.TargetSeq FROM ProbeSet LEFT JOIN GeneChip ON GeneChip.Id = ProbeSet.ChipId LEFT JOIN GeneList ON GeneList.GeneID = ProbeSet.GeneId LEFT JOIN GeneList_rn33 ON GeneList.geneSymbol = ProbeSet.Symbol LEFT JOIN Species ON GeneChip.SpeciesId = Species.Id
```

The above query results to triples that have the form:

```text
gn:probesetProbesetidname -> rdf:type -> gnc:Probeset 
gn:probesetProbesetidname -> rdfs:label -> ProbeSet(Name) 
gn:probesetProbesetidname -> skos:altLabel -> ProbeSet(alias) 
gn:probesetProbesetidname -> gnt:hasChip -> gn:platformGenechipname 
gn:probesetProbesetidname -> gnt:hasTargetId -> TargetId 
gn:probesetProbesetidname -> gnt:symbol -> ProbeSet(Symbol) 
gn:probesetProbesetidname -> dct:description -> ProbeSetdescription 
gn:probesetProbesetidname -> gnt:targetsRegion -> Probe_set_target_region 
gn:probesetProbesetidname -> gnt:chr -> ProbeSet(Chr) 
gn:probesetProbesetidname -> gnt:mb -> "Mb"^^xsd:double 
gn:probesetProbesetidname -> gnt:location -> Chr ProbeSet(Chr) @ ProbeSet(Mb) 
gn:probesetProbesetidname -> dct:references -> <http://www.ncbi.nlm.nih.gov/gene?cmd=Retrieve&dopt=Graphics&list_uids=ProbeSet(GeneId)> .
<http://www.ncbi.nlm.nih.gov/gene?cmd=Retrieve&dopt=Graphics&list_uids=ProbeSet(GeneId)> a gnc:NCBIGeneLink 
gn:probesetProbesetidname -> dct:references -> <http://www.ncbi.nlm.nih.gov/omim/ProbeSet(OMIM)> .
<http://www.ncbi.nlm.nih.gov/omim/ProbeSet(OMIM)> a gnc:omimLink 
gn:probesetProbesetidname -> dct:references -> <http://www.ncbi.nlm.nih.gov/homologene/?term=ProbeSet(HomoloGeneID)> .
<http://www.ncbi.nlm.nih.gov/homologene/?term=ProbeSet(HomoloGeneID)> a gnc:homologeneLink 
gn:probesetProbesetidname -> dct:references -> <https://www.uniprot.org/uniprot/ProbeSet(UniProtID)> .
<https://www.uniprot.org/uniprot/ProbeSet(UniProtID)> a gnc:uniprotLink 
gn:probesetProbesetidname -> dct:references -> <http://string-db.org/newstring_cgi/show_network_section.pl?identifier=ProbeSet(Symbol)> .
<http://string-db.org/newstring_cgi/show_network_section.pl?identifier=ProbeSet(Symbol)> a gnc:stringLink 
gn:probesetProbesetidname -> dct:references -> <https://www.gtexportal.org/home/gene/ProbeSet(Symbol)> .
<https://www.gtexportal.org/home/gene/ProbeSet(Symbol)> a gnc:gtexLink 
gn:probesetProbesetidname -> dct:references -> <https://www.ebi.ac.uk/gwas/search?query=ProbeSet(Symbol)> .
<https://www.ebi.ac.uk/gwas/search?query=ProbeSet(Symbol)> a gnc:ebiGwasLink 
gn:probesetProbesetidname -> dct:references -> <http://www.proteinatlas.org/search/ProbeSet(Symbol)> .
<http://www.proteinatlas.org/search/ProbeSet(Symbol)> a gnc:proteinAtlasLink 
gn:probesetProbesetidname -> dct:references ->  
gn:probesetProbesetidname -> dct:references -> <http://www.pantherdb.org/genes/geneList.do?searchType=basic&fieldName=all&organism=all&listType=1&fieldValue=ProbeSet(Symbol)> .
<http://www.pantherdb.org/genes/geneList.do?searchType=basic&fieldName=all&organism=all&listType=1&fieldValue=ProbeSet(Symbol)> a gnc:PantherLink 
gn:probesetProbesetidname -> dct:references ->  
gn:probesetProbesetidname -> dct:references ->  
gn:probesetProbesetidname -> dct:references -> <http://www.chibi.ubc.ca/Gemma/gene/showGene.html?ncbiid=ProbeSet(GeneId)> .
<http://www.chibi.ubc.ca/Gemma/gene/showGene.html?ncbiid=ProbeSet(GeneId)> a gnc:gemmaLink 
gn:probesetProbesetidname -> dct:references ->  
gn:probesetProbesetidname -> gnt:strandProbe -> ProbeSet(Strand_Probe) 
gn:probesetProbesetidname -> gnt:hasSpecificity -> Probe_set_specificity 
gn:probesetProbesetidname -> gnt:hasBlatScore -> Probe_set_BLAT_score 
gn:probesetProbesetidname -> gnt:hasBlatMbStart -> "Probe_set_Blat_Mb_start"^^xsd:double 
gn:probesetProbesetidname -> gnt:hasBlatMbEnd -> "Probe_set_Blat_Mb_end"^^xsd:double 
gn:probesetProbesetidname -> gnt:hasBlatSeq -> ProbeSetBlatSeq 
gn:probesetProbesetidname -> gnt:hasTargetSeq -> ProbeSetTargetSeq 
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
PREFIX sdmx-measure: <http://purl.org/linked-data/sdmx/2009/measure#> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 

SELECT * WHERE { 
    ?s rdf:type gnc:Probeset .
    ?s rdfs:label "100322_at" .
    ?s skos:altLabel "IGHG2A; AU044919; MGC102604; MGC102659; Ighg" .
    ?s gnt:hasChip gn:platformMg_u74av2 .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:probeset100322_at rdf:type gnc:Probeset .
gn:probeset100322_at rdfs:label "100322_at" .
gn:probeset100322_at skos:altLabel "IGHG2A; AU044919; MGC102604; MGC102659; Ighg" .
gn:probeset100322_at gnt:hasChip gn:platformMg_u74av2 .
gn:probeset100322_at gnt:symbol "Ighg" .
gn:probeset100322_at dct:description "immunoglobulin heavy chain gamma polypeptide" .
gn:probeset100322_at gnt:chr "12" .
gn:probeset100322_at gnt:mb "114.322406"^^xsd:double .
gn:probeset100322_at gnt:location "Chr 12 @ 114.322406 on the minus strand" .
gn:probeset100322_at dct:references <http://www.ncbi.nlm.nih.gov/gene?cmd=Retrieve&dopt=Graphics&list_uids=380794> .
<http://www.ncbi.nlm.nih.gov/gene?cmd=Retrieve&dopt=Graphics&list_uids=380794> a gnc:NCBIGeneLink .
gn:probeset100322_at dct:references <http://string-db.org/newstring_cgi/show_network_section.pl?identifier=Ighg> .
<http://string-db.org/newstring_cgi/show_network_section.pl?identifier=Ighg> a gnc:stringLink .
gn:probeset100322_at dct:references <https://www.gtexportal.org/home/gene/Ighg> .
<https://www.gtexportal.org/home/gene/Ighg> a gnc:gtexLink .
gn:probeset100322_at dct:references <https://www.ebi.ac.uk/gwas/search?query=Ighg> .
<https://www.ebi.ac.uk/gwas/search?query=Ighg> a gnc:ebiGwasLink .
gn:probeset100322_at dct:references <http://www.proteinatlas.org/search/Ighg> .
<http://www.proteinatlas.org/search/Ighg> a gnc:proteinAtlasLink .
gn:probeset100322_at dct:references <http://www.pantherdb.org/genes/geneList.do?searchType=basic&fieldName=all&organism=all&listType=1&fieldValue=Ighg> .
<http://www.pantherdb.org/genes/geneList.do?searchType=basic&fieldName=all&organism=all&listType=1&fieldValue=Ighg> a gnc:PantherLink .
gn:probeset100322_at dct:references <https://genemania.org/search/mus-musculus/380794> .
<https://genemania.org/search/mus-musculus/380794> a gnc:genemaniaLink .
gn:probeset100322_at dct:references <http://mouse.brain-map.org/search/show?search_type=gene&search_term=> .
<http://mouse.brain-map.org/search/show?search_type=gene&search_term=> Ighg .
gn:probeset100322_at dct:references <http://www.chibi.ubc.ca/Gemma/gene/showGene.html?ncbiid=380794> .
<http://www.chibi.ubc.ca/Gemma/gene/showGene.html?ncbiid=380794> a gnc:gemmaLink .
gn:probeset100322_at gnt:strandProbe "-" .
gn:probeset100322_at gnt:hasSpecificity "3.1" .
gn:probeset100322_at gnt:hasBlatScore "62" .
gn:probeset100322_at gnt:hasBlatMbStart "114.322406"^^xsd:double .
gn:probeset100322_at gnt:hasBlatMbEnd "114.322571"^^xsd:double .
gn:probeset100322_at gnt:hasBlatSeq "TGGTCACAGCTTTCCGCTCACGTTCACTGAAACGGGCTGATGCTGCACCAACTGTATCTTCCCACCATCCAGTAAGCTTGGGCCCGGTGGTTACTGGAACTGGATCCGGAAATTCCCAGGGAATATTACCTGCAGTTGAATTCTGTGACTACT" .
gn:probeset100322_at gnt:hasTargetSeq "tggtcacagctttccgctcacgttcggtgctgggaccaagctggaactgaaacgggctgatgctgcaccaactgtatccatcttcccaccatccagtaagcttgggcccggtgggggcnnnnngnnnngnnnnnnntnnnnnnngnnngncnnnnngnnnnncnnntcngaggtgcagcttcaggagtcaggacctngcctngnnaaaccttctcagactctgtccctcacctgttctgtcactggcnactccatcaccagtgnttactggaactggatccggaaattcccagggaataaacttgantacatgggntacataanctacagtggtnncacttactacaatccatctctcaaaagtcgaatctccatnactnnagacacatccaagaaccantattacctgcagttgaattctgtgactact" .
```

