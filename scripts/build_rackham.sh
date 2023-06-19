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


# Loading the needed modules
module load intel-oneapi compiler

# Show the module list, as requested by Pavlin
module list

# Rackham location (GHA location: source /opt/intel/oneapi/setvars.sh)
# source /sw/comp/intel/oneapi/setvars.sh

icpx main.cpp --verbose -o gha_intel_cpp17

# All FAIL:
# icpx main.cpp --verbose -o gha_intel_cpp17 -I/sw/comp/intel/oneapi/dpl/2022.1.0/linux/include/oneapi/dpl
# icpx main.cpp --verbose -o gha_intel_cpp17 -I/sw/comp/gcc/13.1.0_rackham/include/c++/13.1.0
# icpx main.cpp --verbose -o gha_intel_cpp17 -I/sw/comp/intel/oneapi/tbb/2021.9.0/include
# icpx main.cpp --verbose -o gha_intel_cpp17 -I/sw/comp/intel/oneapi/compiler/2023.1.0/linux/bin-llvm/../compiler/include
# icpx main.cpp --verbose -o gha_intel_cpp17 -I/usr/lib/gcc/x86_64-redhat-linux/4.8.5/../../../../include/c++/4.8.5
# icpx main.cpp --verbose -o gha_intel_cpp17 -I/usr/lib/gcc/x86_64-redhat-linux/4.8.5/../../../../include/c++/4.8.5/x86_64-redhat-linux
# icpx main.cpp --verbose -o gha_intel_cpp17 -I/usr/lib/gcc/x86_64-redhat-linux/4.8.5/../../../../include/c++/4.8.5/backward
# icpx main.cpp --verbose -o gha_intel_cpp17 -I/sw/comp/intel/oneapi/compiler/2023.1.0/linux/lib/clang/16/include
# icpx main.cpp --verbose -o gha_intel_cpp17 -I/usr/local/include
# icpx main.cpp --verbose -o gha_intel_cpp17 -I/usr/include


./gha_intel_cpp17
