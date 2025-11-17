-- setting up nix lsp 
vim.lsp.config("nix_ls", {
    -- start command
    cmd = {'nil'},

    -- filetype
    filetypes = {'nix'},

    -- setting workspace root to current nix flake
    root_markers = {'flake.nix'},

    -- settings 
    settings = {
        Nil = {
            formatting = {
                command = {"nixfmt"} -- set formating tool
            }
        }
    }
})