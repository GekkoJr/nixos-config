{pkgs, config, ...}:
{
    stylix = {
        enable = true;
        polarity = "dark";
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
        image = ./wallpaper.jpg;

        # just copied selection from WhatCanICallMySelf on gitlab (shold probably find something better...)
        fonts = {
            serif = {
                name = "Noto Serif";
                package = pkgs.noto-fonts;
            };
            sansSerif = {
                name = "Noto Sans";
                package = pkgs.noto-fonts;
            };
            monospace = {
                name = "JetBrainsMono Nerd Font";
                package = pkgs.nerd-fonts.jetbrains-mono;
            };
            emoji = {
                name = "Noto Color Emoji";
                package = pkgs.noto-fonts-emoji-blob-bin;
        };
        };

    };
}