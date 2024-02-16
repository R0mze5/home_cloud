# Add new user to wireguard

[<-- go back](../README.md)

## How get key for wireguard client to connect to wireguard server

when you run server compose file, wireguard create client config according Peers field in docker-compose file

```yml
# add new name to PEERS field
-  PEERS=homeserver,myPC,myPhone,myTablet
```

in `./server/docker-compose.yml/config`

select required type of config and add to client in `peer_...` folder in file with `*.conf` name

## How to add new user

- update `PEERS` field

```yml
# add new name to PEERS field
-  PEERS=homeserver,myPC,myPhone,myTablet,myNewUser
```

and run in `server` folder

```sh
docker-compose up -d 
```
