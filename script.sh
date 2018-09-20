#!/bin/bash
IFS='/' read -ra urls <<< "$1"
val=${urls[-1]}
IFS='=' read -ra conArr <<< $val

#ULR will have runtime shell with ',' instead of '/'
#Replace ',' with '/'
encoded_shell=${conArr[-1]}
shell=$(echo $encoded_shell | tr ',' '/')

#Login to container
sudo docker exec -it "${conArr[-2]}" "$shell"
