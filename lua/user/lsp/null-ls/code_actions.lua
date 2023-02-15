--Documentation: https://www.lunarvim.org/docs/languages#multi-languages-per-linterformatter
local code_actions = require("lvim.lsp.null-ls.code_actions")

-- install via Mason
code_actions.setup({
  { name = "gitsigns" },
  { name = "refactoring" },
  { name = "shellcheck" },
  { name = "proselint" },
})

local null_ls = require("null-ls")
null_ls.register({
  require("typescript.extensions.null-ls.code-actions")
})
