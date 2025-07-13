{pkgs, ...}: 
{
    environment.systemPackages = with pkgs; [
        nodePackages_latest.nodejs
    ];
}