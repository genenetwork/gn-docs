# Species Metadata
## 'dump-inbred-set'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT InbredSet.Name, InbredSet.FullName, InbredSet.GeneticType, InbredSet.Family, MappingMethod.Name, InbredSet.InbredSetCode, Species.Fullname, IF ((SELECT PublishFreeze.Name FROM PublishFreeze WHERE PublishFreeze.InbredSetId = InbredSet.Id LIMIT 1) IS NOT NULL, 'Traits and Cofactors', '') AS genotypeP, IF ((SELECT GenoFreeze.Name FROM GenoFreeze WHERE GenoFreeze.InbredSetId = InbredSet.Id LIMIT 1) IS NOT NULL, 'DNA Markers and SNPs', '') AS phenotypeP, (SELECT GROUP_CONCAT(DISTINCT Tissue.Short_Name SEPARATOR'||') AS MolecularTraits FROM ProbeFreeze, ProbeSetFreeze, InbredSet, Tissue, Species WHERE ProbeFreeze.TissueId = Tissue.Id AND ProbeFreeze.InbredSetId = InbredSet.Id AND ProbeSetFreeze.ProbeFreezeId = ProbeFreeze.Id ORDER BY Tissue.Name) AS molecularTrait FROM InbredSet LEFT JOIN Species ON InbredSet.SpeciesId=Species.Id LEFT JOIN MappingMethod ON InbredSet.MappingMethodId=MappingMethod.Id
```

The above query results to triples that have the form:

```text
gn:Inbredset_name -> rdf:type -> gnc:inbredSet 
gn:Inbredset_name -> rdfs:label -> InbredSet(FullName) 
gn:Inbredset_name -> gnt:geneticType -> InbredSet(GeneticType) 
gn:Inbredset_name -> gnt:family -> InbredSet(Family) 
gn:Inbredset_name -> gnt:mappingMethod -> MappingMethod(Name) 
gn:Inbredset_name -> gnt:code -> InbredSet(InbredSetCode) 
gn:Inbredset_name -> gnt:belongsToSpecies -> gn:Species_fullname 
gn:Inbredset_name -> gnt:genotype -> genotypeP 
gn:Inbredset_name -> gnt:phenotype -> phenotypeP 
gn:Inbredset_name -> gnt:hasTissue -> gn:tissue_moleculartrait 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 

