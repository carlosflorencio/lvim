local neotest = require("neotest")
local neotestLib = require("neotest.lib")

neotest.setup({
  diagnostic = {
    enabled = true,
    severity = 1
  },
  quickfix = {
    enabled = false,
    open = false
  },
  adapters = {
    require('neotest-jest')({
      jestCommand = "npx jest",
      -- jestConfigFile = "jest.config.ts",
      -- env = { CI = false },
      cwd = function(path)
        local root = neotestLib.files.match_root_pattern("package.json")(path)

        -- vim.notify("found root " .. root)
        return root
      end,

      -- strategy_config = function(args)

      --   vim.notify("strategy_config")
      --   print("strategy config" .. vim.inspect(args))

      --   return {

      --   }
      -- end
    }),
  }
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("cf-autoruntests", { clear = true }),
  pattern = "*.test.ts",
  callback = function()
    local path = vim.api.nvim_buf_get_name(0)

    vim.schedule(function()
      neotest.run.run(path)
    end)

    -- vim.notify("Running Tests", "info", {
    --   timeout = 1000
    -- })
  end
})
