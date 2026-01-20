-- setup up nvim cpm (auto complete)
local cmp = require"cmp"

cmp.setup({
    snippet = {
        -- THIS IS REQUIRED DO NOT REMOVE 
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- using vsnip
        end,
    },
    -- keybinds for autocomplete 
    mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-a>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                
                -- allows tab for switching selected completion and if only one completes
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

    -- the sources for autocomplete
    sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- the nvim language server, see lua/language-servers for langueges added
        { name =  "vsnip"}, -- snippets
        { name = "emoji" }, -- markdown emojis
	{ name = "vimtex" }, -- latex
	{ name = "path" } -- path completion 
    }, {
        { name = "buffer" }
    })
})
