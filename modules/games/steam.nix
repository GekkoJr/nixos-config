{ pkgs, ... }:
{

  programs.steam = {
    enable = true;

    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];

    extraPackages = with pkgs; [
      gamescope
    ];

    gamescopeSession.enable = true;

  };

  environment.systemPackages = with pkgs; [
    gamescope
    protontricks
    rpcs3
    r2modman
    nexusmods-app-unfree
  ];
}