SELECT * WHERE { 
    ?s rdf:type gnc:inbredSet .
    ?s rdfs:label "BXD Family" .
    ?s gnt:geneticType "riset" .
    ?s gnt:family "Reference Populations (replicate average, SE, N)" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:Bxd rdf:type gnc:inbredSet .
gn:Bxd rdfs:label "BXD Family" .
gn:Bxd gnt:geneticType "riset" .
gn:Bxd gnt:family "Reference Populations (replicate average, SE, N)" .
gn:Bxd gnt:mappingMethod "BXD" .
gn:Bxd gnt:code "BXD" .
gn:Bxd gnt:belongsToSpecies gn:Mus_musculus .
gn:Bxd gnt:genotype "Traits and Cofactors" .
gn:Bxd gnt:phenotype "DNA Markers and SNPs" .
gn:Bxd gnt:hasTissue gn:tissue_a1c .
gn:Bxd gnt:hasTissue gn:tissue_acc .
gn:Bxd gnt:hasTissue gn:tissue_adr .
gn:Bxd gnt:hasTissue gn:tissue_amg .
gn:Bxd gnt:hasTissue gn:tissue_bebv .
gn:Bxd gnt:hasTissue gn:tissue_bla .
gn:Bxd gnt:hasTissue gn:tissue_brmet .
gn:Bxd gnt:hasTissue gn:tissue_brmicrorna .
gn:Bxd gnt:hasTissue gn:tissue_brn .
gn:Bxd gnt:hasTissue gn:tissue_cart .
gn:Bxd gnt:hasTissue gn:tissue_cb .
gn:Bxd gnt:hasTissue gn:tissue_cbc .
gn:Bxd gnt:hasTissue gn:tissue_ctx .
gn:Bxd gnt:hasTissue gn:tissue_dfc .
gn:Bxd gnt:hasTissue gn:tissue_drg .
gn:Bxd gnt:hasTissue gn:tissue_ec .
gn:Bxd gnt:hasTissue gn:tissue_emb .
gn:Bxd gnt:hasTissue gn:tissue_eye .
gn:Bxd gnt:hasTissue gn:tissue_fat .
gn:Bxd gnt:hasTissue gn:tissue_fecmet .
gn:Bxd gnt:hasTissue gn:tissue_femur .
gn:Bxd gnt:hasTissue gn:tissue_gtex_aor .
gn:Bxd gnt:hasTissue gn:tissue_gtex_atr .
gn:Bxd gnt:hasTissue gn:tissue_gtex_blo .
gn:Bxd gnt:hasTissue gn:tissue_gtex_bonm .
gn:Bxd gnt:hasTissue gn:tissue_gtex_bre .
gn:Bxd gnt:hasTissue gn:tissue_gtex_cau .
gn:Bxd gnt:hasTissue gn:tissue_gtex_cer .
gn:Bxd gnt:hasTissue gn:tissue_gtex_cerv .
gn:Bxd gnt:hasTissue gn:tissue_gtex_cml .
gn:Bxd gnt:hasTissue gn:tissue_gtex_col .
gn:Bxd gnt:hasTissue gn:tissue_gtex_colsig .
gn:Bxd gnt:hasTissue gn:tissue_gtex_cor .
gn:Bxd gnt:hasTissue gn:tissue_gtex_ebv .
gn:Bxd gnt:hasTissue gn:tissue_gtex_eso .
gn:Bxd gnt:hasTissue gn:tissue_gtex_esogas .
gn:Bxd gnt:hasTissue gn:tissue_gtex_fal .
gn:Bxd gnt:hasTissue gn:tissue_gtex_fro .
gn:Bxd gnt:hasTissue gn:tissue_gtex_muc .
gn:Bxd gnt:hasTissue gn:tissue_gtex_ner .
gn:Bxd gnt:hasTissue gn:tissue_gtex_pan .
gn:Bxd gnt:hasTissue gn:tissue_gtex_put .
gn:Bxd gnt:hasTissue gn:tissue_gtex_sintter .
gn:Bxd gnt:hasTissue gn:tissue_gtex_skinex .
gn:Bxd gnt:hasTissue gn:tissue_gtex_skisex .
gn:Bxd gnt:hasTissue gn:tissue_gtex_sn .
gn:Bxd gnt:hasTissue gn:tissue_gtex_sto .
gn:Bxd gnt:hasTissue gn:tissue_gtex_sub .
gn:Bxd gnt:hasTissue gn:tissue_gtex_tf .
gn:Bxd gnt:hasTissue gn:tissue_gtex_thy .
gn:Bxd gnt:hasTissue gn:tissue_gtex_tib .
gn:Bxd gnt:hasTissue gn:tissue_gtex_vag .
gn:Bxd gnt:hasTissue gn:tissue_gtex_ven .
gn:Bxd gnt:hasTissue gn:tissue_gtex_vis .
gn:Bxd gnt:hasTissue gn:tissue_gtex_who .
gn:Bxd gnt:hasTissue gn:tissue_gut .
gn:Bxd gnt:hasTissue gn:tissue_hea .
gn:Bxd gnt:hasTissue gn:tissue_hip .
gn:Bxd gnt:hasTissue gn:tissue_hippreccel .
gn:Bxd gnt:hasTissue gn:tissue_hipprot .
gn:Bxd gnt:hasTissue gn:tissue_hip_mirna .
gn:Bxd gnt:hasTissue gn:tissue_hsc .
gn:Bxd gnt:hasTissue gn:tissue_hyp .
gn:Bxd gnt:hasTissue gn:tissue_ifra_ctx .
gn:Bxd gnt:hasTissue gn:tissue_ipc .
gn:Bxd gnt:hasTissue gn:tissue_isl .
gn:Bxd gnt:hasTissue gn:tissue_itc .
gn:Bxd gnt:hasTissue gn:tissue_kid .
gn:Bxd gnt:hasTissue gn:tissue_lathab .
gn:Bxd gnt:hasTissue gn:tissue_lcm_brreg .
gn:Bxd gnt:hasTissue gn:tissue_leaf .
gn:Bxd gnt:hasTissue gn:tissue_liv .
gn:Bxd gnt:hasTissue gn:tissue_livdnam .
gn:Bxd gnt:hasTissue gn:tissue_livmet .
gn:Bxd gnt:hasTissue gn:tissue_livpro .
gn:Bxd gnt:hasTissue gn:tissue_lung .
gn:Bxd gnt:hasTissue gn:tissue_m1c .
gn:Bxd gnt:hasTissue gn:tissue_mam .
gn:Bxd gnt:hasTissue gn:tissue_mamtum .
gn:Bxd gnt:hasTissue gn:tissue_mbr .
gn:Bxd gnt:hasTissue gn:tissue_md .
gn:Bxd gnt:hasTissue gn:tissue_methyl .
gn:Bxd gnt:hasTissue gn:tissue_mfc .
gn:Bxd gnt:hasTissue gn:tissue_musmet .
gn:Bxd gnt:hasTissue gn:tissue_nac .
gn:Bxd gnt:hasTissue gn:tissue_nbcb .
gn:Bxd gnt:hasTissue gn:tissue_neutrophil .
gn:Bxd gnt:hasTissue gn:tissue_ocl .
gn:Bxd gnt:hasTissue gn:tissue_ofc .
gn:Bxd gnt:hasTissue gn:tissue_of_ctx .
gn:Bxd gnt:hasTissue gn:tissue_ova .
gn:Bxd gnt:hasTissue gn:tissue_pcg .
gn:Bxd gnt:hasTissue gn:tissue_pfc .
gn:Bxd gnt:hasTissue gn:tissue_pg .
gn:Bxd gnt:hasTissue gn:tissue_pln .
gn:Bxd gnt:hasTissue gn:tissue_pl_ctx .
gn:Bxd gnt:hasTissue gn:tissue_pons .
gn:Bxd gnt:hasTissue gn:tissue_pro .
gn:Bxd gnt:hasTissue gn:tissue_ret .
gn:Bxd gnt:hasTissue gn:tissue_ret_mirna .
gn:Bxd gnt:hasTissue gn:tissue_ret_sc-rna-s .
gn:Bxd gnt:hasTissue gn:tissue_s1c .
gn:Bxd gnt:hasTissue gn:tissue_sal .
gn:Bxd gnt:hasTissue gn:tissue_sg .
gn:Bxd gnt:hasTissue gn:tissue_skm .
gn:Bxd gnt:hasTissue gn:tissue_spi .
gn:Bxd gnt:hasTissue gn:tissue_spl .
gn:Bxd gnt:hasTissue gn:tissue_stc .
gn:Bxd gnt:hasTissue gn:tissue_str .
gn:Bxd gnt:hasTissue gn:tissue_tc .
gn:Bxd gnt:hasTissue gn:tissue_tes .
gn:Bxd gnt:hasTissue gn:tissue_tes_dna_met .
gn:Bxd gnt:hasTissue gn:tissue_thelp .
gn:Bxd gnt:hasTissue gn:tissue_thy .
gn:Bxd gnt:hasTissue gn:tissue_treg .
gn:Bxd gnt:hasTissue gn:tissue_ute .
gn:Bxd gnt:hasTissue gn:tissue_v1 .
gn:Bxd gnt:hasTissue gn:tissue_vfc .
gn:Bxd gnt:hasTissue gn:tissue_vta .
gn:Bxd gnt:hasTissue gn:tissue_wb .
gn:Bxd gnt:hasTissue gn:tissue_wbc .
gn:Bxd gnt:hasTissue gn:tissue_wbpr .
gn:Bxd gnt:hasTissue gn:tissue_wfat .
gn:Bxd gnt:hasTissue gn:tissue_wfat_pro .
```


## 'dump-species'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT Species.Fullname, Species.SpeciesName, Species.Name, Species.MenuName, Species.FullName, Species.Family, Species.TaxonomyId FROM Species
```

The above query results to triples that have the form:

```text
gn:Species_fullname -> rdf:type -> gnc:species 
gn:Species_fullname -> skos:label -> Species(SpeciesName) 
gn:Species_fullname -> skos:altLabel -> Species(Name) 
gn:Species_fullname -> rdfs:label -> Species(MenuName) 
gn:Species_fullname -> gnt:binomialName -> Species(FullName) 
gn:Species_fullname -> gnt:family -> Species(Family) 
gn:Species_fullname -> gnt:organism -> taxon:Species(TaxonomyId) 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 

SELECT * WHERE { 
    ?s rdf:type gnc:species .
    ?s skos:label "Mouse" .
    ?s skos:altLabel "mouse" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:Mus_musculus rdf:type gnc:species .
gn:Mus_musculus skos:label "Mouse" .
gn:Mus_musculus skos:altLabel "mouse" .
gn:Mus_musculus rdfs:label "Mouse (Mus musculus, mm10)" .
gn:Mus_musculus gnt:binomialName "Mus musculus" .
gn:Mus_musculus gnt:family "Vertebrates" .
gn:Mus_musculus gnt:organism taxon:10090 .
```


## 'dump-strain'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT Strain.Name, Species.Fullname, Strain.Name, IF ((Strain.Name2 != Strain.Name), Strain.Name2, '') AS Name2, IF ((Strain.Alias != Strain.Name), Strain.Alias, '') AS Alias, IF ((Strain.Symbol != Strain.Name), Strain.Symbol, '') AS Symbol FROM Strain LEFT JOIN Species ON Strain.SpeciesId = Species.SpeciesId
```

The above query results to triples that have the form:

```text
gn:Strain_name_ -> rdf:type -> gnc:strain 
gn:Strain_name_ -> gnt:belongsToSpecies -> gn:Species_fullname 
gn:Strain_name_ -> rdfs:label -> StrainName 
gn:Strain_name_ -> rdfs:label -> Name2 
gn:Strain_name_ -> gnt:alias -> Alias 
gn:Strain_name_ -> gnt:symbol -> Symbol 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 

SELECT * WHERE { 
    ?s rdf:type gnc:strain .
    ?s gnt:belongsToSpecies gn:Mus_musculus .
    ?s rdfs:label "B6D2F1" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:B6d2f1 rdf:type gnc:strain .
gn:B6d2f1 gnt:belongsToSpecies gn:Mus_musculus .
gn:B6d2f1 rdfs:label "B6D2F1" .
```


## 'dump-mapping-method'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT MappingMethod.Name, MappingMethod.Name FROM MappingMethod
```

The above query results to triples that have the form:

```text
gn:mappingMethod_mappingmethod_name -> rdf:type -> gnc:mappingMethod 
gn:mappingMethod_mappingmethod_name -> rdfs:label -> MappingMethod(Name) 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 

SELECT * WHERE { 
    ?s rdf:type gnc:mappingMethod .
    ?s rdfs:label "qtlreaper" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:mappingMethod_qtlreaper rdf:type gnc:mappingMethod .
gn:mappingMethod_qtlreaper rdfs:label "qtlreaper" .
```


## 'dump-avg-method'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT AvgMethod.Name, AvgMethod.Normalization FROM AvgMethod
```

The above query results to triples that have the form:

```text
gn:avgmethod_avgmethod_name -> rdf:type -> gnc:avgMethod 
gn:avgmethod_avgmethod_name -> rdfs:label -> AvgMethod(Normalization) 
```
Here's an example query:

```sparql
PREFIX gn: <http://genenetwork.org/id/> 
PREFIX gnc: <http://genenetwork.org/category/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX gnt: <http://genenetwork.org/term/> 
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX taxon: <http://purl.uniprot.org/taxonomy/> 

SELECT * WHERE { 
    ?s rdf:type gnc:avgMethod .
    ?s rdfs:label "MAS5" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:avgmethod_mas5 rdf:type gnc:avgMethod .
gn:avgmethod_mas5 rdfs:label "MAS5" .
```

