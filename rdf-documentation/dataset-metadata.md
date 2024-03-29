# Info files / Investigators Metadata
## 'info-files'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT InfoFiles.InfoPageName, IF(GenoFreeze.Id IS NOT NULL, 'gnc:Genotype', IF(PublishFreeze.Id IS NOT NULL, 'gnc:Phenotype', IF(ProbeSetFreeze.Name IS NOT NULL, 'gnc:Probeset', ''))) AS DatasetType, InfoFiles.InfoPageName, IFNULL(GenoFreeze.FullName, IFNULL(PublishFreeze.FullName, '')) AS DatasetFullName, Datasets.DatasetName AS DatasetGroup, Datasets.PublicationTitle, InfoFiles.InfoFileTitle, IFNULL(GenoFreeze.CreateTime, IFNULL(PublishFreeze.CreateTime, IFNULL(ProbeSetFreeze.CreateTime, ''))) AS createTimeGenoFreeze, Investigators.FirstName, Investigators.LastName, Investigators.Email, Organizations.OrganizationName, InfoFiles.GN_AccesionId, DatasetStatus.DatasetStatusName, IFNULL(InbredSet.Name, IFNULL(PublishInbredSet.Name, GenoInbredSet.Name)) AS InbredSetName, Tissue.Short_Name, AvgMethod.Name AS AvgMethodName, AvgMethod.Name AS AvgMethodName, GeneChip.Name AS GeneChip, Datasets.Summary, IFNULL(Datasets.GeoSeries, '') AS GeoSeries, Datasets.AboutTissue, InfoFiles.Specifics, Datasets.AboutCases, Datasets.AboutPlatform, Datasets.AboutDataProcessing, Datasets.Notes, Datasets.ExperimentDesign, Datasets.Contributors, Datasets.Citation, Datasets.Acknowledgment FROM InfoFiles LEFT JOIN PublishFreeze ON InfoFiles.InfoPageName = PublishFreeze.Name LEFT JOIN GenoFreeze ON InfoFiles.InfoPageName = GenoFreeze.Name LEFT JOIN ProbeSetFreeze ON InfoFiles.InfoPageName = ProbeSetFreeze.Name LEFT JOIN InbredSet ON InfoFiles.InbredSetId = InbredSet.InbredSetId LEFT JOIN Species ON InfoFiles.SpeciesId = Species.SpeciesId LEFT JOIN Datasets USING (DatasetId) LEFT JOIN DatasetStatus USING (DatasetStatusId) LEFT JOIN Tissue USING (TissueId) LEFT JOIN Investigators USING (InvestigatorId) LEFT JOIN AvgMethod USING (AvgMethodId) LEFT JOIN Organizations USING (OrganizationId) LEFT JOIN GeneChip USING (GeneChipId) LEFT JOIN InbredSet PublishInbredSet ON PublishFreeze.InbredSetId = PublishInbredSet.InbredSetId LEFT JOIN InbredSet GenoInbredSet ON GenoFreeze.InbredSetId = GenoInbredSet.InbredSetId  WHERE GN_AccesionId IS NOT NULL
```

The above query results to triples that have the form:

```text
gn:Infofiles_infopagename_ -> rdf:type -> dcat:Dataset 
gn:Infofiles_infopagename_ -> xkos:classifiedUnder -> DatasetType 
gn:Infofiles_infopagename_ -> rdfs:label -> InfoFiles(InfoPageName) 
gn:Infofiles_infopagename_ -> skos:prefLabel -> DatasetFullName 
gn:Infofiles_infopagename_ -> skos:altLabel -> Datasets(DatasetGroup) 
gn:Infofiles_infopagename_ -> dct:title -> Datasets(PublicationTitle) 
gn:Infofiles_infopagename_ -> dct:created -> createTimeGenoFreeze 
gn:Infofiles_infopagename_ -> dcat:contactPoint -> gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email 
gn:Infofiles_infopagename_ -> foaf:Organization -> Organizations(OrganizationName) 
gn:Infofiles_infopagename_ -> dct:identifier -> GNInfoFiles(GN_AccesionId) 
gn:Infofiles_infopagename_ -> dct:accessRights -> datasetstatus(datasetstatusname) 
gn:Infofiles_infopagename_ -> gnt:belongsToGroup -> gn:setInbredsetname 
gn:Infofiles_infopagename_ -> gnt:hasTissue -> gn:tissueTissue_short_name 
gn:Infofiles_infopagename_ -> gnt:usesNormalization -> gn:avgMethodAvgmethod_avgmethodname 
gn:Infofiles_infopagename_ -> gnt:usesPlatform -> gn:platformGenechip_genechip 
gn:Infofiles_infopagename_ -> dct:description -> DatasetsSummary 
gn:Infofiles_infopagename_ -> gnt:hasGeoSeriesId ->  
gn:Infofiles_infopagename_ -> gnt:hasTissueInfo -> DatasetsAboutTissue 
gn:Infofiles_infopagename_ -> gnt:hasContentInfo -> InfoFilesSpecifics 
gn:Infofiles_infopagename_ -> gnt:hasCaseInfo -> DatasetsAboutCases 
gn:Infofiles_infopagename_ -> gnt:hasPlatformInfo -> DatasetsAboutPlatform 
gn:Infofiles_infopagename_ -> gnt:hasDataProcessingInfo -> DatasetsAboutDataProcessing 
gn:Infofiles_infopagename_ -> gnt:hasNotes -> DatasetsNotes 
gn:Infofiles_infopagename_ -> gnt:hasExperimentDesignInfo -> DatasetsExperimentDesign 
gn:Infofiles_infopagename_ -> dct:creator -> DatasetsContributors 
gn:Infofiles_infopagename_ -> dct:isReferencedBy -> DatasetsCitation 
gn:Infofiles_infopagename_ -> gnt:hasAcknowledgement -> DatasetsAcknowledgment 
```
Here's an example query:

```sparql
PREFIX v: <http://www.w3.org/2006/vcard/ns#> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX dcat: <http://www.w3.org/ns/dcat#> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX xkos: <http://rdf-vocabulary.ddialliance.org/xkos#> 
PREFIX geoSeries: <http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 
PREFIX dct: <http://purl.org/dc/terms/> 

