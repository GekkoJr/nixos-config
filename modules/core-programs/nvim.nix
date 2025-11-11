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
        require("catppuccin").setup({flavour = "mocha"})
        vim.cmd.colorscheme "catppuccin"
      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        # loaded on launch
        start = [
          fugitive
          vim-nix
          nvim-treesitter.withAllGrammars
          catppuccin-nvim
        ];
        # manually loadable by calling `:packadd $plugin-name`
        opt = [ ];
      };
    };
  };

}
