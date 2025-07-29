{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../../modules/core
    ../../modules/office
    ../../modules/games
    ../../modules/design
    ../../modules/dev
    ../../modules/intel-laptop-battery

    #include hardware config
    ./hardware-configuration.nix
  ];

  networking.hostName = "asmodeus";

  # enable networking
  networking.networkmanager.enable = true;

  #Do not change!
  system.stateVersion = "25.05";

  environment.systemPackages = [ pkgs.howdy.howdy ];
}
