# Data structures


* Species, e.g. 'Mouse', are split into groups, such as 'BXD bone studies'
* A group can contain multiple families (see rat below) divided into subgroups
* A trait, e.g. 'body weight' is a vector of data points the belongs to a study
* A genotype vector can be a trait
* A trait is always a member of group
* A trait is part of a study/sample described in metadata
* Theoretically traits can belong to multiple groups
* An attribute can be a trait
* An attribute can be a cofactor (also a vector)
* An attribute is like a trait, but not used in computations, other than as a cofactor
* Attributes are editable by group owners
* We can have shared vocabulary for traits and attributes

But

* A trait is shown with attributes as cofactors
* A cofactor can be a trait
* A cofactor can be an attribute
* A cofactor is not stored in the database - it is an optional vector

(cofactors and attributes and traits overlap)

## Groups

In GN datasets are organised in groups. On the main menu you can see
BXD datasets are grouped into BXD aged hippocampus or BXD bone studies
reflecting higher level interests. Groups are formed around a strain
(here BXD) and are linked to experiments, or sample lists.
A group, family, cohort, population is almost always a set of N cases or
individuals or isogenic animals treated as "individuals".  The BXD family
of strains is a good and complex example. We can treat the 100+ BXD strains
as if they were 100 "genetic" individuals and collapse traits for 10
animals each into one value with an error term. Or we can treat all 100 x
10 animals as actual individuals. Even though we use the same animals in
both cases, they are treated in GN as two separate GROUPS.

From a computational perspective a GROUP is a set that can be used to
compute correlations among traits. Coming back to the two BXD groups (N =
100 strain means; or N = 1000 individuals), we can only
compute correlations within either mean data or individual data.

Groups are maintained in the inaptly named 'InbredSet' table. E.g.

```
MariaDB [db_webqtl]> select * from InbredSet limit 3;
+----+-------------+-------------------+--------+-----------+-------------------+--------+-----------------+-------------+--------------------------------------------------+-------------+-------------+---------------+
| Id | InbredSetId | InbredSetName     | Name   | SpeciesId | FullName          | public | MappingMethodId | GeneticType | Family                                           | FamilyOrder | MenuOrderId | InbredSetCode |
+----+-------------+-------------------+--------+-----------+-------------------+--------+-----------------+-------------+--------------------------------------------------+-------------+-------------+---------------+
|  1 |           1 | BXD               | BXD    |         1 | BXD Family        |      2 | 1               | riset       | Reference Populations (replicate average, SE, N) |           1 |           0 | BXD           |
|  2 |           2 | B6D2F2 OHSU Brain | B6D2F2 |         1 | B6D2F2 OHSU Brain |      2 | 1               | intercross  | Crosses, AIL, HS                                 |           3 |           0 | NULL          |
|  4 |           4 | AXB/BXA           | AXBXA  |         1 | AXB/BXA Family    |      2 | 1               | NULL        | Reference Populations (replicate average, SE, N) |           1 |           0 | AXB           |
+----+-------------+-------------------+--------+-----------+-------------------+--------+-----------------+-------------+--------------------------------------------------+-------------+-------------+---------------+
3 rows in set (0.000 sec)
```


## What is a trait?

A trait is a vector of floats or integers for a GROUP. Body weight
is a simple example of a trait. Eye color, if coded numerically, is a
trait.

A trait will usually have metadata, but the trait data itself boils
down to single vector of values for a specific group that can be used
to compute univariate statistics, (means, variances, etc),
correlations between traits within a group, maps of trait variance for
that group, and higher order properties. A trait could be a vector of
more complex numerical types than just scalars. But up to now all
traits that we have mapped or studied in GN are just simple vectors of
numbers.

Traits can also be genotypes that are coded as integers (usually). Some
genotypes are coded as floats if genotype probabilities.

In GeneNetwork a single trait value (a scalar) always belongs to a
genetically-defined unit/case/individual/clone/strain/F1 hybrid. A single
trait vector (what I usually mean when I talk about a trait) always belongs
to at least one GROUP.

A trait vector can belong to multiple Groups if the groups overlap in
membership. For example, the rat Hybrid Rat Diversity Population (HRDP)
consists of the HXB family, the LEXF family, and a bunch of other inbred
rat strains. HRDP traits can therefore be split into subgroups. This is a
pain from a programming perspective, since a data matrix of TRAITS-by-GROUP
may be a sparse matrix. And the GUI become more complex, since the user may
want to slice and dice the GROUP in multiple ways, for example—just map the
HXB family, just map the LEXF family, or map everything together.

## Case attributes

Case attributes, such as body weight or gene expression, are
"strain/sample metadata" at the group level. All traits within a group
share the same sample list. The other way, case attribute are
connected to samples within a group.

An attribute can be any trait as defined above, or it can be a short
alphanumeric code used primarily as a cofactor in analysis. Sex is a good
example of an attribute that can be coded as an integer (0 or 1 or
x=unknown) and used computationally as if it were any other trait, or it
can be coded as M and F and use for display and as a cofactor. But some
attributes are not even cofactors. For example, an Attribute column may
define which strains or cases were used in Study X by Roy et al in 2021. In
this situation, the GUI and the attribute are used to quickly sort or
select or exclude particular cases.

Attributes are a recent addition to GeneNetwork. The motivation was to
provide the user with a display of the most important cofactors of a
study.  For example, in our large study of lifespan in the BXD mice,
we wanted to provide "low level" data on each individual animal.

In this situation, the sex, strain, diet, aar tag number, resource
reference ID, the epoch of the BXD strain (when the BXD strain was made),
and even the study in which cases were specifically used—all of those are
considered attributes.

The last three attribute columns that you see in the screenshot below
(KM20, SR21, EW21) refer to three papers (e.g. SR21 = Suheeta Roy 2021)
that have used subsets of these animals. None of these attributes are used
directly in computations. They are used to sort and filter. But notice that
one of these ATTRIBUTES is also  the most important trait in this study—the
Longevity column attribute is the same as the VALUE (Trait BDL_10001). This
highlights the fact that a trait can become an attribute, but not all
attributes can become traits. Who would compute a correlation against ear
tag number?

=> https://genenetwork.org/show_trait?trait_id=10001&dataset=BXD-LongevityPublish

Attributes generally belong to a GROUP, not to an individual TRAIT. But
for display purposes, every trait will show a set of ATTRIBUTES. This is a
source of potential confusion.

Who can edit case attributes?  Attributes should only be editable by
the GROUP owner or perhaps by GeneNetwork curators.

How do we make sure we can compare attributes between datasets if the
naming is haphazard?  Attributes are only a GROUP property (e.g. BXD
Family, AKXD Family, GTEx). The way I think about them today, they
cannot be used computationally across GROUPS. They can be used across
traits within GROUPS.

Can we have global case attributes?  We could have shared vocabulary
for attributes, but I do not know how a global case attribute would be
used computationally.  For example, sex, age, body weight, lab
identifiers, date of analysis, will almost always be useful attributes
(and also some of those are traits) no matter what the GROUP, provided
the GROUP consists of true individuals.  So a common vocabulary of
ATTRIBUTES make great sense, but computationally ATTRIBUTES as I think
about them today, belong just to a group (or overlapping set of
groups).

However, it would be cool to compare differences in gene expression in
the liver of BXD mice, HXD rats, and GTEx humans as a function of sex
and age.
