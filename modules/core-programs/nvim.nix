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
        let mapleader = "\<space>"
        let maplocalleader = "\<space>"

        " nerdtree keybinds
        nnoremap <C-e> :NERDTreeToggle<CR>
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
                      ['<C-a>'] = cmp.mapping.abort(),
                      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                      ['<Tab>'] = cmp.mapping(function(fallback)
                      if cmp.visible() then
                        local entry = cmp.get_selected_entry()
                        if not entry then 
                          cmp.select_next_item({ behaviour = cmp.SelectBehavior.Select })
                        end
                        cmp.confirm()
                      else 
                        fallback()
                      end
                      end, {"i", "s",}), 
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

        -- lualine status bar
        require('lualine').setup({
          options = {
            icons_enabled = true,
            theme = "tomorrow_night",

          },
          sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'lsp_status'}, 
            lualine_y = {'filetype'},
            lualine_z = {'location'},
              
          },
        })

      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        # loaded on launch
        start = [
          # utilitys
          fugitive
          vim-nix
          nvim-treesitter.withAllGrammars
          ctrlp
          nerdtree

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

          # status bar
          lualine-nvim
        ];
        # manually loadable by calling `:packadd $plugin-name`
        opt = [ ];
      };
    };
  };

}
