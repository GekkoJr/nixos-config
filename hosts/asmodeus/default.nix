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
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-filters
      cups-browsed
    ];

  };
  environment.systemPackages = with pkgs; [
    docker
    lmstudio
  ];

  #Do not change!
  system.stateVersion = "25.05";

  virtualisation.docker.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services = {
    howdy = {
      enable = true;
      settings = {
        core = {
          abort_if_ssh = true;
        };

        video = {
          dark_threshold = 70;
          device_path = "/dev/video2";
        };
      };

      control = "sufficient";
    };

    linux-enable-ir-emitter = {
      enable = true;
    };
  };

}
