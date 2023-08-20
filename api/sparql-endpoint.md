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


- list_groups("drosophila") - List available groups of datasets

        PREFIX gn: <http://genenetwork.org/id/>
        PREFIX gnc: <http://genenetwork.org/category/>
        PREFIX owl: <http://www.w3.org/2002/07/owl#>
        PREFIX gnt: <http://genenetwork.org/term/>
        PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
        PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
        PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
        PREFIX taxon: <http://purl.uniprot.org/taxonomy/>

        SELECT ?inbredSet WHERE {
            ?species rdf:type gnc:species .
            ?species skos:altLabel "drosophila" .
            ?inbredSet rdf:type gnc:inbredSet .
            ?inbredSet gnt:belongsToSpecies ?species .
        }


- list_datasets("BXD") - List available datasets for a given group (here, "BXD").

        PREFIX v: <http://www.w3.org/2006/vcard/ns#>
        PREFIX foaf: <http://xmlns.com/foaf/0.1/>
        PREFIX gdmt: <http://vocab.fairdatacollective.org/gdmt/>
        PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
        PREFIX geoSeries: <http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=>
        PREFIX gnt: <http://genenetwork.org/term/>
        PREFIX gn: <http://genenetwork.org/id/>
        PREFIX gnc: <http://genenetwork.org/category/>
        PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
        PREFIX owl: <http://www.w3.org/2002/07/owl#>
        PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
        PREFIX taxon: <http://purl.uniprot.org/taxonomy/>
        PREFIX dct: <http://purl.org/dc/terms/>
        PREFIX gdmt: <http://vocab.fairdatacollective.org/gdmt/>

        SELECT DISTINCT ?datasetName WHERE {
            ?dataset rdf:type/rdfs:subClassOf gnc:dataset .
            ?dataset rdfs:label ?datasetName .
            ?dataset gnt:belongsToInbredSet ?inbredSet .
            ?inbredSet skos:altLabel "BXD" .
            }

- info_dataset("CB_M_1004_P") - Get meta information about a data set.

        PREFIX v: <http://www.w3.org/2006/vcard/ns#>
        PREFIX foaf: <http://xmlns.com/foaf/0.1/>
        PREFIX gdmt: <http://vocab.fairdatacollective.org/gdmt/>
        PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
        PREFIX geoSeries: <http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=>
        PREFIX gnt: <http://genenetwork.org/term/>
        PREFIX gn: <http://genenetwork.org/id/>
        PREFIX gnc: <http://genenetwork.org/category/>
        PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
        PREFIX owl: <http://www.w3.org/2002/07/owl#>
        PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
        PREFIX taxon: <http://purl.uniprot.org/taxonomy/>
        PREFIX dct: <http://purl.org/dc/terms/>

        SELECT DISTINCT * WHERE {
            ?s rdfs:label "CB_M_1004_P" .
            ?s ?p ?o .
             }


- info_datasets("B6D2F2") - Get meta information about all data sets for a group.

        PREFIX v: <http://www.w3.org/2006/vcard/ns#>
        PREFIX foaf: <http://xmlns.com/foaf/0.1/>
        PREFIX gdmt: <http://vocab.fairdatacollective.org/gdmt/>
        PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
        PREFIX geoSeries: <http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=>
        PREFIX gnt: <http://genenetwork.org/term/>
        PREFIX gn: <http://genenetwork.org/id/>
        PREFIX gnc: <http://genenetwork.org/category/>
        PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
        PREFIX owl: <http://www.w3.org/2002/07/owl#>
        PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
        PREFIX taxon: <http://purl.uniprot.org/taxonomy/>
        PREFIX dct: <http://purl.org/dc/terms/>

        SELECT DISTINCT * WHERE {
            ?s rdf:type/rdfs:subClassOf gnc:dataset .
            ?s gnt:belongsToInbredSet ?inbredSet .
            ?inbredSet skos:altLabel "B6D2F2" .
            ?s ?p ?o .
             }

- info_pheno("BXD", "10038") - Get summary information for a phenotype

        PREFIX dct: <http://purl.org/dc/terms/>
        PREFIX gn: <http://genenetwork.org/id/>
        PREFIX owl: <http://www.w3.org/2002/07/owl#>
        PREFIX gnc: <http://genenetwork.org/category/>
        PREFIX gnt: <http://genenetwork.org/terms/>
        PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
        PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
        PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
        PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
        PREFIX pubmed: <http://rdf.ncbi.nlm.nih.gov/pubmed/>
        PREFIX fabio: <http://purl.org/spar/fabio/>

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

> - get_pheno("BXD", "10646") - Get phenotype values for a classical trait.

> - get_geno("BXD") - Get genotypes for a group.

> - run_gemma("BXDPublish", "10015") - Perform a genome scan with gemma
> - run_rqtl("BXDPublish", "10015") - Perform a genome scan with R/qtl
> - run_correlation("HC_M2_0606_P", "BXDPublish", "1427571_at") - Finds traits that are correlated with a given trait.
