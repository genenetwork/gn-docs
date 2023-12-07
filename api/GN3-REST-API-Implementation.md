# API Endpoints

The following end-points are available to all users.  The result of every query is json-ld.

## GET /metadata/species

Returns a list of species.

```
curl "https://cd.genenetwork.org/api3/metadata/species"
```

Example Result:

```
{
  "@context": {
    "alternateName": "skos:altLabel",
    "data": "@graph",
    "family": "gnt:family",
    "fullName": "skos:prefLabel",
    "gnt": "http://genenetwork.org/term/",
    "id": "@id",
    "name": "rdfs:label",
    "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
    "shortName": "gnt:shortName",
    "skos": "http://www.w3.org/2004/02/skos/core#",
    "taxonomicId": "skos:notation",
    "type": "@type"
  },
  "data": [
    {
      "alternateName": "Human",
      "family": "Vertebrates",
      "fullName": "Human (Homo sapiens, hg19)",
      "id": "http://genenetwork.org/id/Homo_sapiens",
      "name": "Homo sapiens",
      "shortName": "human",
      "taxonomicId": {
        "id": "http://purl.uniprot.org/taxonomy/9606"
      }
    },
    [...]
    {
      "alternateName": "Soybean",
      "family": "Plants",
      "fullName": "Soybean (Glycine max, US DOE JGI-PGF v2 2021)",
      "id": "http://genenetwork.org/id/Glycine_max",
      "name": "Glycine max",
      "shortName": "soybean",
      "taxonomicId": {
        "id": "http://purl.uniprot.org/taxonomy/3847"
      }
    }
  ]
}
```

## GET /metadata/species/:name

Get a list of species with data available in GN.

```
curl "https://cd.genenetwork.org/api3/metadata/species/bat"
```

Example Result:

```
{
  "@context": {
    "alternateName": "skos:altLabel",
    "data": "@graph",
    "family": "gnt:family",
    "fullName": "skos:prefLabel",
    "gnt": "http://genenetwork.org/term/",
    "id": "@id",
    "name": "rdfs:label",
    "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
    "shortName": "gnt:shortName",
    "skos": "http://www.w3.org/2004/02/skos/core#",
    "taxonomicId": "skos:notation",
    "type": "@type"
  },
  "alternateName": "Bat (Glossophaga soricina)",
  "family": "Vertebrates",
  "fullName": "Bat (Glossophaga soricina, gsor23)",
  "id": "http://genenetwork.org/id/Glossophaga_soricina",
  "name": "Glossophaga soricina",
  "shortName": "bat",
  "taxonomicId": {
    "id": "http://purl.uniprot.org/taxonomy/27638"
  }
}

```

## GET /metadata/groups

Fetch all groups.

```
curl "https://cd.genenetwork.org/api3/metadata/groups"
```

Example Result:

```
{
  "@context": {
    "code": "gnt:code",
    "data": "@graph",
    "family": "gnt:family",
    "fullName": "skos:prefLabel",
    "geneticType": "gnt:geneticType",
    "gnt": "http://genenetwork.org/term/",
    "id": "@id",
    "mappingMethod": "gnt:mappingMethod",
    "name": "rdfs:label",
    "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
    "shortName": "gnt:shortName",
    "skos": "http://www.w3.org/2004/02/skos/core#",
    "type": "@type"
  },
  "data": [
    {
      "code": "BDG",
      "family": "BXD Individual Data",
      "fullName": "DOD-BXD-GWI",
      "geneticType": "intercross",
      "id": "http://genenetwork.org/id/setDod-bxd-gwi",
      "mappingMethod": "qtlreaper",
      "name": "BXD DOD Gulf War Illness"
    },
    [...]
    {
      "code": "CAN",
      "fullName": "CANDLE",
      "id": "http://genenetwork.org/id/setCandle",
      "name": "Child Development: CANDLE Cohort with Genotypes (TUCI/UTHSC)"
    }
  ]
}
```

## GET /metadata/groups/:name

Fetch information about a given group given a species' name.

```
curl "https://cd.genenetwork.org/api3/metadata/groups/bat"
```

Example Result:

```
{
  "@context": {
    "code": "gnt:code",
    "data": "@graph",
    "family": "gnt:family",
    "fullName": "skos:prefLabel",
    "geneticType": "gnt:geneticType",
    "gnt": "http://genenetwork.org/term/",
    "id": "@id",
    "mappingMethod": "gnt:mappingMethod",
    "name": "rdfs:label",
    "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
    "shortName": "gnt:shortName",
    "skos": "http://www.w3.org/2004/02/skos/core#",
    "type": "@type"
  },
  "code": "GSO",
  "fullName": "GSO",
  "id": "http://genenetwork.org/id/setGso",
  "mappingMethod": "qtlreaper",
  "name": "HUB Winter Gsor families (2014-2022)"
}
```


## GET /metadata/datasets/:name

Fetch information about a given dataset given it's name.

```
curl "https://cd.genenetwork.org/api3/metadata/datasets/IBR_M_0204_M"
```

or

```
curl "https://cd.genenetwork.org/api3/metadata/datasets/GN11"
```

Example Result:

