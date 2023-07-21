# Info files / Investigators Metadata
## 'dump-info-files'


## Generated Triples:

The following SQL query was executed:

```sql
SELECT InfoFiles.InfoPageName, IF(GenoFreeze.Id IS NOT NULL, 'gn:genotypeDataset', IF(PublishFreeze.Id IS NOT NULL, 'gn:phenotypeDataset', 'gn:dataset')) AS rdfType, InfoFiles.InfoPageName, IFNULL(GenoFreeze.FullName, IFNULL(PublishFreeze.FullName, '')) AS DatasetFullName, IFNULL(GenoFreeze.CreateTime, IFNULL(PublishFreeze.CreateTime, IFNULL(ProbeSetFreeze.CreateTime, ''))) AS createTimeGenoFreeze, Investigators.FirstName, Investigators.LastName, Investigators.Email, CAST(CONVERT(BINARY CONVERT(Organizations.OrganizationName USING latin1) USING utf8) AS VARCHAR(1500)) AS Organizations, InfoFiles.GN_AccesionId, DatasetStatus.DatasetStatusName, InbredSet.Name AS InbredSetName, Tissue.Short_Name, AvgMethod.Name AS AvgMethodName, AvgMethod.Name AS AvgMethodName, GeneChip.Name AS GeneChip, Datasets.Summary, Datasets.AboutTissue, IFNULL(Datasets.GeoSeries, '') AS GeoSeries, InfoFiles.InfoFileTitle, Datasets.PublicationTitle, InfoFiles.Specifics, Datasets.DatasetName AS DatasetGroup, CAST(CONVERT(BINARY CONVERT(Datasets.AboutCases USING latin1) USING utf8) AS VARCHAR(10000)) AS AboutCases, CAST(CONVERT(BINARY CONVERT(Datasets.AboutPlatform USING latin1) USING utf8) AS VARCHAR(1500)) AS AboutPlatform, CAST(CONVERT(BINARY CONVERT(Datasets.AboutDataProcessing USING latin1) USING utf8) AS VARCHAR(1500)) AS AboutDataProcessing, CAST(CONVERT(BINARY CONVERT(Datasets.Notes USING latin1) USING utf8) AS VARCHAR(1500)) AS GNNotes, CAST(CONVERT(BINARY CONVERT(Datasets.ExperimentDesign USING latin1) USING utf8) AS VARCHAR(1500)) AS ExperimentDesign, CAST(CONVERT(BINARY CONVERT(Datasets.Contributors USING latin1) USING utf8) AS VARCHAR(1500)) AS Contributors, CAST(CONVERT(BINARY CONVERT(Datasets.Citation USING latin1) USING utf8) AS VARCHAR(1500)) AS Citation, CAST(CONVERT(BINARY CONVERT(InfoFiles.Data_Source_Acknowledge USING latin1) USING utf8) AS VARCHAR(1500)) AS Data_Source_Acknowledge, Datasets.Acknowledgment FROM InfoFiles LEFT JOIN PublishFreeze ON InfoFiles.InfoPageName = PublishFreeze.Name LEFT JOIN GenoFreeze ON InfoFiles.InfoPageName = GenoFreeze.Name LEFT JOIN ProbeSetFreeze ON InfoFiles.InfoPageName = ProbeSetFreeze.Name LEFT JOIN InbredSet ON InfoFiles.InbredSetId = InbredSet.InbredSetId LEFT JOIN Species ON InfoFiles.SpeciesId = Species.SpeciesId LEFT JOIN Datasets USING (DatasetId) LEFT JOIN DatasetStatus USING (DatasetStatusId) LEFT JOIN Tissue USING (TissueId) LEFT JOIN Investigators USING (InvestigatorId) LEFT JOIN AvgMethod USING (AvgMethodId) LEFT JOIN Organizations USING (OrganizationId) LEFT JOIN GeneChip USING (GeneChipId) WHERE GN_AccesionId IS NOT NULL
```

The above query results to triples that have the form:

