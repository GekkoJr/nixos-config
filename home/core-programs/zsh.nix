{ ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "laravel"
      ];
    };

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config";
    };
  };
}
