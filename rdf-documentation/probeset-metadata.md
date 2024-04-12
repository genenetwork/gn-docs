# ProbeSet Metadata
## 'probeset'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT IF(NULLIF(TRIM(ProbeSet.Name), '') IS NULL, '', TRIM(ProbeSet.Name)) AS ProbeSetIdName, ProbeSet.Id, ProbeSet.Name, ProbeSet.alias, IFNULL(GeneChip.Name, '') AS GeneChipName, NULLIF(TRIM(ProbeSet.TargetId), '') AS TargetId, ProbeSet.Symbol, ProbeSet.description, NULLIF(TRIM(ProbeSet.Probe_set_target_region), '') AS Probe_set_target_region, ProbeSet.Chr, IFNULL(ProbeSet.Mb, '') AS Mb, ProbeSet.Mb, ProbeSet.Chr, ProbeSet.Strand_Probe, ProbeSet.GeneId, ProbeSet.OMIM, ProbeSet.HomoloGeneID, ProbeSet.UniProtID, ProbeSet.Strand_Probe, IFNULL(ProbeSet.Probe_set_specificity, '') AS Probe_set_specificity, IFNULL(ProbeSet.Probe_set_BLAT_score, '') AS Probe_set_BLAT_score, IFNULL(ProbeSet.Probe_set_Blat_Mb_start, '') AS Probe_set_Blat_Mb_start, IFNULL(ProbeSet.Probe_set_Blat_Mb_end, '') AS Probe_set_Blat_Mb_end, ProbeSet.BlatSeq, ProbeSet.TargetSeq FROM ProbeSet LEFT JOIN GeneChip ON GeneChip.Id = ProbeSet.ChipId LEFT JOIN Species ON GeneChip.SpeciesId = Species.Id WHERE ProbeSet.Name IS NOT NULL
```

The above query results to triples that have the form:

```text
gn:probesetProbesetidname -> rdf:type -> gnc:Probeset 
gn:probesetProbesetidname -> rdfs:label -> ProbeSet(Name) 
gn:probesetProbesetidname -> skos:altLabel -> ProbeSet(alias) 
gn:probesetProbesetidname -> gnt:hasChip -> gn:platformGenechipname 
gn:probesetProbesetidname -> gnt:hasTargetId -> TargetId 
gn:probesetProbesetidname -> gnt:geneSymbol -> ProbeSet(Symbol) 
gn:probesetProbesetidname -> dct:description -> ProbeSetdescription 
gn:probesetProbesetidname -> gnt:targetsRegion -> Probe_set_target_region 
gn:probesetProbesetidname -> gnt:chr -> ProbeSet(Chr) 
gn:probesetProbesetidname -> gnt:mb -> "Mb"^^xsd:double 
gn:probesetProbesetidname -> gnt:location -> Chr ProbeSet(Chr) @ ProbeSet(Mb) Mb  
gn:probesetProbesetidname -> gnt:hasGeneId -> gene:ProbeSet(GeneId) 
gn:probesetProbesetidname -> dct:references -> <http://www.ncbi.nlm.nih.gov/omim/ProbeSet%28OMIM%29> .
<http://www.ncbi.nlm.nih.gov/omim/ProbeSet%28OMIM%29> a gnc:omimLink 
gn:probesetProbesetidname -> dct:references -> <http://www.ncbi.nlm.nih.gov/homologene/?term=ProbeSet%28HomoloGeneID%29> .
<http://www.ncbi.nlm.nih.gov/homologene/?term=ProbeSet%28HomoloGeneID%29> a gnc:homologeneLink 
gn:probesetProbesetidname -> gnt:uniprot -> uniprot:ProbeSet(UniProtID) 
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
PREFIX gene: <http://www.ncbi.nlm.nih.gov/gene?cmd=Retrieve&dopt=Graphics&list_uids=> 
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
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:probeset1824795 rdf:type gnc:Probeset .
gn:probeset1824795 gnt:location "Not available" .
```

