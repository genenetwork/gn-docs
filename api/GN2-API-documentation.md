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

Example Results:

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

Example Results:

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

Example Results:

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

Example Results:

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
