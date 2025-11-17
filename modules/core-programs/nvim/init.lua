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
                { name = "nvim_lsp" },
                { name =  "vsnip"},
                { name = "emoji" }

            }, {
                { name = "buffer" }
            })
        })
        -- setting up vue-language-server
        local vue_language_server_path = "${pkgs.vue-language-server}/bin/vue-language-server"
        local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
        local vue_plugin = {
          name = '@vue/typescript-plugin',
          location = vue_language_server_path,
          languages = { 'vue' },
          configNamespace = 'typescript',
        }
        local vtsls_config = {
          settings = {
            vtsls = {
              tsserver = {
                globalPlugins = {
                  vue_plugin,
                },
            },
          },
        },
        filetypes = tsserver_filetypes,
        }

        local ts_ls_config = {
          init_options = {
            plugins = {
              vue_plugin,
            },
          },
          filetypes = tsserver_filetypes,
        }
        local vue_ls_config = {}

        -- setting up lspconfig
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        vim.lsp.config('phpactor', {
          cmd = { 'phpactor', 'language-server' },
          filetypes = { 'php' },
          root_markers = { '.git', 'composer.json', '.phpactor.json', '.phpactor.yml' },
          workspace_required = true,
            init_options = {
              ["language_server_phpstan.enabled"] = false,
              ["language_server_psalm.enabled"] = false,
          },
        capabilities = capabilities,
        })
        vim.lsp.enable('phpactor')

        vim.lsp.config('vtsls', vtsls_config)
        vim.lsp.config('vue_ls', vue_ls_config)
        vim.lsp.config('ts_ls', ts_ls_config)
        vim.lsp.enable({'vtsls', 'vue_ls'})

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

        -- toggleterm 
        require("toggleterm").setup{
          open_mapping = [[<C-\>]],
        