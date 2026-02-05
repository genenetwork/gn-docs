# Equipment

The core [GeneNetwork team](https://github.com/genenetwork/) and [Pangenome team](https://github.com/pangenome) at UTHSC maintains modern Linux servers and storage systems for genetic, genomic, pangenome, pangenetics, and phenome analyses. Machines are located in in the main UTHSC machine room of the Lamar Alexander Building at UTHSC (Memphis TN campus).
This is a physically secure location with raised floors and an advanced fire extinguishing system.
We have access to this space for upgrades and hardware maintenance.

We use remote racadm and/or ipmi to all machines for out-of-band maintenance.
Issues and work packages are tracked through our 'tissue' [tracker board](https://issues.genenetwork.org/) and we use git repositories for documentation, issue tracking and planning (mostly public and some private repos available on request).
We also run [continuous integration](https://ci.genenetwork.org/) and [continuous deployment](https://cd.genenetwork.org/) services online (CI and CD).
At FOSDEM 2023 Arun Isaac presented tissue, our [minimalist git+plain text issue tracker](https://archive.fosdem.org/2023/schedule/event/tissue/) that allowed us to move away from github soure code hosting and github issue trackers.

The computing facility has four computer racks dedicated to GeneNetwork-related work and pangenomics. Each rack has a mix of Dell PowerEdge servers (from a few older low-end R610s, R6515, and three R7425 AMD Epyc systems - tux01 and tux02 - running development and experimental web services). In 2023 we added two machines to upgrade from tux01 and tux02 -- named tux04 and tux05 resp. --- that have the latest Dell Poweredge R6625 AMD Genoa EPYC processors adding a total of 96 real CPU cores running at 4GHz. These two machines have 768Gb RAM each.
We also support several experimental systems, including a 40-core R7425 system with 196 GB RAM and 2x NVIDIA V100 GPU (tux03), and one Penguin Computing Relion 2600GT systems (Penguin2) with NVIDIA Tesla K80 GPU used for software development and to serve outside-facing less secure R/shiny and Python services that run in isolated containers.
Effectively, we have outward facing servers that are fully utilized by the GeneNetwork team with a total of 64+64+40+28 = 196 real cores.

## Octopus HPC cluster

In 2020 we installed a powerful HPC cluster (Octopus) dedicated to
[pangenomic](https://pubmed.ncbi.nlm.nih.gov/39433878/)
and [genetic](https://genenetwork.org/) computations, consisting of 11
PowerEdge R6515 AMD EPYC 7402P 24-core CPUs (264 real cores).
In 2023 we added 5 new R6625 AMD Genoa machines adding a total of 240 real
CPU cores running at 4GHz (i.e., a total of 504 real CPU cores).
Nine of these machines are equipped with 378 GB RAM, five R6625 have 768 GB
and two R6515 have 1 TB of memory.
All machines have large SSD storage (~10TB) driving the MooseFS distributed shared
network storage. MooseFS is flexible in its storage policies. MooseFS is configured with three storage classes: 2CP
(default) with one copy on SSD and one on RAID5 spinning HDD for
redundancy, scratch for fast non-redundant SSD access, and raid5 for
archival storage on spinning disks. For high throughput we also define multiple copies on the network storage (e.g. 4CP).
All Octopus nodes run Debian and GNU Guix and use Slurm for batch
submission.
We can run the common
workflow language (CWL), Docker, and Apptainer containers amongst other solutions.
The racks have dedicated 10Gbs high-speed Cisco switches and firewalls that
are maintained by UTHSC IT staff.
This heavily used cluster, notably, is almost self-managed by its users and
 features on the GNU Guix High Performance Computing [2020](https://hpc.guix.info/blog/2021/02/guix-hpc-activity-report-2020/),
 [2022](https://hpc.guix.info/blog/2023/02/guix-hpc-activity-report-2022/),
 [2023](https://hpc.guix.info/blog/2024/02/guix-hpc-activity-report-2023/),
 and
 [2024](https://hpc.guix.info/blog/2025/02/guix-hpc-activity-report-2024/)
activity reports!

The total number of cores for Octopus has essentially doubled to a total of
504 real CPU cores and the MooseFS SSD distributed network storage is
getting close to 250TB with fiber optic interconnect.

<table border="0" style="width:95%">
<tr>
  <td>
    <img style="margin: 20px 0px" alt="Octopus HPC" width="100%"  src="
https://github.com/genenetwork/gn-docs/raw/master/general/help/combi.jpg"/>
  </td>
</tr>
</table>

## Lambda server

We also run a 128 real core AMD EPYC 7713 Lambda server (2023) with 1TB
RAM, 40TB nvme storage AND 8x NVIDIA RTX6000: a total of approx. 145,000
compute cores for large language models (LLMs) and AI.

## Backups

For backups we run three Synology servers with a total of 300TB of storage.
On demand we also deploy an off-site fallback server and encrypted backups
in the Amazon cloud for the main web-service databases and files.

## Specials

We run some 'specials' including an ARM-based NVIDIA Jetson and a
RISC-V [PolarFire
SOC](https://www.cnx-software.com/2020/07/20/polarfire-soc-icicle-64-bit-risc-v-and-fpga-development-board-runs-linux-or-freebsd/
).
We
have also two RISC-V
[SiFive](https://www.sifive.com/blog/the-heart-of-risc-v-development-is-unmatched)
computers for development purposes.

Additionally, together with Chris Batten of Cornell and Michael Taylor of
the University of Washington, Erik Garrison and Pjotr Prins are UTHSC PIs
responsible for leading the NSF-funded [RISC-V supercomputer for
pangenomics](https://news.cornell.edu/stories/2021/11/5m-grant-will-tackle-pangenomics-computing-challenge).
This RISC-V supercomputer 'in a rack' will come online in 2026.

## ISAAC access

In addition to above hardware the GeneNetwork team has batch submission
access to the HIPAA complient cluster computing resource at the ISAAC
computing facility operated by the UT Joint Institute for Computational
Sciences in a secure setup at the DOE Oak Ridge National Laboratory (ORNL)
and on the UT Knoxville campus.
We have a 10 Gbit connection from the machine room at UTHSC to data
transfer nodes at ISAAC.  ISAAC is continuously being upgraded (see [ISAAC
system overview](https://oit.utk.edu/hpsc/available-resources/)) and has
over 7 PB of high-performance Lustre DDN storage and contains over 20,000
cores with some large RAM nodes and 32 GPU nodes.
Drs. Prins, Garrison, Colonna, Chen, Ashbrook and other team members use
ISAAC systems to analyze genomic and genetic data sets.
Note that we can not use ISAAC and storage facilities for public-facing web
services because of stringent security requirements.
ISAAC however, can be highly useful for precomputed genomics and genetics
results using standardized pipelines.

## Deployment

The software stack is maintained and deployed throughout with GNU Guix, a
modern software package manager that allows running Docker and Apptainer
(formerly Singularity) containers as well as full system containers and VMs.
All current tools are maintained on [
https://gitlab.com/genenetwork/guix-bioinformatics](https://gitlab.com/genenetwork/guix-bioinformatics).
Dr&nbsp;Garrison's pangenome tools are packaged on [https://github.com/ekg/guix-genomics](https://github.com/ekg/guix-genomics).

## Cloud computing

In addition the the "bare metal" described above we increasingly use cloud
services for running VMs for teaching and fallbacks, as well as  for
storing data, including backups.
