{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = [
        pkgs.vscode-extensions.bbenoist.nix # nix support
        pkgs.vscode-extensions.ms-python.python # python support
        pkgs.vscode-extensions.leonardssh.vscord # Discord rich prescence
        #pkgs.vscode-extensions.eww-yuck.yuck # eww (not supportet?)
      ];
    };
  };
}
