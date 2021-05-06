#!/bin/bash
source env.sh

backup_file="appdata_$(hostname)_$(date +"%m-%d-%y").tar.gz"
tar czf "${backup_file}" appdata

rclone copy --create-empty-src-dirs "${backup_file}" "${backend}":"${bucket}/backups/"
