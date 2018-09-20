#!/bin/bash
IFS='/' read -ra urls <<< "$1"
val=${urls[-1]}
IFS='=' read -ra queryStringArr <<< $val

#ULR will have runtime shell with ',' instead of '/'
#Replace ',' with '/'
encoded_shell=${queryStringArr[-1]}
shell=$(echo $encoded_shell | tr ',' '/')

#Get container ID from "queryStringArr[-2]"
IFS='&' read -ra conArr <<< ${queryStringArr[-2]}

#Login to container
sudo docker exec -it "${conArr[-2]}" "$shell"
