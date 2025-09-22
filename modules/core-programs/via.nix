{ pkgs, ... }:
{
  services.udev = {

    packages = with pkgs; [
      qmk
      qmk-udev-rules
      qmk_hid
      via
    ]; # packages

  }; # udev

  environment.systemPackages = with pkgs; [
    via
    qmk
  ];
}
