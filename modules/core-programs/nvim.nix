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

        -- setup up nvim cpm (auto complete)
        local cmp = require"cmp"

        cmp.setup({
            snippet = {
                -- THIS IS REQUIRED DO NOT REMOVE 
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body) -- using vsnip
                end,
            },

            mapping = cmp.mapping.preset.insert({
                      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                      ['<C-f>'] = cmp.mapping.scroll_docs(4),
                      ['<C-Space>'] = cmp.mapping.complete(),
                      ['<C-e>'] = cmp.mapping.abort(),
                      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),

            sources = cmp.config.sources({
                { name = "nvim-lsp" },
                { name =  "vsnip"},
                { name = "emoji" }

            }, {
                { name = "buffer" }
            })
        })

        -- setting up lspconfig
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        # loaded on launch
        start = [
          fugitive
          vim-nix
          nvim-treesitter.withAllGrammars
          ctrlp

          #snippets
          cmp-vsnip
          vim-vsnip

          # auto complete
          nvim-cmp
          nvim-lspconfig
          cmp-nvim-lsp
          cmp-buffer
          cmp-emoji
        ];
        # manually loadable by calling `:packadd $plugin-name`
        opt = [ ];
      };
    };
  };

}
