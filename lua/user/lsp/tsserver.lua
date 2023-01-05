-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver

-- Add "tsserver" to skipped servers - required for manual setup
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })

-- extend lvim default settings
require("lvim.lsp.manager").setup("tsserver", {
  -- only look for package.json to differentiate from deno repository
  -- .git => monorepo support
  root_dir = require("lspconfig").util.root_pattern(".git"),
})
