vim.lsp.config("ts_ls", {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = Globals.vue_typescript_plugin_location,
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

  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
})

vim.lsp.config("vue_ls", {})
vim.lsp.enable("ts_ls")
vim.lsp.enable("vue_ls")