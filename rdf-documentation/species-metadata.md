# Species Metadata
## 'inbred-set'

## Generated Triples:

The following SQL query was executed:

```sql
SELECT InbredSet.Name, InbredSet.FullName, InbredSet.Name, InbredSet.GeneticType, InbredSet.Family, MappingMethod.Name, InbredSet.InbredSetCode, Species.Fullname, IF ((SELECT PublishFreeze.Name FROM PublishFreeze WHERE PublishFreeze.InbredSetId = InbredSet.Id LIMIT 1) IS NOT NULL, 'Traits and Cofactors', '') AS genotypeP, IF ((SELECT GenoFreeze.Name FROM GenoFreeze WHERE GenoFreeze.InbredSetId = InbredSet.Id LIMIT 1) IS NOT NULL, 'DNA Markers and SNPs', '') AS phenotypeP, (SELECT GROUP_CONCAT(DISTINCT Tissue.Short_Name SEPARATOR'||') AS MolecularTraits FROM ProbeFreeze, ProbeSetFreeze, InbredSet, Tissue, Species WHERE ProbeFreeze.TissueId = Tissue.Id AND ProbeFreeze.InbredSetId = InbredSet.Id AND ProbeSetFreeze.ProbeFreezeId = ProbeFreeze.Id ORDER BY Tissue.Name) AS molecularTrait FROM InbredSet LEFT JOIN Species ON InbredSet.SpeciesId=Species.Id LEFT JOIN MappingMethod ON InbredSet.MappingMethodId=MappingMethod.Id
```

The above query results to triples that have the form:

```text
gn:setInbredset_name -> rdf:type -> gnc:set 
gn:setInbredset_name -> rdfs:label -> InbredSet(FullName) 
gn:setInbredset_name -> skos:altLabel -> InbredSet(Name) 
gn:setInbredset_name -> gnt:geneticType -> InbredSet(GeneticType) 
gn:setInbredset_name -> gnt:family -> InbredSet(Family) 
gn:setInbredset_name -> gnt:mappingMethod -> MappingMethod(Name) 
gn:setInbredset_name -> gnt:code -> InbredSet(InbredSetCode) 
gn:setInbredset_name -> gnt:belongsToSpecies -> gn:Species_fullname 
gn:setInbredset_name -> gnt:genotype -> genotypeP 
gn:setInbredset_name -> gnt:phenotype -> phenotypeP 
gn:setInbredset_name -> gnt:hasTissue -> gn:tissue_moleculartrait 
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
    ?s rdf:type gnc:set .
    ?s rdfs:label "BXD Family" .
    ?s skos:altLabel "BXD" .
    ?s gnt:geneticType "riset" .
    ?s ?p ?o .
}
```

Expected Result:

