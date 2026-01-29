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

  environment.systemPackages = with pkgs; [
    ollama
  ];

  #Do not change!
  system.stateVersion = "25.05";

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