```
{
  "@context": {
    "GoTree": "gnt:hasGoTreeValue",
    "accessRights": "dct:accessRights",
    "accessionId": "dct:identifier",
    "acknowledgement": "gnt:hasAcknowledgement",
    "altLabel": "skos:altLabel",
    "caseInfo": "gnt:hasCaseInfo",
    "citation": "dct:isReferencedBy",
    "classifiedUnder": "xkos:classifiedUnder",
    "contactName": "foaf:name",
    "contactPoint": "dcat:contactPoint",
    "contactWebUrl": "foaf:homepage",
    "contributors": "dct:creator",
    "created": "dct:created",
    "data": "@graph",
    "dcat": "http://www.w3.org/ns/dcat#",
    "dct": "http://purl.org/dc/terms/",
    "description": "dct:description",
    "ex": "http://example.org/stuff/1.0/",
    "experimentDesignInfo": "gnt:hasExperimentDesignInfo",
    "foaf": "http://xmlns.com/foaf/0.1/",
    "geoSeriesId": "gnt:hasGeoSeriesId",
    "gnt": "http://genenetwork.org/term/",
    "id": "@id",
    "inbredSet": "gnt:belongsToGroup",
    "label": "rdfs:label",
    "normalization": "gnt:usesNormalization",
    "notes": "gnt:hasNotes",
    "organization": "foaf:Organization",
    "platform": "gnt:usesPlatform",
    "platformInfo": "gnt:hasPlatformInfo",
    "prefLabel": "skos:prefLabel",
    "processingInfo": "gnt:hasDataProcessingInfo",
    "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
    "skos": "http://www.w3.org/2004/02/skos/core#",
    "specifics": "gnt:hasContentInfo",
    "tissue": "gnt:hasTissue",
    "tissueInfo": "gnt:hasTissueInfo",
    "title": "dct:title",
    "type": "@type",
    "xkos": "http://rdf-vocabulary.ddialliance.org/xkos#"
  },
  "accessRights": "public",
  "accessionId": "GN11",
  "acknowledgement": "<blockquote>Data for the microarrays were generously provided by support from NIAAA INIA grants to RWW and Thomas Sutter. Support for sample acquistion and WebQTL have been provided by NIMH Human Brain Project, and the Dunavant Chair of Excellence, University of Tennessee Health Science Center. All arrays were processed at the University of Memphis by Dr. Thomas Sutter and colleagues with support of the INIA Bioanalytical Core.</blockquote>",
  "altLabel": "INIA Brain mRNA M430 (Feb04)",
  "caseInfo": "<p>We have exploited a set of BXD recombinant inbred strains. The parental strains from which all BXD lines are derived are C57BL/6J B and DBA/2J D. Both B and D strains have been almost fully sequence 8x coverage for B by a public consortium and approximately 1.5x coverage for D by <a class='fs14' href='http://www.celeradiscoverysystem.com/index.cfm' target='_blank'>Celera</a>.</p>\n\n<p>BXD1 through BXD32 were produced by Benjamin A. Taylor starting in the late 1970s. BXD33 through BXD42 were also produced by Taylor, but from a second set of crosses initiated in the early 1990s. These strains are all available from the Jackson Laboratory, Bar Harbor, Maine.</p>",
  "classifiedUnder": {
    "id": "http://genenetwork.org/category/Probeset",
    "prefLabel": "mRNA Assay Datasets"
  },
  "contactPoint": {
    "contactName": "Michael Miles",
    "contactWebUrl": "http://www.brainchip.vcu.edu",
    "id": "http://genenetwork.org/id/investigatorMichael_miles_mfmiles_vcu.edu"
  },
  "created": "2004-02-01",
  "description": "<p>This October 2004 data freeze provides initial estimates of mRNA expression in brains of adult BXD recombinant inbred mice measured using Affymetrix M430AB microarrays. In contast to the U74Av2 array, this new data set provides broader coverage ~45,000 transcripts but does not include replicates or as many strains 25 vs 35. Data were generated at UTHSC and the University of Memphis with support from grants from the NIAAA Integrative Neuroscience Initiative on Alcoholism <a class='fs14' href='http://www.iniastress.org' target='_blank'>INIA</a>. Data were processed using the <a class='fs14' href='http://odin.mdacc.tmc.edu/~zhangli/PerfectMatch/' target='_blank'>PDNN</a> method of Zhang. To simplify comparison among transforms, PDNN values of each array were adjusted to an average of 8 units and a variance of 2 units.</p>",
  "id": "http://genenetwork.org/id/Ibr_m_0204_m",
  "inbredSet": {
    "id": "http://genenetwork.org/id/setBxd",
    "label": "BXD Family"
  },
  "label": "IBR_M_0204_M",
  "normalization": {
    "id": "http://genenetwork.org/id/avgMethodMas5",
    "label": "MAS5"
  },
  "notes": "<p>This text file originally generated by RWW, YHQ, and EJC, Oct 2004. Updated by RWW, Nov 5, 2004.</p>",
  "organization": "Virginia Commonwealth University",
  "platform": {
    "classifiedUnder": {
      "id": "http://genenetwork.org/id/Mus_musculus"
    },
    "geoSeriesId": {
      "id": "http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GPL339_340"
    },
    "gnt:hasGOTreeValue": "GN_GPL339_340",
    "id": "http://genenetwork.org/id/platformMoe430",
    "label": "Affy Mouse Genome 430A, 430B, 430A 2.0 (GPL339,GPL340)",
    "platformInfo": "<p><strong>Affymetrix 430A and 430B GeneChip Set:</strong> Expression data were generated using 430AB array pairs. The chromosomal locations of probe sets were determined by <a class='fs14' href='http://genome.ucsc.edu/cgi-bin/hgBlat?command=start&amp;org=mouse' target='_blank'>BLAT</a> analysis of concatenated probe sequences using the Mouse Genome Sequencing Consortium May 2004 mm5 assembly. This BLAT analysis is performed periodically by Yanhua Qu as each new build of the mouse genome is released. We thank Yan Cui UTHSC for allowing us to use his Linux cluster to perform this analysis. It is possible to confirm the BLAT alignment results yourself simply by clicking on either the <strong>Verify UCSC</strong> and <strong>Verify Ensembl</strong> links in the Trait Data and Editing Form right side of the <strong>Location</strong> line.</p>",
    "prefLabel": "MOE430",
    "type": "http://genenetwork.org/category/geneChip"
  },
  "processingInfo": "<blockquote><strong>Probe cell level data from the CEL file: </strong>These CEL values produced by <a class='fs14' href='http://www.affymetrix.com/support/technical/product_updates/gcos_download.affx' target='_blank'>GCOS</a> are 75% quantiles from a set of 91 pixel values per cell.</blockquote>\n\n<blockquote>\n<ul>\n\t<li>Step 1: We added an offset of 1 to the CEL expression values for each cell to ensure that all values could be logged without generating negative values.</li>\n\t<li>Step 2: We took the log base 2 of each probe signal.</li>\n\t<li>Step 3: We computed the Z scores for each probe signal.</li>\n\t<li>Step 4: We multiplied all Z scores by 2.</li>\n\t<li>Step 5: We added 8 to the value of all Z scores. The consequence of this simple set of transformations is to produce a set of Z scores that have a mean of 8, a variance of 4, and a standard deviation of 2. The advantage of this modified Z score is that a two-fold difference in expression level corresponds approximately to a 1 unit difference.</li>\n\t<li>Step 6a: The 430A and 430B arrays include a set of 100 shared probe sets 2200 probes that have identical sequences. These probes provide a way to calibrate expression of the A and B arrays to a common scale. The absolute mean expression on the 430B array is almost invariably lower than that on the 430A array. To bring the two arrays into alignment, we regressed Z scores of the common set of probes to obtain a linear regression corrections to rescale the 430B arrays to the 430A array. In our case this involved multiplying all 430B Z scores by the slope of the regression and adding or subtracting a very small offset. The result of this step is that the mean of the 430A GeneChip expression is fixed at a value of 8, whereas that of the 430B chip is typically 7. Thus average of A and B arrays is approximately 7.5.</li>\n\t<li>Step 6b: We recenter the whole set of 430A and B transcripts to a mean of 8 and a standard deviation of 2. This involves reapplying Steps 3 through 5 above but now using the entire set of probes and probe sets from a merged 430A and B data set.</li>\n\t<li>Step 7: We corrected for technical variance introduced by two batches. Means separated by the first batch for each gene are corrected same as means of the second batch.</li>\n\t<li>Step 8: Finally, we compute the arithmetic mean of the values for the set of microarrays for each strain. In this data set we have modest numbers of replicates and for this reason we do not yet provide error terms for transcripts or probes. Note, that we have not yet corrected for variance introduced by differences in sex, age, or any interaction terms. We have not corrected for background beyond the background correction implemented by Affymetrix in generating the CEL file. We expect to add statistical controls and adjustments for these variables in subsequent versions of WebQTL.</li>\n</ul>\n</blockquote>\n\n<blockquote>\n<p><strong>Probe set data: </strong>The original expression values in the Affymetrix CEL files were read into <a class='fs14' href='http://odin.mdacc.tmc.edu/~zhangli/PerfectMatch/' target='_blank'>PerfectMatch</a> to generate the normalized PDNN data set.</p>\n\n<p>PDNN values of each array were subsequently normalized to a achieve a mean value of 8 units and a variance of 2 units.</p>\n\n<p>When necessary, we computed the arithmetic mean for technical replicates and treated these as single samples. We then computed the arithmetic mean for the set of 2 to 5 biological replicates for each strain.</p>\n</blockquote>\n\n<p>About the array probe sets names:</p>\n\n<blockquote>\n<p>Most probe sets on the mouse 430A and 430B arrays consist of a total of 22 probes, divided into 11 perfect matchPM probes and 11 mismatch MM controls. Each set of these 25-nucleotide-long probes has an identifier code that includes a unique number, an underscore character, several suffix characters that highlight design features, a a final A or B character to specify the array pair member. The most common probe set suffix is <strong>at</strong>. This code indicates that the probes should hybridize relatively selectively with the complementary anti-sense target i.e., the complemenary RNA produced from a single gene.</p>\n</blockquote>",
  "tissue": {
    "id": "http://genenetwork.org/id/tissueBrn",
    "label": "Brain mRNA",
    "tissueInfo": "<p>The data set consists of a single batch of Affymetrix mouse expression 430A and 430B GeneChip array pairs. Each AB pair was hybridized in sequence A array first, B array second with a pool of brain tissue forebrain minus olfactory bulb, plus the entire midbrain taken from three adult animals of closely matched age and the same sex. RNA was extracted at UTHSC by Lu Lu, Zhiping Jia, and Hongtao Zhai. All samples were subsequently processed in the INIA Bioanalytical Core at the W. Harry Feinstone Center of Excellence by Thomas R. Sutter and colleagues at the University of Memphis. Before running the main batch of 30 pairs of array, we ran four &quot;test&quot; samples one male and one female pool from each of the two parental strains, C57BL/6J and DBA/2J. The main set of 30 array pairs includes the same four samples in other words we have four technical replicates, two F1 hybrid sample each run two times for a within-batch technical replication, and 22 BXD strains. The data set therefore consists of one male and one female pool from C57BL/6J, DBA/2J, the B6D2F1 hybrid, 11 female BXD samples, and 11 male BXD samples. We should note that the four technical replicates between batches were eventually combined with a correction for a highly significant batch effect. This was done at both the probe and probe set levels to &quot;align&quot; the test batch values with the two main batches. The ratio of the probe average in the four test arrays to the average of the same probe in the four corresponding main batch arrays was used as a correction factor. The F1 within-batch technical replicates were simply averaged. In the next batch we will reverse the sex of the BXD samples to achieve a balance with at least 22 BXD strains with one male and one female sample each.</p>\n\n<p>The table below lists the arrays by strain, sex, age, sample identifier, and data results were obtained from the Bioanalytical Core at the University of Memphis. Each array was hybridized to a pool of mRNA from three mice.</p>\n\n<table align='Center' border='1' cellpadding='0' cellspacing='0' style='width:50%'>\n\t<tbody>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<table border='1' cellpadding='5' cellspacing='1' style='width:100%'>\n\t\t\t\t<tbody>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>Strain</td>\n\t\t\t\t\t\t<td>Sex</td>\n\t\t\t\t\t\t<td>Age</td>\n\t\t\t\t\t\t<td>SampleID</td>\n\t\t\t\t\t\t<td>Date</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>B6D2F1</td>\n\t\t\t\t\t\t<td>F</td>\n\t\t\t\t\t\t<td>127</td>\n\t\t\t\t\t\t<td>919-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>B6D2F1</td>\n\t\t\t\t\t\t<td>F</td>\n\t\t\t\t\t\t<td>127</td>\n\t\t\t\t\t\t<td>919-F2</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>B6D2F1</td>\n\t\t\t\t\t\t<td>M</td>\n\t\t\t\t\t\t<td>127</td>\n\t\t\t\t\t\t<td>920-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>B6D2F1</td>\n\t\t\t\t\t\t<td>M</td>\n\t\t\t\t\t\t<td>127</td>\n\t\t\t\t\t\t<td>920-F2</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>C57BL/6J</td>\n\t\t\t\t\t\t<td>F</td>\n\t\t\t\t\t\t<td>65</td>\n\t\t\t\t\t\t<td>903-F1</td>\n\t\t\t\t\t\t<td>Nov03</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>C57BL/6J</td>\n\t\t\t\t\t\t<td>F</td>\n\t\t\t\t\t\t<td>65</td>\n\t\t\t\t\t\t<td>903-F2</td>\n\t\t\t\t\t\t<td>Jan03</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>C57BL/6J</td>\n\t\t\t\t\t\t<td>M</td>\n\t\t\t\t\t\t<td>66</td>\n\t\t\t\t\t\t<td>906-F1</td>\n\t\t\t\t\t\t<td>Nov03</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>C57BL/6J</td>\n\t\t\t\t\t\t<td>M</td>\n\t\t\t\t\t\t<td>66</td>\n\t\t\t\t\t\t<td>906-F2</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>DBA/2J</td>\n\t\t\t\t\t\t<td>F</td>\n\t\t\t\t\t\t<td>60</td>\n\t\t\t\t\t\t<td>917-F1</td>\n\t\t\t\t\t\t<td>Nov03</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>DBA/2J</td>\n\t\t\t\t\t\t<td>F</td>\n\t\t\t\t\t\t<td>60</td>\n\t\t\t\t\t\t<td>917-F2</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>DBA/2J</td>\n\t\t\t\t\t\t<td>M</td>\n\t\t\t\t\t\t<td>60</td>\n\t\t\t\t\t\t<td>918-F1</td>\n\t\t\t\t\t\t<td>Nov03</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>DBA/2J</td>\n\t\t\t\t\t\t<td>M</td>\n\t\t\t\t\t\t<td>60</td>\n\t\t\t\t\t\t<td>918-F2</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>BXD1</td>\n\t\t\t\t\t\t<td>F</td>\n\t\t\t\t\t\t<td>95</td>\n\t\t\t\t\t\t<td>895-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>BXD5</td>\n\t\t\t\t\t\t<td>M</td>\n\t\t\t\t\t\t<td>71</td>\n\t\t\t\t\t\t<td>728-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>BXD6</td>\n\t\t\t\t\t\t<td>M</td>\n\t\t\t\t\t\t<td>92</td>\n\t\t\t\t\t\t<td>902-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>BXD8</td>\n\t\t\t\t\t\t<td>F</td>\n\t\t\t\t\t\t<td>72</td>\n\t\t\t\t\t\t<td>S167-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>BXD9</td>\n\t\t\t\t\t\t<td>M</td>\n\t\t\t\t\t\t<td>86</td>\n\t\t\t\t\t\t<td>909-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>BXD12</td>\n\t\t\t\t\t\t<td>M</td>\n\t\t\t\t\t\t<td>64</td>\n\t\t\t\t\t\t<td>897-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>BXD13</td>\n\t\t\t\t\t\t<td>F</td>\n\t\t\t\t\t\t<td>86</td>\n\t\t\t\t\t\t<td>748-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>BXD14</td>\n\t\t\t\t\t\t<td>M</td>\n\t\t\t\t\t\t<td>91</td>\n\t\t\t\t\t\t<td>912-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>BXD18</td>\n\t\t\t\t\t\t<td>F</td>\n\t\t\t\t\t\t<td>108</td>\n\t\t\t\t\t\t<td>771-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>BXD19</td>\n\t\t\t\t\t\t<td>F</td>\n\t\t\t\t\t\t<td>56</td>\n\t\t\t\t\t\t<td>S236-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>BXD21</td>\n\t\t\t\t\t\t<td>F</td>\n\t\t\t\t\t\t<td>67</td>\n\t\t\t\t\t\t<td>740-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>BXD23</td>\n\t\t\t\t\t\t<td>F</td>\n\t\t\t\t\t\t<td>88</td>\n\t\t\t\t\t\t<td>815-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>BXD24</td>\n\t\t\t\t\t\t<td>M</td>\n\t\t\t\t\t\t<td>71</td>\n\t\t\t\t\t\t<td>913-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>BXD25</td>\n\t\t\t\t\t\t<td>F</td>\n\t\t\t\t\t\t<td>74</td>\n\t\t\t\t\t\t<td>S373-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>BXD28</td>\n\t\t\t\t\t\t<td>F</td>\n\t\t\t\t\t\t<td>79</td>\n\t\t\t\t\t\t<td>910-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>BXD29</td>\n\t\t\t\t\t\t<td>F</td>\n\t\t\t\t\t\t<td>76</td>\n\t\t\t\t\t\t<td>693-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>BXD32</td>\n\t\t\t\t\t\t<td>F</td>\n\t\t\t\t\t\t<td>93</td>\n\t\t\t\t\t\t<td>898-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>BXD33</td>\n\t\t\t\t\t\t<td>M</td>\n\t\t\t\t\t\t<td>77</td>\n\t\t\t\t\t\t<td>915-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>BXD34</td>\n\t\t\t\t\t\t<td>M</td>\n\t\t\t\t\t\t<td>72</td>\n\t\t\t\t\t\t<td>916-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>BXD36</td>\n\t\t\t\t\t\t<td>M</td>\n\t\t\t\t\t\t<td>77</td>\n\t\t\t\t\t\t<td>926-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>BXD38</td>\n\t\t\t\t\t\t<td>M</td>\n\t\t\t\t\t\t<td>69</td>\n\t\t\t\t\t\t<td>731-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>BXD42</td>\n\t\t\t\t\t\t<td>M</td>\n\t\t\t\t\t\t<td>97</td>\n\t\t\t\t\t\t<td>936-F1</td>\n\t\t\t\t\t\t<td>Jan04</td>\n\t\t\t\t\t</tr>\n\t\t\t\t</tbody>\n\t\t\t</table>\n\t\t\t</td>\n\t\t</tr>\n\t</tbody>\n</table>",
    "type": "http://genenetwork.org/category/tissue"
  },
  "type": "dcat:Dataset"
}
```

