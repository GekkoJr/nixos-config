{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ftb-app
    prismlauncher
  ];
}
