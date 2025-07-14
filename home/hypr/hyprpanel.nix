{...}: 
{
    programs.hyprpanel = {
        enable = true;
        settings = {
            bar = {
                layouts = {
                    "*" = {
                        left = [ "dashboard" "workspaces" ];
                        middle = [ "media" ];
                        right = [ "volume" "battery" "clock" "systray" "notifications" ];
                    };
                };
                
                launcher = {
                    autoDetectIcon = true;
                };

                workspaces = {
                    #1show_numbered = true;
                    showWsIcons = true;
                    showApplicationIcons = true;
                };

                clock = {
                    format = "%R";
                };
            };

            menus = {
                clock = {
                    time = {
                        military = true;
                        hideSeconds = true;
                    };

                    weather = {
                        unit = "metric";
                        location = "Oslo";
                    };
                };
            };

            theme = {
                font = {
                    name = "Recursive Sans Casual Static Italic";
                    size = "16";
                };

                notification.opacity = 80;

                bar = {
                    menus.opacity = 100;
                    transparent = true;
                    border.location = "none";
                };
            };
        };
    };
}