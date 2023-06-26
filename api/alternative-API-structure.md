# Notes on the API

## Target audience
1. People like me who want to perform more complicated queries (potentially across different populations) and interact using automated workflows.

2. Developers who want to access GeneNetwork data to create their own custom services.

3. Potentially the GeneNetwork interface itself (I do not know the extent to which this already happens).

## Conceptual organisation

### Current hierarchy
?

### Groups
- Why are groups currently nested at the highest level? Surely these are specific to a species and the logical next *lower* level? Also, is this layer *only* used for mice? Or does every species need to contain at least one genetic group to properly include genotypes in the hierarchy?

- `http://genenetwork.org/api/v_pre1/groups/mouse` seems to me to be the wrong way around. Why not `http://genenetwork.org/api/v_pre1/mouse/groups`?

- Is 'population' a better word for 'group'? Is this the same as RISet (in which case the term RISet should be expunged)?

### Genotypes
- There may be several alternative genotypes for a species (e.g. mm9, mm10 or GRCm39 for mouse).
- These may also be served in different formats.
The content and the format are conceptually different, so they should be handled as such.
	- `http://genenetwork.org/api/v_pre1/genotypes/bimbam/BXD` Is wrong. 
	- `http://genenetwork.org/api/v_pre1/genotypes/BXD.bimbam` Is better.
	- `http://genenetwork.org/api/v_pre1/mouse/BXD/genotypes/mm10.bimbam` [**! not a real URL**] Is ideal.
- The genotypes are conceptually at the same level as datasets, and could be seen as a special type of dataset.
  
### Datasets
- Again, why are these not nested under 'population'?

### Data versions (?)
Perhaps another hierarchy level below dataset is needed to accommodate versions/releases.
- For microarray experiments, this would be the processing variant (e.g. PDNN/RMA).
- For genotypes, this would be the genome build.
Each version would be associated with different raw sample data.

Currently, all versions have unique IDs so they can be (and are) accessed as distinct datasets.
There may be no advantage to making this level of the hierarchy explicit.

### Sample data
- Surely should be nested under dataset?
Does this need to be called 'sample_data" rather than just 'data'?

- Data seem to be served as matrices. Would it not be conceptually cleaner to embed these in the JSON response (as a list structure)?
This ma (?) make it easier to handle cases where different subsets of strains are present in different datasets.

- Keep in mind that 'data' is actually processed results and not raw data.
There seems to be some interest in actually storing or access raw data (CEL/fasta/video) files. 
This would necessitate an even deeper level (e.g. 'data/raw') that should also be accessed through this conceptual hierarchy.

### Fetching
- Does it make sense to retrieve each result in a nested JSON document that includes the enclosing higher levels?
The user should be able to retrieve some sample-level data in one deep query and have access to the species/population/dataset that it belongs to.

### Proposed hierarchy
- species
	- species_info
	- population
		- population_info
		- genotypes
		- dataset
			- dataset_info
   			- versions (?)
				- trait
					- trait_info
					- trait_data
					- trait_qtl
				- whole-dataset_data_matrix
				- whole-dataset_qtl_matrix

## URL construction
It should be unnecessary to include the class terms 'species', 'populations', 'datasets' etc. in the URL.
These levels should be implicit in the nesting structure.

If used, these can refer to a listing of all available options.

Use of unqualified instance names (e.g. 'mouse', 'bxd', 'HC_M2_0606_P') should return info for the instance. See below for examples.

Suggested URLs for each query are given below.

<hr>

## Fetch tests
### Fetch species listing
Species are the highest level of grouping.
```{r echo = FALSE}
if(RCurl::url.exists("http://genenetwork.org/api/v_pre1/species")){
	species = RCurl::getURL(
	"http://genenetwork.org/api/v_pre1/species", verbose = TRUE)
	species = rjson::fromJSON(species)
}
do.call("rbind", species)
```

Proposed URL: "http://genenetwork.org/api/v_pre1/species"

