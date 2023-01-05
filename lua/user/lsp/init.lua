lvim.lsp.installer.setup.ensure_installed = {
  "html", "cssls", "dockerls", "jsonls", "eslint", "tsserver", "bashls", "gopls", "marksman", "taplo"
}

require("user.lsp.formatters")
require("user.lsp.linters")
require("user.lsp.code_actions")


-- do not forget to :LvimCacheReset
---@diagnostic disable-next-line: missing-parameter
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "denols", "tsserver" })

-- LspConfig:  https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- LunarVim:   https://www.lunarvim.org/docs/languages
require("user.lsp.denols")
require("user.lsp.tsserver")

-- Manually enable
-- require("lvim.lsp.manager").setup("marksman")
-- require("lvim.lsp.manager").setup("taplo")
