{
  pkgs,
  lib,
  username,
  ...
}:
{
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

  };

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #time zone
  time.timeZone = "Europe/Oslo";

  environment.systemPackages = with pkgs; [
    neovim
    wget
    curl
    git
    neofetch
  ];

  security.polkit.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  hardware.graphics.enable = true;
}
