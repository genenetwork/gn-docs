# API Endpoints

The following end-points are available to all users.  The result of every query is json-ld.

## GET /metadata/species

Returns a list of species.

```
curl localhost:8080/api/metadata/species
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
curl "localhost:8080/api/metadata/species/bat"
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
curl "localhost:8080/api/metadata/groups"
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
curl "localhost:8080/api/metadata/groups/bat"
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
curl "localhost:8080/api/metadata/datasets/IBR_M_0204_M"
```

or

```
curl "localhost:8080/api/metadata/datasets/GN11"
```

Example Result:

```
{
  "@context": {
    "accessRights": "dct:accessRights",
    "accessionId": "dct:identifier",
    "acknowledgement": "gnt:hasAcknowledgement",
    "altLabel": "skos:altLabel",
    "caseInfo": "gnt:hasCaseInfo",
    "classifiedUnder": "xkos:classifiedUnder",
    "contactPoint": "dcat:contactPoint",
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
    "inbredSet": "ex:belongsToInbredSet",
    "info": "ex:info",
    "label": "rdfs:label",
    "normalization": "gnt:usesNormalization",
    "notes": "gnt:hasNotes",
    "organization": "foaf:Organization",
    "platform": "ex:platform",
    "prefLabel": "skos:prefLabel",
    "processingInfo": "gnt:hasDataProcessingInfo",
    "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
    "skos": "http://www.w3.org/2004/02/skos/core#",
    "tissue": "ex:tissue",
    "title": "dct:title",
    "type": "@type",
    "xkos": "http://rdf-vocabulary.ddialliance.org/xkos#"
  },
  "accessionId": "GN11",
  "contactPoint": "Michael Miles",
  "id": "http://genenetwork.org/id/Ibr_m_0204_m",
  "inbredSet": "BXD Family",
  "label": "IBR_M_0204_M",
  "normalization": "MAS5",
  "platform": {
    "id": "http://genenetwork.org/id/platformMoe430",
    "info": "[...]",
    "label": "Affy Mouse Genome 430A, 430B, 430A 2.0 (GPL339,GPL340)",
    "prefLabel": "MOE430",
    "type": "http://genenetwork.org/category/geneChip"
  },
  "tissue": {
    "id": "http://genenetwork.org/id/tissueBrn",
    "info": "[...]",
    "label": "Brain mRNA",
    "type": "http://genenetwork.org/category/tissue"
  },
  "type": "dcat:Dataset"
}
```

## GET /metadata/datasets/:group/list

List datasets that belong to a given group.

*Parameters:* page(default=0), per-page(default=10)

```
curl "localhost:8080/api/metadata/datasets/BXD/list"
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
curl "localhost:8080/api/metadata/datasets/search/BXD?page=2&limit=3"
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
curl "localhost:8080/api/metadata/datasets/search/BXD?page=2&limit=3"
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

## GET /metadata/publication/:name

Get a publication given it's name.  Name can be a pubmedId or a GN-specific identifier for unpublished work.

```
curl localhost:8080/api/metadata/publications/2760876
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
curl "localhost:8080/api/metadata/publications/search/BXD?page=0&limit=3"
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
curl "localhost:8080/api/metadata/phenotypes/BXD_10007"
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
curl "localhost:8080/api/metadata/phenotypes/BXD/10007"
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

## GET /metadata/genotypes/:name
Fetch metadata about a given genotype given it's name.

```
curl "localhost:8080/api/metadata/genotypes/D1Mit3"
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
curl "localhost:8080/api/metadata/genewikis/gn/Lpl"
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
curl "localhost:8080/api/metadata/genewikis/ncbi/Lpl?per-page=3"
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
curl "localhost:8080/api/metadata/probesets/1436869_at"
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
