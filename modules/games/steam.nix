{ pkgs, ... }:
{
  services.wivrn = {
    enable = true;
    openFirewall = true;

    defaultRuntime = true;

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
    protontricks
  ];
}
