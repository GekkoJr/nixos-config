{ pkgs, ... }:
{
  programs.thunderbird = {
    enable = true;
    package = pkgs.thunderbird;

    profiles = {
      default = {
        isDefault = true;
      };
    };
  };
}
