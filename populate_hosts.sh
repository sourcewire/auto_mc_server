#!/bin/bash
IP_ADDRESS=$(cat public_ip.txt)
cat <<EOL > hosts
[minecraft]
$IP_ADDRESS ansible_ssh_private_key_file=~/.ssh/minecraft ansible_user=ubuntu