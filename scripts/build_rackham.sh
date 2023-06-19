#!/bin/bash
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 10:00
#SBATCH --job-name gha_intel_cpp17
#SBATCH --qos=short
#
# Build the project on Rackham, an UPPMAX computer cluster, see
# https://www.uppmax.uu.se/support/user-guides/rackham-user-guide/
#
# Usage:
#
#   ./scripts/build_rackham.sh
#
#  Using sbatch, when being Richel:
#
#   sbatch -A uppmax2023-2-25 -M snowy scripts/build_rackham.sh
#
#  Or using the convenience script:
#
#   ./sbatch_richel.sh
#
if [[ ! -z "${CLUSTER}" ]]; then
  echo "Working on a cluster"
else
  echo "Not working on a cluster, stopping"
  exit 42
fi

date


# Loading intel/2022a and its dependencies
module load bioinfo-tools wrf-python/1.3.1 ABINIT/8.10.3 Amber/20 CDO/1.9.5 GOTM/5.3-221-gac7ec88d MUMPS/5.5.0 CDO/1.9.5 PRISMS-PF/2.1.1 PROJ/8.1.0 Siesta/4.1-b4 Singular/4.1.2 deal.II/9.1.1-intel intel/2022a
# Too old, but easier:
# module load intel/20.4

# Rackham location (GHA location: source /opt/intel/oneapi/setvars.sh)
source /sw/comp/intel/oneapi/setvars.sh

icpx main.cpp --verbose -o gha_intel_cpp17
./gha_intel_cpp17