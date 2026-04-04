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

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-filters
      cups-browsed
    ];
  };

  #Do not change!
  system.stateVersion = "25.05";

}
