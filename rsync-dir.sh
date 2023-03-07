#!/bin/bash

if  [ -n "$1" ] 
then
    source $1
else
    echo "Error: missing .env file path"
	exit 1;
fi

if  [ -z "$ssh_port" ] 
then
    ssh_port=22
fi

if  [ -z "$destination_owner_user" ] 
then
    destination_owner_user=www-data
fi

if  [ -z "$destination_owner_group" ] 
then
    destination_owner_group=www-data
fi

if [ -z "$remote_server_ip" ] || [ -z "$ssh_user" ] || [ -z "$ssh_password" ] || [ -z "$source" ] || [ -z "$destination" ]
then
	echo "Error: 5 mandatory env variables expected: remote_server_ip, ssh_user, ssh_password, source, destination"
	exit 1;
fi

mkdir -p $destination

sshpass -p "$ssh_password" rsync  -e "ssh -p $ssh_port"\
        --recursive \
        --update \
        --compress \
        --compress-level 9 \
        --partial \
        --progress \
        --verbose \
        "$ssh_user@$remote_server_ip:$source" $destination

chown -R $destination_owner_user:$destination_owner_group $destination