## GET /metadata/datasets/:group/list

List datasets that belong to a given group.

*Parameters:* page(default=0), per-page(default=10)

```
curl "https://cd.genenetwork.org/api3/metadata/datasets/BXD/list"
```

Example Result:

```
{
  "@context": {
    "classifiedUnder": "xkos:classifiedUnder",
    "created": "dct:created",
    "currentPage": "ex:currentPage",
    "data": "@graph",
    "dct": "http://purl.org/dc/terms/",
    "ex": "http://example.org/stuff/1.0/",
    "id": "@id",
    "name": "rdfs:label",
    "pages": "ex:totalCount",
    "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
    "result": "ex:result",
    "resultItem": "ex:resultType",
    "results": "ex:items",
    "title": "dct:title",
    "type": "@type",
    "xkos": "http://rdf-vocabulary.ddialliance.org/xkos#"
  },
  "currentPage": 0,
  "id": "ex:result",
  "pages": 42,
  "results": [
    {
      "created": "2001-09-22",
      "name": "DBA2J-ONH-1212",
      "title": "Molecular clustering identifies complement and endothelin induction as early events in a mouse model of glaucoma."
    },
    [...]
    {
      "created": "2003-06-01",
      "name": "Br_U_0603_M"
    }
  ],
  "type": "resultItem"
}
```

