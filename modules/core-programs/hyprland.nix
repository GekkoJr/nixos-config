{ pkgs, ... }:
{
  programs.hyprland.enable = true;
  environment.systemPackages = with pkgs; [
    hypridle
    hyprlock
    hyprpaper
    hyprshot
    kitty
    wofi
    wofi
    playerctl
    brightnessctl
    pavucontrol
    xdg-desktop-portal-hyprland
  ];

  programs.xwayland.enable = true;

  fonts.packages = with pkgs; [
    font-awesome
  ];
}
