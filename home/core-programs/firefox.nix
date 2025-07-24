{ pkgs, ... }:
{
  stylix.targets.firefox.enable = false;
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      extensions.force = true;
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        proton-pass
      ];

      search = {
        force = true;
        default = "ddg";
        order = [ "ddg" ];
      };
    };
  };
}
