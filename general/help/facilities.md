# Facilities

The core GeneNetwork team maintains modern Linux servers and storage
systems for genetic, genomic, and phenome analyses. Machines are
located in the main UTHSC machine room of the Lamar Alexander
Building in at UTHSC (Memphis campus). The whole team has access to this space for
upgrades and hardware maintenance. Issues and work packages are
tracked through a Trello board and we use git repositories for
documentation (all available on request).

This computing facility has four computer racks dedicated to
GeneNetwork-related work. Each rack has a mix of Dell PowerEdge
servers (from a few low-end R610s, high performance Dell R6515, and two R7425
64-core systems - tux01 and tux02 - running the GeneNetwork web
services). We also support several more experimental systems, including a 40-core system with 196 GB RAM and 2x NVIDIA V100 GPU (tux03), and one Penguin Computing Relion 2600GT systems (Penguin2) with a NVIDIA Tesla K40
GPU used for software development and to serve outside-facing
less secure R/shiny and Python  services that run in isolated
containers. Effectively, we have three  outward facing servers
that are fully used by  GeneNetwork teams with a
total of 64+64+40+28 = 196 real cores. In late 2020 we set up a small
HPC cluster (Octopus), consisting of 11 PowerEdge R6515 AMD EPYC
7402P 24-core CPUs (264 cores). Most of these machines
are equipped with 128 GB RAM, but two  nodes have 1 TB of memory. 
All Octopus nodes run Debian and GNU Guix and use Slurm for
batch submission. All racks have dedicated high-speed Cisco switches
and firewalls that are maintained by UTHSC IT staff.

We also run some 'specials' including an ARM-based NVIDIA Jetson and a
RISC-V [PolarFire
SOC](https://www.cnx-software.com/2020/07/20/polarfire-soc-icicle-64-bit-risc-v-and-fpga-development-board-runs-linux-or-freebsd/). We
have also ordered two RISC-V
[SiFive](https://www.sifive.com/blog/the-heart-of-risc-v-development-is-unmatched)
computers.

In addition to above hardware we have batch submission access to the
cluster computing resource at the ISAAX computing facility operated
by the UT Joint Institute for Computational Sciences in a secure setup
at the DOE Oak Ridge National Laboratory and on the UT Knoxville campus. We have a 10 Gbit connection
from the machine room at UTHSC to data transfer nodes at ISAAC. 
ISAAC has been upgraded in the past year (see [ISAAC system
overview](http://www.nics.utk.edu/computing-resources/acf/acf-system-overview)
and now has over 3 PB of high-performance Lustre DDN storage and
contains over 8000 cores with some large RAM nodes and several GPU
nodes. Drs. Prins and other team members have used ISAAC systems to
analyze genomic and genetic data sets. Note that we can
not yet use ISAAC and storage facilities for public-facing web
services because of stringent security requirements.  ISAAC
however, will be highly useful for "precomputing" genomics and genetics
 results using standardized pipelines.
