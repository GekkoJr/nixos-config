{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      {
        plugin = mini-base16;
        config = ''
          packadd! mini-base16
            lua << END
            require("mini.base16").setup({
              plugins = {
              default = true,
              },
            })
            END 
        '';
      }
      mini-deps
      catppuccin-nvim
    ];
  };
}
