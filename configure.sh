#!/bin/bash
version=$(./version.sh)

case $version in
  Fedora)
    user=$(logname)
    dnf remove -y docker docker-common docker-selinux docker-engine-selinux docker-engine
    dnf -y install dnf-plugins-core
    dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
    dnf install -y docker-ce docker-compose
    ;;
  Ubuntu)
    user=$SUDO_USER
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    apt-get update
    apt-get install -y docker-ce docker-compose
    ;;
  *)
    echo Unsupported version! Please install docker-ce and docker-compose manually
    exit 1
    ;;
esac
echo "Configuring user for using docker"
groupadd docker
usermod -aG docker $user
echo "Configuring docker service"
systemctl enable docker
systemctl start docker