```text
gn:Infofiles_infopagename_ -> rdf:type -> rdfType 
gn:Infofiles_infopagename_ -> gn-term:name -> InfoFiles(InfoPageName) 
gn:Infofiles_infopagename_ -> gn-term:fullName -> DatasetFullName 
gn:Infofiles_infopagename_ -> dct:created -> createTimeGenoFreeze 
gn:Infofiles_infopagename_ -> gn-term:datasetOfInvestigator -> gn:investigator_investigators_firstname_investigators_lastname_investigators_email 
gn:Infofiles_infopagename_ -> gn-term:datasetOfOrganization -> Organizations 
gn:Infofiles_infopagename_ -> gn-term:accessionId -> GNInfoFiles(GN_AccesionId) 
gn:Infofiles_infopagename_ -> gn-term:datasetStatusName -> datasetstatus(datasetstatusname) 
gn:Infofiles_infopagename_ -> gn-term:datasetOfInbredSet -> gn:inbredSet_inbredset_inbredsetname 
gn:Infofiles_infopagename_ -> gn-term:datasetOfTissue -> gn:tissue_tissue_short_name 
gn:Infofiles_infopagename_ -> gn-term:normalization -> gn:avgmethod_avgmethod_avgmethodname 
gn:Infofiles_infopagename_ -> gn-term:datasetOfPlatform -> gn:platform_genechip_genechip 
gn:Infofiles_infopagename_ -> gn-term:summary -> DatasetsSummary 
gn:Infofiles_infopagename_ -> gn-term:aboutTissue -> DatasetsAboutTissue 
gn:Infofiles_infopagename_ -> gn-term:geoSeries ->  
gn:Infofiles_infopagename_ -> gn-term:title -> InfoFiles(InfoFileTitle) 
gn:Infofiles_infopagename_ -> gn-term:publicationTitle -> Datasets(PublicationTitle) 
gn:Infofiles_infopagename_ -> gn-term:specifics -> InfoFilesSpecifics 
gn:Infofiles_infopagename_ -> gn-term:datasetGroup -> Datasets(DatasetGroup) 
gn:Infofiles_infopagename_ -> gn-term:aboutCases -> AboutCases 
gn:Infofiles_infopagename_ -> gn-term:aboutPlatform -> AboutPlatform 
gn:Infofiles_infopagename_ -> gn-term:aboutDataProcessing -> AboutDataProcessing 
gn:Infofiles_infopagename_ -> gn-term:notes -> GNNotes 
gn:Infofiles_infopagename_ -> gn-term:experimentDesign -> ExperimentDesign 
gn:Infofiles_infopagename_ -> gn-term:contributors -> Contributors 
gn:Infofiles_infopagename_ -> gn-term:citation -> Citation 
gn:Infofiles_infopagename_ -> gn-term:dataSourceAcknowledgment -> Data_Source_Acknowledge 
gn:Infofiles_infopagename_ -> gn-term:acknowledgment -> DatasetsAcknowledgment 
```
Here's an example query:

