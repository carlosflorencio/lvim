--Documentation: https://www.lunarvim.org/docs/languages#multi-languages-per-linterformatter
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { name = "prettierd" },
  { name = "fish_indent" },
  -- { name = "eslintd" }
})