## GET /metadata/datasets/search/:term
Search datasets based of it's title.

*Parameters:* page(default=0), per-page(default=10)

```
curl "https://cd.genenetwork.org/api3/metadata/datasets/search/BXD?page=2&per-page=3"
```

Example Result:

```
{
  "@context": {
    "classifiedUnder": "xkos:classifiedUnder",
    "currentPage": "ex:currentPage",
    "data": "@graph",
    "dataset": "rdfs:label",
    "dct": "http://purl.org/dc/terms/",
    "ex": "http://example.org/stuff/1.0/",
    "id": "@id",
    "inbredSet": "ex:belongsToInbredSet",
    "pages": "ex:totalCount",
    "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
    "result": "ex:result",
    "resultItem": "ex:resultType",
    "results": "ex:items",
    "title": "dct:title",
    "type": "@type",
    "xkos": "http://rdf-vocabulary.ddialliance.org/xkos#"
  },
  "data": [
    {
      "currentPage": 2,
      "id": "ex:result",
      "pages": 46,
      "results": [
        {
          "classifiedUnder": "Phenotype",
          "dataset": "BXD-AEPublish",
          "inbredSet": "BXD Adult and Aged Eye",
          "title": "BXD Adult and Aged Eye Phenotypes"
        },
        {
          "classifiedUnder": "Phenotype",
          "dataset": "BXD-AEPublish",
          "inbredSet": "BXD Adult and Aged Eye",
          "title": "BXD Adult and Aged Eye Phenotypes"
        },
        {
          "classifiedUnder": "Phenotype",
          "dataset": "BXD-BonePublish",
          "inbredSet": "BXD Bone Individual Data",
          "title": "BXD Bone Individual Data"
        }
      ],
      "type": "resultItem"
    }
  ]
}
```

