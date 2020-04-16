#!/bin/bash


if [[ Toolbox-v1.sh != Toolbox-v2.sh ]]; then
clear
echo -e "\e[1;31m"
figlet -f small No Se A Podido Actualizar Toolbox Porque Aun No Hay Una Nueva Actualizacion Disponible
sleep 5
bash Toolbox-v1.sh
fi
