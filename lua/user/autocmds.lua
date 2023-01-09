local group = vim.api.nvim_create_augroup("user-inlay-hints", {})

-- attach inlay-hints to each lsp client
vim.api.nvim_create_autocmd("LspAttach", {
  group = group,
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local validFileTypes = {
      rust = true,
      typescript = true,
      typescriptreact = true,
      javascript = true,
      javascriptreact = true,
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
