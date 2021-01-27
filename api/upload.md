# GeneNetwork upload API

## API

The REST API will accept gzipped tar ball which contains multiple
files:

1. A metadata file (JSON)
2. A phenotype file

On upload to the API the data gets unpacked into files in a temporary
directory. Next we compute an MD5SUM over the directory and it gets
renamed to the hash value. So, after unpacking, first we have

```
GENENETWORK_UPLOAD_DIR/tempdir/metadata.json
                              /phenotypes.tsv
```

The upload directory is set in the GN2
[config](https://github.com/genenetwork/genenetwork2/blob/testing/etc/default_settings.py). After
computing the HASH we rename it to

```
GENENETWORK_UPLOAD_DIR/e524ee7ea9b1f452c58abe560960a60f/metadata.json
                                                       /phenotypes.tsv
```

On success the upload REST API returns this HASH to the invoker:

```
{
  "status": 0,
  "token": "e524ee7ea9b1f452c58abe560960a60f"
}
```

On error the result should include the error output

```
{
  "status": 128
  "error": "gzip failed to unpack file"
}
```

### Metadata

The metadata file is a simple JSON file containing

```js
{
  "title": "This is my dataset for testing the REST API",
  "description": "Longer description"
  "date": "20210127",
  "authors": [
    "R.W. Williams"
  ],
  "cross": "BXD"
}
```

### Phenotype file

The phenotype file is a tab delimited 'spreadsheet' where the columns
contain phenotypes and the rows contain individuals. Example

```
      pheno
BXD01 5.060
BXD02 307.866
BXD03 185.400
BXD04 380.729
BXD05 150.066
BXD06 94.483
BXD07 438.700
BXD08 NA
BXD09 130.457
BXD10 184.900
BXD11 223.400
BXD12 167.250
BXD13 313.950
BXD14 219.383
BXD15 277.800
BXD16 6.467
BXD17 364.967
BXD18 132.016
BXD19 468.133
BXD20 309.500
```

Missing data are 'NA'. Multiple pheno columns are possible.
