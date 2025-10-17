{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ../../modules/core
    ../../modules/office
    ../../modules/games
    ../../modules/design
    ../../modules/dev

    #include hardware config
    ./hardware-configuration.nix
  ];

  networking.hostName = "bael";

  # enable networking
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    #ollama-rocm
  ];

  #Do not change!
  system.stateVersion = "25.05";

}
