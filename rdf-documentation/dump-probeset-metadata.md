# Probeset Metadata
## 'dump-probeset-metadata'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT ProbeSetFreeze.Name, IFNULL(ProbeSet.Name, ProbeSet.Id) AS name, ProbeSetFreeze.Name, IFNULL(ProbeSetXRef.mean, '') AS mean, IFNULL(ProbeSetXRef.se, '') AS se, ProbeSetXRef.Locus, IFNULL(ProbeSetXRef.LRS, '') AS LRS, IFNULL(ProbeSetXRef.pValue, '') AS pValue, IFNULL(ProbeSetXRef.additive, '') AS additive, IFNULL(ProbeSetXRef.h2, '') AS h2 FROM ProbeSetXRef LEFT JOIN ProbeSet ON ProbeSetXRef.ProbeSetId = ProbeSet.Id LEFT JOIN ProbeSetFreeze ON ProbeSetXRef.ProbeSetFreezeId = ProbeSetFreeze.Id WHERE ProbeSetFreeze.public > 0 AND ProbeSetFreeze.confidentiality < 1
```

The above query results to triples that have the form:

```text
gn:Probesetfreeze_name_ -> rdf:type -> gnc:probesetData 
gn:Probesetfreeze_name_ -> gnt:hasProbeset -> probeset:name 
gn:Probesetfreeze_name_ -> gnt:probesetOfDataset -> probeset:ProbeSetFreeze_Name_ 
gn:Probesetfreeze_name_ -> gnt:mean -> "mean"^^xsd:double 
gn:Probesetfreeze_name_ -> gnt:se -> "se"^^xsd:double 
gn:Probesetfreeze_name_ -> gnt:locus -> ProbeSetXRef(Locus) 
gn:Probesetfreeze_name_ -> gn:LRS -> "LRS"^^xsd:double 
gn:Probesetfreeze_name_ -> gnt:pValue -> "pValue"^^xsd:double 
gn:Probesetfreeze_name_ -> gnt:additive -> "additive"^^xsd:double 
gn:Probesetfreeze_name_ -> gnt:h2 -> "h2"^^xsd:float 
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
    ?s rdf:type gnc:probesetData .
    ?s gnt:hasProbeset probeset:100001_at .
    ?s gnt:probesetOfDataset probeset:HC_U_0304_R .
    ?s gnt:mean #{"8.14033666666667"^^xsd:double}# .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:Hc_u_0304_r rdf:type gnc:probesetData .
gn:Hc_u_0304_r gnt:hasProbeset probeset:100001_at .
gn:Hc_u_0304_r gnt:probesetOfDataset probeset:HC_U_0304_R .
gn:Hc_u_0304_r gnt:mean "8.14033666666667"^^xsd:double .
gn:Hc_u_0304_r gnt:se "0.023595817125580502"^^xsd:double .
gn:Hc_u_0304_r gnt:locus "rsm10000021399" .
gn:Hc_u_0304_r gn:LRS "12.2805314427567"^^xsd:double .
gn:Hc_u_0304_r gnt:pValue "0.118"^^xsd:double .
gn:Hc_u_0304_r gnt:additive "0.0803547619047631"^^xsd:double .
```

