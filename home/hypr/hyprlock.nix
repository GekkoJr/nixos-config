{ config, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        #				hide_cursor = true;
      };

      background = {
        monitor = "";
        path = "${config.stylix.image}";
        blur_passes = 0;
      };

      input-field = {
        monitor = "";
        size = "200,30";
        position = "0, 20";
        valign = "bottom";
        fade_on_empty = true;
      };
    };
  };
}
