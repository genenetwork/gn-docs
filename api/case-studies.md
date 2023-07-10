# Case studies

## The Hp1bp3 transcript
Investigate Hp1bp3, which has a cis-QTL in hippocampus and is associated with cognitive ageing.

___
Search for the dataset:

https://genenetwork.org/api/v2/Mus_musculus/BXD/datasets?search=hippocampus

[API v1]: # https://genenetwork.org/api/v_pre1/datasets/bxd
```
[
	{
    "AvgID": 1, 
    "CreateTime": "Mon, 24 Oct 2005 00:00:00 GMT", 
    "DataScale": "log2", 
    "FullName": "Hippocampus Consortium M430v2 (Oct05) MAS5", 
    "Id": 86, 
    "Long_Abbreviation": "Hippocampus_M430_V2_BXD_MAS5_Oct05", 
    "ProbeFreezeId": 24, 
    "ShortName": "Hippocampus M430v2 BXD 10/05 MAS5", 
    "Short_Abbreviation": "HC_M2_1005_M", 
    "confidentiality": 0, 
    "public": 0
  }, 
  {
    "AvgID": 3, 
    "CreateTime": "Mon, 24 Oct 2005 00:00:00 GMT", 
    "DataScale": "log2", 
    "FullName": "Hippocampus Consortium M430v2 (Oct05) RMA", 
    "Id": 87, 
    "Long_Abbreviation": "Hippocampus_M430_V2_BXD_RMA_Oct05", 
    "ProbeFreezeId": 24, 
    "ShortName": "Hippocampus M430v2 BXD 10/05 RMA", 
    "Short_Abbreviation": "HC_M2_1005_R", 
    "confidentiality": 0, 
    "public": 0
  }, 
  {
    "AvgID": 2, 
    "CreateTime": "Mon, 24 Oct 2005 00:00:00 GMT", 
    "DataScale": "log2", 
    "FullName": "Hippocampus Consortium M430v2 (Oct05) PDNN", 
    "Id": 88, 
    "Long_Abbreviation": "Hippocampus_M430_V2_BXD_PDNN_Oct05", 
    "ProbeFreezeId": 24, 
    "ShortName": "Hippocampus M430v2 BXD 10/05 PDNN", 
    "Short_Abbreviation": "HC_M2_1005_P", 
    "confidentiality": 0, 
    "public": 0
  }
]

```
This should return a list of all hippocampal _datasets_ containing the phrase 'hippocampus' (or its lemma).
The user can then look through the descriptions and decide which one they need.
In this case the appropriate key is `HC_M2_0606_P`.

We could also just get a listing of all datasets and work through them locally (by eye or with a local grep).

https://genenetwork.org/api/v2/Mus_musculus/BXD/datasets

In all cases, giving the generic term (`species`, `populations`, `datasets`, `traits`) will return a listing of all descendent options.

Just using the instance keys as the endpoint (e.g. `api/v2/Mus_musculus`, `api/v2/Mus_musculus/BXD`, `api/v2/Mus_musculus/BXD/HC_M2_0606_P`) will return metadata about the level (about the species 'mouse', the population 'BXD' or the dataset 'HC_M2_0606_P' respectively in the above examples).

___
To continue, we dig down and search the dataset for the desired gene name:

https://genenetwork.org/api/v2/Mus_musculus/BXD/HC_M2_0606_P/traits?search&symbol=Hp1bp3

```
[
	{
	  "additive": -0.15845054446461, 
	  "alias": "HP1BP74; HP1-BP74; Hp1bp74", 
	  "chr": "4", 
	  "description": "heterochromatin protein 1, binding protein 3", 
	  "id": 78509, 
	  "locus": "rsm10000002056", 
	  "lrs": 57.6845496792109, 
	  "mb": 138.242585, 
	  "mean": 12.2393434343434, 
	  "name": "1415751_at", 
	  "p_value": 0.0, 
	  "se": null, 
	  "symbol": "Hp1bp3"
	},
	{
	  "additive": -0.489152777777777, 
	  "alias": "HP1BP74; HP1-BP74; Hp1bp74", 
	  "chr": "4", 
	  "description": "heterochromatin protein 1, binding protein 3", 
	  "id": 102578, 
	  "locus": "rsm10000002058", 
	  "lrs": 96.3121317863362, 
	  "mb": 138.244118, 
	  "mean": 8.88365656565657, 
	  "name": "1439845_at", 
	  "p_value": 0.0, 
	  "se": null, 
	  "symbol": "Hp1bp3"
	},
	{
	  "additive": -0.037382526029878, 
	  "alias": "HP1BP74; HP1-BP74; Hp1bp74; 2310026L22Rik", 
	  "chr": "4", 
	  "description": "heterochromatin protein 1, binding protein 3", 
	  "id": 110688, 
	  "locus": "rs32937254", 
	  "lrs": 13.2029671197265, 
	  "mb": 138.21577, 
	  "mean": 6.51316161616162, 
	  "name": "1447955_at", 
	  "p_value": 0.317, 
	  "se": null, 
	  "symbol": "Hp1bp3"
	}
]
```

