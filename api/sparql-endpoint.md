# GENENETWORK SPARQL endpoint

SPARQL is the query language for our RDF database. This endpoint can export HTML, JSON and TSV(!)

Note that we created a reflective REST API that executes similar queries. See the [REST API](GN-REST-API-v2.md).

SPARQL examples are:

## Get species info

- list_species() - List available species.

        PREFIX gn: <http://genenetwork.org/id/>
        PREFIX gnc: <http://genenetwork.org/category/>
        PREFIX owl: <http://www.w3.org/2002/07/owl#>
        PREFIX gnt: <http://genenetwork.org/term/>
        PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
        PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
        PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
        PREFIX taxon: <http://purl.uniprot.org/taxonomy/>

        SELECT DISTINCT * WHERE {
            ?s rdf:type gnc:species .
            ?s ?p ?o .
        }

[try me] (https://sparql.genenetwork.org/sparql?default-graph-uri=&qtxt=%20%20%20%20%20%20%20%20PREFIX%20gn%3A%20%3Chttp%3A%2F%2Fgenenetwork.org%2Fid%2F%3E%0A%20%20%20%20%20%20%20%20PREFIX%20gnc%3A%20%3Chttp%3A%2F%2Fgenenetwork.org%2Fcategory%2F%3E%0A%20%20%20%20%20%20%20%20PREFIX%20owl%3A%20%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0A%20%20%20%20%20%20%20%20PREFIX%20gnt%3A%20%3Chttp%3A%2F%2Fgenenetwork.org%2Fterm%2F%3E%0A%20%20%20%20%20%20%20%20PREFIX%20skos%3A%20%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0A%20%20%20%20%20%20%20%20PREFIX%20rdf%3A%20%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0A%20%20%20%20%20%20%20%20PREFIX%20rdfs%3A%20%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0A%20%20%20%20%20%20%20%20PREFIX%20taxon%3A%20%3Chttp%3A%2F%2Fpurl.uniprot.org%2Ftaxonomy%2F%3E%0A%0A%20%20%20%20%20%20%20%20SELECT%20DISTINCT%20*%20WHERE%20%7B%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Fs%20rdf%3Atype%20gnc%3Aspecies%20.%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Fs%20%3Fp%20%3Fo%20.%0A%20%20%20%20%20%20%20%20%7D%0A%0A&format=text%2Fhtml&timeout=0&signal_void=on)

## Get 'group' or population info

- list_groups("drosophila") - List available groups of datasets

```sparql
        PREFIX gn: <http://genenetwork.org/id/>
        PREFIX gnc: <http://genenetwork.org/category/>
        PREFIX owl: <http://www.w3.org/2002/07/owl#>
        PREFIX gnt: <http://genenetwork.org/term/>
        PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
        PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
        PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
        PREFIX taxon: <http://purl.uniprot.org/taxonomy/>

        SELECT ?inbredSet WHERE {
             rdf:type gnc:species .
            ?species skos:altLabel "drosophila" .
            ?inbredSet rdf:type gnc:inbredSet .
            ?inbredSet gnt:belongsToSpecies ?species .
        }
```

And list all 50+ sets for Mouse:

```sql
       SELECT DISTINCT * WHERE {
            ?inbredSet rdf:type gnc:inbredSet ;
             gnt:belongsToSpecies gn:Mus_musculus .
            OPTIONAL {?inbredSet rdfs:label ?descr }.
        }
```

[try](https://sparql.genenetwork.org/sparql?default-graph-uri=&qtxt=%20%20%20%20%20%20%20PREFIX%20gn%3A%20%3Chttp%3A%2F%2Fgenenetwork.org%2Fid%2F%3E%0A%20%20%20%20%20%20%20%20PREFIX%20gnc%3A%20%3Chttp%3A%2F%2Fgenenetwork.org%2Fcategory%2F%3E%0A%20%20%20%20%20%20%20%20PREFIX%20owl%3A%20%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0A%20%20%20%20%20%20%20%20PREFIX%20gnt%3A%20%3Chttp%3A%2F%2Fgenenetwork.org%2Fterm%2F%3E%0A%20%20%20%20%20%20%20%20PREFIX%20skos%3A%20%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0A%20%20%20%20%20%20%20%20PREFIX%20rdf%3A%20%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0A%20%20%20%20%20%20%20%20PREFIX%20rdfs%3A%20%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0A%20%20%20%20%20%20%20%20PREFIX%20taxon%3A%20%3Chttp%3A%2F%2Fpurl.uniprot.org%2Ftaxonomy%2F%3E%0A%0A%20%20%20%20%20%20%20%20SELECT%20DISTINCT%20*%20WHERE%20%7B%0A%20%20%20%20%20%20%20%20%20%20%20%20%3FinbredSet%20rdf%3Atype%20gnc%3AinbredSet%20%3B%0A%20%20%20%20%20%20%20%20%20%20%20%20%20gnt%3AbelongsToSpecies%20gn%3AMus_musculus%20.%0A%20%20%20%20%20%20%20%20%20%20%20%20OPTIONAL%20%7B%3FinbredSet%20rdfs%3Alabel%20%3Fdescr%20%7D.%0A%20%20%20%20%20%20%20%20%7D&format=text%2Fhtml&timeout=0&signal_void=on).

## List all datasets for a group/population:

- list_datasets("BXD") - List available datasets for a given group (here, "BXD").

```
SELECT DISTINCT * WHERE {
             ?dataset gnt:belongsToInbredSet gn:inbredSetBxd ;
             rdfs:label ?descr .
}
```

[try](https://sparql.genenetwork.org/sparql?default-graph-uri=&qtxt=%20%20%20%20%20%20%20%20PREFIX%20gn%3A%20%3Chttp%3A%2F%2Fgenenetwork.org%2Fid%2F%3E%0A%20%20%20%20%20%20%20%20PREFIX%20gnc%3A%20%3Chttp%3A%2F%2Fgenenetwork.org%2Fcategory%2F%3E%0A%20%20%20%20%20%20%20%20PREFIX%20owl%3A%20%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0A%20%20%20%20%20%20%20%20PREFIX%20gnt%3A%20%3Chttp%3A%2F%2Fgenenetwork.org%2Fterm%2F%3E%0A%20%20%20%20%20%20%20%20PREFIX%20skos%3A%20%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0A%20%20%20%20%20%20%20%20PREFIX%20rdf%3A%20%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0A%20%20%20%20%20%20%20%20PREFIX%20rdfs%3A%20%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0A%20%20%20%20%20%20%20%20PREFIX%20taxon%3A%20%3Chttp%3A%2F%2Fpurl.uniprot.org%2Ftaxonomy%2F%3E%0A%0ASELECT%20DISTINCT%20*%20WHERE%20%7B%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%3Fdataset%20gnt%3AbelongsToInbredSet%20gn%3AinbredSetBxd%20%3B%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20rdfs%3Alabel%20%3Fdescr%20.%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on)

Pick one, e.g. http://genenetwork.org/id/Devneocortex_ilm6_2p14rinv_1111 or `gn:Devneocortex_ilm6_2p14rinv_1111`

```
SELECT DISTINCT * WHERE {
      gn:Devneocortex_ilm6_2p14rinv_1111 ?p ?o .
}
```

Will show something like:

```
http://www.w3.org/1999/02/22-rdf-syntax-ns#type    http://genenetwork.org/category/probesetDataset
http://purl.org/dc/terms/created "2011-11-18"
http://www.w3.org/2004/02/skos/core#prefLabel "BIDMC/UTHSC Dev Neocortex P14 ILMv6.2 (Nov10)"
http://genenetwork.org/term/belongsToInbredSet 	http://genenetwork.org/id/inbredSetBxd
http://vocab.fairdatacollective.org/gdmt/hasCreatorAffiliation 	"Beth Israel Deaconess Medical Center"
```
[try](https://sparql.genenetwork.org/sparql?default-graph-uri=&qtxt=%20%20%20%20%20%20%20%20PREFIX%20gn%3A%20%3Chttp%3A%2F%2Fgenenetwork.org%2Fid%2F%3E%0A%20%20%20%20%20%20%20%20PREFIX%20gnc%3A%20%3Chttp%3A%2F%2Fgenenetwork.org%2Fcategory%2F%3E%0A%20%20%20%20%20%20%20%20PREFIX%20owl%3A%20%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0A%20%20%20%20%20%20%20%20PREFIX%20gnt%3A%20%3Chttp%3A%2F%2Fgenenetwork.org%2Fterm%2F%3E%0A%20%20%20%20%20%20%20%20PREFIX%20skos%3A%20%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0A%20%20%20%20%20%20%20%20PREFIX%20rdf%3A%20%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0A%20%20%20%20%20%20%20%20PREFIX%20rdfs%3A%20%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0A%20%20%20%20%20%20%20%20PREFIX%20taxon%3A%20%3Chttp%3A%2F%2Fpurl.uniprot.org%2Ftaxonomy%2F%3E%0A%0ASELECT%20DISTINCT%20*%20WHERE%20%7B%0A%20%20%20%20%20%20gn%3ADevneocortex_ilm6_2p14rinv_1111%20%3Fp%20%3Fo%20.%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on)


Another way to list datasets with the name that is used in GN:

```
        SELECT DISTINCT ?dataset ?datasetName WHERE {
            ?dataset rdf:type/rdfs:subClassOf gnc:dataset .
            ?dataset rdfs:label ?datasetName .
            ?dataset gnt:belongsToInbredSet ?inbredSet .
            ?inbredSet skos:altLabel "BXD" .
          }
```


- info_dataset("CB_M_1004_P") - Get meta information about a data set using the GN name:

```
        SELECT DISTINCT * WHERE {
            ?s rdfs:label "CB_M_1004_P" .
            ?s ?p ?o .
             }
```

(you should be using the identifier here)

- info_datasets("B6D2F2") - Get meta information about all data sets for a group.

```
    SELECT DISTINCT * WHERE {
            ?s rdf:type/rdfs:subClassOf gnc:dataset .
            ?s gnt:belongsToInbredSet ?inbredSet .
            ?inbredSet skos:altLabel "B6D2F2" .
            ?s ?p ?o .
             }
```
- info_pheno("BXD", "10038") - Get summary information for a phenotype

```
        SELECT DISTINCT * WHERE {
            ?s rdf:type gnc:phenotype .
            ?inbredSet skos:altLabel "BXD" .
            ?s gnt:belongsToInbredSet ?inbredSet.
            ?s gnt:traitName "10001" .
            ?s ?p ?o .
        OPTIONAL {
            ?pub fabio:hasPubMedId ?pmid .
            ?s dct:isReferencedBy ?pmid .
            ?pub ?pubTerms ?pubResult .
            }
        }
```

> - get_pheno("BXD", "10646") - Get phenotype values for a classical trait.

Use lmdb

> - get_geno("BXD") - Get genotypes for a group.

Use lmdb

> - run_gemma("BXDPublish", "10015") - Perform a genome scan with gemma
> - run_rqtl("BXDPublish", "10015") - Perform a genome scan with R/qtl
> - run_correlation("HC_M2_0606_P", "BXDPublish", "1427571_at") - Finds traits that are correlated with a given trait.

Not in SPARQL
