{ pkgs, ... }:
{
  programs = {
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
    # enable preference changes saving for xfce/thunar
    xfconf.enable = true;
    # test for archive plugin and neovim wrapper
    file-roller.enable = true;
    # add this after environment.systemPackages, otherwise it won't be found
    dconf.enable = true;
  };
  services = {
    gvfs.enable = true;
    tumbler.enable = true;
  };

  environment.systemPackages = with pkgs; [
    xdg-utils
  ];
}
