{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    btop
    mpv
    zip
    unzip
    python313
    python313Packages.tkinter
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
  programs.nix-ld.libraries = with pkgs; [
    glibc
    zlib
    qt5.qtbase
    qt5.qtdeclarative
    qt5.qtquickcontrols
    qt5.qtquickcontrols2
    qt5.qtsvg
    qt5.qtgraphicaleffects
  ];
}
