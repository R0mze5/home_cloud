server_up:
	cd ./server && docker-compose up -d --build

server_down:
	cd ./server && docker-compose down

display_conf:
	cat ./server/config/peer_homeserver/peer_homeserver.conf

display_mypc_conf:
	cat ./server/config/peer_myPC/peer_myPC.conf

local_prepare:
	cp ./local/.env.example ./local/.env

local_up:
	cd ./local && docker-compose up -d --build

local_down:
	cd ./local && docker-compose down
