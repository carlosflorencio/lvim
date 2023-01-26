-- A global group for all the config autocommands
local group = vim.api.nvim_create_augroup("MyConfigGroup", {})

-- attach inlay-hints to each lsp client
vim.api.nvim_create_autocmd("LspAttach", {
  group = group,
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local validFileTypes = {
      rust = true,
      -- typescript = true,
      -- typescriptreact = true,
      -- javascript = true,
      -- javascriptreact = true,
      -- lua = true,
    }

    local ft = vim.bo[args.buf].filetype
    if not validFileTypes[ft] then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    require("inlay-hints").on_attach(client, bufnr)
  end,
})

-- cf uses prettier tabWidth of 3
vim.api.nvim_create_autocmd({ "BufEnter", "BufRead" }, {
  group = group,
  pattern = {
    "*/Careerfairy/web/**/*.ts",
    "*/Careerfairy/web/**/*.js",
    "*/Careerfairy/web/**/*.json",
    "*/Careerfairy/web/**/*.yml",
  },
  callback = function()
    vim.bo.tabstop = 3
    vim.bo.shiftwidth = 3
    vim.bo.softtabstop = 3
  end,
})


-- vim.api.nvim_create_autocmd({ 'User' }, {
--   pattern = "SessionLoadPost",
--   group = group,
--   callback = function()
--     print("here")
--     vim.notify("here")
--     require('nvim-tree').toggle(false, true)
--   end,
-- })
