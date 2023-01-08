--Documentation: https://www.lunarvim.org/docs/languages#multi-languages-per-linterformatter
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  {
    name = "eslint",
    runtime_condition = function()
      local file = vim.api.nvim_buf_get_name(0)

      -- disable for certain paths
      if string.find(file, "web/packages/shared%-lib/") or
          string.find(file, "web/packages/seed%-data/") or
          string.find(file, "web/packages/firebase%-scripts/") or
          string.find(file, "web/packages/fetch%-firestore%-data/")
      then
        return false
      end


      return true
      -- return require("lspconfig").utils.root_pattern(
      --   "eslint.config.js",
      --   -- https://eslint.org/docs/user-guide/configuring/configuration-files#configuration-file-formats
      --   ".eslintrc",
      --   ".eslintrc.js",
      --   ".eslintrc.cjs",
      --   ".eslintrc.yaml",
      --   ".eslintrc.yml",
      --   ".eslintrc.json"
      -- -- "package.json"
      -- )(vim.api.nvim_buf_get_name(0)) ~= nil
    end
  },
  {
    command = "shellcheck",
    extra_args = { "--severity", "warning" },
  }
})
