#!/usr/bin/env bash

#
# Enable docker and docker-compose on TrueNAS SCALE (no Kubernetes)
#
# This script is a hack! Use it at your own risk!!
# Using this script to enable Docker is NOT SUPPORTED by ix-systems!
# You CANNOT use SCALE Apps while using this script!
#
# 1  Create a dedicated Docker dataset in one of your zpools
# 2  Save this script somewhere else on your zpool, not in the Docker dataset
# 3  Edit line 20 of the script, set a path to the Docker dataset you created
# 4  You can now start Docker by running the script from the SCALE console
#
# For these changes to persist after SCALE reboots and upgrades, run the script at start-up
#   Schedule this script to run via System Settings -> Advanced -> Init/Shutdown Scripts
#   Click Add -> Type: Script and choose this script -> When: choose to run as Post Init

## Set a path to your docker dataset
docker_dataset='/mnt/ssd-1tb/docker-standalone'


## HEREDOC: docker/daemon.json
read -r -d '' JSON << END_JSON
{
  "data-root": "${docker_dataset}",
  "storage-driver": "overlay2",
  "exec-opts": [
    "native.cgroupdriver=cgroupfs"
  ],
  "iptables": true,
  "bridge": "",
  "dns": ["192.168.178.1"]
}
END_JSON

## path to docker daemon file
docker_daemon='/etc/docker/daemon.json'

if [ ${EUID} -ne 0 ]; then
  echo "Please run this script as root or using sudo"
elif [ "$(systemctl is-enabled k3s)" == "enabled" ]; then
  echo "You can not use this script while k3s is enabled"
elif [ "$(systemctl is-active k3s)" == "active" ]; then
  echo "You can not use this script while k3s is active"
elif ! which docker &> /dev/null; then
  echo "Docker executable not found"
elif ! chmod +x /usr/bin/docker-compose &> /dev/null; then
  echo "Failed to make docker-compose executable"
elif ! install -d -m 755 -- /etc/docker &> /dev/null; then
  echo "Failed to install directory: /etc/docker"
elif ! zfs list "${docker_dataset}" &> /dev/null; then
  echo "Dataset not found: ${docker_dataset}"
else
  echo "Checking file: ${docker_daemon}"
  if test "${JSON}" != "$(cat ${docker_daemon} 2> /dev/null)"; then
    echo "Updating file: ${docker_daemon}"
    jq -n "${JSON}" > ${docker_daemon}
    if [ "$(systemctl is-active docker)" == "active" ]; then
      echo "Restarting Docker"
      systemctl restart docker
    elif [ "$(systemctl is-enabled docker)" != "enabled" ]; then
      echo "Enable and starting Docker"
      systemctl enable --now docker
    fi
  fi
fi