### Fetch info for a species
Proposed URL: "http://genenetwork.org/api/v_pre1/mouse"

Get the metadata for a single species (here mouse).
```{r echo = FALSE}
if(RCurl::url.exists("http://genenetwork.org/api/v_pre1/species/mouse")){
	species_info = RCurl::getURL(
	"http://genenetwork.org/api/v_pre1/species/mouse", verbose = TRUE)
	species_info = rjson::fromJSON(species_info)
}
do.call("rbind", species_info)
```

### Fetch the population listing for a species 
Proposed URL: "http://genenetwork.org/api/v_pre1/mouse/populations"

The next level of grouping within each species is the population.
- Each population is composed of individuals or inbred strains of genetically compatible genotype.
- Strains or individuals may be present in multiple populations.
- Every species contains at *least one population*.
- Each population is associated with genotypes. There may be no genotypes available, or there may be multiple (e.g. for different genome builds).
```{r echo = FALSE}
if(RCurl::url.exists("http://genenetwork.org/api/v_pre1/groups/mouse")){
	population = RCurl::getURL(
	"http://genenetwork.org/api/v_pre1/groups/mouse", verbose = TRUE)
	population = rjson::fromJSON(population)
}
do.call("rbind", population)[1:20, ]
```
**! It is not clear whether this level of grouping currently exists for all species.**


### Fetch info for a population 
Proposed URL: "http://genenetwork.org/api/v_pre1/mouse/bxd"

**! Is this currently possible?**

### Fetch genotype listing 
Proposed URL: "http://genenetwork.org/api/v_pre1/mouse/bxd/genotypes"

**! Is this currently possible?**

### Fetch genotypes for a population 
Proposed URL: "http://genenetwork.org/api/v_pre1/mouse/bxd/mm10.geno"

Is it necessary for an API to provide data in every format possible?
I would have considered it the job of the consuming application to reformat the standardised JSOM output into the proprietary format it requires.

This issue is reflected in the ugly hard-coded query below, which **will not work** for other genotype files.
```{r echo = FALSE}
if(RCurl::url.exists("http://genenetwork.org/api/v_pre1/genotypes/BXD.geno")){
	genotypes = read.delim(
	"http://genenetwork.org/api/v_pre1/genotypes/BXD.geno", sep = "\t", skip = 23)
}
genotypes[1:20, 1:10]
```
*Note: The special query/response formats for R/qtl2 should be documented in a separate heading.
These are specific to a particular application and break the conceptual flow of the documentation.*

### Fetch the dataset listing for a population
Proposed URL: "http://genenetwork.org/api/v_pre1/mouse/bxd/datasets"

**! This documented query fails**
```{r echo = FALSE}
if(RCurl::url.exists("http://genenetwork.org/api/v_pre1/datasets/bxd")){
	# Returns 404
	#datasets = RCurl::getURL(
	#"http://genenetwork.org/api/v_pre1/datasets/mouse/bxd", verbose = TRUE)
}
```

### Fetch info for a dataset
Proposed URL: "http://genenetwork.org/api/v_pre1/mouse/bxd/HC_M2_0606_P"

This information should either be wrapped in a nested response (see [comment on fetching above](Fetching)) or the GeneNetwork 'taxonomy' (species->population->dataset) should be included.

```{r echo = FALSE}
if(RCurl::url.exists("http://genenetwork.org/api/v_pre1/dataset/bxd/HC_M2_0606_P")){
	dataset_info = RCurl::getURL(
	"http://genenetwork.org/api/v_pre1/dataset/bxd/HC_M2_0606_P", verbose = TRUE)
	dataset_info = rjson::fromJSON(dataset_info)
}
do.call("rbind", dataset_info)
```
*Note: Addressing datasets in the absence of 'taxonomy' information sounds like a recipe for disaster. There is a clear namespace structure inherent in the GeneNetwork ecosystem so that should be used to avoid naming clashes.*

