#!/bin/bash

#
# Install LightGBM script
# 


# Install dependecies ----
apt-get -y install ocl-icd-opencl-dev libboost-dev libboost-system-dev libboost-filesystem-dev
Rscript -e "install.packages(c('roxygen2', 'data.table', 'devtools'))"


# Install LightGBM ----
# WARN: go to RStudio terminal
# clone LightGBM
git clone --recursive https://github.com/Microsoft/LightGBM
# set use_gpu to TRUE in R-package/src/install.libs.R 
cd LightGBM
Rscript build_r.R
cd ~


# Validate installation ----
Rscript -e "library(lightgbm)"


# References ----
# 1. https://lightgbm.readthedocs.io/en/latest/Installation-Guide.html#id17
# 2. https://github.com/Microsoft/LightGBM/blob/master/docs/Installation-Guide.rst#build-gpu-version
