{pkgs, ...}:
{
    environment.systemPackages = with pkgs; [
        via
    ];
}