vim.lsp.config("ts_ls", {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        -- it's a hack for nixOS /nix/store/
        location = vim.fs.joinpath(
          vim.fs.dirname(vim.fs.dirname(vim.fn.system "echo -n $(readlink -f $(which vue-language-server))")),
          "lib/node_modules/@vue/language-server"
        ),
        languages = { "vue" },
      },
    },
  },
  filetypes = {
    "typescript",
    "javascript",
    "javascriptreact",
    "typescriptreact",
    "vue",
  },

  root_markers = {"package.json"}
})

vim.lsp.enable("ts_ls")