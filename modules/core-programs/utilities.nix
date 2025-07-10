{pkgs, ...}:
{   
    environment.systemPackages = with pkgs; [
        btop
        mpv
        zip
        unzip
        python3
        killall
        libnotify
        dunst
    ];
}