```sparql
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX geoSeries: <http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=> 
PREFIX gn-term: <http://genenetwork.org/term/> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 
PREFIX dct: <http://purl.org/dc/terms/> 

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type gn:dataset .
    ?s gn-term:name "Br_U_0803_M" .
    ?s dct:created "2003-08-01" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:Br_u_0803_m rdf:type gn:dataset .
gn:Br_u_0803_m gn-term:name "Br_U_0803_M" .
gn:Br_u_0803_m dct:created "2003-08-01" .
gn:Br_u_0803_m gn-term:datasetOfInvestigator gn:investigator_robert_williams_rwilliams_uthsc.edu .
gn:Br_u_0803_m gn-term:datasetOfOrganization "University of Tennessee Health Science Center" .
gn:Br_u_0803_m gn-term:accessionId "GN1" .
gn:Br_u_0803_m gn-term:datasetStatusName "public" .
gn:Br_u_0803_m gn-term:datasetOfInbredSet gn:inbredSet_bxd .
gn:Br_u_0803_m gn-term:datasetOfTissue gn:tissue_brn .
gn:Br_u_0803_m gn-term:normalization gn:avgmethod_mas5 .
gn:Br_u_0803_m gn-term:datasetOfPlatform gn:platform_mg_u74av2 .
gn:Br_u_0803_m gn-term:summary "<p>This August 2003 freeze provides estimates of mRNA expression in brains of BXD recombinant inbred mice measured using Affymetrix U74Av2 microarrays. This is data set includes six arrays which are of marginal quality. New users are encouraged to use one of the more recent data sets December 2003 or March 2004 from which these six arrays have been excluded. Data were generated at the University of Tennessee Health Science Center UTHSC. Over 300 brain samples from 35 strains were hybridized in small pools n=3 to 106 arrays. Data were processed using the Microarray Suite 5 <a class='fs14' href='www.affymetrix.com/support/technical/whitepapers/sadd_whitepaper.pdf'>MAS 5</a> protocol of Affymetrix. To simplify comparison between transforms, MAS 5 values of each array were adjusted to an average of 8 units and a variance of 2 units. In general, the MAS 5 transform does not perform as well as RMA, PDNN, or the new heritability weighted transforms HW1PM.</p>" .
gn:Br_u_0803_m gn-term:aboutTissue "<p>Each array was hybridized with labeled cRNA generated from a pool of three brains from adult animals usually of the same age and always of the same sex. The brain region included most of the forebrain and midbrain, bilaterally. However, the sample excluded the olfactory bulbs, retinas, or the posterior pituitary all formally part of the forebrain. A total of 100 such pooled samples were arrayed: 74 from females and 26 from males. Animals ranged in age from 56 to 441 days, usually with a balanced design: one pool at approximately 8 weeks, one pool at approximately 20 weeks, and one pool at approximately 1 year. Strain averages of mRNA expression level are therefore typically based on three pooled biological replicate arrays. This data set does not incorporate statistical adjustment for possible effects of age and sex. Users can select the strain symbol in the table above to review details about the specific cases and array processing center DP = Divyen Patel at Genome Explorations, Inc; TS = Thomas Sutter at University of Memphis. You can also click on the individual symbols males or females to view the array image.</p>" .
gn:Br_u_0803_m gn-term:title "UTHSC Brain mRNA U74Av2 (Aug03) MAS5" .
gn:Br_u_0803_m gn-term:datasetGroup "UTHSC Brain mRNA U74Av2 (Aug-Sep03)" .
gn:Br_u_0803_m gn-term:aboutCases "<p>This data set includes estimate of gene expression for 35 genetically uniform lines of mice: C57BL/6J B6, or simply B, DBA/2J D2 or D, their B6D2 F1 intercross, and 32 BXD recombinant inbred RI strains derived by crossing female B6 mice with male D2 mice and then inbreeding progeny for over 21 generations. This set of RI strains is a remarkable resource because many of these strains have been extensively phenotyped for hundreds of interesting traits over a 25-year period. A significant advantage of this RI set is that the two parental strains B6 and D2 have both been extensively sequenced and are known to differ at approximately 1.8 million SNPs. Coding variants mostly single nucleotide polymorphisms and insertion-deletions that may produce interesting phenotypes can be rapidly identified in this particular RI set.</p>\r\n\r\n<p>BXD1 through BXD32 were produced by Benjamin A. Taylor starting in the late 1970s. BXD33 through BXD42 were also produced by Taylor, but from a second set of crosses initiated in the early 1990s. These strains are all available from the Jackson Laboratory, Bar Harbor, Maine. BXD43 through BXD99 were produced by Lu Lu, Jeremy Peirce, Lee M. Silver, and Robert W. Williams in the late 1990s and early 2000s using advanced intercross progeny Peirce et al. <a class='fs14' href='http://www.biomedcentral.com/1471-2156/5/7'>2004</a>. Only two of these incipient strains are included in the current database BXD67 and BXD68.</p>\r\n\r\n<p>In this mRNA expression database we generally used progeny of stock obtained from The Jackson Laboratory between 1999 and 2001. Animals were generated in-house at the University of Alabama by John Mountz and Hui-Chen Hsu and at the University of Tennessee Health Science Center by Lu Lu and Robert Williams.</p>\r\n\r\n<p>The table below lists the arrays by strain, sex, and age. Each array was hybridized to a pool of mRNA from three mice. Note that this table includes six arrays dropped from the December 2003 data sets BXD6, n=2; BXD12, BXD16, BXD40, and BXD67, n=1 each.</p>\r\n\r\n<table align='Center' border='1' cellpadding='0' cellspacing='0' style='width:85%'>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<table border='1' cellpadding='5' cellspacing='1' style='width:100%'>\r\n				<tbody>\r\n					<tr>\r\n						<td rowspan='2'>Strain</td>\r\n						<td colspan='3'>\r\n						<p>Age</p>\r\n						</td>\r\n						<td rowspan='2'>Strain</td>\r\n						<td colspan='3'>\r\n						<p>Age</p>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td>\r\n						<p>8 Wks</p>\r\n						</td>\r\n						<td>\r\n						<p>20 Wks</p>\r\n						</td>\r\n						<td>\r\n						<p>52 Wks</p>\r\n						</td>\r\n						<td>\r\n						<p>8 Wks</p>\r\n						</td>\r\n						<td>\r\n						<p>20 Wks</p>\r\n						</td>\r\n						<td>\r\n						<p>52 Wks</p>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td>C57BL/6J B6</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S092-1F1.png' target='_blank'>???</a><a class='fs14' href='http://www.webqtl.org/array_images/S092UM-1F2.png' target='_blank'>???</a><a class='fs14' href='http://www.webqtl.org/array_images/S051-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S172-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S337b-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td>DBA/2J D2</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S169-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S286-1F1-U74Av2.png' target='_blank'>???</a><a class='fs14' href='http://www.webqtl.org/array_images/S098-1F1-U74Av2.png' target='_blank'>???</a><a class='fs14' href='http://www.webqtl.org/array_images/S101-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td>&nbsp;</td>\r\n					</tr>\r\n					<tr>\r\n						<td>B6D2F1 F1</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S238-1F1-U74Av2.png' target='_blank'>???</a><a class='fs14' href='http://www.webqtl.org/array_images/S191-1F1-U74Av2.png' target='_blank'> ???</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S273-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td>&nbsp;</td>\r\n						<td>BXD1</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S233-1F1-U74Av2.png' target='_blank'>???</a><a class='fs14' href='http://www.webqtl.org/array_images/S342-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td>&nbsp;</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S280-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD2</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S011-1F1.png' target='_blank'>???</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/UT-701.png' target='_blank'>???</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S340-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td>BXD5</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/UT-728.png' target='_blank'>???</a><a class='fs14' href='http://www.webqtl.org/array_images/UT746.png' target='_blank'>???</a><a class='fs14' href='http://www.webqtl.org/array_images/UT-744.png' target='_blank'>???</a></td>\r\n						<td>&nbsp;</td>\r\n						<td>&nbsp;</td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD6</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S378-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S269-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S361-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td>BXD8</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S167-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S605-1F1-U74Av2.png' target='_blank'>???</a><a class='fs14' href='http://www.webqtl.org/array_images/S343-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td>&nbsp;</td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD9</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S009-1F2.png' target='_blank'>???</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S270-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S193-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td>BXD11</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S234-1F1-U74Av2.png' target='_blank'>???</a><a class='fs14' href='http://www.webqtl.org/array_images/UT-745.png' target='_blank'>???</a></td>\r\n						<td>&nbsp;</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S194-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD12</td>\r\n						<td>&nbsp;</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S607-1F1-U74Av2.png' target='_blank'>???</a><a class='fs14' href='http://www.webqtl.org/array_images/S358-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S281-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td>BXD13</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/UT-748.png' target='_blank'>??? </a></td>\r\n						<td>&nbsp;</td>\r\n						<td>&nbsp;</td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD14</td>\r\n						<td>&nbsp;</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/UT-706.png' target='_blank'>???</a><a class='fs14' href='http://www.webqtl.org/array_images/UT-705.png' target='_blank'>???</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S195-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td>BXD15</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S235-F2-U74Av2.png' target='_blank'>???</a></td>\r\n						<td>&nbsp;</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S338b-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD16</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S380-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S359-1F1-U74Av2.png' target='_blank'>???</a><a class='fs14' href='http://www.webqtl.org/array_images/S382-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td>&nbsp;</td>\r\n						<td>BXD18</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S334-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S606-1F2c-U74Av2.png' target='_blank'>???</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S362-1F2-U74Av2.png' target='_blank'>???</a></td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD19</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S236-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S271-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S169-1F1-U74Av2.png' target='_blank'>???</a></td>\r\n						<td>BXD21</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/UT-743.png' target='_blank'>???</a><a class='fs14' href='http://www.webqtl.org/array_images/UT740.png' target='_blank'>???</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S120-1F1-U74Av2.png' target='_blank'>???</a><a class='fs14' href='http://www.webqtl.org/array_images/S120-1F2-U74Av2.png' target='_blank'>???</a></td>\r\n						<td>&nbsp;</td>\r\n					</tr>\r\n					<tr>\r\n						<td>BXD22</td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S168-1F2-U74Av2.png' target='_blank'>???</a></td>\r\n						<td><a class='fs14' href='http://www.webqtl.org/array_images/S170-1F1-U74Av2.png' target='_blank'>???</a><a class='fs14' href='http:" .
gn:Br_u_0803_m gn-term:aboutPlatform "<p><strong>Affymetrix U74Av2 GeneChip:</strong> The expression data were generated using 100 U74Av2 arrays. The chromosomal locations of U74Av2 probe sets were determined by BLAT analysis of concatenated probe sequences using the Mouse Genome Sequencing Consortium May 2004 mm5 assembly. This BLAT analysis is performed periodically by Yanhua Qu as each new build of the mouse genome is released see <a class='fs14' href='http://genome.ucsc.edu/cgi-bin/hgBlat?command=start&amp;org=mouse'>http://genome.ucsc.edu/cgi-bin/hgBlat?command=start&amp;org=mouse</a>. We thank Yan Cui UTHSC for allowing us to use his Linux cluster to perform this analysis. It is possiible to confirm the BLAT alignment results yourself simply by clicking on the <strong>Verify</strong> link in the Trait Data and Editing Form right side of the <strong>Location</strong> line.</p>" .
gn:Br_u_0803_m gn-term:aboutDataProcessing "<blockquote><strong>Probe cell level data from the CEL file: </strong> Probe signal intensity estimates in the Affymetrix CEL files are the 75% quantile value taken from a set of <a class='fs14' href='images/AffyU74.pdf' target='_blank'>36</a> 6x6 pixels per probe cell in the DAT image file.\r\n<ul>\r\n	<li>Step 1: We added an offset of 1.0 to the CEL expression values for each cell to ensure that all values could be logged without generating negative values.</li>\r\n	<li>Step 2: We took the log2 of each cell signal intensity.</li>\r\n	<li>Step 3: We computed the Z score for each of these log2 cell signal intensity values within a single array.</li>\r\n	<li>Step 4: We multiplied all Z scores by 2.</li>\r\n	<li>Step 5: We added a constant of 8 units to the value of the Z score. The consequence of this simple set of transformations is to produce a set of Z scores that have a mean of 8 units, a variance of 4 units, and a standard deviation of 2 units. The advantage of this modified Z score is that a 2-fold difference in expression level corresponds roughly to 1 unit.</li>\r\n	<li>Step 6: We computed the arithmetic mean of the values for the set of microarrays for each strain. We have not corrected for variance introduced by sex, age, source of animals, or any possible interaction. We have not corrected for background beyond that implemented by Affymetrix in generating the CEL file.</li>\r\n</ul>\r\n<strong>Probe set data from the CHP file: </strong>Probe set estimates of expression were initi" .
gn:Br_u_0803_m gn-term:notes "<p>This text file originally generated by RWW, EJC, and YHQ, August 2003. Updated by RWW, October 30, 2004.</p>" .
gn:Br_u_0803_m gn-term:dataSourceAcknowledgment "<Blockquote><P>Data were generated with funds to RWW from the Dunavant Chair of\r\nExcellence, University of Tennessee Health Science Center, Department\r\nof Pediatrics. The majority of arrays were processed at <a href='http://www.genomeexplorations.com' target='_blank' class='fs14'>Genome Explorations</A> by Divyen Patel. We thank Guomin Zhou for generating advanced intercross stock used to produce most of the new BXD RI strains.\r\n</P></Blockquote>" .
gn:Br_u_0803_m gn-term:acknowledgment "<p>Data were generated with funds to RWW from the Dunavant Chair of Excellence, University of Tennessee Health Science Center, Department of Pediatrics. The majority of arrays were processed at <a class='fs14' href='http://www.genomeexplorations.com' target='_blank'>Genome Explorations</a> by Divyen Patel. We thank Guomin Zhou for generating advanced intercross stock used to produce most of the new BXD RI strains.</p>" .
```


