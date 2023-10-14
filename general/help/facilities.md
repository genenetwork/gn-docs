# Equipment

The core [GeneNetwork team](https://github.com/genenetwork/) maintains modern Linux servers and storage systems for genetic, genomic, pangenome and phenome analyses.
Machines are located in in the main UTHSC machine room of the Lamar Alexander Building at UTHSC (Memphis TN campus).
The whole team has access to this space for upgrades and hardware maintenance.
We use remote racadm and/or ipmi on all important machines.
Issues and work packages are tracked through our 'tissue' [tracker board](https://issues.genenetwork.org/) and we use git repositories for documentation, issue tracking and planning (mostly public and some private repos available on request).
We also run [continuous integration](https://ci.genenetwork.org/) and [continuous deployment](https://cd.genenetwork.org/) services online (CI and CD).

The computing facility has four computer racks dedicated to GeneNetwork-related work.
Each rack has a mix of Dell PowerEdge servers (from a few older low-end R610s, R6515, and two recent R7425 AMD Epyc 64-core 256GB RAM systems - tux01 and tux02 - running the GeneNetwork web services).
We also support several more experimental systems, including a 40-core R7425 system with 196 GB RAM and 2x NVIDIA V100 GPU (tux03), and one Penguin Computing Relion 2600GT systems (Penguin2) with NVIDIA Tesla K80 GPU used for software development and to serve outside-facing less secure R/shiny and Python services that run in isolated containers. Effectively, we have three outward facing servers that are fully used by the GeneNetwork team with a total of 64+64+40+28 = 196 real cores.
We are in the process of installing upgrades to tux01 and tux02 using the latest AMD Genoa EPYC processors adding a total of 96 real CPU cores running at 4GHz. These two machines with 768Gb RAM each will be installed in June 2023.

## Octopus HPC cluster

In 2020 we installed a small but powerful HPC cluster (Octopus) dedicated to [pangenomic](https://www.biorxiv.org/content/10.1101/2021.11.10.467921v1) and [genetic](https://genenetwork.org/) computations, consisting of 11 PowerEdge R6515 AMD EPYC 7402P 24-core CPUs (264 real cores).
Nine of these machines are equipped with 378 GB RAM and two have 1 TB of memory.
All machines have large SSD storage (~10TB) driving 100+ TB shared network storage.
All Octopus nodes run Debian and GNU Guix and use Slurm for batch submission.
We run lizardfs for distributed network file storage and we run the common workflow language (CWL) and Docker containers.
The racks have dedicated 10Gbs high-speed Cisco switches and firewalls that are maintained by UTHSC IT staff.
This heavily used cluster, however, is almost self-managed by its users and was featured on the GNU Guix High Performance Computing [2020](https://hpc.guix.info/blog/2021/02/guix-hpc-activity-report-2020/) and  [2022](https://hpc.guix.info/blog/2023/02/guix-hpc-activity-report-2022/) activity reports! In the near future we expect to double the number nodes.

<table border="0">
<tr>
  <td>
    <img style="margin: 20px 0px;" alt="Octopus HPC" src="https://github.com/genenetwork/gn-docs/raw/master/general/help/octopus.jpg"/>
  </td>
  <td>
    <img style="margin: 20px 0px;" alt="Garrison and Prins" src="https://github.com/genenetwork/gn-docs/raw/master/general/help/garrison-prins.jpg"/>
  </td>
</tr>
</table>

## Backups

We run three Synology servers with a total of 300TB of storage.
We also have an off-site fallback server and encrypted backups in the Amazon cloud for the main web-service databases and files.

## Specials

We also run some 'specials' including an ARM-based NVIDIA Jetson and a
RISC-V [PolarFire
SOC](https://www.cnx-software.com/2020/07/20/polarfire-soc-icicle-64-bit-risc-v-and-fpga-development-board-runs-linux-or-freebsd/).
We
have also two RISC-V
[SiFive](https://www.sifive.com/blog/the-heart-of-risc-v-development-is-unmatched)
computers for development purposes.

Additionally, together with Chris Batten of Cornell and Michael Taylor of the University of Washington, Erik Garrison and Pjotr Prins are UTHSC PIs responsible for leading the NSF-funded [RISC-V supercomputer for pangenomics](https://news.cornell.edu/stories/2021/11/5m-grant-will-tackle-pangenomics-computing-challenge). This supercomputer will come online in 2025.

## ISAAC access

In addition to above hardware the GeneNetwork team has batch submission access to the HIPAA complient cluster computing resource at the ISAAC computing facility operated by the UT Joint Institute for Computational Sciences in a secure setup at the DOE Oak Ridge National Laboratory (ORNL) and on the UT Knoxville campus.
We have a 10 Gbit connection from the machine room at UTHSC to data transfer nodes at ISAAC.  ISAAC has been upgraded in the past year (see [ISAAC system overview](https://oit.utk.edu/hpsc/available-resources/)) and has over 6 PB of high-performance Lustre DDN storage and contains about 18,000 cores with some large RAM nodes and 19 GPU nodes.
Drs. Prins, Garrison, Colonna, Chen, Ashbrook and other team members use ISAAC systems to analyze genomic and genetic data sets.
Note that we can not use ISAAC and storage facilities for public-facing web services because of stringent security requirements.
ISAAC however, can be highly useful for precomputed genomics and genetics results using standardized pipelines.

## Deployment

The software stack is maintained and deployed throughout with GNU Guix, a modern software package manager that allows running Docker and Apptainer (formerly Singularity) containers as well as full system containers and VMs.
All current tools are maintained on [https://gitlab.com/genenetwork/guix-bioinformatics](https://gitlab.com/genenetwork/guix-bioinformatics). Dr&nbsp;Garrison's pangenome tools are packaged on [https://github.com/ekg/guix-genomics](https://github.com/ekg/guix-genomics).

## Cloud computing

In addition the the "bare metal" described above we increasingly use cloud services for running VMs for teaching and fallbacks, as well as for storing data, including backups. Also we depend on cloud services for GPT-type work.
