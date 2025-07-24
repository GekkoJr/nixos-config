{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    powertop
    thermald
  ];

  services.power-profiles-daemon = {
    enable = true;
  };
}