## GET /metadata/datasets/search/:term
Search datasets based of it's title.

*Parameters:* page(default=0), per-page(default=10)

```
curl "https://cd.genenetwork.org/api3/metadata/datasets/search/BXD?page=2&per-page=3"
```

Example Result:

```
{
  "@context": {
    "classifiedUnder": "xkos:classifiedUnder",
    "currentPage": "ex:currentPage",
    "data": "@graph",
    "dataset": "rdfs:label",
    "dct": "http://purl.org/dc/terms/",
    "ex": "http://example.org/stuff/1.0/",
    "id": "@id",
    "inbredSet": "ex:belongsToInbredSet",
    "pages": "ex:totalCount",
    "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
    "result": "ex:result",
    "resultItem": "ex:resultType",
    "results": "ex:items",
    "title": "dct:title",
    "type": "@type",
    "xkos": "http://rdf-vocabulary.ddialliance.org/xkos#"
  },
  "data": [
    {
      "currentPage": 2,
      "id": "ex:result",
      "pages": 118,
      "results": [
        {
          "dataset": "BR_U_0304_DPMMR",
          "inbredSet": "BXD Family"
        },
        {
          "dataset": "Br_U_0303_M",
          "inbredSet": "BXD Family"
        },
        {
          "dataset": "BR_M2_1106_R",
          "inbredSet": "BXD Family",
          "title": "Candidate genes and their regulatory elements: alcohol preference and tolerance"
        },
        {
          "dataset": "BR_M2_1106_R",
          "inbredSet": "BXD Family",
          "title": "Candidate genes and their regulatory elements: alcohol preference and tolerance"
        },
        {
          "dataset": "BR_M2_1106_R",
          "inbredSet": "BXD Family",
          "title": "Candidate genes and their regulatory elements: alcohol preference and tolerance"
        },
        {
          "classifiedUnder": "Phenotype",
          "dataset": "B6D2RIPublish",
          "inbredSet": "BXD Aged Hippocampus",
          "title": "BXD Aged Hippocampus eQTL (Dresden UTHSC 2015)"
        },
        {
          "dataset": "Br_U_0303_M",
          "inbredSet": "BXD Family"
        },
        {
          "dataset": "BR_M2_1106_R",
          "inbredSet": "BXD Family",
          "title": "Candidate genes and their regulatory elements: alcohol preference and tolerance"
        },
        {
          "classifiedUnder": "Phenotype",
          "dataset": "B6D2RIPublish",
          "inbredSet": "BXD Aged Hippocampus",
          "title": "BXD Aged Hippocampus eQTL (Dresden UTHSC 2015)"
        },
        {
          "dataset": "Br_U_0303_M",
          "inbredSet": "BXD Family"
        }
      ],
      "type": "resultItem"
    }
  ]
}

```

## GET /metadata/publications/:name

Get a publication given it's name.  Name can be a pubmedId or a GN-specific identifier for unpublished work.

```
curl "https://cd.genenetwork.org/api3/metadata/publications/2760876"
```

Example Result:

```
{
  "@context": {
    "abstract": "dct:abstract",
    "creator": "dct:creator",
    "dct": "http://purl.org/dc/terms/",
    "fabio": "http://purl.org/spar/fabio/",
    "id": "@id",
    "journal": "fabio:Journal",
    "month": {
      "@id": "prism:publicationDate",
      "@type": "xsd:gMonth"
    },
    "page": "fabio:page",
    "prism": "http://prismstandard.org/namespaces/basic/2.0/",
    "title": "dct:title",
    "type": "@type",
    "volume": "prism:volume",
    "xsd": "http://www.w3.org/2001/XMLSchema#",
    "year": {
      "@id": "fabio:hasPublicationYear",
      "@type": "xsd:gYear"
    }
  },
  "abstract": "Fetal gonadal size [...]",
  "creator": [
    "Argyropoulos G",
    "Shire JG"
  ],
  "id": "http://rdf.ncbi.nlm.nih.gov/pubmed/2760876",
  "journal": "J Reprod Fertil",
  "month": "July",
  "page": "473-478",
  "title": "Genotypic effects on gonadal size in fetal mice",
  "type": "fabio:ResearchPaper",
  "volume": "86(2)",
  "year": "1989"
}
```

## GET /metadata/publications/search/:term

Search publications using :term.

```
curl "https://cd.genenetwork.org/api3/metadata/publications/search/BXD?page=0&per-page=3"
```


Example Result:

```
{
  "@context": {
    "currentPage": "ex:currentPage",
    "data": "@graph",
    "dcat": "http://www.w3.org/ns/dcat#",
    "dct": "http://purl.org/dc/terms/",
    "ex": "http://example.org/stuff/1.0/",
    "fabio": "http://purl.org/spar/fabio/",
    "foaf": "http://xmlns.com/foaf/0.1/",
    "generif": "http://www.ncbi.nlm.nih.gov/gene?cmd=Retrieve&dopt=Graphics&list_uids=",
    "genotype": "http://genenetwork.org/genotype/",
    "gn": "http://genenetwork.org/id/",
    "gnc": "http://genenetwork.org/category/",
    "gnt": "http://genenetwork.org/term/",
    "id": "@id",
    "owl": "http://www.w3.org/2002/07/owl#",
    "pages": "ex:totalCount",
    "phenotype": "http://genenetwork.org/phenotype/",
    "prism": "http://prismstandard.org/namespaces/basic/2.0/",
    "publication": "http://genenetwork.org/publication/",
    "pubmed": "fabio:hasPubMedId",
    "rdf": "http://www.w3.org/1999/02/22-rdf-syntax-ns#",
    "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
    "result": "ex:result",
    "resultItem": "ex:resultType",
    "results": "ex:items",
    "skos": "http://www.w3.org/2004/02/skos/core#",
    "taxon": "https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=",
    "title": "dct:title",
    "type": "@type",
    "up": "http://purl.uniprot.org/core/",
    "url": "rdfs:label",
    "xkos": "http://rdf-vocabulary.ddialliance.org/xkos#",
    "xsd": "http://www.w3.org/2001/XMLSchema#"
  },
  "data": [
    {
      "currentPage": 0,
      "id": "ex:result",
      "pages": 2740,
      "results": [
        {
          "title": "A QTL on chromosome 1 modulates inter-male aggression in mice",
          "url": "http://genenetwork.org/id/unpublished14159"
        },
        {
          "title": "\tSystems genetics of metabolism: the use of the BXD murine reference panel for multiscalar integration of traits",
          "url": "http://genenetwork.org/id/unpublished14051"
        },
        {
          "title": "3a,5a-THP in BXD CIE study",
          "url": "http://genenetwork.org/id/unpublished12780"
        }
      ],
      "type": "resultItem"
    }
  ]
}
```

