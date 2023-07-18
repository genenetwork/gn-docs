# ProbeSet Metadata
## 'dump-probeset'

## Schema Triples:

```text
gn-term:name -> rdfs:range -> rdfs:Literal
gn-term:probeset -> rdfs:range -> rdfs:Literal
```
## Generated Triples:

The following SQL query was executed:

```sql
SELECT IFNULL(NULLIF(TRIM(ProbeSet.Name), ''), ProbeSet.Id) AS name, GeneChip.Name, ProbeSet.Name, ProbeSet.Symbol, ProbeSet.description, ProbeSet.Chr, IFNULL(ProbeSet.Mb, '') AS Mb, ProbeSet.BlatSeq, ProbeSet.TargetSeq, ProbeSet.UniProtID FROM ProbeSet LEFT JOIN GeneChip ON GeneChip.Id = ProbeSet.ChipId
```

The above query results to triples that have the form:

```text
probeset:name -> rdf:type -> gn-id:probeset 
probeset:name -> gn-term:chipOf -> gn-id:platform_genechip_name 
probeset:name -> gn-term:name -> ProbeSet(Name) 
probeset:name -> gn-term:symbol -> ProbeSet(Symbol) 
probeset:name -> gn-term:description -> ProbeSetdescription 
probeset:name -> gn-term:chr -> ProbeSet(Chr) 
probeset:name -> gn-term:mb -> "Mb"^^xsd:double 
probeset:name -> gn-term:blatSeq -> ProbeSetBlatSeq 
probeset:name -> gn-term:targetSeq -> ProbeSetTargetSeq 
probeset:name -> gn-term:uniProtReference -> uniprot:ProbeSet(UniProtID) 
```
Here's an example query:

```sparql
@prefix probeset: <http://genenetwork.org/probeset/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-r .
@prefix uniprot: <http://purl.uniprot.org/uniprot/> .

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn-id:probeset .
    ?s gn-term:chipOf gn-id:platform_mg_u74av2 .
    ?s gn-term:name "MG_U74AV2" .
    ?s gn-term:symbol "Cd3g" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
probeset:100001_at rdf:type gn-id:probeset .
probeset:100001_at gn-term:chipOf gn-id:platform_mg_u74av2 .
probeset:100001_at gn-term:name "MG_U74AV2" .
probeset:100001_at gn-term:symbol "Cd3g" .
probeset:100001_at gn-term:description "CD3d antigen, gamma polypeptide" .
probeset:100001_at gn-term:chr "9" .
probeset:100001_at gn-term:mb "44.970689"^^xsd:double .
probeset:100001_at gn-term:blatSeq "CTCTGTTGCAAAATGAACAGCTGTACAGCCCCTCAAGGACCGGGAATATGACCAGTACAGCCATCTCCAAGGAAACCAACTGAGGAAGAAGTGAACTCAGCAGGACTCAGGGTGTCCCCACAATGCATTTTGGAGAGAGCCCAGACTGCAAGCAGAGAGGAAGAACTGAGGAAAACAAGCACAGCGTGGTGTT" .
probeset:100001_at gn-term:targetSeq "ctctgttgcaaaatgaacagctgtaccagcccctcaaggaccgggaatatgaccagtacagccatctccaaggaaaccaactgaggaagaagtgaactcagcaggactcagggtgtccccccttntatccagcacccagaatcaaaacaatgcattttggagagagcccagtagagagattttcaaccctacaggtagactgcaagcagagaggaagaactgtcaaagaaattttggtcttttttttttttttnncaaaataaaataaaagcttggaggagccagtggtatgantnnnnnntgnancanttgtcaaccttgtttggggttnncagcaccccacccccagaccccccaaaaaaattcagtgaaggaaaacaagcacagcgtggtgtt" .
```

