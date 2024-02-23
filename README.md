# HOMECLOUD with nextcloud and wireguard client

## Local server with nextcloud prepare

- Download and unarchive project from github

```sh
curl -L -o homecloud.zip https://github.com/R0mze5/home_cloud/archive/refs/heads/main.zip
unzip homecloud.zip -d home_cloud
rm homecloud.zip
```

or via git

```sh
git clone https://github.com/R0mze5/home_cloud.git
```

- open `home_cloud` folder

```sh
cd ./home_cloud
```

- copy example env file to .env

```sh
make local_prepare
```

- fill fields on in `./local/.env` file if required

## Remote server with wireguard setup

- install `curl` or `git`, `docker` with `docker compose` and `make` if they not installed yet

- Download and unarchive project from github

```sh
curl -L -o homecloud.zip https://github.com/R0mze5/home_cloud/archive/refs/heads/main.zip
unzip homecloud.zip
mv home_cloud-main home_cloud
rm homecloud.zip
```

or via git

```sh
git clone https://github.com/R0mze5/home_cloud.git
```

- open `home_cloud` folder and run server

```sh
cd ./home_cloud
make server_up
```

## Homecloud configuration

- on `remote server with wireguard` display and copy wireguard config

```sh
make display_conf
```

- and paste it on `local server with nextcloud` to `./local/peer_homeserver.conf` file and save it

- run local `local server with nextcloud` in `home_cloud` folder

```sh
make local_up
```

## Configuration testing

- download and install [wireguard client]("https://www.wireguard.com/install/") on another device, NOT ON `Local server with nextcloud`

- display and copy config for new device

```sh
make display_mypc_conf
```

- paste config to your device

- connect to wireguard server

- try to connect to `homecloud` in browser by url `http://10.13.13.2`

if not connected, try to restart `local server with nextcloud` in `home_cloud` folder

```sh
make local_down
make local_up
```

also after browser success connection, you can download nextcloud app and connect there

## Bonus

you have own VPN

## FAQ

- how get config for new device [here](./docs/wireguard_users.md)
- how to backup and restore nextcloud [here](./docs/nextcloud_backup.md)
- how to integrate onlyoffice to nextcloud [here](./docs/onlyoffice.md)
- how to backup and restore webtrees [here](./docs/webtrees_backup.md)
