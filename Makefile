SHELL := /bin/bash

default: up

clean:
	@sudo rm -rf data/{radarr,seerr,jellyfin,sonarr,lidarr,prowlarr,bazarr,torrent}/*

setup:
	@mkdir -p data/{radarr,seerr,jellyfin,sonarr,lidarr,prowlarr,bazarr/config,torrent} \
		downloads/{incomplete,complete/{radarr,sonarr,lidarr}}
	@test -f data/bazarr/config/config.ini || printf '%s\n' '[general]' 'base_url = /bazarr/' > data/bazarr/config/config.ini
	@sudo chown -R $$(id -u):$$(id -g) data/{radarr,seerr,jellyfin,sonarr,lidarr,prowlarr,bazarr,torrent} downloads
	@sudo chmod -R 755 data/{radarr,seerr,jellyfin,sonarr,lidarr,prowlarr,bazarr,torrent} downloads

restart-vpn:
	@docker container restart vpn

up:
	@docker compose up -d --remove-orphans

down:
	@docker compose down

restart-all:
	@docker compose down && \
		docker compose -f traefik/docker-compose.extended.yml down && \
		docker compose -f traefik/docker-compose.extended.yml up -d && \
		docker compose up -d --remove-orphans

prune:
	@docker system prune -f --volumes 