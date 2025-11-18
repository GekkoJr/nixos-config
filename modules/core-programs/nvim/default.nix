{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    phpactor
    vue-language-server
    lua-language-server
    nodePackages.typescript-language-server
    nil # nix language server
    pyright
  ];

  environment.etc."xdg/nvim".source = ../nvim;

  programs.neovim = {
    viAlias = true;
    vimAlias = true;
    enable = true;
    defaultEditor = true;
    withNodeJs = true;

    configure = {
      customRC = lib.fileContents ./init.vim;
      customLuaRC = builtins.readFile (
        pkgs.replaceVars ./init.lua {
          vue_typescript_plugin_location = "${pkgs.vue-language-server}/lib/language-tools/packages/language-server";
        }
      );
      packages.myVimPackage = with pkgs.vimPlugins; {
        # loaded on launch
        start = [
          # utilitys
          fugitive
          vim-nix
          nvim-treesitter.withAllGrammars
          ctrlp
          neo-tree-nvim
          toggleterm-nvim

          # theme
          catppuccin-nvim

          #snippets
          cmp-vsnip
          vim-vsnip

          # auto complete
          nvim-cmp
          nvim-lspconfig
          cmp-nvim-lsp
          cmp-buffer
          cmp-emoji

          # lsp
          phpactor

          # status bar
          lualine-nvim
        ];
        # manually loadable by calling `:packadd $plugin-name`
        opt = [ ];
      };
    };
  };

}
