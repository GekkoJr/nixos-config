{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ../../modules/core
    #		../../modules/office
    ../../modules/games
    #		../../modules/design
    ../../modules/dev

    #include hardware config
    ./hardware-configuration.nix
  ];

  networking.hostName = "kimaris";

  # enable networking
  networking.networkmanager.enable = true;

  #Do not change!
  system.stateVersion = "25.05";
}
