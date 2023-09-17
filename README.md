# hephaistos-gui
A graphical user interface to swap screen resolutions for the [Hephaistos widescreen mod](https://github.com/nbusseneau/hephaistos/tree/main)

## Requirements
- [Hephaistos](https://github.com/nbusseneau/hephaistos/tree/main) installed and patched
- See https://github.com/nbusseneau/hephaistos/tree/main
- [hephaistos-gui.sh](https://raw.githubusercontent.com/apolopena/hephaistos-gui/main/src/hephaistos-gui.sh) with executable permissions installed next to the hephaistos binary in the Hades game folder.

## Steam Deck Installation
Although you can run this script on just about any Linux system, `hephaistos-gui.sh` is most useful when run in Game Mode on the Steam Deck so you can patch the screen resolution back to 16:9 or 16:10 without having to go back to Desktop Mode.

### Installation
1. Download https://raw.githubusercontent.com/apolopena/hephaistos-gui/main/src/hephaistos-gui.sh to your Hades game folder
2. Set permissions to be executable by opening a terminal in your Hades game folder and run the command ```bash chmod +x hephaistos-gui.sh```
3. Add `hephaistos.sh` as a non steam game so you can run it from your Steam Deck in Game Mode or just run it from your terminal with the command: ```bash ./hephaistos-gui.sh```

