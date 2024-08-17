#!/bin/bash 
# todos os comandos devem ser executados com usuário normal

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl start docker
curl -LO https://dl.k8s.io/release/v1.24.2/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client --output=yaml   
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v1.26.0/minikube-linux-amd64
chmod +x minikube
sudo install minikube /usr/local/bin/
sudo usermod -aG docker $USER
sudo systemctl enable --now docker
sudo reboot
minkube start