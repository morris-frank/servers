#!/bin/bash
source env.sh

echo "Pick an backup:"
rclone lsf "${backend}":"${bucket}/backups/"| grep backup*tar.gz
read filename
rclone copy "${backend}":"${bucket}/backups/${filename}" ./
tar xf "${filename}"
rm ${filename}

# Restore Bitwarden vault
docker stop ${vault_container}
docker cp backup/${vault_container}/data ${vault_container}:/data 
docker start ${vault_container}

rm -rf backup
