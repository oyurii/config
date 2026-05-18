#!/usr/bin/env bash

sudo apt-get install openmpi-bin 
sudo apt-get install libopenmpi-dev 

cd ~/tools/lammps
git clone -b stable https://github.com/lammps/lammps.git .
cd ~/tools/lammps/src
make yes-body yes-compress yes-manybody yes-plugin yes-openmp yes-phonon yes-opt yes-mc yes-misc yes-meam
make mpi

