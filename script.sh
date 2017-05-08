#!/bin/bash
IFS='/' read -ra urls <<< "$1"
val=${urls[-1]}
IFS='=' read -ra conArr <<< $val
sudo docker exec -it ${conArr[-1]} bash
