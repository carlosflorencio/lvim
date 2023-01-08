-- Mason install
lvim.lsp.installer.setup.ensure_installed = {
  "html",
  "cssls",
  "dockerls",
  "jsonls",
  "tsserver",
  "bashls",
  "gopls",
  "marksman",
  "taplo"
}

require("user.lsp.null-ls.formatters")
require("user.lsp.null-ls.linters")
require("user.lsp.null-ls.code_actions")

-- do not forget to :LvimCacheReset
-- eslint is already loaded as linter/formatter/code actions, no need for a dedicated lsp server
---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "eslint" })

-- check https://github.com/abzcoding/lvim/blob/main/lua/user/builtin.lua#L286 to setup mappings per language server

-- Manually setup
require("user.lsp.providers.denols")
require("user.lsp.providers.tsserver")
require("user.lsp.providers.jsonls")

-- Enable
require("lvim.lsp.manager").setup("marksman")
require("lvim.lsp.manager").setup("taplo")


-- tmp until setup rust tools
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my-inlay-hints", {}),
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    if ft ~= "rust" then
      return
    end

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("inlay-hints").on_attach(client, args.buf)
  end,
})