This gives us the three probesets associated with Hp1bp3 and some metadata (name, aliases, expression, precomputed QTL etc.).
We decide that `1439845_at` is the correct probeset.

___
Get more information about `1439845_at` including the metadata noted above, but also microarray platform, probe composition and mapping, chromosomal position, gene/transcript length, links to gene info (NCBI, Wikidata), homologous genes in other species, [what other datasets contain data for this gene] etc.:

https://genenetwork.org/api/v2/Mus_musculus/BXD/HC_M2_0606_P/1439845_at

[API v1]: # https://genenetwork.org/api/v_pre1/trait/HC_M2_0606_P/1439845_at
```
[
	{
	  "additive": -0.489152777777777, 
	  "alias": "HP1BP74; HP1-BP74; Hp1bp74", 
	  "chr": "4", 
	  "description": "heterochromatin protein 1, binding protein 3", 
	  "id": 102578, 
	  "locus": "rsm10000002058", 
	  "lrs": 96.3121317863362, 
	  "mb": 138.244118, 
	  "mean": 8.88365656565657, 
	  "name": "1439845_at", 
	  "p_value": 0.0, 
	  "se": null, 
	  "symbol": "Hp1bp3",
	  "wikidata": "Q18251298",
	  "homologene", "7774",
	}
]
```
*Should include all of the data shown at https://genenetwork.org/show_trait?trait_id=1439845_at&dataset=HC_M2_0606_P*

___
Get the expression data for this trait:

https://genenetwork.org/api/v2/Mus_musculus/BXD/HC_M2_0606_P/1439845_at/data

```
[
  {
    "data_id": 23426549, 
    "sample_name": "129S1/SvImJ", 
    "sample_name_2": "129S1/SvImJ", 
    "se": 0.219, 
    "value": 6.61
  }, 
  {
    "data_id": 23426549, 
    "sample_name": "A/J", 
    "sample_name_2": "A/J", 
    "se": 0.158, 
    "value": 6.536
  }, 
  {
    "data_id": 23426549, 
    "sample_name": "AKR/J", 
    "sample_name_2": "AKR/J", 
    "se": 0.076, 
    "value": 6.486
  }, 
  {
    "data_id": 23426549, 
    "sample_name": "B6D2F1", 
    "sample_name_2": "B6D2F1", 
    "se": 0.09, 
    "value": 6.561
  }, 
	.
	.
	.
]
```

This is a data endpoint, so the returned JSON includes a vector of the transcript expression values for this probeset.

If we wanted to grab the whole microarray dataset, then we can just use the data keyword one level up.
Here, a return type can also be specified

https://genenetwork.org/api/v2/Mus_musculus/BXD/HC_M2_0606_P/BXD/data.tsv

This returns a tab-delimited table of data (probesets in columns, strains/individuals in rows) for download.

___
Get the QTL vector:

https://genenetwork.org/api/v2/Mus_musculus/BXD/HC_M2_0606_P/1439845_at/qtl?method=GEMMA&genotype=mm10

