#!/bin/bash
user=$(logname)

dnf remove docker docker-common docker-selinux docker-engine-selinux docker-engine
dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
dnf install docker-ce docker-compose
groupadd docker
usermod -aG docker $user
systemctl enable docker
systemctl start docker