## GET /metadata/phenotypes/:name
Fetch metadata about a given phenotype given it's name.

```
curl "https://cd.genenetwork.org/api3/metadata/phenotypes/BXD_10007"
```

Example Result:

```
{
  "@context": {
    "LRS": "gnt:LRS",
    "abbreviation": "dct:abbreviation",
    "abstract": "dct:abstract",
    "additive": "gnt:additive",
    "altName": "rdfs:altLabel",
    "contributor": "dct:contributor",
    "creator": "dct:creator",
    "data": "@graph",
    "dct": "http://purl.org/dc/terms/",
    "description": "dct:description",
    "fabio": "http://purl.org/spar/fabio/",
    "gnc": "http://genenetwork.org/category/",
    "gnt": "http://genenetwork.org/term/",
    "id": "@id",
    "journal": "fabio:Journal",
    "labCode": "gnt:labCode",
    "locus": "gnt:locus",
    "mean": "gnt:mean",
    "month": {
      "@id": "prism:publicationDate",
      "@type": "xsd:gMonth"
    },
    "page": "fabio:page",
    "prism": "http://prismstandard.org/namespaces/basic/2.0/",
    "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
    "references": "dct:isReferencedBy",
    "sequence": "gnt:sequence",
    "skos": "http://www.w3.org/2004/02/skos/core#",
    "submitter": "gnt:submitter",
    "title": "dct:title",
    "trait": "rdfs:label",
    "traitName": "skos:altLabel",
    "type": "@type",
    "volume": "prism:volume",
    "xsd": "http://www.w3.org/2001/XMLSchema#",
    "year": {
      "@id": "fabio:hasPublicationYear",
      "@type": "xsd:gYear"
    }
  },
  "LRS": 14.3203,
  "abstract": "To discover [...]",
  "additive": 1.24101,
  "creator": [
    "Airey DC",
    "Williams RW",
    "Lu L"
  ],
  "description": "Central nervous system, morphology: Internal granule layer IGL of the cerebellum volume, adjusted for sex, age, body and brain weight [mm3]",
  "gnt:abbreviation": "AdjIGLVol",
  "http://example.org/stuff/1.0/inbredSet": "BXD Family",
  "http://example.org/stuff/1.0/species": "Mouse (Mus musculus, mm10)",
  "id": "http://genenetwork.org/id/traitBxd_10007",
  "journal": "J Neurosci",
  "locus": "rsm10000005700",
  "mean": 18.2129,
  "month": "Jul",
  "page": "5099-5109",
  "references": {
    "id": "http://rdf.ncbi.nlm.nih.gov/pubmed/11438585"
  },
  "sequence": 1,
  "submitter": "robwilliams",
  "title": "Genetic control of the mouse cerebellum: identification of quantitative trait loci modulating size and architecture",

  "trait": "10007",
  "traitName": "BXD_10007",
  "type": "gnc:Phenotype",
  "volume": "21(14)",
  "year": "2001"
}
```

## GET /metadata/phenotypes/:group/:name
Fetch metadata about a given phenotype given it's group and name.

```
curl "https://cd.genenetwork.org/api3/metadata/phenotypes/BXD/10007"
```

Example Result:

```
{
  "@context": {
    "abbreviation": "gnt:abbreviation",
    "abstract": "dct:abstract",
    "additive": "gnt:additive",
    "altName": "rdfs:altLabel",
    "chromosome": "gnt:chr",
    "contributor": "dct:contributor",
    "creator": "dct:creator",
    "data": "@graph",
    "dataset": "dcat:Distribution",
    "dcat": "http://www.w3.org/ns/dcat#",
    "dct": "http://purl.org/dc/terms/",
    "description": "dct:description",
    "fabio": "http://purl.org/spar/fabio/",
    "gnc": "http://genenetwork.org/category/",
    "gnt": "http://genenetwork.org/term/",
    "group": "gnt:belongsToGroup",
    "id": "@id",
    "identifier": "dct:identifier",
    "journal": "fabio:Journal",
    "labCode": "gnt:labCode",
    "locus": "gnt:locus",
    "lodScore": "gnt:lodScore",
    "mb": "gnt:mb",
    "mean": "gnt:mean",
    "month": {
      "@id": "prism:publicationDate",
      "@type": "xsd:gMonth"
    },
    "page": "fabio:page",
    "peakLocation": "gnt:locus",
    "prefLabel": "skos:prefLabel",
    "prism": "http://prismstandard.org/namespaces/basic/2.0/",
    "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
    "references": "dct:isReferencedBy",
    "sequence": "gnt:sequence",
    "skos": "http://www.w3.org/2004/02/skos/core#",
    "species": "gnt:belongsToSpecies",
    "submitter": "gnt:submitter",
    "title": "dct:title",
    "trait": "rdfs:label",
    "traitName": "skos:altLabel",
    "type": "@type",
    "volume": "prism:volume",
    "xsd": "http://www.w3.org/2001/XMLSchema#",
    "year": {
      "@id": "fabio:hasPublicationYear",
      "@type": "xsd:gYear"
    }
  },
  "abbreviation": "AdjIGLVol",
  "additive": 1.24101,
  "dataset": [
    {
      "id": "http://genenetwork.org/id/Gitrmetpublish",
      "identifier": "GITrMetPublish",
      "prefLabel": "GI Tract Metagenome Phenotypes",
      "type": "dcat:Dataset"
    },
    {
      "id": "http://genenetwork.org/id/Bxdpublish",
      "identifier": "BXDPublish",
      "prefLabel": "BXD Published Phenotypes",
      "type": "dcat:Dataset"
    }
  ],
  "description": "Central nervous system, morphology: Internal granule layer IGL of the cerebellum volume, adjusted for sex, age, body and brain weight [mm3]",
  "group": "BXD Family",
  "id": "http://genenetwork.org/id/traitBxd_10007",
  "locus": {
    "chromosome": "8",
    "id": "http://genenetwork.org/id/Rsm10000005700",
    "mb": 95.713,
    "trait": "rsm10000005700"
  },
  "lodScore": 3.11041,
  "mean": 18.2129,
  "references": {
    "abstract": "To discover genes influencing cerebellum development, we conducted a complex trait analysis of variation in the size of the adult mouse cerebellum. We analyzed two sets of recombinant inbred BXD strains and an F2 intercross of the common inbred strains, C57BL/6J and DBA/2J. We measured cerebellar size as the weight or volume of fixed or histologically processed tissue. Among BXD recombinant inbred strains, the cerebellum averages 52 mg 12.4% of the brain and ranges 18 mg in size. In F2 mice, the cerebellum averages 62 mg 12.9% of the brain and ranges approximately 20 mg in size. Five quantitative trait loci QTLs that significantly control variation in cerebellar size were mapped to chromosomes 1 Cbs1a, 8 Cbs8a, 14 Cbs14a, and 19 Cbs19a, Cbs19b. In combination, these QTLs can shift cerebellar size an appreciable 35% of the observed range. To assess regional genetic control of the cerebellum, we also measured the volume of the cell-rich, internal granule layer IGL in a set of BXD strains. The IGL ranges from 34 to 43% of total cerebellar volume. The QTL Cbs8a is significantly linked to variation in IGL volume and is suggestively linked to variation in the number of cerebellar folia. The QTLs we have discovered are among the first loci shown to modulate the size and architecture of the adult mouse cerebellum.5",
    "creator": [
      "Airey DC",
      "Williams RW",
      "Lu L"
    ],
    "id": "http://rdf.ncbi.nlm.nih.gov/pubmed/11438585",
    "journal": "J Neurosci",
    "month": "Jul",
    "page": "5099-5109",
    "title": "Genetic control of the mouse cerebellum: identification of quantitative trait loci modulating size and architecture",
    "volume": "21(14)",
    "year": "2001"
  },
  "sequence": 1,
  "species": "Mouse (Mus musculus, mm10)",
  "submitter": "robwilliams",
  "trait": "10007",
  "traitName": "BXD_10007",
  "type": "gnc:Phenotype"
}
```

