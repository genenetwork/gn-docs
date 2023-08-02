# GeneNetwork REST API (version 2)

We are working on a new REST API that is more consistent.

## Prefix

* `api:` is the prefix we use for the API and expands to https://genenetwork.org/api/v2 or similar, so `api:species` expands to https://genenetwork.org/api/v2/species

* `doc:` is the prefix we use for the documentation and expands to https://genenetork.org/doc, so `doc:species.html` expands to https://genenetwork.org/doc/species.html

## Postfix extension

* The API call with .json extension returns a record *without* metadata, i.e., the data version. Example of a URI: `api:species/Mus_musculus.json` or, the short form, `api:mouse.json`. This typically represents the API call that people use (see below for some output).

* The API call with .meta.json extension returns the metadata, including a link to the docs and links to dig further into the API. Example: `api:species/Mus_musculus.meta.json`, or the short form, `api:mouse.meta.json` (see below for output).

* The API call with other extensions may return CSV, TSV etc. Depending on *documented* implementation details.

So, for species list in GN we get:

* api:species.json
* api:species.meta.json
* doc:species.html

We may forward api:species/ (no extension) to doc:species.html.

So, for mouse with its alias we'll get:

* api:species/Mus_musculus.json
* api:mouse.json
* api:species/Mus_musculus.meta.json
* api:mouse.meta.json
* doc:species/Mus_musculus.html
* doc:mouse.html

We may forward `api:mouse` and `api:species/Mus_musculus` (no extension) to `doc:Mus_musculus.html`

# JSON data

Standard JSON data (the .json postfix) will return a minimal structure that requires the minimum amount of work to parse. Example `api:mouse.json` can result in a dictionary of:

```js
{
  "id": "Mouse",
  "wikidata": "Q83310",
  "taxonomy-id": "10090",
  "ncbi-url": "https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=10090",
  "uniprot-url": "https://www.uniprot.org/taxonomy/10090",
  "wikidata-url": "http://www.wikidata.org/entity/Q83310",
  "taxonomy-name": "Mus musculus",
  "description": "species of mammal",
  "organism": "http://purl.uniprot.org/taxonomy/10090",
  "family": "Vertebrates",
  "binomialName": "Mus musculus",
  "22-rdf-syntax-ns#isDefinedBy": "http://www.wikidata.org/entity/Q83310",
  "rdf-schema#label": "Mouse (Mus musculus, mm10)",
  "name": "Mouse"
}
```

# Metadata

Metadata contains further information on a JSON record, but typically not the data that is already served by above JSON record. Example for `api:mouse.meta.json`

```
{
  "api": "api:mouse.json",
  "doc": "doc:mouse.html",
  "links":
    Expand on metadata links that can be followed:
    "strains": {
      "BXD12": "api:BXD12.meta.json",
      "BXD13": "api:BXD13.meta.json",
    }
  }
}
```
