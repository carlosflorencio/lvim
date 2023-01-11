--Documentation: https://www.lunarvim.org/docs/languages#multi-languages-per-linterformatter
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  {
    command = "shellcheck",
    extra_args = { "--severity", "warning" },
  },
  {
    -- github actions
    name = "actionlint"
  },
  { name = "codespell" },
  { name = "fish" },
})