## GET /metadata/genotypes/:name
Fetch metadata about a given genotype given it's name.

```
curl "https://cd.genenetwork.org/api3/metadata/genotypes/D1Mit3"
```

Example Result:

```
{
  "@context": {
    "alternateSource": "gnt:hasAltSourceName",
    "chr": "gnt:chr",
    "chrNum": {
      "@id": "gnt:chrNum",
      "@type": "xsd:int"
    },
    "comments": "rdfs:comments",
    "data": "@graph",
    "gnc": "http://genenetwork.org/category/",
    "gnt": "http://genenetwork.org/term/",
    "id": "@id",
    "mb": "gnt:mb",
    "mb2016": "gnt:mb2016",
    "mbMm8": "gnt:mbMm8",
    "name": "rdfs:label",
    "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
    "sequence": "gnt:hasSequence",
    "source": "gnt:hasSource",
    "species": "xkos:classifiedUnder",
    "type": "@type",
    "xkos": "http://rdf-vocabulary.ddialliance.org/xkos#",
    "xsd": "http://www.w3.org/2001/XMLSchema#"
  },
  "chr": "1",
  "chrNum": "1",
  "id": "http://genenetwork.org/id/D1mit3",
  "mb": 19.812,
  "mb2016": 19.8021,
  "mbMm8": 19.7972,
  "name": "D1Mit3",
  "sequence": "TTTAGCAATGGGTANCGGGGATCTTCCACTGTCTTTGTGTCTTAGGACCCAGAATTTACTTTTCTTTTTGTTTTCTTTTCTTTTCCCTGTCTTTTTTTTTTTTTGCTTCTTTTATTTTAAAAATCTATTCATGTTTAAAGTCTCCCTCTCTGTCTCTCTGTCTGTCTCTGTGTGTGTGTGTGTGTGTGTGTGTGTGTCCAGTACATGTGGAAACCAGAAGAGGGCATCAGATTCCTAGGAACTGGAGCTACAGAT",
  "source": "Mit",
  "species": {
    "id": "http://genenetwork.org/id/Mus_musculus",
    "name": "Mus musculus"
  },
  "type": "gnc:Genotype"
}
```

## GET /genewiki/gn/:symbol
Get genewiki entries from Genetwork about a given symbol

*Parameters:* page(default=0), per-page(default=10)

```
curl "https://cd.genenetwork.org/api3/metadata/genewikis/gn/Lpl"
```

Example Result:

```
{
  "@context": {
    "author": "dct:creator",
    "category": "gnt:belongsToCategory",
    "comment": "rdfs:comment",
    "created": {
      "@id": "dct:created",
      "@type": "xsd:datetime"
    },
    "currentPage": "ex:currentPage",
    "data": "@graph",
    "dct": "http://purl.org/dc/terms/",
    "entries": "ex:entries",
    "ex": "http://example.org/stuff/1.0/",
    "gnc": "http://genenetwork.org/category/",
    "gnt": "http://genenetwork.org/term/",
    "id": "@id",
    "pages": "ex:totalCount",
    "pubmed": "dct:references",
    "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
    "species": "ex:species",
    "type": "@type",
    "xsd": "http://www.w3.org/2001/XMLSchema#"
  },
  "currentPage": 0,
  "entries": [
    {
      "author": "Robert Williams",
      "category": "Genetic variation and alleles",
      "comment": "cis eQTL in BXD brain RNA-seq data with LRS of 33 and high D allele. No obvious trans target transcripts.",
      "created": "2012-11-10T07:30:09",
      "pubmed": "",
      "species": "Mouse (Mus musculus, mm10)"
    },
    {
      "category": "Genetic variation and alleles",
      "comment": "Individual probe analysis:probably true cisQTL",
      "created": "2007-10-05T09:09:52",
      "pubmed": "",
      "species": "Mouse (Mus musculus, mm10)"
    },
    {
      "category": "",
      "comment": "hippocampal CA1-3 expression signature",
      "created": "2005-12-16T15:23:23",
      "pubmed": "http://rdf.ncbi.nlm.nih.gov/pubmed/15084669",
      "species": "Mouse (Mus musculus, mm10)"
    },
    {
      "category": "Probes and probe sets; Transcriptional and translation control",
      "comment": "Validated strong cis-QTL in CNS using allele-specific expression ASE SNaPshot assay Daniel Ciobanu and al., 2007. Possible 3' UTR variants.",
      "created": "2007-05-08T09:46:07",
      "pubmed": "",
      "species": "Mouse (Mus musculus, mm10)"
    },
    {
      "category": "Expression patterns: mature cells, tissues; Gene structure and organization; Genetic variation and alleles",
      "comment": "cis QTL present in hippocampus LXS, ILM2970706 distal 3' UTR, 121.4 LRS, ISS increases the trait;",
      "created": "2007-05-10T05:52:22",
      "pubmed": "",
      "species": "Mouse (Mus musculus, mm10)"
    },
    {
      "category": "Health and disease associations",
      "comment": "Merck, Rosetta, Schadt, Lusis target gene associated with obesity, diabetes and atherosclerosis.",
      "created": "2008-05-13T08:48:50",
      "pubmed": "",
      "species": "Mouse (Mus musculus, mm10)"
    },
    {
      "author": "Robert Williams",
      "category": "",
      "comment": "Of interest to Lu Lu and colleagues 2015 due to modulation of expression of this gene in hippocampus following stress or ethanol BXD Illumina Hippocampus data sets.",
      "created": "2015-05-26T11:37:57",
      "pubmed": "",
      "species": "Mouse (Mus musculus, mm10)"
    }
  ],
  "id": "http://genenetwork.org/id/symbolLpl",
  "pages": 1,
  "type": "gnc:GNWikiEntry"
}
```

