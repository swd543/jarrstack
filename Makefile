SHELL := /bin/bash

clean:
	@sudo rm -rf data/{radarr,seerr,jellyfin,sonarr,lidarr,prowlarr,bazarr,torrent}/*

setup:
	@sudo mkdir -p data/{radarr,seerr,jellyfin,sonarr,lidarr,prowlarr,bazarr,torrent} \
		downloads/{incomplete,complete/{radarr,sonarr,lidarr}}
	@sudo chown -R $$(id -u):$$(id -g) data/{radarr,seerr,jellyfin,sonarr,lidarr,prowlarr,bazarr,torrent}
	@sudo chmod -R 755 data/{radarr,seerr,jellyfin,sonarr,lidarr,prowlarr,bazarr,torrent}

restart-vpn:
	@docker container restart vpn

up:
	@docker compose up -d

restart-all:
	@docker compose down && \
		docker compose -f traefik/docker-compose.extended.yml down && \
		docker compose -f traefik/docker-compose.extended.yml up -d && \
		docker compose up -d --remove-orphans

prune:
	@docker system prune -f --volumes 