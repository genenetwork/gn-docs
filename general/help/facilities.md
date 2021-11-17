# Facilities

The core [GeneNetwork team](https://github.com/genenetwork/) maintains
modern Linux servers and storage systems for genetic, genomic, and
phenome analyses. Machines are located in four racks in the main UTHSC
machine room of the Lamar Alexander Building at UTHSC (Memphis TN
campus). The whole team has access to this space for upgrades and
hardware maintenance. We use remote racadm and/or ipmi on all
important machines. Issues and work packages are tracked through a
Trello board and we use git repositories for documentation (all
available on request).

This computing facility has four computer racks dedicated to
GeneNetwork-related work. Each rack has a mix of Dell PowerEdge servers
(from a few older low-end R610s, R6515, and two recent R7425 AMD Epyc
64-core 256GB RAM systems - tux01 and tux02 - running the GeneNetwork
web services). We also support several more experimental systems,
including a 40-core R7425 system with 196 GB RAM and 2x NVIDIA V100 GPU
(tux03), and one Penguin Computing Relion 2600GT systems (Penguin2) with
NVIDIA Tesla K80 GPU used for software development and to serve
outside-facing less secure R/shiny and Python services that run in
isolated containers. Effectively, we have three outward facing servers
that are fully used by the GeneNetwork team with a total of 64+64+40+28
= 196 real cores.

## Octopus HPC cluster

Late 2020 we added a small HPC cluster (Octopus), consisting of 11
PowerEdge R6515 AMD EPYC 7402P 24-core CPUs (264 real cores). Nine of
these machines are equipped with 128 GB RAM and two nodes have 1 TB of
memory. Octopus is designed for pangenomics work without HIPAA
restrictions. All Octopus nodes run Debian and GNU Guix and use Slurm
for batch submission. We run lizardfs for distributed network file
storage and we run the common workflow language (CWL) and Docker
containers. The racks have dedicated high-speed Cisco switches and
firewalls that are maintained by UTHSC IT staff. This heavily used
cluster, however, is almost self-managed by its users and was featured
on the GNU Guix High Performance Computing [2020 Activity
Report](https://hpc.guix.info/blog/2021/02/guix-hpc-activity-report-2020/)!
In 2021 we expect to double the number nodes.

<img style="width: 40%; margin: 20px 0px;" alt="Octopus HPC" src="https://github.com/genenetwork/gn-docs/raw/master/general/help/octopus.jpg"/>

## Backups

We run three Synology servers with a total of 300TB of storage. We
also have an off-site fallback server and encrypted backups in the
Amazon cloud for the main web-service databases and files. We plan to
expand backup storage in the summer of 2021.

## Specials

We also run some 'specials' including an ARM-based NVIDIA Jetson and a
RISC-V [PolarFire
SOC](https://www.cnx-software.com/2020/07/20/polarfire-soc-icicle-64-bit-risc-v-and-fpga-development-board-runs-linux-or-freebsd/). We
have also ordered two RISC-V
[SiFive](https://www.sifive.com/blog/the-heart-of-risc-v-development-is-unmatched)
computers.

## ISAAC access

In addition to above hardware the GeneNetwork team also has batch
submission access to the HIPAA complient cluster computing resource at
the ISAAX computing facility operated by the UT Joint Institute for
Computational Sciences in a secure setup at the DOE Oak Ridge National
Laboratory (ORNL) and on the UT Knoxville campus. We have a 10 Gbit
connection from the machine room at UTHSC to data transfer nodes at
ISAAC.  ISAAC has been upgraded in the past year (see [ISAAC system
overview](http://www.nics.utk.edu/computing-resources/acf/acf-system-overview))
and now has over 3 PB of high-performance Lustre DDN storage and
contains over 8000 cores with some large RAM nodes and several GPU
nodes. Drs. Prins, Garrison, Chen, Ashbrook and other team members use
ISAAC systems to analyze genomic and genetic data sets. Note that we
can not use ISAAC and storage facilities for public-facing web
services because of stringent security requirements.  ISAAC however,
can be highly useful for precomputed genomics and genetics results
using standardized pipelines.

## Deployment

The software stack is maintained and deployed throughout with GNU Guix,
a modern software package manager. All current tools are maintained on
http://git.genenetwork.org/guix-bioinformatics/guix-bioinformatics. Dr
Garrison's pangenome tools are packaged on
https://github.com/ekg/guix-genomics.
