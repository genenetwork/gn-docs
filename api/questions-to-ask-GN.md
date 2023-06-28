# Questions to ask GN

We are asking GN users to list questions here that should return information through the GN APIs. We will add information on (proposed) API endpoints.

The GN API is used by the gnapi R package

https://github.com/kbroman/gnapi

as well as the Julia GeneNetworkAPI package

https://github.com/senresearch/GeneNetworkAPI.jl

Note the API is currently up for discussion (WIP).

To understand concepts such as Groups it may be worth reading
[this](../features/data-structures.md)

## Is it live?

```
curl https://genenetwork.org/api/v_pre1/
{"hello":"world"}
```


## Return species

* Current:

```
curl -s https://genenetwork.org/api/v_pre1/species|jq '.[0:2]'
[
  {
    "FullName": "Mus musculus",
    "Id": 1,
    "Name": "mouse",
    "TaxonomyId": 10090
  },
  {
    "FullName": "Rattus norvegicus",
    "Id": 2,
    "Name": "rat",
    "TaxonomyId": 10116
  }
]
```

* Current SPARQL:

https://sparql.genenetwork.org/sparql?default-graph-uri=&qtxt=prefix%20gn%3A%20%3Chttp%3A%2F%2Fgenenetwork.org%2F%3E%0A%0ASELECT%20*%20WHERE%20%7B%0A%3Fs%20rdf%3Atype%20gn%3Aspecies%20.%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on

What is known about mouse?

```
SELECT * WHERE {
  gn:species_mus_musculus ?p ?o.
}
```

https://sparql.genenetwork.org/sparql?default-graph-uri=&qtxt=prefix%20gn%3A%20%3Chttp%3A%2F%2Fgenenetwork.org%2F%3E%0A%0ASELECT%20*%20WHERE%20%7B%0Agn%3Aspecies_mus_musculus%20%3Fp%20%3Fo.%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on

## Return available groups/populations

* Current: https://genenetwork.org/api/v_pre1/groups/mouse
* Proposed: https://genenetwork.org/api/v_pre1/mouse/groups (?)

```sh
curl -s http://genenetwork.org/api/v_pre1/groups/mouse |jq '.[8:10]' -M
```

