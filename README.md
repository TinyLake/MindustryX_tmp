![Logo](core/assets-raw/sprites/ui/logo.png)

### About MindustryX
Two Purpose:
* Add more useful apis to `core`, which can be use by mods/plugins.
* More features/optimizations for `server`.

All change should be compatible with official client.(can be optional with client support)  
This project will publish more frequently than the upstream.

### Build
This project will only release server builds.
Core api will be available in Jitpack.

If you'd rather compile on your own, `gradlew server:dist`.

### Version rule
`v144.102` match the upstream version `v144.1`, `02` is the MDTX patch version(begin with 1, reset each large version)

### Commit Tag
* S: server only change.
* SO: server and optional client.
* SC: server and client all need to update, otherwise will disable.
* C: client only change.
* API: no effect, pure api for mod/plugin.
* fix: fix bug of previous feature
* None tag means not game change.

### Features
See `./patches/`.

## Contribution
1. execute `scripts/applyPatches` then work in `work/`
2. commit your feature in `work/`, then `scripts/genPatches.sh` and commit in root.