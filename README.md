              _______  ._______  ___  ___________________  _____  _________ ___________             
      /\  /\  \      \ |   \   \/  / /   _____/\______   \/  _  \ \_   ___ \\_   _____/ /\  /\      
      \/  \/  /   |   \|   |\     /  \_____  \  |     ___/  /_\  \/    \  \/ |    __)_  \/  \/      
      /\  /\ /    |    \   |/     \  /        \ |    |  /    |    \     \____|        \ /\  /\ 
      /\  \/ \____|__  /___/___/\  \/_______  / |____|  \____|__  /\______  /_______  / \/  \/
      
# NIXSPACE

NixOs configurations includes pkgs config and home profile

## Packages CLI

### Waybar

- Start the Waybar: `waybar`

### SWWW

- Before using swww cli, you must init first. Just run: `swww init`
- Change wallpaper, `swww img <img-path>`

### Cloudflare WARP

- Before run the cloudflare WARP, you must run the daemon: `sudo warp-svc`
- All CLI has described good at `warp-cli --help`

## Commons Linux CLI

### Wifi

- Show hotspot list: `nmcli dev wifi list`
- Check the connection status: `nmcli dev status`
- Turn on wifi radio: `nmcli radio wifi on`
- Connect to a hotspot: `nmcli dev wifi <SSID> password "<Password>"`
