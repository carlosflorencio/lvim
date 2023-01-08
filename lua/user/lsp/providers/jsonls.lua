-- Add "jsonls" to skipped servers - required for manual setup
---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jsonls" })

-- extend lvim default settings
require("lvim.lsp.manager").setup("jsonls", {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
})
