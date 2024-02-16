# Backup and restore nextcloud data

[<-- go back](../README.md)

## Manually backup

<https://github.com/offen/docker-volume-backup>

```sh
docker exec nextcloud_backup backup
```

## Restoring a volume from a backup

compose and stop containers to create volumes if they not exist:

```sh
docker-compose up
docker-compose down
```

check name of created volumes

```sh
docker volume list
```

>names of volumes have format `[DOCKER_COMPOSE_PREFIX]_[VOLUME_NAME]`
>
> DOCKER_COMPOSE_PREFIX in default is your project directory name
>
> VOLUME_NAME is the data-volume container name from compose file
>
>if our project is placed in `cloud` folder, volumes call `cloud_nextcloud-app` and `cloud_nextcloud-db`

restore volumes:

```sh
# create temp container and connect required volumes to it. we use alpine as image of temp container

docker run -d -it --name temp_restore_container -v cloud_nextcloud-app:/nextcloud_app -v cloud_nextcloud-db:/nextcloud_db -v cloud_backup:/nextcloud_backup alpine

# copy our backup file from backup folder to temp container backup folder

docker cp ./backups/backup-latest.tar.gz temp_restore_container:/nextcloud_backup
```

attach temp docker container and restore volumes data

```sh
docker attach temp_restore_container
# extract backup archive
tar -C /nextcloud_backup -xvf  /nextcloud_backup/backup-latest.tar.gz
# copy all data of app and db
cp -a /nextcloud_backup/backup/nextcloud-app-backup/. /nextcloud_app
cp -a /nextcloud_backup/backup/nextcloud-db-backup/. /nextcloud_db
exit
```

clear temp data

```sh
docker stop temp_restore_container
docker rm temp_restore_container
docker volume rm cloud_backup
```
