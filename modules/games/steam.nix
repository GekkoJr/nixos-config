{ pkgs, ... }:
{
  programs.alvr = {
    enable = true;
    openFirewall = true;
  };
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
  ];
}
