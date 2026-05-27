{ ... }:
{
  services.wayle = {
    enable = true;
    settings = {
      bar = {
        bg = "transparent";
        button-variant = "basic";
        layout = [
          {
            center = [ "media" ];
            left = [
              "dashboard"
              "clock"
              "hyprland-workspaces"
            ];
            monitor = "*";
            right = [
              "volume"
              "battery"
              "bluetooth"
              "network"
              "systray"
              "notifications"
            ];
            show = true;
          }
        ];
        module-gap = 0.4;
      };
      modules = {
        clock = {
          format = "%H : %M";
          icon-show = false;
        };
        dashboard = {
          dropdown-lock-command = "hyprlock";
        };
        hyprland-workspaces = {
          app-icons-show = true;
          display-mode = "none";
        };
        media = {
          format = "{{ artist }}  - {{ title }}";
        };
        network = {
          label-show = false;
        };
        systray = {
          item-gap = 0.75;
        };
      };
      styling = {
        palette = {
          bg = "#11111b";
          blue = "#74c7ec";
          elevated = "#1e1e2e";
          fg = "#cdd6f4";
          fg-muted = "#bac2de";
          green = "#a6e3a1";
          primary = "#b4befe";
          red = "#f38ba8";
          surface = "#181825";
          yellow = "#f9e2af";
        };
      };
      wallpaper = {
        engine-enabled = false;
      };
    };
  };
}
