#!/bin/bash
source env.sh

mkdir -p backup/${vault_container}
docker cp ${vault_container}:/data backup/${vault_container}/data

backup_file="backup_$(hostname)_$(date +"%m-%d-%y").tar.gz"
tar czf "${backup_file}" backup
rm -rf backup

rclone copy --create-empty-src-dirs "${backup_file}" "${backend}":"${bucket}/backups/"