SELECT * WHERE { 
    ?s rdf:type dcat:Dataset .
    ?s xkos:classifiedUnder gnc:Probeset .
    ?s rdfs:label "Br_U_0803_M" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:Br_u_0803_m rdf:type dcat:Dataset .
gn:Br_u_0803_m xkos:classifiedUnder gnc:Probeset .
gn:Br_u_0803_m rdfs:label "Br_U_0803_M" .
gn:Br_u_0803_m skos:altLabel "UTHSC Brain mRNA U74Av2 (Aug-Sep03)" .
gn:Br_u_0803_m dct:created "2003-08-01" .
gn:Br_u_0803_m dcat:contactPoint gn:investigatorRobert_williams_rwilliams_uthsc.edu .
gn:Br_u_0803_m foaf:Organization "University of Tennessee Health Science Center" .
gn:Br_u_0803_m dct:identifier "GN1" .
gn:Br_u_0803_m dct:accessRights "public" .
gn:Br_u_0803_m gnt:belongsToGroup gn:setBxd .
gn:Br_u_0803_m gnt:hasTissue gn:tissueBrn .
gn:Br_u_0803_m gnt:usesNormalization gn:avgMethodMas5 .
gn:Br_u_0803_m gnt:usesPlatform gn:platformMg_u74av2 .
gn:Br_u_0803_m dct:description "<p>This August 2003 freeze provides estimates of mRNA expression in brains of BXD recombinant inbred mice measured using Affymetrix U74Av2 microarrays. This is data set includes six arrays which are of marginal quality. New users are encouraged to use one of the more recent data sets December 2003 or March 2004 from which these six arrays have been excluded. Data were generated at the University of Tennessee Health Science Center UTHSC. Over 300 brain samples from 35 strains were hybridized in small pools n=3 to 106 arrays. Data were processed using the Microarray Suite 5 <a class='fs14' href='www.affymetrix.com/support/technical/whitepapers/sadd_whitepaper.pdf'>MAS 5</a> protocol of Affymetrix. To simplify comparison between transforms, MAS 5 values of each array were adjusted to an average of 8 units and a variance of 2 units. In general, the MAS 5 transform does not perform as well as RMA, PDNN, or the new heritability weighted transforms HW1PM.</p>" .
gn:Br_u_0803_m gnt:hasTissueInfo "<p>Each array was hybridized with labeled cRNA generated from a pool of three brains from adult animals usually of the same age and always of the same sex. The brain region included most of the forebrain and midbrain, bilaterally. However, the sample excluded the olfactory bulbs, retinas, or the posterior pituitary all formally part of the forebrain. A total of 100 such pooled samples were arrayed: 74 from females and 26 from males. Animals ranged in age from 56 to 441 days, usually with a balanced design: one pool at approximately 8 weeks, one pool at approximately 20 weeks, and one pool at approximately 1 year. Strain averages of mRNA expression level are therefore typically based on three pooled biological replicate arrays. This data set does not incorporate statistical adjustment for possible effects of age and sex. Users can select the strain symbol in the table above to review details about the specific cases and array processing center DP = Divyen Patel at Genome Explorations, Inc; TS = Thomas Sutter at University of Memphis. You can also click on the individual symbols males or females to view the array image.</p>" .
gn:Br_u_0803_m gnt:hasCaseInfo "<p>This data set includes estimate of gene expression for 35 genetically uniform lines of mice: C57BL/6J B6, or simply B, DBA/2J D2 or D, their B6D2 F1 intercross, and 32 BXD recombinant inbred RI strains derived by crossing female B6 mice with male D2 mice and then inbreeding progeny for over 21 generations. This set of RI strains is a remarkable resource because many of these strains have been extensively phenotyped for hundreds of interesting traits over a 25-year period. A significant advantage of this RI set is that the two parental strains B6 and D2 have both been extensively sequenced and are known to differ at approximately 1.8 million SNPs. Coding variants mostly single nucleotide polymorphisms and insertion-deletions that may produce interesting phenotypes can be rapidly identified in this particular RI set.</p>\r\n\r\n<p>BXD1 through BXD32 were produced by Benjamin A. Taylor starting in the late 1970s. BXD33 through BXD42 were also produced by Taylor, but from a second set of crosses initiated in the early 1990s. These strains are all available from the Jackson Laboratory, Bar Harbor, Maine. BXD43 through BXD99 were produced by Lu Lu, Jeremy Peirce, Lee M. Silver, and Robert W. Williams in the late 1990s and early 2000s using advanced intercross progeny Peirce et al. <a class='fs14' href='http://www.biomedcentral.com/1471-2156/5/7'>2004</a>. Only two of these incipient strains are included in the current database BXD67 and BXD68.</p>\r\n\r\n<p>In this mRNA expression database we generally used progeny of stock obtained from The Jackson Laboratory between 1999 and 2001. Animals were generated in-house at the University of Alabama by John Mountz and Hui-Chen Hsu and at the University of Tennessee Health Science Center by Lu Lu and Robert Williams.</p>\r\n\r\n<p>The table below lists the arrays by strain, sex, and age. Each array was hybridized to a pool of mRNA from three mice. Note that this table includes six arrays dropped from the December 2003 data sets BXD6, n=2; BXD12, BXD16, BXD40, and BXD67, n=1 each.</p>\r\n\r\n<table align='Center' border='1' cellpadding='0' cellspacing='0' style='width:85%'>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<table border='1' cellpadding='5' cellspacing='1' style='width:100%'>\r\n				<tbody>\r\n					<tr>\r\n						<td rowspan='2'>Strain</td>\r\n						<td colspan='3'>\r\n						<p>Age</p>\r\n						</td>\r\n						<td rowspan='2'>Strain</td>\r\n						<td colspan='3'>\r\n						<p>Age</p>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td>\r\n						<p>8 Wks</p>\r\n						</td>\r\n						<td>\r\n						<p>20 Wks</p>\r\n						</td>\r\n						<td>\r\n						<p>52 Wks</p>\r\n						</td>\r\n						<td>\r\n						<p>8 Wks</p>\r\n						</td>\r\n						<td>\r\n						<p>20 Wks</p>\r\n						</td>\r\n						<td>\r\n						<p>52 Wks</p>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td>C57BL/6J B6</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S092-1F1.png' target='_blank'>â™‚</a><a class='fs14' href='http://www.webqtl.org/array_images/S092UM-1F2.png' target='_blank'>â™‚</a><a class='fs14' href='http://www.webqtl.org/array_images/S051-1F1-U74Av2.png' target='_blank'>â™‚</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S172-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S337b-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td>DBA/2J D2</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S169-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S286-1F1-U74Av2.png' target='_blank'>â™€</a><a class='fs14' href='http://www.webqtl.org/array_images/S098-1F1-U74Av2.png' target='_blank'>â™‚</a><a class='fs14' href='http://www.webqtl.org/array_images/S101-1F1-U74Av2.png' target='_blank'>â™‚</a></td>\r\n						<td>&nbsp;</td>\r\n					</tr>\r\n					<tr>\r\n						<td>B6D2F1 F1</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S238-1F1-U74Av2.png' target='_blank'>â™€</a><a class='fs14' href='http://www.webqtl.org/array_images/S191-1F1-U74Av2.png' target='_blank'> â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S273-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td>&nbsp;</td>\r\n						<td>BXD1</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S233-1F1-U74Av2.png' target='_blank'>â™€</a><a class='fs14' href='http://www.webqtl.org/array_images/S342-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td>&nbsp;</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S280-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD2</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S011-1F1.png' target='_blank'>â™‚</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/UT-701.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S340-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td>BXD5</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/UT-728.png' target='_blank'>â™‚</a><a class='fs14' href='http://www.webqtl.org/array_images/UT746.png' target='_blank'>â™‚</a><a class='fs14' href='http://www.webqtl.org/array_images/UT-744.png' target='_blank'>â™€</a></td>\r\n						<td>&nbsp;</td>\r\n						<td>&nbsp;</td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD6</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S378-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S269-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S361-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td>BXD8</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S167-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S605-1F1-U74Av2.png' target='_blank'>â™‚</a><a class='fs14' href='http://www.webqtl.org/array_images/S343-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td>&nbsp;</td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD9</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S009-1F2.png' target='_blank'>â™‚</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S270-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S193-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td>BXD11</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S234-1F1-U74Av2.png' target='_blank'>â™€</a><a class='fs14' href='http://www.webqtl.org/array_images/UT-745.png' target='_blank'>â™€</a></td>\r\n						<td>&nbsp;</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S194-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD12</td>\r\n						<td>&nbsp;</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S607-1F1-U74Av2.png' target='_blank'>â™‚</a><a class='fs14' href='http://www.webqtl.org/array_images/S358-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S281-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td>BXD13</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/UT-748.png' target='_blank'>â™€ </a></td>\r\n						<td>&nbsp;</td>\r\n						<td>&nbsp;</td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD14</td>\r\n						<td>&nbsp;</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/UT-706.png' target='_blank'>â™€</a><a class='fs14' href='http://www.webqtl.org/array_images/UT-705.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S195-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td>BXD15</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S235-F2-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td>&nbsp;</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S338b-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD16</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S380-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S359-1F1-U74Av2.png' target='_blank'>â™€</a><a class='fs14' href='http://www.webqtl.org/array_images/S382-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td>&nbsp;</td>\r\n						<td>BXD18</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S334-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S606-1F2c-U74Av2.png' target='_blank'>â™‚</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S362-1F2-U74Av2.png' target='_blank'>â™€</a></td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD19</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S236-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S271-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S169-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td>BXD21</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/UT-743.png' target='_blank'>â™€</a><a class='fs14' href='http://www.webqtl.org/array_images/UT740.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S120-1F1-U74Av2.png' target='_blank'>â™‚</a><a class='fs14' href='http://www.webqtl.org/array_images/S120-1F2-U74Av2.png' target='_blank'>â™‚</a></td>\r\n						<td>&nbsp;</td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD22</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S168-1F2-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S170-1F1-U74Av2.png' target='_blank'>â™€</a><a class='fs14' href='http://www.webqtl.org/array_images/S383-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td>&nbsp;</td>\r\n						<td>BXD23</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/UT815.png' target='_blank'>â™€</a></td>\r\n						<td>&nbsp;</td>\r\n						<td>&nbsp;</td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD24</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S335b-1F1-U74Av2.png' target='_blank'>â™€</a><a class='fs14' href='http://www.webqtl.org/array_images/S344-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td>&nbsp;</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S283-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td>BXD25</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S373-1F1-U74Av2.png' target='_blank'>â™€</a><a class='fs14' href='http://www.webqtl.org/array_images/S532-1F1-U74Av2.png' target='_blank'>â™€ </a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S376-1F2-U74Av2.png' target='_blank'>â™€</a><a class='fs14' href='http://www.webqtl.org/array_images/S384-1F1-U74Av2.png' target='_blank'>â™€ </a></td>\r\n						<td>&nbsp;</td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD27</td>\r\n						<td>&nbsp;</td>\r\n						<td>&nbsp;</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S339-1F2-U74Av2.png' target='_blank'>â™€</a><a class='fs14' href='http://www.webqtl.org/array_images/S339b-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td>BXD28</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S381-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S171-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S197-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD29</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/Z694-1F-U74Av2.png' target='_blank'>â™‚</a></td>\r\n						<td>&nbsp;</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S284-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td>BXD31</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S336b-1F1-U74Av2.png' target='_blank'>â™€</a><a class='fs14' href='http://www.webqtl.org/array_images/S198-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S345-1F1-U74Av2.png' target='_blank'>â™€</a><a class='fs14' href='http://www.webqtl.org/array_images/S534-1F2-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td>&nbsp;</td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD32</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S237-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/Z621-1F1.png' target='_blank'>â™‚</a><a class='fs14' href='http://www.webqtl.org/array_images/S272-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S341-1F2-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td>BXD33</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/Z632-1F1.png' target='_blank'>â™‚</a><a class='fs14' href='http://www.webqtl.org/array_images/Z633-1F1.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/UT-704.png' target='_blank'>â™€</a></td>\r\n						<td>&nbsp;</td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD34</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S601-1F1-U74Av2.png' target='_blank'>â™‚</a><a class='fs14' href='http://www.webqtl.org/array_images/S597-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/Z624-1F1.png' target='_blank'>â™€</a></td>\r\n						<td>&nbsp;</td>\r\n						<td>BXD38</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/UT749.png' target='_blank'>â™‚</a><a class='fs14' href='http://www.webqtl.org/array_images/UT780.png' target='_blank'>â™€</a><a class='fs14' href='http://www.webqtl.org/array_images/UT747.png' target='_blank'>â™€</a></td>\r\n						<td>&nbsp;</td>\r\n						<td>&nbsp;</td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD39</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S602-1F1-U74Av2.png' target='_blank'>â™‚</a><a class='fs14' href='http://www.webqtl.org/array_images/S598-1F1-U74Av2.png' target='_blank'>â™€ </a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/Z628-1F1.png' target='_blank'>â™‚</a></td>\r\n						<td>&nbsp;</td>\r\n						<td>BXD40</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S603-1F1-U74Av2.png' target='_blank'>â™‚</a><a class='fs14' href='http://www.webqtl.org/array_images/Z640-1F1.png' target='_blank'>â™‚</a><a class='fs14' href='http://www.webqtl.org/array_images/S599-1F1-U74Av2.png' target='_blank'>â™€</a><a class='fs14' href='http://www.webqtl.org/array_images/S599-1F2-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td>&nbsp;</td>\r\n						<td>&nbsp;</td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD42</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S604-1F1-U74Av2.png' target='_blank'>â™‚</a><a class='fs14' href='http://www.webqtl.org/array_images/Z641-1F1.png' target='_blank'>â™‚</a> <a class='fs14' href='http://www.webqtl.org/array_images/S600-1F1-U74Av2.png' target='_blank'>â™€</a></td>\r\n						<td>&nbsp;</td>\r\n						<td>&nbsp;</td>\r\n						<td>BXD67 F8</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/UT767.png' target='_blank'>â™€</a> <a class='fs14' href='http://www.webqtl.org/array_images/S536UM-1F1.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/UT784.png' target='_blank'>â™‚ </a></td>\r\n						<td>&nbsp;</td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD68 F9</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S537UM-1F1.png' target='_blank'>â™€</a> <a class='fs14' href='http://www.webqtl.org/array_images/S538UM-1F1.png' target='_blank'>â™€</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/UT768.png' target='_blank'>â™‚</a></td>\r\n						<td>&nbsp;</td>\r\n						<td>&nbsp;</td>\r\n						<td>&nbsp;</td>\r\n						<td>&nbsp;</td>\r\n						<td>&nbsp;</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>" .
gn:Br_u_0803_m gnt:hasPlatformInfo "<p><strong>Affymetrix U74Av2 GeneChip:</strong> The expression data were generated using 100 U74Av2 arrays. The chromosomal locations of U74Av2 probe sets were determined by BLAT analysis of concatenated probe sequences using the Mouse Genome Sequencing Consortium May 2004 mm5 assembly. This BLAT analysis is performed periodically by Yanhua Qu as each new build of the mouse genome is released see <a class='fs14' href='http://genome.ucsc.edu/cgi-bin/hgBlat?command=start&amp;org=mouse'>http://genome.ucsc.edu/cgi-bin/hgBlat?command=start&amp;org=mouse</a>. We thank Yan Cui UTHSC for allowing us to use his Linux cluster to perform this analysis. It is possiible to confirm the BLAT alignment results yourself simply by clicking on the <strong>Verify</strong> link in the Trait Data and Editing Form right side of the <strong>Location</strong> line.</p>" .
gn:Br_u_0803_m gnt:hasDataProcessingInfo "<blockquote><strong>Probe cell level data from the CEL file: </strong> Probe signal intensity estimates in the Affymetrix CEL files are the 75% quantile value taken from a set of <a class='fs14' href='images/AffyU74.pdf' target='_blank'>36</a> 6x6 pixels per probe cell in the DAT image file.\r\n<ul>\r\n	<li>Step 1: We added an offset of 1.0 to the CEL expression values for each cell to ensure that all values could be logged without generating negative values.</li>\r\n	<li>Step 2: We took the log2 of each cell signal intensity.</li>\r\n	<li>Step 3: We computed the Z score for each of these log2 cell signal intensity values within a single array.</li>\r\n	<li>Step 4: We multiplied all Z scores by 2.</li>\r\n	<li>Step 5: We added a constant of 8 units to the value of the Z score. The consequence of this simple set of transformations is to produce a set of Z scores that have a mean of 8 units, a variance of 4 units, and a standard deviation of 2 units. The advantage of this modified Z score is that a 2-fold difference in expression level corresponds roughly to 1 unit.</li>\r\n	<li>Step 6: We computed the arithmetic mean of the values for the set of microarrays for each strain. We have not corrected for variance introduced by sex, age, source of animals, or any possible interaction. We have not corrected for background beyond that implemented by Affymetrix in generating the CEL file.</li>\r\n</ul>\r\n<strong>Probe set data from the CHP file: </strong>Probe set estimates of expression were initially generated using the standard Affymetrix MAS 5 algorithm. The CHP values were then processed following precisely the same six steps listed above to normalize expression and stabilize the variance of all 106 arrays. The mean expression within each array is therefore 8 units with a standard deviation of 2 units. A 1-unit difference represents roughly a 2-fold difference in expression level. Expression levels below 5 are close to the background noise level. While a value of 8 unit is nominally the average expression, this average includes all those transcripts with negligible expression in the brain that would often be eliminated from subsequent analysis so-called &quot;absent&quot; and &quot;marginal&quot; calls in the CHP file.</blockquote>\r\n\r\n<p>About the array probe set names:</p>\r\n\r\n<blockquote>\r\n<p>Most probe sets on the U74Av2 array consist of a total of 32 probes, divided into 16 perfect match probes and 16 mismatch controls. Each set of these 25-nucleotide-long probes has an identifier code that includes a unique number, an underscore character, and several suffix characters that highlight design features. The most common probe set suffix is <strong>at</strong>. This code indicates that the probes should hybridize relatively selectively with the complementary anti-sense target i.e., the complemenary RNA produced from a single gene. Other codes include:</p>\r\n\r\n<ul>\r\n	<li><strong>f_at sequence family</strong>: Some probes in this probe set will hybridize to identical and/or slightly different sequences of related gene transcripts.</li>\r\n	<li><strong>s_at similarity constraint</strong>: All Probes in this probe set target common sequences found in transcripts from several genes.</li>\r\n	<li><strong>g_at common groups</strong>: Some probes in this set target identical sequences in multiple genes and some target unique sequences in the intended target gene.</li>\r\n	<li><strong>r_at rules dropped</strong>: Probe sets for which it was not possible to pick a full set of unique probes using the Affymetrix probe selection rules. Probes were picked after dropping some of the selection rules.</li>\r\n	<li><strong>i_at incomplete</strong>: Designates probe sets for which there are fewer than the standard numbers of unique probes specified in the design 16 perfect match for the U74Av2.</li>\r\n	<li><strong>st </strong> sense target: Designates a sense target; almost always generated in error.</li>\r\n</ul>\r\n\r\n<p>Descriptions for the probe set extensions were taken from the Affymetrix<a class='fs14' href='./dbdoc/data_analysis_fundamentals_manual.pdf'> GeneChip Expression Analysis Fundamentals</a>.</p>\r\n</blockquote>" .
gn:Br_u_0803_m gnt:hasNotes "<p>This text file originally generated by RWW, EJC, and YHQ, August 2003. Updated by RWW, October 30, 2004.</p>" .
gn:Br_u_0803_m gnt:hasAcknowledgement "<p>Data were generated with funds to RWW from the Dunavant Chair of Excellence, University of Tennessee Health Science Center, Department of Pediatrics. The majority of arrays were processed at <a class='fs14' href='http://www.genomeexplorations.com' target='_blank'>Genome Explorations</a> by Divyen Patel. We thank Guomin Zhou for generating advanced intercross stock used to produce most of the new BXD RI strains.</p>" .
```


## 'publishfreeze'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT PublishFreeze.Name, PublishFreeze.FullName, PublishFreeze.Name, PublishFreeze.ShortName, PublishFreeze.CreateTime, InbredSet.Name AS InbredSetName FROM PublishFreeze LEFT JOIN InfoFiles ON InfoFiles.InfoPageName = PublishFreeze.Name LEFT JOIN InbredSet ON PublishFreeze.InbredSetId = InbredSet.InbredSetId WHERE PublishFreeze.public > 0 AND PublishFreeze.confidentiality < 1 AND InfoFiles.InfoFileId IS NULL
```

The above query results to triples that have the form:

```text
gn:Publishfreeze_name_ -> rdf:type -> dcat:Dataset 
gn:Publishfreeze_name_ -> xkos:classifiedUnder -> gnc:Phenotype 
gn:Publishfreeze_name_ -> dct:title -> PublishFreeze(FullName) 
gn:Publishfreeze_name_ -> rdfs:label -> PublishFreeze(Name) 
gn:Publishfreeze_name_ -> skos:altLabel -> PublishFreeze(ShortName) 
gn:Publishfreeze_name_ -> dct:created -> "PublishFreeze(CreateTime)"^^xsd:date 
gn:Publishfreeze_name_ -> gnt:belongsToGroup -> gn:setInbredset_inbredsetname 
```
Here's an example query:

```sparql
PREFIX v: <http://www.w3.org/2006/vcard/ns#> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX dcat: <http://www.w3.org/ns/dcat#> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX xkos: <http://rdf-vocabulary.ddialliance.org/xkos#> 
PREFIX geoSeries: <http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 
PREFIX dct: <http://purl.org/dc/terms/> 

SELECT * WHERE { 
    ?s rdf:type dcat:Dataset .
    ?s xkos:classifiedUnder gnc:Phenotype .
    ?s dct:title "B6D2F2 PSU Phenotypes" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:B6d2f2_psupublish rdf:type dcat:Dataset .
gn:B6d2f2_psupublish xkos:classifiedUnder gnc:Phenotype .
gn:B6d2f2_psupublish dct:title "B6D2F2 PSU Phenotypes" .
gn:B6d2f2_psupublish rdfs:label "B6D2F2-PSUPublish" .
gn:B6d2f2_psupublish skos:altLabel "B6D2F2 PSU Publish" .
gn:B6d2f2_psupublish dct:created "2015-03-18"^^xsd:date .
gn:B6d2f2_psupublish gnt:belongsToGroup gn:setB6d2f2-psu .
```


## 'genofreeze'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT GenoFreeze.Name, GenoFreeze.Name, GenoFreeze.FullName, GenoFreeze.ShortName, GenoFreeze.CreateTime, InbredSet.Name AS InbredSetName FROM GenoFreeze LEFT JOIN InfoFiles ON InfoFiles.InfoPageName = GenoFreeze.Name LEFT JOIN InbredSet ON GenoFreeze.InbredSetId = InbredSet.InbredSetId WHERE GenoFreeze.public > 0 AND GenoFreeze.confidentiality < 1 AND InfoFiles.InfoPageName IS NULL
```

The above query results to triples that have the form:

```text
gn:Genofreeze_name_ -> rdf:type -> dcat:Dataset 
gn:Genofreeze_name_ -> xkos:classifiedUnder -> gnc:Genotype 
gn:Genofreeze_name_ -> rdfs:label -> GenoFreeze(Name) 
gn:Genofreeze_name_ -> dct:title -> GenoFreeze(FullName) 
gn:Genofreeze_name_ -> skos:altLabel -> GenoFreeze(ShortName) 
gn:Genofreeze_name_ -> dct:created -> "GenoFreeze(CreateTime)"^^xsd:date 
gn:Genofreeze_name_ -> gnt:belongsToGroup -> gn:setInbredset_inbredsetname 
```
Here's an example query:

```sparql
PREFIX v: <http://www.w3.org/2006/vcard/ns#> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX dcat: <http://www.w3.org/ns/dcat#> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX xkos: <http://rdf-vocabulary.ddialliance.org/xkos#> 
PREFIX geoSeries: <http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 
PREFIX dct: <http://purl.org/dc/terms/> 

SELECT * WHERE { 
    ?s rdf:type dcat:Dataset .
    ?s xkos:classifiedUnder gnc:Genotype .
    ?s rdfs:label "B6D2RIGeno" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:B6d2rigeno rdf:type dcat:Dataset .
gn:B6d2rigeno xkos:classifiedUnder gnc:Genotype .
gn:B6d2rigeno rdfs:label "B6D2RIGeno" .
gn:B6d2rigeno dct:title "B6D2RI Genotypes" .
gn:B6d2rigeno skos:altLabel "B6D2RIGeno" .
gn:B6d2rigeno dct:created "2022-10-24"^^xsd:date .
gn:B6d2rigeno gnt:belongsToGroup gn:setB6d2ri .
```


## 'probesetfreeze'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT ProbeSetFreeze.Name, AvgMethod.Name AS AvgMethodName, AvgMethod.Name AS AvgMethodName, ProbeSetFreeze.FullName, ProbeSetFreeze.ShortName, ProbeSetFreeze.Name, ProbeSetFreeze.Name2, ProbeSetFreeze.CreateTime, ProbeSetFreeze.DataScale, Tissue.Short_Name, InbredSet.Name AS InbredSetName FROM ProbeSetFreeze LEFT JOIN InfoFiles ON InfoFiles.InfoPageName = ProbeSetFreeze.Name LEFT JOIN ProbeFreeze USING (ProbeFreezeId) LEFT JOIN AvgMethod ON AvgMethod.AvgMethodId = ProbeSetFreeze.AvgID LEFT JOIN InbredSet ON ProbeFreeze.InbredSetId = InbredSet.Id LEFT JOIN Tissue ON ProbeFreeze.TissueId = Tissue.TissueId WHERE ProbeSetFreeze.public > 0 AND InfoFiles.InfoPageName IS NULL GROUP BY ProbeFreeze.Id
```

The above query results to triples that have the form:

```text
gn:Probesetfreeze_name_ -> rdf:type -> dcat:Dataset 
gn:Probesetfreeze_name_ -> xkos:classifiedUnder -> gnc:Probeset 
gn:Probesetfreeze_name_ -> gnt:usesNormalization -> gn:avgMethodAvgmethod_avgmethodname 
gn:Probesetfreeze_name_ -> dct:title -> ProbeSetFreeze(FullName) 
gn:Probesetfreeze_name_ -> rdfs:label -> ProbeSetFreeze(ShortName) 
gn:Probesetfreeze_name_ -> skos:prefLabel -> ProbeSetFreeze(Name) 
gn:Probesetfreeze_name_ -> skos:altLabel -> ProbeSetFreeze(Name2) 
gn:Probesetfreeze_name_ -> dct:created -> "ProbeSetFreeze(CreateTime)"^^xsd:datetime 
gn:Probesetfreeze_name_ -> gnt:usesDataScale -> ProbeSetFreeze(DataScale) 
gn:Probesetfreeze_name_ -> gnt:hasTissue -> gn:tissueTissue_short_name 
gn:Probesetfreeze_name_ -> gnt:belongsToGroup -> gn:setInbredset_inbredsetname 
```
Here's an example query:

```sparql
PREFIX v: <http://www.w3.org/2006/vcard/ns#> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX dcat: <http://www.w3.org/ns/dcat#> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX xkos: <http://rdf-vocabulary.ddialliance.org/xkos#> 
PREFIX geoSeries: <http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 
PREFIX dct: <http://purl.org/dc/terms/> 

SELECT * WHERE { 
    ?s rdf:type dcat:Dataset .
    ?s xkos:classifiedUnder gnc:Probeset .
    ?s gnt:usesNormalization gn:avgMethodRankinv .
    ?s dct:title "UBC/CMMT BXD P0 Cerebellum ILM Mouse WG-6 v2.0 (May13) RankInv" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:Cmmtubcbxdp00cerilm0513 rdf:type dcat:Dataset .
gn:Cmmtubcbxdp00cerilm0513 xkos:classifiedUnder gnc:Probeset .
gn:Cmmtubcbxdp00cerilm0513 gnt:usesNormalization gn:avgMethodRankinv .
gn:Cmmtubcbxdp00cerilm0513 dct:title "UBC/CMMT BXD P0 Cerebellum ILM Mouse WG-6 v2.0 (May13) RankInv" .
gn:Cmmtubcbxdp00cerilm0513 rdfs:label "UBC/CMMT BXD P0 Cerebellum ILM Mouse WG-6 v2.0 (May13) RankInv" .
gn:Cmmtubcbxdp00cerilm0513 skos:prefLabel "CMMTUBCBXDP00CerILM0513" .
gn:Cmmtubcbxdp00cerilm0513 skos:altLabel "CMMTUBCBXDP00CerILMMay13" .
gn:Cmmtubcbxdp00cerilm0513 dct:created "2013-04-22"^^xsd:datetime .
gn:Cmmtubcbxdp00cerilm0513 gnt:usesDataScale "log2" .
gn:Cmmtubcbxdp00cerilm0513 gnt:hasTissue gn:tissueCb .
gn:Cmmtubcbxdp00cerilm0513 gnt:belongsToGroup gn:setBxd .
```


## 'investigators'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT Investigators.FirstName, Investigators.LastName, Investigators.Email, Investigators.FirstName, Investigators.LastName, Investigators.FirstName, Investigators.LastName, Investigators.Url, Investigators.Address, Investigators.City, Investigators.State, Investigators.ZipCode, Investigators.Country FROM Investigators GROUP BY Email
```

The above query results to triples that have the form:

```text
gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email -> rdf:type -> foaf:Person 
gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email -> foaf:name -> Investigators(FirstName) Investigators(LastName) 
gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email -> foaf:givenName -> Investigators(FirstName) 
gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email -> foaf:familyName -> Investigators(LastName) 
gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email -> foaf:homepage -> Investigators(Url) 
gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email -> v:adr -> Investigators(Address) 
gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email -> v:locality -> Investigators(City) 
gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email -> v:region -> Investigators(State) 
gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email -> v:postal-code -> Investigators(ZipCode) 
gn:investigatorInvestigators_firstname_investigators_lastname_investigators_email -> v:country-name -> Investigators(Country) 
```
Here's an example query:

```sparql
PREFIX v: <http://www.w3.org/2006/vcard/ns#> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX dcat: <http://www.w3.org/ns/dcat#> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX xkos: <http://rdf-vocabulary.ddialliance.org/xkos#> 
PREFIX geoSeries: <http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 
PREFIX dct: <http://purl.org/dc/terms/> 

SELECT * WHERE { 
    ?s rdf:type foaf:Person .
    ?s foaf:name "Evan Williams" .
    ?s foaf:givenName "Evan" .
    ?s foaf:familyName "Williams" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:investigatorEvan_williams_ rdf:type foaf:Person .
gn:investigatorEvan_williams_ foaf:name "Evan Williams" .
gn:investigatorEvan_williams_ foaf:givenName "Evan" .
gn:investigatorEvan_williams_ foaf:familyName "Williams" .
gn:investigatorEvan_williams_ v:country-name "Switzerland" .
```


## 'gene-chip'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT GeneChip.Name, GeneChip.GeneChipName, GeneChip.Name, IF(GeneChip.GeneChipName != GeneChip.Title, Title, NULL) AS Title, GeneChip.Go_tree_value, Species.Fullname, GeneChip.GeoPlatform FROM GeneChip LEFT JOIN Species USING (SpeciesId)
```

The above query results to triples that have the form:

```text
gn:platformGenechip_name -> rdf:type -> gnc:geneChip 
gn:platformGenechip_name -> rdfs:label -> GeneChip(GeneChipName) 
gn:platformGenechip_name -> skos:prefLabel -> GeneChip(Name) 
gn:platformGenechip_name -> skos:altLabel -> Title 
gn:platformGenechip_name -> gnt:hasGOTreeValue -> GeneChip(Go_tree_value) 
gn:platformGenechip_name -> xkos:classifiedUnder -> gn:Species_fullname 
gn:platformGenechip_name -> gnt:hasGeoSeriesId -> geoSeries:GeneChip(GeoPlatform) 
```
Here's an example query:

```sparql
PREFIX v: <http://www.w3.org/2006/vcard/ns#> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX dcat: <http://www.w3.org/ns/dcat#> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX xkos: <http://rdf-vocabulary.ddialliance.org/xkos#> 
PREFIX geoSeries: <http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 
PREFIX dct: <http://purl.org/dc/terms/> 

SELECT * WHERE { 
    ?s rdf:type gnc:geneChip .
    ?s rdfs:label "Affy Mouse Genome U74Av2 (GPL81)" .
    ?s skos:prefLabel "MG_U74AV2" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:platformMg_u74av2 rdf:type gnc:geneChip .
gn:platformMg_u74av2 rdfs:label "Affy Mouse Genome U74Av2 (GPL81)" .
gn:platformMg_u74av2 skos:prefLabel "MG_U74AV2" .
gn:platformMg_u74av2 gnt:hasGOTreeValue "affy_mg_u74av2" .
gn:platformMg_u74av2 xkos:classifiedUnder gn:Mus_musculus .
gn:platformMg_u74av2 gnt:hasGeoSeriesId geoSeries:GPL81 .
```

