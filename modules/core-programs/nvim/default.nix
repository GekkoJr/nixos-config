{ pkgs, lib,  ... }:
{
  environment.systemPackages = with pkgs; [
    phpactor
    vue-language-server
    vtsls
  ];

  programs.neovim = {
    viAlias = true;
    vimAlias = true;
    enable = true;
    defaultEditor = true;

    configure = {
      customRC = ''
        " custom vimscript
        let mapleader = "\<space>"
        let maplocalleader = "\<space>"

        " nerdtree keybinds
        nnoremap <C-e> :NERDTreeToggle<CR>

        " tabs
        nnoremap th :tabfirst<cr>
        nnoremap tk :tabnext<cr>
        nnoremap tj :tabprev<cr>
        nnoremap tl :tablast<cr>
        nnoremap tn :tabnew<cr>
        nnoremap tc :tabclose<cr>

        " create horizontal window
        nnoremap <c-w>h <c-w>s
      '';
      customLuaRC = lib.fileContents ./init.lua;
      packages.myVimPackage = with pkgs.vimPlugins; {
        # loaded on launch
        start = [
          # utilitys
          fugitive
          vim-nix
          nvim-treesitter.withAllGrammars
          ctrlp
          nerdtree
          toggleterm-nvim

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
