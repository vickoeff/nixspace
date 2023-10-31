{
  inputs,
  lib,
  config,
  pkgs,
  environment,
  ...
}:
{
   home.username = "vicko";
   home.homeDirectory = "/home/vicko";

   nixpkgs = {
     overlays = [
     ];
     config = {
       allowUnfree = true;
       allowUnfreePredicate = _: true;
     };
   };

   nix = {
     package = pkgs.nix;
     settings.experimental-features = [ "nix-command" "flakes" ];
   };

   home.packages = with pkgs; [
     xclip
     waybar
     brightnessctl
     swww
     # Another apps
     vlc
   ];

   programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "bottom";
        position = "bottom";
        height = 30;
        output = [
          "eDP-1"
          "HDMI-A-1"
        ];
        modules-left = [ "clock" ];
        modules-right = [ "battery" ];
 
        "battery" = {
          tooltip = true;
          interval = 60;
          states = {
            warning = 20;
            critical = 10;
          };
          format = "{capacity}%";
  	      max-length = 25;
        };

        "clock" = {
          format-alt = "{:%a, %d. %b  %H:%M}";
        };
      };
     };
    style = ''
      * {
            border: none;
            border-radius: 0;
            font-family: Roboto, Helvetica, Arial, sans-serif;
            font-size: 13px;
            min-height: 0;
        }

        window#waybar {
           background: transparent;
           padding: 1rem;
           color: rgba(0, 0, 0, 0.8);
        }

        tooltip {
          background: rgba(43, 48, 59, 0.5);
          border: 1px solid rgba(100, 114, 125, 0.5);
        }

        tooltip label {
          color: white;
        }
        
        #workspaces button {
            background: transparent;
            color: white;
        }

        #workspaces button.focused {
            background: transparent;
            border-bottom: 1px solid #99ff33;
        }
        
        #workspaces button.hover {
            background: transparent;
            border-bottom: 1px solid white;
        }

        #mode, #clock, #battery {
            padding: 4px 8px;
        }

        #mode {
            background: #64727D;
            border-bottom: 3px solid white;
        }

        #clock {
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.2);
            border-top-right-radius: 30px;
            border-bottom-right-radius: 30px;
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.2);
            color: rgba(255, 255, 255, 0.8);
            border: 1px solid rgba(255, 255, 255, 0.8);
            border-left-color: transparent;
            margin-right: 8px;
        }

        #battery {
            color: rgba(255, 255, 255, 0.8);
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.8);
            border-right-color: transparent;
            border-top-left-radius: 30px;
            border-bottom-left-radius: 30px;
            margin-left: 8px;
        }

        #battery.charging {
            color: white;
            border-color: #26A65B;
            background-color: #26A65B;
        }

        @keyframes blink {
            to {
                background-color: #ffffff;
                color: black;
            }
        }

        #battery.warning:not(.charging) {
            background: #f53c3c;
            border-color: #f53c3c;
            color: white;
            animation-name: blink;
            animation-duration: 0.5s;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
            animation-direction: alternate;
        }
    '';
   };

   programs.home-manager.enable = true;
   programs.git = {
     enable = true;
     userName = "vickoeff";
     userEmail = "vic.eff3@gmail.com";
   };

   home.stateVersion = "23.05";
}
