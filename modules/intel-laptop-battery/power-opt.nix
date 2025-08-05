{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    powertop
  ];

  services.thermald = {
    enable = true;
  };

  services.power-profiles-daemon = {
    enable = true;
  };
}
