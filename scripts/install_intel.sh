#!/bin/bash
#
# Install the Intel C++ compiler
#
# Usage:
#
#   ./scripts/install_intel.sh
#   ./install_intel.sh
#
#
wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
sudo apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
rm GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
sudo echo "deb https://apt.repos.intel.com/oneapi all main" | sudo tee /etc/apt/sources.list.d/oneAPI.list
sudo apt-get update
sudo apt install --yes intel-oneapi-compiler-dpcpp-cpp intel-oneapi-mkl-devel