### Fetch the trait listing for a dataset
This should return a list of all trait names/ids/annotations

```{r echo = FALSE}
```
Proposed URL: "http://genenetwork.org/api/v_pre1/mouse/bxd/HC_M2_0606_P/traits"

**Is this currently possible?**


### Fetch info for the phenotypes dataset
Proposed URL: "http://genenetwork.org/api/v_pre1/mouse/bxd/phenotypes"

So-called 'phenotypes' should be accessed like any other dataset.

Conceptually, that means that dataset metadata should exist that describe the phentoypes as a whiole.
It is unclear what useful information this could contain though.

**! Is this currently possible?**
*The following code returns info for a single trait. This command should usefully return one such row of results for every trait in the phenotype database. This would enable local searching and selection of traits of interest.* 

```{r echo = FALSE}
```

### Fetch the trait listing for the phenotypes dataset
Proposed URL: "http://genenetwork.org/api/v_pre1/mouse/bxd/phenotypes/traits"

Because of the slightly different information attached to phenotypes, the info returned by this command would most usefully be metadata on all the individual traits and the studies they are associated with.

**! Is this currently possible?**
*The following code returns info for a single trait. This command should usefully return one such row of results for every trait in the phenotype database. This would enable local searching and selection of traits of interest.* 

```{r echo = FALSE}
if(RCurl::url.exists("http://genenetwork.org/api/v_pre1/dataset/bxd/10001")){
	trait_info = RCurl::getURL(
	"http://genenetwork.org/api/v_pre1/dataset/bxd/10001", verbose = TRUE)
	trait_info = rjson::fromJSON(trait_info)
}
do.call("cbind", trait_info)
```

### Fetch data for a single trait
Proposed URL: "http://genenetwork.org/api/v_pre1/mouse/bxd/HC_M2_0606_P/1436869_at/data"

```{r echo = FALSE}
if(RCurl::url.exists("http://genenetwork.org/api/v_pre1/sample_data/HC_M2_0606_P/1436869_at")){
	trait_data = RCurl::getURL(
	"http://genenetwork.org/api/v_pre1/sample_data/HC_M2_0606_P/1436869_at", verbose = TRUE)
	trait_data = rjson::fromJSON(trait_data)
}
do.call("rbind", lapply(trait_data[1:10], function(row){
	if(is.null(row$se)) row$se = NA
	as.data.frame(row)[, c("data_id", "sample_name", "sample_name_2", "se", "value")]
}))
```
*Note: the standard error is not returned for some of these results---presumably because n = 1 (although n is not returned). I guess the script receiving the response should make an effort to handle this properly.*

Likewise for a phenotype trait.

Proposed URL: "http://genenetwork.org/api/v_pre1/mouse/bxd/phenotypes/1436869_at/data"

**! Is this currently possible?**
```{r echo = FALSE}
```

### Fetch pre-computed mapping results for a trait
Proposed URL: "http://genenetwork.org/api/v_pre1/mouse/bxd/HC_M2_0606_P/1436869_at/qtl"

*Note: This currently returns trait info, which includes peak position and LRS of the top QTL (using a preferred mapping algorithm).*

```{r echo = FALSE}
if(RCurl::url.exists("http://genenetwork.org/api/v_pre1/trait/HC_M2_0606_P/1436869_at")){
	trait_info = RCurl::getURL(
	"http://genenetwork.org/api/v_pre1/trait/HC_M2_0606_P/1436869_at", verbose = TRUE)
	trait_info = rjson::fromJSON(trait_info)
}
do.call("rbind", trait_info)
```

Likewise for phenotypes.
Proposed URL: "http://genenetwork.org/api/v_pre1/mouse/bxd/phenotypes/10001/qtl"

