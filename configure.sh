#!/bin/bash
user=$(logname)
version=$(./version.sh)

case $version in
  Fedora)
    dnf remove -y docker docker-common docker-selinux docker-engine-selinux docker-engine
    dnf -y install dnf-plugins-core
    dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
    dnf install -y docker-ce docker-compose
    ;;
  *)
    echo Unsupported version! Please install docker-ce and docker-compose manually
    exit 1
    ;;
esac
groupadd docker
usermod -aG docker $user
systemctl enable docker
systemctl start docker
