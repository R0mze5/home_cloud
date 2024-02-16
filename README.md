# HOMECLOUD with nextcloud

## Local server with nextcloud prepare

- Download and unarchive project from github

```sh
curl -L -o homecloud.zip https://github.com/R0mze5/home_cloud/archive/refs/heads/main.zip
unzip homecloud.zip -d homecloud
rm homecloud.zip
```

or via git

```sh
git clone https://github.com/R0mze5/home_cloud.git
```

- open `homecloud` folder

```sh
cd ./homecloud
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
unzip homecloud.zip -d homecloud
rm homecloud.zip
```

or via git

```sh
git clone https://github.com/R0mze5/home_cloud.git
```

- open `homecloud` folder and run server

```sh
cd ./homecloud
make server_up
```

## Homecloud configuration

- on `remote server with wireguard` display and copy wireguard config

```sh
make display_conf
```

- and paste it on `local server with nextcloud` to `./local/peer_homeserver.conf` file and save it

- run local `local server with nextcloud` in `homecloud` folder

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

## Bonus

you have own VPN

## FAQ

- how get config for new device [here](./docs/wireguard_users.md)
- how to backup and restore nextcloud [here](./docs/nextcloud_backup.md)
