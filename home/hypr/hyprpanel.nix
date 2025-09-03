{ ... }:
{
  programs.hyprpanel = {
    enable = true;
    settings = {
      bar = {
        layouts = {
          "*" = {
            left = [
              "dashboard"
              "workspaces"
            ];
            middle = [ "media" ];
            right = [
              "volume"
              "battery"
              "clock"
              "systray"
              "notifications"
            ];
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
          showIcon = false;
        };

        spacing = {
          outerSpacing = "8px";
        };
      };

      menus = {
        clock = {
          time = {
            military = true;
            hideSeconds = true;
          };

          weather = {
            enabled = false;
            unit = "metric";
            location = "Oslo";
          };
        };

        dashboard = {
          shortcuts.enabled = false;
          directories.enabled = false;
        };

        power = {
          lowBatteryNotification = true;
          lowBatteryNotificationText = "Battery is running low ($POWER_LEVEL %).\n\nPlease charge soon :p.";
          lowBatteryNotificationTitle = "Warning: Low Power :/";
          lowBatteryThreshold = 20;
        };

      };

      theme = {
        font = {
          name = "JetBrainsMono Nerd Font Propo";
          size = 20;
        };

        notification.opacity = 100;

        bar = {
          menus = {
            opacity = 100;

            menu = {
              notifications = {
                height = "50em";
              };
            };
          };
          transparent = true;
          border.location = "none";
          outer_spacing = "8px";

          buttons = {
            clock = {
              spacing = "0";
            };
          };
        };
      };
    };
  };
}
