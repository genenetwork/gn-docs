# ProbeSet Metadata
## 'probeset'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT IF(NULLIF(TRIM(ProbeSet.Name), '') IS NULL, '', TRIM(ProbeSet.Name)) AS ProbeSetIdName, ProbeSet.Id, ProbeSet.Name, ProbeSet.alias, IFNULL(GeneChip.Name, '') AS GeneChipName, NULLIF(TRIM(ProbeSet.TargetId), '') AS TargetId, ProbeSet.Symbol, ProbeSet.description, NULLIF(TRIM(ProbeSet.Probe_set_target_region), '') AS Probe_set_target_region, ProbeSet.Chr, IFNULL(ProbeSet.Mb, '') AS Mb, IFNULL(ProbeSet.Mb_mm8, '') AS Mb_mm8, IFNULL(ProbeSet.Mb_2016, '') AS Mb_2016, IFNULL(ProbeSet.Probe_set_specificity, '') AS Probe_set_specificity, IFNULL(ProbeSet.Probe_set_BLAT_score, '') AS Probe_set_BLAT_score, IFNULL(ProbeSet.Probe_set_Blat_Mb_start, '') AS Probe_set_Blat_Mb_start, IFNULL(ProbeSet.Probe_set_Blat_Mb_start_2016, '') AS Probe_set_Blat_Mb_start_2016, IFNULL(ProbeSet.Probe_set_Blat_Mb_end, '') AS Probe_set_Blat_Mb_end, IFNULL(ProbeSet.Probe_set_Blat_Mb_start_2016, '') AS Probe_set_Blat_Mb_start_2016, ProbeSet.BlatSeq, ProbeSet.TargetSeq, IFNULL(ProbeSet.HomoloGeneID, '') AS HomoloGeneID, IFNULL(ProbeSet.UniProtID, '') AS UniProtID, IFNULL(ProbeSet.PubChem_ID, '') AS PubChem_ID, IFNULL(ProbeSet.KEGG_ID, '') AS KEGG_ID, IFNULL(ProbeSet.OMIM, '') AS OMIM, IFNULL(ProbeSet.ChEBI_ID, '') AS ChEBI_ID FROM ProbeSet LEFT JOIN GeneChip ON GeneChip.Id = ProbeSet.ChipId
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
gn:probesetProbesetidname -> gnt:mbMm8 -> "Mb_mm8"^^xsd:double 
gn:probesetProbesetidname -> gnt:mb2016 -> "Mb_2016"^^xsd:double 
gn:probesetProbesetidname -> gnt:hasSpecificity -> Probe_set_specificity 
gn:probesetProbesetidname -> gnt:hasBlatScore -> Probe_set_BLAT_score 
gn:probesetProbesetidname -> gnt:hasBlatMbStart -> "Probe_set_Blat_Mb_start"^^xsd:double 
gn:probesetProbesetidname -> gnt:hasBlatMbStart2016 -> "Probe_set_Blat_Mb_start_2016"^^xsd:double 
gn:probesetProbesetidname -> gnt:hasBlatMbEnd -> "Probe_set_Blat_Mb_end"^^xsd:double 
gn:probesetProbesetidname -> gnt:hasBlatMbEnd2016 -> "Probe_set_Blat_Mb_start_2016"^^xsd:double 
gn:probesetProbesetidname -> gnt:hasBlatSeq -> ProbeSetBlatSeq 
gn:probesetProbesetidname -> gnt:hasTargetSeq -> ProbeSetTargetSeq 
gn:probesetProbesetidname -> gnt:hasHomologeneId -> homologene:HomoloGeneID 
gn:probesetProbesetidname -> gnt:hasUniprotId -> uniprot:UniProtID 
gn:probesetProbesetidname -> gnt:hasPubChemId -> pubchem:PubChem_ID 
gn:probesetProbesetidname -> gnt:hasKeggId -> kegg:KEGG_ID 
gn:probesetProbesetidname -> gnt:hasOmimId ->  
gn:probesetProbesetidname -> gnt:hasChebiId -> chebi:ChEBI_ID 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX probeset: <http://genenetwork.org/probeset/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX kegg: <http://bio2rdf.org/ns/kegg#> 
PREFIX pubchem: <https://pubchem.ncbi.nlm.nih.gov/> 
PREFIX omim: <https://www.omim.org/entry/> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX uniprot: <http://purl.uniprot.org/uniprot/> 
PREFIX chebi: <http://purl.obolibrary.org/obo/CHEBI_> 
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX homologene: <https://bio2rdf.org/homologene:> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX qb: <http://purl.org/linked-data/cube#> 
PREFIX sdmx-measure: <http://purl.org/linked-data/sdmx/2009/measure#> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 

SELECT * WHERE { 
    ?s rdf:type gnc:Probeset .
    ?s rdfs:label "100001_at" .
    ?s skos:altLabel "T3g; Ctg3; Ctg-3" .
    ?s gnt:hasChip gn:platformMg_u74av2 .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:probeset100001_at rdf:type gnc:Probeset .
gn:probeset100001_at rdfs:label "100001_at" .
gn:probeset100001_at skos:altLabel "T3g; Ctg3; Ctg-3" .
gn:probeset100001_at gnt:hasChip gn:platformMg_u74av2 .
gn:probeset100001_at gnt:symbol "Cd3g" .
gn:probeset100001_at dct:description "CD3d antigen, gamma polypeptide" .
gn:probeset100001_at gnt:chr "9" .
gn:probeset100001_at gnt:mb "44.970689"^^xsd:double .
gn:probeset100001_at gnt:mbMm8 "44.721684"^^xsd:double .
gn:probeset100001_at gnt:mb2016 "44.778772"^^xsd:double .
gn:probeset100001_at gnt:hasSpecificity "9.3" .
gn:probeset100001_at gnt:hasBlatScore "186" .
gn:probeset100001_at gnt:hasBlatMbStart "44.970689"^^xsd:double .
gn:probeset100001_at gnt:hasBlatMbStart2016 "44.778772"^^xsd:double .
gn:probeset100001_at gnt:hasBlatMbEnd "44.971291"^^xsd:double .
gn:probeset100001_at gnt:hasBlatMbEnd2016 "44.778772"^^xsd:double .
gn:probeset100001_at gnt:hasBlatSeq "CTCTGTTGCAAAATGAACAGCTGTACAGCCCCTCAAGGACCGGGAATATGACCAGTACAGCCATCTCCAAGGAAACCAACTGAGGAAGAAGTGAACTCAGCAGGACTCAGGGTGTCCCCACAATGCATTTTGGAGAGAGCCCAGACTGCAAGCAGAGAGGAAGAACTGAGGAAAACAAGCACAGCGTGGTGTT" .
gn:probeset100001_at gnt:hasTargetSeq "ctctgttgcaaaatgaacagctgtaccagcccctcaaggaccgggaatatgaccagtacagccatctccaaggaaaccaactgaggaagaagtgaactcagcaggactcagggtgtccccccttntatccagcacccagaatcaaaacaatgcattttggagagagcccagtagagagattttcaaccctacaggtagactgcaagcagagaggaagaactgtcaaagaaattttggtcttttttttttttttnncaaaataaaataaaagcttggaggagccagtggtatgantnnnnnntgnancanttgtcaaccttgtttggggttnncagcaccccacccccagaccccccaaaaaaattcagtgaaggaaaacaagcacagcgtggtgtt" .
gn:probeset100001_at gnt:hasHomologeneId homologene:55 .
gn:probeset100001_at gnt:hasOmimId omim:186740 .
```

