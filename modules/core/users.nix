{ pkgs, ... }:
{
  # it refuses to work in most places so here it is...
  programs.zsh.enable = true;

  # configuring user and shell
  users.defaultUserShell = pkgs.zsh;
  users.users.gekko = {
    isNormalUser = true;
    useDefaultShell = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
