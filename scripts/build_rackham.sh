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

# 'intel-oneapi' is a complex module:
# after loading it, one adds modules from it, 
# e.g. loading the compiler with: 'module load intel-oneapi compiler'
# Use 'll /sw/comp/intel/oneapi/modulefiles' to see those secondary modules.

module load gcc/13.1.0 intel-oneapi compiler
icpx main.cpp --verbose -o gha_intel_cpp17
./gha_intel_cpp17
