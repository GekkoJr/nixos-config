{pkgs, ...}:
{
    environment.systemPackages = with pkgs; [
        jetbrains.phpstorm
        jetbrains.idea-ultimate
        jetbrains.pycharm-professional
    ];
}