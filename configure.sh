#!/bin/bash
user=$(logname)

groupadd docker
usermod -aG docker $user
systemctl enable docker
systemctl start docker
