# Facilities

The core GeneNetwork team maintains modern Linux servers and storage
systems for genomic and genetic analysis. These machines are
maintained in the main UTHSC machine room in the Lamar Alexander
Building in Memphis. The whole team has access to this space for
upgrades and hardware maintenance. Issues and work packages are
tracked through a Trello board and we use git repositories for
documentation (all available on request).

This computing facility has four computer racks dedicated to
GeneNetwork related work. Each rack has a mix of Dell PowerEdge
servers (from a few low-end R610s to high performance Dell R7425
64-core systems - tux01 and tux02 - running the GeneNetwork web
services), tux03 with 40 cores, 196 GB RAM and 2x NVIDIA V100 GPU, and
one Computing Relion 2600GT systems - Penguin2 - with NVIDIA Tesla K40
GPU which is used for software development and serves outside facing
less-secure R/shiny and Python web services running in isolated
containers. Effectively we have three decent outward facing servers
which are fully utilized for the GeneNetwork project and OPAR with a
total of 64+64+40+28=196 real cores. Furthermore we have a dedicated
HPC cluster, named Octopus, consisting of 11 PowerEdge R6515 AMD EPYC
7402P 24-Core (total 264 cores; 528 hyperthreaded). These machines
have 128 GB RAM each. The two head nodes are large RAM machines with
1TB each. All these machines run Debian + GNU Guix and use Slurm for
batch submission.  The racks have dedicated high speed Cisco switches
and firewalls which are maintained by UTHSC IT staff.

We also run some 'specials' including an ARM-based NVIDIA Jetson and a
RISC-V [PolarFire
SOC](https://www.cnx-software.com/2020/07/20/polarfire-soc-icicle-64-bit-risc-v-and-fpga-development-board-runs-linux-or-freebsd/). We
have also ordered two RISC-V
[SiFive](https://www.sifive.com/blog/the-heart-of-risc-v-development-is-unmatched)
computers.

In addition to above hardware we have batch submission access to the
cluster computing resource at the Advanced Computing Facility operated
by the UT Joint Institute for Computational Sciences in a secure setup
at the DOE Oak Ridge National Laboratory. We have a 10 Gbit connection
from the machine room at UTHSC to data transfer nodes at the ACF. The
ACF has been upgraded in the past year (see [ACF system
overview](http://www.nics.utk.edu/computing-resources/acf/acf-system-overview)
and now has over 3 PB of high-performance Lustre DDN storage and
contains over 8000 cores with some large RAM nodes and one GPU
node. Drs. Prins and other team members have used ACF systems to
analyze genomic and genetic data sets. In recent developments the ACF
will be moved from ORNL to UT Knoxville in 2021.  We note that we can
not use the ACF compute and storage facilities for public facing web
services because of its stringent security requirements.  The ACF,
however, may come in useful to precompute genomics and genetics
analysis results using standardized pipelines.
