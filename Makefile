SHELL := /bin/bash

clean:
	@sudo rm -rf {radarr,seerr,jellyfin,sonarr,lidarr,prowlarr,torrent}/*

setup:
	@sudo mkdir -p {radarr,seerr,jellyfin,sonarr,lidarr,prowlarr}/config \
		torrent/{config,watch,downloads/{incomplete,complete/{radarr,sonarr,lidarr}}}
	@sudo chown -R $$(id -u):$$(id -g) radarr seerr jellyfin sonarr lidarr prowlarr torrent
	@sudo chmod -R 755 radarr seerr jellyfin sonarr lidarr prowlarr torrent

restart-vpn:
	@docker container restart vpn

up:
	@docker compose up -d