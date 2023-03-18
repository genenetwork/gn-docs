# Search

## Overview

One of the key features of GeneNetwork (GN) are powerful search functions. For most users "Search" is the entry point. The main GN front page has a simple heirarchical menu modeled roughy on the USCS Genome Browser that enables a focused search by species (human, mouse, rat, potato), and then by more and more refined groups, cohorts, families, or studies (BXD family, GTEx). The lowest level of this heirarchy enable a search of a particular data type (phenotypes, genotypes, molecular traits such as "Hippocampus mRNA").

The problem with heirarchical search is that it is not practical to search for all instances of data on lifespan or BRACA2 expression across all species and data sets. We therefore added a global search function, but this search was too slow for all but the most patient users. We therefore reworked the global search using the Xapian search engine. Xapian implements a very fast search using deep indexing of files. Xapian also enables much more powerful search queries.

A example a global search for the BRCA2 results in a comprehensive trawling expedition through 754 datasets and 39,765,944 traits across 10 species. The result is a table of 7998 results that can now be selected and sorted by species, family, or even expression levels.

The search URL looks like 'https://genenetwork.org/gsearch?type=gene&terms=BRCA2' and can be copy-pasted and shared with other users.

More powerful queries will narrow down on field in the result table. For example to get only mouse results "species:mouse BRCA2" found 5916 results.

Example search terms:

```
species:mouse BRCA2 - looks good, has Liver
species:mouse Tissue:Liver - 0 results
species:mouse tissue:Liver - 0 results
brca - only renders 2 results, why not BRCA2?
```

FIXME: keywords like tissue appear to be case sensitive. Should not be the case.

See also

=> https://issues.genenetwork.org/topics/xapian-search-queries

GeneNetwork search functionality is used in the publication `Integrative Functional Genomics for Systems Genetics in GeneWeaver.org`. The authors present their webservice by searching for a "nociception" QTL in a region on chromosome 4 found in GN. They export the details and use it for further analysis in GeneWeaver\cite{bubier2016}.

In the publication `Systems Genetics of Obesity` GeneNetwork search is used to find genes contributing to collagen content in adipose tissue in the BXD and find similar cis-eQTL connected with adipose tissue that exist in other studies hosted on GN\cite{brockmann2016}.

In the paper `New Insights on Gene by Environmental Effects of Drugs of Abuse in Animal Models Using GeneNetwork' the authors reanalyzed an older experimental data in the GeneNetwork database.
They discovered QTLs on mouse chromosomes 3, 5, 9, 11, and 14, not found in the original study
and found new candidate genes included Slitrk6 and Cdk14. Slitrk6, in a Chromosome14 QTL for locomotion, was found to be part of a co-expression network involved in voluntary movement and associated with neuropsychiatric phenotypes. Cdk14, one of only three genes in a Chromosome5 QTL, is associated with handling induced convulsions after ethanol treatment, that is regulated by the anticonvulsant drug valproic acid\cite{PMC9024903}.

## Future

* Add human SNP search and synteny
* Support more sources, e.g. geneweaver

## Methods

GN search is built on Xapian, an Open Source Search Engine Library, released under the GPL v2+. It's written in C++, with bindings to allow use from Python, Guile and other languages.
Xapian is actively maintained and current Xapian users include, for example, the Debian website and the notmuch E-mail indexer.
Xapian is a highly adaptable toolkit which allows developers to easily add advanced indexing and search facilities to their own applications. It has built-in support for several families of weighting models and also supports a rich set of boolean query operators\cite{Xapian}.
We build the Xapian index from SQL data and RDF data in the GN databases.
