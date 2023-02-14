-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver

-- Add "tsserver" to skipped servers - required for manual setup
---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })

local capabilities = require("lvim.lsp").common_capabilities()

-- nvim-ufo
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

-- require("lvim.lsp.manager").setup("tsserver", {
--   capabilities = capabilities,
--   -- on_attach = function(c, b)
--   --   -- require("inlay-hints").on_attach(c, b)
--   --   -- require("lvim.lsp").common_on_attach(c, b)
--   -- end,

--   -- only look for package.json to differentiate from deno repository
--   -- .git => monorepo support
--   root_dir = require("lspconfig").util.root_pattern(".git"),
-- })

require("typescript").setup({
  -- disable_commands = false, -- prevent the plugin from creating Vim commands
  -- debug = false, -- enable debug logging for commands
  -- go_to_source_definition = {
  --     fallback = true, -- fall back to standard LSP definition on failure
  -- },
  server = { -- pass options to lspconfig's setup method
    capabilities = capabilities,

    -- on_attach = function(c, b)
    --   -- require("inlay-hints").on_attach(c, b)
    --   -- require("lvim.lsp").common_on_attach(c, b)
    -- end,

    -- only look for package.json to differentiate from deno repository
    -- .git => monorepo support
    root_dir = require("lspconfig").util.root_pattern(".git"),
  },
})
