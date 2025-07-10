{pkgs, ...}:
{
    programs.steam = {
        enable = true;
        
        extraCompatPackages = with pkgs; [
            proton-ge-bin
        ];

        extraPackages = with pkgs; [
            gamescope
        ];
    };
}