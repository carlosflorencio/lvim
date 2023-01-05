--Documentation: https://www.lunarvim.org/docs/languages#multi-languages-per-linterformatter
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  { name = "eslint" },
  {
    command = "shellcheck",
    extra_args = { "--severity", "warning" },
  }
})