```rdf
gn:setBxd rdf:type gnc:set .
gn:setBxd rdfs:label "BXD Family" .
gn:setBxd skos:altLabel "BXD" .
gn:setBxd gnt:geneticType "riset" .
gn:setBxd gnt:family "Reference Populations (replicate average, SE, N)" .
gn:setBxd gnt:mappingMethod "BXD" .
gn:setBxd gnt:code "BXD" .
gn:setBxd gnt:belongsToSpecies gn:Mus_musculus .
gn:setBxd gnt:genotype "Traits and Cofactors" .
gn:setBxd gnt:phenotype "DNA Markers and SNPs" .
gn:setBxd gnt:hasTissue gn:tissue_a1c .
gn:setBxd gnt:hasTissue gn:tissue_acc .
gn:setBxd gnt:hasTissue gn:tissue_adr .
gn:setBxd gnt:hasTissue gn:tissue_amg .
gn:setBxd gnt:hasTissue gn:tissue_bebv .
gn:setBxd gnt:hasTissue gn:tissue_bla .
gn:setBxd gnt:hasTissue gn:tissue_brmet .
gn:setBxd gnt:hasTissue gn:tissue_brmicrorna .
gn:setBxd gnt:hasTissue gn:tissue_brn .
gn:setBxd gnt:hasTissue gn:tissue_cart .
gn:setBxd gnt:hasTissue gn:tissue_cb .
gn:setBxd gnt:hasTissue gn:tissue_cbc .
gn:setBxd gnt:hasTissue gn:tissue_ctx .
gn:setBxd gnt:hasTissue gn:tissue_dfc .
gn:setBxd gnt:hasTissue gn:tissue_drg .
gn:setBxd gnt:hasTissue gn:tissue_ec .
gn:setBxd gnt:hasTissue gn:tissue_emb .
gn:setBxd gnt:hasTissue gn:tissue_eye .
gn:setBxd gnt:hasTissue gn:tissue_fat .
gn:setBxd gnt:hasTissue gn:tissue_fecmet .
gn:setBxd gnt:hasTissue gn:tissue_femur .
gn:setBxd gnt:hasTissue gn:tissue_gtex_aor .
gn:setBxd gnt:hasTissue gn:tissue_gtex_atr .
gn:setBxd gnt:hasTissue gn:tissue_gtex_blo .
gn:setBxd gnt:hasTissue gn:tissue_gtex_bonm .
gn:setBxd gnt:hasTissue gn:tissue_gtex_bre .
gn:setBxd gnt:hasTissue gn:tissue_gtex_cau .
gn:setBxd gnt:hasTissue gn:tissue_gtex_cer .
gn:setBxd gnt:hasTissue gn:tissue_gtex_cerv .
gn:setBxd gnt:hasTissue gn:tissue_gtex_cml .
gn:setBxd gnt:hasTissue gn:tissue_gtex_col .
gn:setBxd gnt:hasTissue gn:tissue_gtex_colsig .
gn:setBxd gnt:hasTissue gn:tissue_gtex_cor .
gn:setBxd gnt:hasTissue gn:tissue_gtex_ebv .
gn:setBxd gnt:hasTissue gn:tissue_gtex_eso .
gn:setBxd gnt:hasTissue gn:tissue_gtex_esogas .
gn:setBxd gnt:hasTissue gn:tissue_gtex_fal .
gn:setBxd gnt:hasTissue gn:tissue_gtex_fro .
gn:setBxd gnt:hasTissue gn:tissue_gtex_muc .
gn:setBxd gnt:hasTissue gn:tissue_gtex_ner .
gn:setBxd gnt:hasTissue gn:tissue_gtex_pan .
gn:setBxd gnt:hasTissue gn:tissue_gtex_put .
gn:setBxd gnt:hasTissue gn:tissue_gtex_sintter .
gn:setBxd gnt:hasTissue gn:tissue_gtex_skinex .
gn:setBxd gnt:hasTissue gn:tissue_gtex_skisex .
gn:setBxd gnt:hasTissue gn:tissue_gtex_sn .
gn:setBxd gnt:hasTissue gn:tissue_gtex_sto .
gn:setBxd gnt:hasTissue gn:tissue_gtex_sub .
gn:setBxd gnt:hasTissue gn:tissue_gtex_tf .
gn:setBxd gnt:hasTissue gn:tissue_gtex_thy .
gn:setBxd gnt:hasTissue gn:tissue_gtex_tib .
gn:setBxd gnt:hasTissue gn:tissue_gtex_vag .
gn:setBxd gnt:hasTissue gn:tissue_gtex_ven .
gn:setBxd gnt:hasTissue gn:tissue_gtex_vis .
gn:setBxd gnt:hasTissue gn:tissue_gtex_who .
gn:setBxd gnt:hasTissue gn:tissue_gut .
gn:setBxd gnt:hasTissue gn:tissue_hea .
gn:setBxd gnt:hasTissue gn:tissue_hip .
gn:setBxd gnt:hasTissue gn:tissue_hippreccel .
gn:setBxd gnt:hasTissue gn:tissue_hipprot .
gn:setBxd gnt:hasTissue gn:tissue_hip_mirna .
gn:setBxd gnt:hasTissue gn:tissue_hsc .
gn:setBxd gnt:hasTissue gn:tissue_hyp .
gn:setBxd gnt:hasTissue gn:tissue_ifra_ctx .
gn:setBxd gnt:hasTissue gn:tissue_ipc .
gn:setBxd gnt:hasTissue gn:tissue_isl .
gn:setBxd gnt:hasTissue gn:tissue_itc .
gn:setBxd gnt:hasTissue gn:tissue_kid .
gn:setBxd gnt:hasTissue gn:tissue_lathab .
gn:setBxd gnt:hasTissue gn:tissue_lcm_brreg .
gn:setBxd gnt:hasTissue gn:tissue_leaf .
gn:setBxd gnt:hasTissue gn:tissue_liv .
gn:setBxd gnt:hasTissue gn:tissue_livdnam .
gn:setBxd gnt:hasTissue gn:tissue_livmet .
gn:setBxd gnt:hasTissue gn:tissue_livpro .
gn:setBxd gnt:hasTissue gn:tissue_lung .
gn:setBxd gnt:hasTissue gn:tissue_m1c .
gn:setBxd gnt:hasTissue gn:tissue_mam .
gn:setBxd gnt:hasTissue gn:tissue_mamtum .
gn:setBxd gnt:hasTissue gn:tissue_mbr .
gn:setBxd gnt:hasTissue gn:tissue_md .
gn:setBxd gnt:hasTissue gn:tissue_methyl .
gn:setBxd gnt:hasTissue gn:tissue_mfc .
gn:setBxd gnt:hasTissue gn:tissue_musmet .
gn:setBxd gnt:hasTissue gn:tissue_nac .
gn:setBxd gnt:hasTissue gn:tissue_nbcb .
gn:setBxd gnt:hasTissue gn:tissue_neutrophil .
gn:setBxd gnt:hasTissue gn:tissue_ocl .
gn:setBxd gnt:hasTissue gn:tissue_ofc .
gn:setBxd gnt:hasTissue gn:tissue_of_ctx .
gn:setBxd gnt:hasTissue gn:tissue_ova .
gn:setBxd gnt:hasTissue gn:tissue_pcg .
gn:setBxd gnt:hasTissue gn:tissue_pfc .
gn:setBxd gnt:hasTissue gn:tissue_pg .
gn:setBxd gnt:hasTissue gn:tissue_pln .
gn:setBxd gnt:hasTissue gn:tissue_pl_ctx .
gn:setBxd gnt:hasTissue gn:tissue_pons .
gn:setBxd gnt:hasTissue gn:tissue_pro .
gn:setBxd gnt:hasTissue gn:tissue_ret .
gn:setBxd gnt:hasTissue gn:tissue_ret_mirna .
gn:setBxd gnt:hasTissue gn:tissue_ret_sc-rna-s .
gn:setBxd gnt:hasTissue gn:tissue_s1c .
gn:setBxd gnt:hasTissue gn:tissue_sal .
gn:setBxd gnt:hasTissue gn:tissue_sg .
gn:setBxd gnt:hasTissue gn:tissue_skm .
gn:setBxd gnt:hasTissue gn:tissue_spi .
gn:setBxd gnt:hasTissue gn:tissue_spl .
gn:setBxd gnt:hasTissue gn:tissue_stc .
gn:setBxd gnt:hasTissue gn:tissue_str .
gn:setBxd gnt:hasTissue gn:tissue_tc .
gn:setBxd gnt:hasTissue gn:tissue_tes .
gn:setBxd gnt:hasTissue gn:tissue_tes_dna_met .
gn:setBxd gnt:hasTissue gn:tissue_thelp .
gn:setBxd gnt:hasTissue gn:tissue_thy .
gn:setBxd gnt:hasTissue gn:tissue_treg .
gn:setBxd gnt:hasTissue gn:tissue_ute .
gn:setBxd gnt:hasTissue gn:tissue_v1 .
gn:setBxd gnt:hasTissue gn:tissue_vfc .
gn:setBxd gnt:hasTissue gn:tissue_vta .
gn:setBxd gnt:hasTissue gn:tissue_wb .
gn:setBxd gnt:hasTissue gn:tissue_wbc .
gn:setBxd gnt:hasTissue gn:tissue_wbpr .
gn:setBxd gnt:hasTissue gn:tissue_wfat .
gn:setBxd gnt:hasTissue gn:tissue_wfat_pro .
```


## 'species'

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


## 'strain'

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


## 'mapping-method'

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


## 'avg-method'

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

