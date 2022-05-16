#########
#!/bin/sh
echo
echo ---------->>>
echo
echo NOTA: Ejecutar con permisos SUDO, despues de ejecutar el script se reiniciara el equipo
echo
echo Fuente: https://www.hiroom2.com/2017/09/24/parrotsec-3-8-docker-engine-en/
echo
set -e
echo
echo Instalar las dependencias necesarias.
echo
sudo apt install -y curl apt-transport-https \
     software-properties-common ca-certificates 
echo
echo Instalar docker
echo
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" | \
  sudo tee /etc/apt/sources.list.d/docker-engine.list
echo
echo  Actualizar sistema e intalar Docker
echo
sudo apt-get update -y
sudo apt-get install -y docker-ce
echo
echo Se ejecutara docker...
echo
sudo systemctl start docker
sudo systemctl enable docker
echo
echo Se Agregara un usuario al grupo docker para usar docker sin el comando sudo.
echo
sudo gpasswd -a "${USER}" docker
echo
echo Se reiniciara el  equipo
echo
sudo reboot
echo 

