#!/bin/bash
source env.sh

echo "Pick an backup:"
rclone lsf "${backend}":"${bucket}/backups/"| grep backup*tar.gz
read filename
rclone copy "${backend}":"${bucket}/backups/${filename}" ./
tar xf "${filename}"

docker-compose restart