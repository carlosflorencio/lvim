local capabilities = require("lvim.lsp").common_capabilities()

-- nvim-ufo
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

require("lvim.lsp.manager").setup("yamlls", {
  capabilities = capabilities,
})
