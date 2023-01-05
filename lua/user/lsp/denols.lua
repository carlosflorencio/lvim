-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#denols
-- https://deno.land/manual@v1.28.3/getting_started/setup_your_environment#neovim-06-using-the-built-in-language-server

-- Add "denols" to skipped servers - required for manual setup
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "denols" })

-- extend lvim default settings
require("lvim.lsp.manager").setup("denols", {
  cmd = { "deno", "lsp" },
  filetypes = {
    "typescript",
  },
  init_options = {
    enable = true,
    lint = true,
    unstable = false,
  },
  -- Look for these files to identify a deno repository
  root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
})
