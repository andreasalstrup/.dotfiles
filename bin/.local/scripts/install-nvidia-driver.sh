#!/bin/bash

# https://docs.nvidia.com/datacenter/tesla/driver-installation-guide/debian.html

read DISTRO_NAME DISTRO_VERSION < <(awk -F= '
/^ID=/         {gsub(/"/,"",$2); id=$2}
/^VERSION_ID=/ {gsub(/"/,"",$2); ver=$2}
END {print id, ver}
' /etc/os-release)

DRIVER_VERSION=$(curl -s https://www.nvidia.com/en-us/drivers/unix/ \
        | grep -A1 "Latest Production Branch Version" \
        | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+' \
        | awk 'NR==1 {print $1}')

DRIVER_PACKAGE_VERSION=$(uname -r | awk -F '[-]' '{print "1.0-1_"$3}')

printf "DISTRO_NAME=%s\nDISTRO_VERSION=%s\nDRIVER_VERSION=%s\nDRIVER_PACKAGE_VERSION=%s\n" \
  "$DISTRO_NAME" "$DISTRO_VERSION" "$DRIVER_VERSION" "$DRIVER_PACKAGE_VERSION"
exit 1

# Preparation
sudo apt install linux-headers-$(uname -r)
sudo add-apt-repository contrib

# Local Repository Enablement
wget https://developer.download.nvidia.com/compute/nvidia-driver/${DRIVER_VERSION}/local_installers/nvidia-driver-local-repo-${DISTRO_NAME}${DISTRO_VERSION}-${DRIVER_VERSION}_${DRIVER_PACKAGE_VERSION}.deb
sudo dpkg -i https://developer.download.nvidia.com/compute/nvidia-driver/${DRIVER_VERSION}/local_installers/nvidia-driver-local-repo-${DISTRO_NAME}${DISTRO_VERSION}-${DRIVER_VERSION}_${DRIVER_PACKAGE_VERSION}.deb
exit 1
sudo cp /var/nvidia-driver-local-repo-debian12-580.126.09/nvidia-driver-local-0DC21A72-keyring.gpg /usr/share/keyrings/

# Network Repository Enablement (amd64)
wget https://developer.download.nvidia.com/compute/cuda/repos/${DISTRO_NAME}${DISTRO_VERSION}/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt update

# Selecting a Branch or a Specific Driver version
sudo apt install nvidia-driver-pinning-$(echo $DRIVER_VERSION | grep -o -E '^[^.]*')

# Driver Installation
sudo apt -V install nvidia-open

# Desktop-only System
sudo apt -V install nvidia-driver nvidia-kernel-open-dkms

# Status
nvidia-smi
dkms status

# Reboot the System
echo -e "\n[*] Reboot the System.."
echo "sudo reboot"

# Post-installation Actions
echo -e "\n[*] Post-installation Action.."
echo "cat /proc/driver/nvidia/version"
echo "sudo apt remove --purge nvidia-driver-local-repo\*"

