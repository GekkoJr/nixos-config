{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jetbrains.phpstorm
    jetbrains.idea
    jetbrains.pycharm
    jetbrains.webstorm
  ];
}