[API v1]: # https://genenetwork.org/api/v_pre1/mapping?trait_id=1447955_at&db=HC_M2_0606_P&method=gemma&use_loco=FALSE&use_loco=0.01
```
[
  [
    {
      "Mb": 3.00149, 
      "additive": -0.0017764785, 
      "chr": 1, 
      "lod_score": 0.06055383480931299, 
      "name": "rsm10000000001", 
      "p_value": 0.8698536
    }, 
    {
      "Mb": 3.010274, 
      "additive": -0.0017764785, 
      "chr": 1, 
      "lod_score": 0.06055383480931299, 
      "name": "rs31443144", 
      "p_value": 0.8698536
    }, 
    {
      "Mb": 3.492195, 
      "additive": -0.0017764785, 
      "chr": 1, 
      "lod_score": 0.06055383480931299, 
      "name": "rs6269442", 
      "p_value": 0.8698536
    }, 
    {
      "Mb": 3.511204, 
      "additive": -0.0017764785, 
      "chr": 1, 
      "lod_score": 0.06055383480931299, 
      "name": "rs32285189", 
      "p_value": 0.8698536
    }, 
    {
      "Mb": 3.659804, 
      "additive": -0.0017764785, 
      "chr": 1, 
      "lod_score": 0.06055383480931299, 
      "name": "rs258367496", 
      "p_value": 0.8698536
    }, 
    {
      "Mb": 3.777023, 
      "additive": -0.0017764785, 
      "chr": 1, 
      "lod_score": 0.06055383480931299, 
      "name": "rs32430919", 
      "p_value": 0.8698536
    },
    .
    .
    .
 ]
```

This is also a data endpoint, so we get a vector of p-values together with a vector of chromosomal positions.


___
Correlate with all phenotypes:

https://genenetwork.org/api/v2/Mus_musculus/BXD/HC_M2_0606_P/1439845_at/correlations?method=spearmann&dataset=phenotypes&n_results=10

[API v1]: # https://genenetwork.org/api/v_pre1/correlation?trait_id=1447955_at&db=HC_M2_0606_P&target_db=BXDPublish&type=sample&method=spearman&return=10 
[Error]: # This returns 500 results.
```
[
  {
    "#_strains": 7, 
    "p_value": 0.0025194724037946874, 
    "sample_r": 0.9285714285714288, 
    "trait": "12562"
  }, 
  {
    "#_strains": 13, 
    "p_value": 2.4445741031329683e-05, 
    "sample_r": 0.9023392305243964, 
    "trait": "12889"
  }, 
  {
    "#_strains": 7, 
    "p_value": 0.01369732661532562, 
    "sample_r": -0.8571428571428573, 
    "trait": "19087"
  }, 
  {
    "#_strains": 13, 
    "p_value": 0.00039102596905431295, 
    "sample_r": 0.8342668763658431, 
    "trait": "20884"
  }, 
  {
    "#_strains": 8, 
    "p_value": 0.01017554012345675, 
    "sample_r": -0.8333333333333335, 
    "trait": "10409"
  }, 
  {
    "#_strains": 8, 
    "p_value": 0.01017554012345675, 
    "sample_r": -0.8333333333333335, 
    "trait": "10410"
  }, 
  {
    "#_strains": 6, 
    "p_value": 0.04156268221574334, 
    "sample_r": 0.8285714285714287, 
    "trait": "20393"
  }, 
  {
    "#_strains": 6, 
    "p_value": 0.04156268221574334, 
    "sample_r": -0.8285714285714287, 
    "trait": "20595"
  }, 
  {
    "#_strains": 10, 
    "p_value": 0.0038149200825507135, 
    "sample_r": -0.8181818181818182, 
    "trait": "16177"
  }, 
  {
    "#_strains": 15, 
    "p_value": 0.000219365827727102, 
    "sample_r": 0.8142857142857142, 
    "trait": "27198"
  }
 ]
```
It is not necessary to specify the target at any level above dataset as correlations can only be performed within a population.

___
Correlate with a specific trait:

https://genenetwork.org/api/v2/Mus_musculus/BXD/HC_M2_0606_P/1439845_at/correlations?method=pearson&dataset=HC_M2_0606_P&traits=1415751_at,1447955_at

Here, we have correlated against the two other Hs1bp3 probesets, which are specified by a comma-delimited list of trait IDs.

Correlation across different datasets would be achieved by multiple API calls.
Although there may be a way to line up a series of calls and have them run as a batch (I presume more complicated queries like this would be done via a POST interface though).

___
More advanced searches could allow restricting the search to certain fields:

https://genenetwork.org/api/v2/Mus_musculus/BXD/datasets?search&type=transcript&tag=hippocampus

I would support using tags to associate keywords with items at all levels.
Here, the `search` parameter was left empty as we are looking for a phrase in a particular field.
If all parameters are empty, this should not fail but return the same as the `datasets` query without the parameters (i.e. return a listing of all available datasets).
