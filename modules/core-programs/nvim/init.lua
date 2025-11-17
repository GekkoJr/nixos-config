-- making nix actually use lua directory, may be redundant?
package.path = package.path .. ";" .. vim.fn.stdpath("config") .. "/lua/?.lua"

-- setting up lspconfig
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- setting up language servers
require("language-servers")

-- enable plugins
require("plugins")