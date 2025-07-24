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
  ];
}
