-- Mason install
lvim.lsp.installer.setup.ensure_installed = {
  "html",
  "cssls",
  "dockerls",
  "jsonls",
  "tsserver",
  "bashls",
  "gopls",
  "marksman", -- markdown
  "taplo", -- toml
  "quick_lint_js",
  "vimls",
  "emmet_ls"
}

require("user.lsp.null-ls.formatters")
require("user.lsp.null-ls.linters")
require("user.lsp.null-ls.code_actions")

-- Disable LSP server, don't forget to :LvimCacheReset
---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tailwindcss" })

-- check https://github.com/abzcoding/lvim/blob/main/lua/user/builtin.lua#L286 to setup mappings per language server

-- Manually setup (each should add himself to the skipped_servers list)
require("user.lsp.providers.denols")
require("user.lsp.providers.tsserver")
-- require("user.lsp.providers.jsonls")

-- Enable the ones missing on lunar vim ftplugin/filetype
require("lvim.lsp.manager").setup("marksman")
require("lvim.lsp.manager").setup("taplo")
require("lvim.lsp.manager").setup("quick_lint_js")
require("lvim.lsp.manager").setup("eslint")
require("lvim.lsp.manager").setup("emmet_ls")

-- Disable virtual_text since it's redundant due to lsp_lines.
lvim.lsp.diagnostics.virtual_text = false
