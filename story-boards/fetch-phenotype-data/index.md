# Storyboard: fetch phenotype data from GeneNetwork

GeneNetwork contains data on thousands of experiments.
How do you fetch data from the database so it can be used in R, Python or a spreadsheet?

# Using the REST API

GeneNetwork comes with a flexible REST API which allows fetching standard datatypes from the database. Much of the output is in JSON format which can be parsed from R, Python etc. There is also the excellent jq tool which allows viewing output in color. E.g.

```sh
curl https://genenetwork.org/api/v_pre1/datasets/bxd > bxd.json
jq -C -S . bxd.json |less -R
```

shows for example

```js
  {
    "AvgID": 3,
    "CreateTime": "Tue, 02 Nov 2021 00:00:00 GMT",
    "DataScale": "log2",
    "FullName": "UTHSC BXD Hippocampus Postnatal Day 7 Ethanol Both Sexes Affy Clarion S (Nov21) RMA",
    "Id": 1041,
    "Long_Abbreviation": "UTHSC_BXD_Hip_PostD7EtohBS_Nov21",
    "ProbeFreezeId": 432,
    "ShortName": "UTHSC BXD Hippocampus Postnatal Day 7 Ethanol Both Sexes Affy Clarion S (Nov21) RMA",
    "Short_Abbreviation": "UTHSC_BXD_Hip_PostD7EtohBS_1121",
    "confidentiality": 0,
    "public": 1
  }
```

curl is a tool for fetching API data. You can also use wget or download with R or Python.

Karl Broman wrote the [GNapi](https://github.com/kbroman/GNapi) R package for accessing the GN API.

# Reading the API tutorial

In the next step check out the [documentation](../../api/GN2-REST-API.md).
