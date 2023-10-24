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

## GET /metadata/species/<name>

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

## GET /metadata/groups/mouse

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
