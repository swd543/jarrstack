SHELL := /bin/bash

clean:
	@sudo rm -rf {radarr,seerr,jellyfin,sonarr,lidarr,prowlarr,bazarr,torrent}/*

setup:
	@sudo mkdir -p {radarr,seerr,jellyfin,sonarr,lidarr,prowlarr,bazarr}/config \
		torrent/{config,watch,downloads/{incomplete,complete/{radarr,sonarr,lidarr}}}
	@sudo mkdir -p bazarr/config/config
	@sudo test -f bazarr/config/config/config.ini || sudo sh -c "printf '%s\n' '[general]' 'base_url = /bazarr/' > bazarr/config/config/config.ini"
	@sudo chown -R $$(id -u):$$(id -g) radarr seerr jellyfin sonarr lidarr prowlarr bazarr torrent
	@sudo chmod -R 755 radarr seerr jellyfin sonarr lidarr prowlarr bazarr torrent

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