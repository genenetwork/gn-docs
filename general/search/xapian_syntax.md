# Global Search Queries

This page documents search queries as understood by our xapian search engine (aka "the global search").

General xapian search query syntax is documented on the xapian website: [https://getting-started-with-xapian.readthedocs.io/en/latest/concepts/search/queryparser.html](https://getting-started-with-xapian.readthedocs.io/en/latest/concepts/search/queryparser.html).

The specifics of GeneNetwork's use of xapian differs slightly in the choice of prefixes and special syntax such as the synteny search.  The examples below may help to illustrate it.

### Free text search

Search for the term "cytochrome" in the free text.

`cytochrome`

Search for the term "cytochrome" and the term "P450" in the free text (only results that have both are shown):

`cytochrome AND P450`

Search for occurrences of the term "cytochrome" near the term "P450" in the free text:

`cytochrome NEAR P450`

Search for the term "cytochrome" in the free text but exclude results that have the term "P450":

`cytochrome -P450`
`cytochrome NOT P450`

### Boolean filtering

Search for results pertaining to the human species:

`species:human`

Search for results pertaining to the BXD group:

`group:BXD`

or
`group:bxd`

The above search is case-insensitive.

Search for results pertaining to chromosome 11:

`chr:11`

Search for results pertaining to the BXD group and chromosome 11:

`group:BXD AND chr:11`

### Boolean filtering using numerical ranges

Search for results with mean between 5 and 7:

`mean:5..7`

Search for results with mean less than 5:

`mean:..5`

Search for results with mean greater than 7:

`mean:7..`

### RIF/WIKI search

To do a RIF search you can use the prefixes: `RIF:` or `rif:`.  Here are some searches you can try out:

```
rif:Brca2
rif:Brca2 mean:2.4..2.404
rif:isoneuronal mean:12.103..12.105
rif:glioma symbol:shh
rif:diabetes
```

To do a WIKI search you can use the prefixes: `WIKI:` or `wiki:`.  Here are some example searches:

```
wiki:nicotine
wiki:nicotine mean:12.103..12.105
wiki:addiction species:mouse
wiki:nicotine symbol:shh
wiki:glioma species:mouse group:bxd dataset:hc_m2_0606_p
```


### Synteny search

Search for results near (+/- 50 kbases) base 9930021 of chromosome 4 of the human species and syntenic locations in other species:

`Hs:chr4:9930021`

Search for results near (+/- 50 kbases) base 9930021 of chromosome 4 of the human species and syntenic locations in mouse alone:

`Hs:chr4:9930021 species:mouse`

Search for results between base 9130000 and 9980000 of chromosome 4 of the human species and syntenic locations in mouse alone:

`Hs:chr4:9130000..9980000 species:mouse`

Alternatively, this same query may be expressed using kilo or mega suffixes:

```
Hs:chr4:9130k..9980k species:mouse
Hs:chr4:9.13M..9.98M species:mouse
```

### Gotchas

#### Pure \`NOT\` queries are not supported

Due to [performance reasons,](https://xapian.org/docs/apidoc/html/classXapian_1_1QueryParser.html#ae96a58a8de9d219ca3214a5a66e0407eacafc7c8cf7c90adac0fc07d02125aed0) pure `NOT` queries are not supported.

A search such as: `NOT author:hager` will fail.

You will need to add something to the query to prevent the error, e.g.

`species:mouse NOT author:hager`
