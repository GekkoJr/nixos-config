{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    btop
    mpv
    zip
    unzip
    python3
    killall
    libnotify
    dunst
    loupe
    nixfmt-rfc-style
    geteduroam
    signal-desktop
    ffmpeg
    appimage-run
    paprefs
  ];

  programs.nix-ld.enable = true;
}
