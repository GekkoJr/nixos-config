{ pkgs, ... }:
{
  programs.neovim = {
    viAlias = true;
    vimAlias = true;
    enable = true;
    defaultEditor = true;

    configure = {
      customRC = ''
        " custom vimscript
      '';
      customLuaRC = ''
        -- custom lua config
        vim.cmd.colorscheme "habamax"
      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        # loaded on launch
        start = [
          fugitive
          vim-nix
          nvim-treesitter.withAllGrammars

        ];
        # manually loadable by calling `:packadd $plugin-name`
        opt = [ ];
      };
    };
  };

}
