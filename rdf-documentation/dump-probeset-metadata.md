# Probeset Metadata
## 'dump-probeset-metadata'


## Generated Triples:

The following SQL query was executed:

```sql
SELECT CONCAT(ProbeSetFreeze.Name,':',IFNULL(ProbeSet.Name, ProbeSet.Id)) AS ProbeSetName, IFNULL(ProbeSet.Name, ProbeSet.Id) AS name, ProbeSetFreeze.Name, IFNULL(ProbeSetXRef.mean, '') AS mean, IFNULL(ProbeSetXRef.se, '') AS se, ProbeSetXRef.Locus, IFNULL(ProbeSetXRef.LRS, '') AS LRS, IFNULL(ProbeSetXRef.pValue, '') AS pValue, IFNULL(ProbeSetXRef.additive, '') AS additive, IFNULL(ProbeSetXRef.h2, '') AS h2 FROM ProbeSetXRef LEFT JOIN ProbeSet ON ProbeSetXRef.ProbeSetId = ProbeSet.Id LEFT JOIN ProbeSetFreeze ON ProbeSetXRef.ProbeSetFreezeId = ProbeSetFreeze.Id WHERE ProbeSetFreeze.public > 0 AND ProbeSetFreeze.confidentiality < 1
```

The above query results to triples that have the form:

```text
gn:probesetData_probesetname -> rdf:type -> gn:probesetData 
gn:probesetData_probesetname -> gn-term:hasProbeset -> probeset:name 
gn:probesetData_probesetname -> gn-term:probesetOfDataset -> probeset:ProbeSetFreeze_Name_ 
gn:probesetData_probesetname -> gn-term:mean -> "mean"^^xsd:double 
gn:probesetData_probesetname -> gn-term:se -> "se"^^xsd:double 
gn:probesetData_probesetname -> gn-term:locus -> ProbeSetXRef(Locus) 
gn:probesetData_probesetname -> gn:LRS -> "LRS"^^xsd:double 
gn:probesetData_probesetname -> gn-term:pValue -> "pValue"^^xsd:double 
gn:probesetData_probesetname -> gn-term:additive -> "additive"^^xsd:double 
gn:probesetData_probesetname -> gn-term:h2 -> "h2"^^xsd:float 
```
Here's an example query:

```sparql
@prefix gn: <http://genenetwork.org/id/> .
@prefix gn-term: <http://genenetwork.org/id/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn:probesetData .
    ?s gn-term:hasProbeset probeset:100001_at .
    ?s gn-term:probesetOfDataset probeset:HC_U_0304_R .
    ?s gn-term:mean #{"8.14033666666667"^^xsd:double}# .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:probesetData_hc_u_0304_r:100001_at rdf:type gn:probesetData .
gn:probesetData_hc_u_0304_r:100001_at gn-term:hasProbeset probeset:100001_at .
gn:probesetData_hc_u_0304_r:100001_at gn-term:probesetOfDataset probeset:HC_U_0304_R .
gn:probesetData_hc_u_0304_r:100001_at gn-term:mean "8.14033666666667"^^xsd:double .
gn:probesetData_hc_u_0304_r:100001_at gn-term:se "0.023595817125580502"^^xsd:double .
gn:probesetData_hc_u_0304_r:100001_at gn-term:locus "rsm10000021399" .
gn:probesetData_hc_u_0304_r:100001_at gn:LRS "12.2805314427567"^^xsd:double .
gn:probesetData_hc_u_0304_r:100001_at gn-term:pValue "0.118"^^xsd:double .
gn:probesetData_hc_u_0304_r:100001_at gn-term:additive "0.0803547619047631"^^xsd:double .
```

