clean:
	@sudo rm -rf radarr/* seerr/* jellyfin/* sonarr/* torrent/*

setup:
	@sudo mkdir -p radarr seerr jellyfin sonarr torrent
	@sudo chown -R $$(id -u):$$(id -g) radarr seerr jellyfin sonarr torrent
	@sudo chmod -R 755 radarr seerr jellyfin sonarr torrent