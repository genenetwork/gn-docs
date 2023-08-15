# Probeset Summary Statistics
## 'dump-probeset-data'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT CONCAT(ProbeSetFreeze.Name, '_', IF(NULLIF(TRIM(ProbeSet.Name), ProbeSet.Id) IS NULL, '', TRIM(ProbeSet.Name))) AS probesetData, IF(NULLIF(TRIM(ProbeSet.Name), '') IS NULL, '', TRIM(ProbeSet.Name)) AS ProbeSetIdName, ProbeSet.Id, IFNULL(ProbeSetXRef.mean, '') AS mean, ProbeSetXRef.Locus, IFNULL(ProbeSetXRef.LRS, '') AS lrs, IFNULL(ProbeSetXRef.additive, '') AS additive, IFNULL(ProbeSetXRef.se, '') AS stdErr, IFNULL(ProbeSetXRef.pValue, '') AS pValue, IFNULL(ProbeSetXRef.h2, '') AS h2, ProbeSetFreeze.Name FROM ProbeSetXRef LEFT JOIN ProbeSet ON ProbeSetXRef.ProbeSetId = ProbeSet.Id LEFT JOIN ProbeSetFreeze ON ProbeSetXRef.ProbeSetFreezeId = ProbeSetFreeze.Id WHERE ProbeSetFreeze.public > 0 AND ProbeSetFreeze.confidentiality < 1
```

The above query results to triples that have the form:

```text
gn:Probesetdata -> rdf:type -> gnc:probesetStatistics 
gn:Probesetdata -> gnt:hasProbeSet -> gn:probeset_probesetidname 
gn:Probesetdata -> gnt:mean -> "mean"^^xsd:double 
gn:Probesetdata -> gnt:locus -> ProbeSetXRef(Locus) 
gn:Probesetdata -> gnt:LRS -> "lrs"^^xsd:double 
gn:Probesetdata -> gnt:additive -> "additive"^^xsd:double 
gn:Probesetdata -> gnt:stdErr -> "stdErr"^^xsd:double 
gn:Probesetdata -> gnt:pValue -> "pValue"^^xsd:double 
gn:Probesetdata -> gnt:h2 -> "h2"^^xsd:double 
gn:Probesetdata -> gnt:belongsToDataset -> gn:Probesetfreeze_name_ 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX gnt: <http://genenetwork.org/id/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 

SELECT * WHERE { 
    ?s rdf:type gnc:probesetStatistics .
    ?s gnt:hasProbeSet gn:probeset_100001_at .
    ?s gnt:mean #{"8.14033666666667"^^xsd:double}# .
    ?s gnt:locus "rsm10000021399" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:Hc_u_0304_r_100001_at rdf:type gnc:probesetStatistics .
gn:Hc_u_0304_r_100001_at gnt:hasProbeSet gn:probeset_100001_at .
gn:Hc_u_0304_r_100001_at gnt:mean "8.14033666666667"^^xsd:double .
gn:Hc_u_0304_r_100001_at gnt:locus "rsm10000021399" .
gn:Hc_u_0304_r_100001_at gnt:LRS "12.2805314427567"^^xsd:double .
gn:Hc_u_0304_r_100001_at gnt:additive "0.0803547619047631"^^xsd:double .
gn:Hc_u_0304_r_100001_at gnt:stdErr "0.023595817125580502"^^xsd:double .
gn:Hc_u_0304_r_100001_at gnt:pValue "0.118"^^xsd:double .
gn:Hc_u_0304_r_100001_at gnt:belongsToDataset gn:Hc_u_0304_r .
```