```{r echo = FALSE}
if(RCurl::url.exists("http://genenetwork.org/api/v_pre1/trait/BXD/10001")){
	trait_info = RCurl::getURL(
	"http://genenetwork.org/api/v_pre1/trait/BXD/10001", verbose = TRUE)
	trait_info = rjson::fromJSON(trait_info)
}
do.call("rbind", trait_info)
```

### Fetch whole datasets
Proposed URL: "http://genenetwork.org/api/v_pre1/mouse/bxd/HC_M2_0606_P/data"

These queries should return data matrices in tab-delimited text format.
Use the 'data' keyword at the dataset level.

**! This documented example returns an error.**

```{r echo = FALSE}
if(RCurl::url.exists("https://genenetwork.org/api/v_pre1/datasets/mouse/bxd")){
	#data = read.delim(
	#"https://genenetwork.org/api/v_pre1/datasets/mouse/bxd", sep = "\t", skip = 23)
}
#data[1:20, 1:10]
```

Likewise for phenotypes.
Proposed URL: "http://genenetwork.org/api/v_pre1/mouse/bxd/phenotypes/data"

```{r echo = FALSE}
if(RCurl::url.exists("https://genenetwork.org/api/v_pre1/sample_data/BXDPublish.csv")){
	data = read.csv(
	"https://genenetwork.org/api/v_pre1/sample_data/BXDPublish.csv")
}
data[1:20, 1:10]
```


### Fetch whole-dataset mapping results
Proposed URL: "http://genenetwork.org/api/v_pre1/mouse/bxd/HC_M2_0606_P/qtls"

Using the 'qtls' keyword at the dataset level should return pre-computed QTL mapping results for all traits in the dataset as a data matrix in tab-delimited text format.

It may not make sense to bother with different download formats. Tab-delimited text ('.tsv') enables the necessary data to be returned and is the most portable solution.

If metadata are required, then a query format such as "http://genenetwork.org/api/v_pre1/mouse/bxd/HC_M2_0606_P/qtls/info" could return a JSON response.

**! Is this currently possible?**

```{r echo = FALSE}
if(RCurl::url.exists("https://genenetwork.org/api/v_pre1/datasets/mouse/bxd")){
	#data = read.delim(
	#"https://genenetwork.org/api/v_pre1/datasets/mouse/bxd", sep = "\t", skip = 23)
}
#data[1:20, 1:10]
```

Likewise for phenotypes.
Proposed URL: "http://genenetwork.org/api/v_pre1/mouse/bxd/phenotypes/qtls"

**! Is this currently possible?**

```{r echo = FALSE}
if(RCurl::url.exists("https://genenetwork.org/api/v_pre1/sample_data/BXDPublish.csv")){
	data = read.csv(
	"https://genenetwork.org/api/v_pre1/sample_data/BXDPublish.csv")
}
data[1:20, 1:10]
```


_______________________________


### Fetch subsets of data
...

_______________________________


<hr>


## Analyses
### Perform searches
...

### Mapping
...

### Calculate correlations
...

<hr>

## Problems
### Error catching
I question whether a scripting API should return a 404 in HTML on a failed query.
An error response wrapped in valid JSON would seem to be much more useful.

<hr>

## Wishlist
The following ideas are for tools that would make interacting with GeneNetwork as a geneticist much easier and more powerful.

### Available strains
Perhaps as part of the population_info (see [proposed hierarchy](Proposed hierarchy)), a list of all strains/individuals that are available should be accessible.

### Strain name conversion tool
When retrieving data from other sources, from archival data (ehere strains have been renamed) or when working with strings that have been mutated (looking at you, R), a mapping to the GeneNetwork strain designations would avoid loss of data.
As examples:
- "C57BL/6J" in GeneNetwork can be variously encoded as "C57BL/6", "B6", "C57BL.6J".
- "BXD96" in older publications is now present in GeneNetwork as "BXD48a". Data from this strain will be dropped if a re-analysis is attempted.

### Upload API
The ability to upload temporary datasets programmatically and analyse them directly using the API would be a hugely useful workflow. 



