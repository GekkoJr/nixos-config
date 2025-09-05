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

    #include hardware config
    ./hardware-configuration.nix

    # howdy stuff
    "${inputs.howdy-pkg}/nixos/modules/security/pam.nix"
    "${inputs.howdy-pkg}/nixos/modules/services/security/howdy"
    "${inputs.howdy-pkg}/nixos/modules/services/misc/linux-enable-ir-emitter.nix"
  ];

  networking.hostName = "bael";

  # enable networking
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    ollama-rocm
  ];

  #Do not change!
  system.stateVersion = "25.05";
}
