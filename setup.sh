#!/usr/bin/env bash

mkdir -p \
    ~/tools/lammps \
    ~/tools/qe \
    ~/projects/lammps \
    ~/projects/qe \

sudo apt install mc htop

cp -rf ~/config/tools ~
cp -rf ~/config/bin ~
cp -rf ~/config/.bashrc ~/.bashrc
cp -rf ~/config/.selected_editor ~/.selected_editor
cp -rf ~/config/.tmux.conf ~/.tmux.conf

source ~/.bashrc

./quantum_espresso_install.sh
./lammps_install.sh

