#!/bin/bash


if [[ Toolbox-v1.sh != Toolbox-v2.sh ]]; then
echo -e "\e[1;31m"
figlet -f small No Se A Podido Actualizar Toolbox Porque Aun No Hay Una Nueva Actualizacion Disponible
sleep 1.3
bash Toolbox-v1.sh
fi
if [[ Toolbox-v2.sh != Toolbox-v1.sh ]]; then
clear
echo -e "\e[1;33m"
figlet -f small Felicidades Has Actualizado Toolbox A La Versión: 1.2
sleep 1
bash Toolbox-v2.sh
fi
