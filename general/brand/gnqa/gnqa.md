# GNQA the Genenetwork.org Question Answer System

## Purpose

Genenetwork.org (GN) is a site housing tens of terabytes of experimental genetic and genomic information on many species, most notably mouse and human. In its constantly evolving state the masterminds behind this systems genetics service look to make it easier to use for non-experts or citizen scientists. To this end GNQA, a retrieval augmented generation service, is under development to support knowledge communication and research understanding.

### Accessing GNQA
In order to use GNQA you must be a registered user of genenetwork.org. If you have not yet registered, do so [here](https://genenetwork.org/oauth2/user/register).
The GN registration page with have you verify the email address you used for registration. Once your email has been confirmed you can log in to genenetwork.org.
There are two ways to query GNQA: the 1st is by using the genenetwork.org global search, the 2nd is by visiting [GNQA directly](https://genenetwork.org/gnqna).
When using the global search, GNQA results are presented in a small panel above the table of records.
![GNQA integrated int GN](https://raw.githubusercontent.com/genenetwork/gn-docs/master/general/brand/gnqa/imgs/integration.svg)


## Knowledge Communication & Research Understanding

GNQA is a tool utilizing a large language model and a separately maintained scientific knowledge base with specially and specifically curated data. The curated data is currently focused on three main areas: GN research, genomics of aging, and the genomics of diabetes. We chose each area based on our research interests. GNQA as it currently exists, as of 16 January 2025, is comprised of 3000 research tomes in our listed areas of interest. The GN global search bar returns a table of often several thousand results and links to datasets related to ones query, whereas GNQA queries its knowledge base of research documents and books to return an answer to the query along with a list of references, real... not hallucinated. Some references are presented with links to the research documents on [PubMed](https://www.ncbi.nlm.nih.gov/pubmed "The destination for science research").

### System Workflow
![GNQA workflow](https://raw.githubusercontent.com/genenetwork/gn-docs/master/general/brand/gnqa/imgs/workflow.svg)


<!-- ![GNQA reference list](https://raw.githubusercontent.com/genenetwork/gn-docs/master/general/brand/gnqa/imgs/refs.png)

![GNQA References on PubMed](https://raw.githubusercontent.com/genenetwork/gn-docs/master/general/brand/gnqa/imgs/pubmed-ref.svg)
-->
