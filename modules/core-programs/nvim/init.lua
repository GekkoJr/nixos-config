-- making nix actually use lua directory, may be redundant?
package.path = package.path .. ";" .. vim.fn.stdpath("config") .. "/lua/?.lua"

-- globals to be replaced by nix build
Globals = {
    vue_typescript_plugin_location = "@vue_typescript_plugin_location@",
}

-- setting up language servers
require("language-servers")

-- enable plugins
require("plugins")

vim.diagnostic.config({
    virtual_text = true,  -- show messages inline
    signs = true,         -- keep gutter signs
    underline = true,
    update_in_insert = false,
})