## 'dump-investigators'


## Generated Triples:

The following SQL query was executed:

```sql
SELECT Investigators.FirstName, Investigators.LastName, Investigators.Email, Investigators.FirstName, Investigators.FirstName, Investigators.LastName, CAST(CONVERT(BINARY CONVERT(FirstName USING latin1) USING utf8) AS VARCHAR(100)) AS FirstName, CAST(CONVERT(BINARY CONVERT(LastName USING latin1) USING utf8) AS VARCHAR(100)) AS LastName, Investigators.Url, Investigators.Address, Investigators.City, Investigators.State, Investigators.ZipCode, Investigators.Country FROM Investigators GROUP BY Email
```

The above query results to triples that have the form:

```text
gn:investigator_investigators_firstname_investigators_lastname_investigators_email -> rdf:type -> foaf:Person 
gn:investigator_investigators_firstname_investigators_lastname_investigators_email -> foaf:name -> Investigators(FirstName) Investigators(LastName) 
gn:investigator_investigators_firstname_investigators_lastname_investigators_email -> foaf:givenName -> FirstName 
gn:investigator_investigators_firstname_investigators_lastname_investigators_email -> foaf:familyName -> LastName 
gn:investigator_investigators_firstname_investigators_lastname_investigators_email -> foaf:homepage -> Investigators(Url) 
gn:investigator_investigators_firstname_investigators_lastname_investigators_email -> gn-term:address -> Investigators(Address) 
gn:investigator_investigators_firstname_investigators_lastname_investigators_email -> gn-term:city -> Investigators(City) 
gn:investigator_investigators_firstname_investigators_lastname_investigators_email -> gn-term:state -> Investigators(State) 
gn:investigator_investigators_firstname_investigators_lastname_investigators_email -> gn-term:zipCode -> Investigators(ZipCode) 
gn:investigator_investigators_firstname_investigators_lastname_investigators_email -> gn-term:country -> Investigators(Country) 
```
Here's an example query:

```sparql
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX geoSeries: <http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=> 
PREFIX gn-term: <http://genenetwork.org/term/> 
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 
PREFIX dct: <http://purl.org/dc/terms/> 

SELECT ?s ?p ?o WHERE { 
    ?s rdf:type foaf:Person .
    ?s foaf:name "Evan Williams" .
    ?s foaf:givenName "Evan" .
    ?s foaf:familyName "Williams" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:investigator_evan_williams_ rdf:type foaf:Person .
gn:investigator_evan_williams_ foaf:name "Evan Williams" .
gn:investigator_evan_williams_ foaf:givenName "Evan" .
gn:investigator_evan_williams_ foaf:familyName "Williams" .
gn:investigator_evan_williams_ gn-term:country "Switzerland" .
```

