{
  config,
  pkgs,
  inputs,
  ...
}:
{
  disabledModules = [ "security/pam.nix" ];
  imports = [
    ../../modules/core
    ../../modules/office
    ../../modules/games
    ../../modules/design
    ../../modules/dev
    ../../modules/intel-laptop-battery

    #include hardware config
    ./hardware-configuration.nix

    # howdy stuff
    "${inputs.howdy-pkg}/nixos/modules/security/pam.nix"
    "${inputs.howdy-pkg}/nixos/modules/services/security/howdy"
    "${inputs.howdy-pkg}/nixos/modules/services/misc/linux-enable-ir-emitter.nix"
  ];

  networking.hostName = "asmodeus";

  # enable networking
  networking.networkmanager.enable = true;

  #Do not change!
  system.stateVersion = "25.05";

  services = {
    howdy = {
      enable = true;
      package = inputs.howdy-pkg.legacyPackages.${pkgs.system}.howdy;
      settings = {
        core = {
          abort_if_ssh = true;
        };

        video = {
          dark_threshold = 90;
          device_path = "/dev/video0";
        };
      };
    };

    linux-enable-ir-emitter = {
      enable = true;
      package = inputs.howdy-pkg.legacyPackages.${pkgs.system}.linux-enable-ir-emitter;
    };
  };

}