## GET /genewiki/ncbi/:symbol
Get genewiki entries from NCBI about a given symbol

*Parameters:* page(default=0), per-page(default=10)

```
curl "https://cd.genenetwork.org/api3/metadata/genewikis/ncbi/Lpl?per-page=3"
```

Example Result:

```
{
  "@context": {
    "author": "dct:creator", 
    "category": "gnt:belongsToCategory", 
    "comment": "rdfs:comment", 
    "created": {
      "@id": "dct:created", 
      "@type": "xsd:datetime"
    }, 
    "currentPage": "ex:currentPage", 
    "data": "@graph", 
    "dct": "http://purl.org/dc/terms/", 
    "entries": "ex:entries", 
    "ex": "http://example.org/stuff/1.0/", 
    "geneId": "gnt:hasGeneId", 
    "gnc": "http://genenetwork.org/category/", 
    "gnt": "http://genenetwork.org/term/", 
    "id": "@id", 
    "pages": "ex:totalCount", 
    "pubmed": "dct:references", 
    "rdfs": "http://www.w3.org/2000/01/rdf-schema#", 
    "species": "ex:species", 
    "type": "@type", 
    "xsd": "http://www.w3.org/2001/XMLSchema#"
  }, 
  "currentPage": 0, 
  "entries": [
    {
      "comment": "LPL gene variant is involved in carotid atherosclerotic lesions.", 
      "created": "2010-01-20T18:00:00", 
      "geneId": {
        "id": "http://www.ncbi.nlm.nih.gov/gene?cmd=Retrieve&dopt=Graphics&list_uids=4023"
      }, 
      "pubmed": "", 
      "species": "Human (Homo sapiens, hg19)"
    }, 
    {
      "comment": "LPL 44X alleles were associated with moderately increased LDL peak particle size.", 
      "created": "2010-01-20T18:00:00", 
      "geneId": {
        "id": "http://www.ncbi.nlm.nih.gov/gene?cmd=Retrieve&dopt=Graphics&list_uids=4023"
      }, 
      "pubmed": "", 
      "species": "Human (Homo sapiens, hg19)"
    }, 
    {
      "comment": "Observational study of gene-disease association and pharmacogenomic / toxicogenomic. HuGE Navigator", 
      "created": "2009-02-11T15:30:00", 
      "geneId": {
        "id": "http://www.ncbi.nlm.nih.gov/gene?cmd=Retrieve&dopt=Graphics&list_uids=4023"
      }, 
      "pubmed": "", 
      "species": "Human (Homo sapiens, hg19)"
    }
  ], 
  "id": "http://genenetwork.org/id/symbolLPL", 
  "pages": 158, 
  "type": "gnc:GNWikiEntry"
}
```
## GET /metadata/probesets/:name

Get probeset metadat given it's name

```
curl "https://cd.genenetwork.org/api3/metadata/probesets/1436869_at"
```

Expected Result:

```
{
  "@context": {
    "alias": "skos:altLabel",
    "blatMbEnd": "gnt:hasBlatMbEnd",
    "blatMbEnd2016": "gnt:hasBlatMbEnd2016",
    "blatMbStart": "gnt:hasBlatMbStart",
    "blatMbStart2016": "gnt:hasBlatMbStart2016",
    "blatScore": "gnt:hasBlatScore",
    "blatSeq": "gnt:hasBlatSeq",
    "chebi": "gnt:hasChebiId",
    "chip": "gnt:hasChip",
    "chr": "gnt:chr",
    "data": "@graph",
    "dct": "http://purl.org/dc/terms/",
    "description": "dct:description",
    "gnt": "http://genenetwork.org/term/",
    "homologene": "gnt:hasHomologeneId",
    "id": "@id",
    "kegg": "gnt:hasKeggId",
    "mb": "gnt:mb",
    "mb2016": "gnt:mb2016",
    "mbMm8": "gnt:mbMm8",
    "name": "rdfs:label",
    "omim": "gnt:hasOmimId",
    "pubchem": "gnt:hasPubChemId",
    "rdf": "http://www.w3.org/1999/02/22-rdf-syntax-ns#",
    "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
    "skos": "http://www.w3.org/2004/02/skos/core#",
    "specificity": "gnt:hasSpecificity",
    "symbol": "gnt:symbol",
    "targetId": "gnt:hasTargetId",
    "targetSeq": "gnt:hasTargetSeq",
    "targetsRegion": "gnt:targetsRegion",
    "type": "@type",
    "uniprot": "gnt:hasUniprotId"
  },
  "alias": "HHG1; HLP3; HPE3; SMMCI; Dsh; Hhg1",
  "blatMbEnd": 28.4573,
  "blatMbEnd2016": 28.7837,
  "blatMbStart": 28.4572,
  "blatMbStart2016": 28.7837,
  "blatScore": "72",
  "blatSeq": "CATGGGGGTCCACAAATTATATTTTAATTTAACTATTTTCCAATGTAATAGCCGTCTTCTGTACTGCCTTCTT",
  "chip": "Affy Mouse Genome 430 2.0 (GPL1261)",
  "chr": "5",
  "description": "sonic hedgehog hedgehog",
  "homologene": {
    "id": "https://bio2rdf.org/homologene:30961"
  },
  "id": "http://genenetwork.org/id/probeset1436869_at",
  "mb": 28.4572,
  "mb2016": 28.7837,
  "mbMm8": 28.7879,
  "name": "1436869_at",
  "omim": {
    "id": "https://www.omim.org/entry/600725"
  },
  "specificity": "3.6",
  "symbol": "Shh",
  "targetSeq": "catgggggtccacaaattatatttttatacacagaattgtanattanatttttgagagatcaatacctaantgaatgacatttcattttttgaaagtgtaaaatatgnaaatatattattttaatttaactattttccaatgtaatagccgtcttctgtactgccttctt",
  "type": "http://genenetwork.org/category/Probeset"
}
```
