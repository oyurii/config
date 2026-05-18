# config
Конфігурація системи для роботи з програмним пакетом LAMMPS:
make yes-body yes-compress yes-manybody yes-plugin yes-openmp yes-phonon yes-opt yes-mc yes-misc yes-meam

Можливо треба буде встановлювати в системі для реалізації багатопотоковості:
sudo apt-get install openmpi-bin 
sudo apt-get install libopenmpi-dev 

Підключення Google-диска:
from google.colab import drive
drive.mount('/root/google_disk')