```js
[
  {
    "DisplayName": "B6D2F2 OHSU Striatum",
    "FullName": "B6D2F2 OHSU Striatum",
    "GeneticType": "intercross",
    "Id": 12,
    "MappingMethodId": "1",
    "Name": "BDF2-2005",
    "SpeciesId": 1,
    "public": 2
  },
  {
    "DisplayName": "Mouse Diversity Panel",
    "FullName": "Mouse Diversity Panel",
    "GeneticType": "None",
    "Id": 15,
    "MappingMethodId": "1",
    "Name": "MDP",
    "SpeciesId": 1,
    "public": 2
  }
]
```
**Note: I wonder if the key "Short_Abbreviation" could have a different name. This is the keyword that users need in order to construct the URLs. I guess most people would be looking for something in the metadata a bit more 'important'-sounding: like "Key" or "Keyword" or even "Title" ("ID" is already used by a database index - although this value can't be used in the URLs). The name of the key required for URL-building is also different for each hierarchy level ("Name" in most cases (although sometimes all lowercase) but "id" for phenotype traits for example).**

## Return cross info

There is a bug in this one. It is supposed to return something like

```
{"species_id":1,"species":"mouse","mapping_method_id":1,"group_id":1,"group":"BXD","genetic_type":"riset","chr_info":[["1",197195432],["2",181748087],["3",159599783],["4",155630120],["5",152537259],["6",149517037],["7",152524553],["8",131738871],["9",124076172],["10",129993255],["11",121843856],["12",121257530],["13",120284312],["14",125194864],["15",103494974],["16",98319150],["17",95272651],["18",90772031],["19",61342430],["X",166650296]]}
```

Errors

```
curl -s https://genenetwork.org/api/v_pre1/group/BXD
File "/home/gn2/production/gene/wqflask/wqflask/api/router.py", line 157, in get_group_info
    group = results.fetchone()
AttributeError: 'tuple' object has no attribute 'fetchone'
```

## Return Genotypes

Return all genotypes for a specific population.

* Current https://genenetwork.org/api/v_pre1/genotypes/HSNIH-Palmer_true.geno

without _true we get a different and incomplete file.

The API code is at
https://github.com/genenetwork/genenetwork2/blob/8bfb79da9b8dc0591532939dca97e0fa9c06c5d2/wqflask/wqflask/api/router.py#L803

You can see it simply returns a file - so we have a geno file named HSNIH-Palmer_true.geno and that is what it returns.

According to above code we can get .geno, .csv, .rqtl2, .bimbam, etc. as long as the file exists.

Standardization of genotype data format would be helpful. Alternatively, a query that tells the user what genotype formats are available.

* Proposed: return available files

## Return trait metadata

Return trait metadata such as probeset info or other "trait covariates" for the high-dimensional traits. There is also the information on how the data was collected or processed.

* Current: through SPARQL
* Proposed: https://genenetwork.org/api/v_pre1/mouse/bxd/HC_M2_0606_P/1436869_at

## List datasets

```
curl -s https://genenetwork.org/api/v_pre1/datasets/BXD|jq ".[0:2]"
[
  {
    "AvgID": 1,
    "CreateTime": "Fri, 01 Aug 2003 00:00:00 GMT",
    "DataScale": "log2",
    "FullName": "Brain U74Av2 08/03 MAS5",
    "Id": 1,
    "Long_Abbreviation": "BXDMicroArray_ProbeSet_August03",
    "ProbeFreezeId": 337,
    "ShortName": "Brain U74Av2 08/03 MAS5",
    "Short_Abbreviation": "Br_U_0803_M",
    "confidentiality": 0,
    "public": 0
  },
  {
    "AvgID": 1,
    "CreateTime": "Sun, 01 Jun 2003 00:00:00 GMT",
    "DataScale": "log2",
    "FullName": "UTHSC Brain mRNA U74Av2 (Jun03) MAS5",
    "Id": 2,
    "Long_Abbreviation": "BXDMicroArray_ProbeSet_June03",
    "ProbeFreezeId": 10,
    "ShortName": "Brain U74Av2 06/03 MAS5",
    "Short_Abbreviation": "Br_U_0603_M",
    "confidentiality": 0,
    "public": 0
  }
]
```

## Get information on a dataset

Use the dataset name

```
curl -s https://genenetwork.org/api/v_pre1/dataset/KIN_YSM_HIP_0711.json|jq
{
  "confidential": 0,
  "data_scale": "log2",
  "dataset_type": "mRNA expression",
  "full_name": "Human Hippocampus Affy Hu-Exon 1.0 ST (Jul11) Quantile",
  "id": 337,
  "name": "KIN_YSM_HIP_0711",
  "public": 1,
  "short_name": "KIN/YSM Human HIP Affy Hu-Exon 1.0 ST (Jul11) Quantile",
  "tissue": "Hippocampus mRNA",
  "tissue_id": 9
}
```

Use the ProbeFreezeId above (correct?)

```
curl -s https://genenetwork.org/api/v_pre1/dataset/10.json|jq
{
  "confidential": 0,
  "data_scale": "log2",
  "dataset_type": "mRNA expression",
  "full_name": "Eye M430v2 No Mutant/Mutant (Aug12) RMA",
  "id": 10,
  "name": "gn10",
  "public": 1,
  "short_name": "Eye M430v2 No Mutant/Mutant (Aug12) RMA",
  "tissue": "Eye mRNA",
  "tissue_id": 10
}
```

```
curl -s https://genenetwork.org/api/v_pre1/dataset/bxd/10001|jq
{
  "dataset_type": "phenotype",
  "description": "Central nervous system, morphology: Cerebellum weight, whole, bilateral in adults of both sexes [mg]",
  "id": 10001,
  "name": "CBLWT2",
  "pubmed_id": 11438585,
  "title": "Genetic control of the mouse cerebellum: identification of quantitative trait loci modulating size and architecture",
  "year": "2001"
}
```

## Return sample data

Return all traits in a dataset.

```
 curl -s https://genenetwork.org/api/v_pre1/traits/HC_U_0304_R.json|jq ".[0:2]"
[
  {
    "Additive": 0.0803547619047631,
    "Aliases": "T3g; Ctg3; Ctg-3",
    "Chr": "9",
    "Description": "CD3d antigen, gamma polypeptide",
    "Id": 1,
    "LRS": 12.2805314427567,
    "Locus": "rsm10000021399",
    "Mb": 44.970689,
    "Mean": 8.14033666666667,
    "Name": "100001_at",
    "P-Value": 0.118,
    "SE": 0.023595817125580502,
    "Symbol": "Cd3g"
  },
  {
    "Additive": 0.0317847222222219,
    "Aliases": "Intin3; Itih-3; AW108094",
    "Chr": "14",
    "Description": "inter-alpha trypsin inhibitor, heavy chain 3",
    "Id": 2,
    "LRS": 8.37046436677732,
    "Locus": "rsm10000013342",
    "Mb": 30.908741,
    "Mean": 7.82323333333333,
    "Name": "100002_at",
    "P-Value": 0.561,
    "SE": 0.011720083297057399,
    "Symbol": "Itih3"
  }
]
```

Return trait by probe

```
curl -s https://genenetwork.org/api/v_pre1/trait//HC_U_0304_R/104617_at.json|jq
{
  "additive": -0.0515941964285714,
  "alias": "AI182092; 0610005C13Rik; 0610005C13Rik-205",
  "chr": "7",
  "description": "RIKEN cDNA 0610005C13 protein (high kidney and liver expression)_",
  "id": 3690,
  "locus": "rsm10000026692",
  "lrs": 11.3682286632142,
  "mb": 45.568173,
  "mean": 8.165623333333329,
  "name": "104617_at",
  "p_value": 0.666,
  "se": 0.0170213555407089,
  "symbol": "0610005C13Rik"
}
```

## Return QTL

Return the QTL (one or more) for a trait.

* Proposed: http://genenetwork.org/api/v_pre1/mouse/bxd/HC_M2_0606_P/1436869_at/qtl

There is also the question of more complex queries, such as with covariates.

## Mapping

Return mapping results through the API.

```
curl -s "https://genenetwork.org/api/v_pre1/mapping?trait_id=10015&db=BXDPublish&method=rqtl&limit_to=10"|jq ".[0:3]"
[
  {
    "Mb": 3.010274,
    "cM": 3.010274,
    "chr": 1,
    "lod_score": 0.116927114593807,
    "name": "rs31443144"
  },
  {
    "Mb": 3.492195,
    "cM": 3.492195,
    "chr": 1,
    "lod_score": 0.117404479202946,
    "name": "rs6269442"
  },
  {
    "Mb": 3.511204,
    "cM": 3.511204,
    "chr": 1,
    "lod_score": 0.11742354952122,
    "name": "rs32285189"
  }
]
```

## Correlate

```
curl -s "https://genenetwork.org/api/v_pre1/correlation?trait_id=1427571_at&db=HC_M2_0606_P&target_db=BXDPublish&method=spearman&type=sample&return_count=5"|jq ".[0:3]"[
  {
    "#_strains": 6,
    "p_value": 0.004804664723032055,
    "sample_r": -0.942857142857143,
    "trait": 20511
  },
  {
    "#_strains": 6,
    "p_value": 0.004804664723032055,
    "sample_r": -0.942857142857143,
    "trait": 20724
  },
  {
    "#_strains": 12,
    "p_value": 1.8288943424888848e-05,
    "sample_r": -0.9233615170820528,
    "trait": 13536
  }
]
```

## Return datasets are relevant to diabetes?

TBD

## What phenotypes do we have for a certain dataset?

TBD

# More

All computations in GN can be exposed through the API.

# Implementation

Currently the API is managed from three bases. First the main web server code base:

* https://github.com/genenetwork/genenetwork2/blob/testing/wqflask/wqflask/api/router.py

Next the GN3 code base which is all supposed to be REST API:

* https://github.com/genenetwork/genenetwork3/tree/main/gn3/api


is GN3 live?

```
curl -s http://genenetwork.org/api3/api/version
"1.0"
```

Finally the SPARQL endpoint which is driven by RDF generated with

* https://github.com/genenetwork/dump-genenetwork-database

Visit

* https://sparql.genenetwork.org/sparql
