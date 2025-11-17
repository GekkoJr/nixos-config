vim.lsp.config("lua_ls", {
    -- start command
    cmd = { 'lua-language-server'},

    -- filetypes
    filetypes = {'lua'},

    -- root markers (sets workspace to directory where these are found)
    root_markers = {{'.luarc.json', '.luarc.jsonc'}, '.git'},

    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT'
            }
        }
    }
})
vim.lsp.enable("lua_ls")