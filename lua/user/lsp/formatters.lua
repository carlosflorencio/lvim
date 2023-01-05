--Documentation: https://www.lunarvim.org/docs/languages#multi-languages-per-linterformatter
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { name = "prettier" },
  { name = "eslint_d" }
})
