#!/usr/bin/env bash

cd  ~/tools/qe

wget https://www.quantum-espresso.org/rdm-download/8/v7-5/c8778718560b4730b9acf1648d65e15b/qe-7.5-ReleasePack.tar.gz
tar -xzvf qe-7.5-ReleasePack.tar.gz
rm qe-7.5-ReleasePack.tar.gz

apt-get update
apt-get install -y gfortran gcc g++ make libfftw3-dev libfftw3-mpi-dev libopenmpi-dev openmpi-bin

make distclean 2>/dev/null || true
rm -f make.inc

./configure MPIF90=mpif90 CC=mpicc F77=mpif90 F90=mpif90 \
  --with-scalapack=no \
  --with-elpa=no

make clean
make all -j2

