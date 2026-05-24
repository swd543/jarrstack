# Self hosted movie stack

# Setting up
- run `make setup`
- run `make up`

## Service URLs
- Jellyfin: `<hostname>/jellyfin`
- Radarr: `<hostname>/radarr`
- Prowlarr: `<hostname>/prowlarr`
- Sonarr: `<hostname>/sonarr`
- Lidarr: `<hostname>/lidarr`
- Bazarr: `<hostname>/bazarr`
- Seerr: `<hostname>/`
- Transmission: `<hostname>/torrent`

## Configure Jellyfin
- Open `<hostname>/jellyfin` in browser
- Server name `<hostname>`
- Username/password
- Under set up your media libraries, add the following media libraries
- Movies > folders /data/complete/radarr
- Automatically refresh metadata from internet to 30 days (optional)
- Music > folders /data/complete/libarr
- Shows > folders /data/complete/sonarr
- Allow remote access to this server 

## Configure Transmission
- Open `<hostname>/transmission` in browser
- Confirm downloads path is `/downloads`
- Optional: set incomplete dir to `/downloads/incomplete`
- Leave RPC URL as default used by image (`/transmission/`)

## Configure Radarr
- Open `<hostname>/radarr` in browser
- Authentication Method `Forms (Login Page)`
- Authentication required `Disabled for local addresses`
- Username/password
- Media Management root folder: `/downloads/complete/radarr`
- Download client: add Transmission (`vpn`, `9091`, URL Base `/transmission/`)

## Configure Sonarr
- Open `<hostname>/sonarr` in browser
- Authentication Method `Forms (Login Page)`
- Authentication required `Disabled for local addresses`
- Username/password
- Media Management root folder: `/downloads/complete/sonarr`
- Download client: add Transmission (`vpn`, `9091`, URL Base `/transmission/`)

## Configure Lidarr
- Open `<hostname>/lidarr` in browser
- Authentication Method `Forms (Login Page)`
- Authentication required `Disabled for local addresses`
- Username/password
- Media Management root folder: `/downloads/complete/lidarr`
- Download client: add Transmission (`vpn`, `9091`, URL Base `/transmission/`)

## Configure Prowlarr
- Open `<hostname>/prowlarr` in browser
- Add your indexers (tpb)
- Settings -> Apps -> add Radarr, Sonarr, and Lidarr
- Use internal URLs:
- Radarr: `http://radarr:7878`
- Sonarr: `http://sonarr:8989`
- Lidarr: `http://lidarr:8686`
- Paste API key from each app and test/save

## Configure Bazarr
- Open `<hostname>/bazarr` in browser
- Set language profiles
- Add Sonarr and Radarr connections with internal URLs:
- Sonarr: `http://sonarr:8989`
- Radarr: `http://radarr:7878`
- Use API keys from Sonarr/Radarr and test/save

## Configure Seerr
- Open `<hostname>/` in browser
- Select `Configure Jellyfin`
- Complete setup wizard
- Add Jellyfin server using internal URL `http://jellyfin:8096`
- Add Radarr and Sonarr services using internal URLs:
- Radarr: `http://radarr:7878`
- Sonarr: `http://sonarr:8989`

## Recommended setup order
- Jellyfin
- Transmission
- Radarr, Sonarr, Lidarr
- Prowlarr
- Bazarr
- Seerr
