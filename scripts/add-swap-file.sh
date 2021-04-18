#!/usr/bin/env bash

dd if=/dev/zero of=/swapfile bs=128M count=16 &&
chmod 600 /swapfile &&
mkswap /swapfile &&
swapon /swapfile &&
swapon -s &&
echo "/swapfile swap swap defaults 0 0"| sudo tee -a /etc/fstab
