lvim.builtin.dap.on_config_done = function(dap)
  dap.adapters.node2 = {
    type = "executable",
    command = vim.fn.stdpath "data" .. "/mason/bin/node-debug2-adapter",
  }


  dap.configurations.typescript = {
    {
      name = "Launch",
      type = "node2",
      request = "launch",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
      -- outFiles = function()
      --   local cwd = vim.fn.getcwd()
      --   print(vim.inspect(cwd))
      --
      --   -- local cwd = vim.fn.getcwd()
      --   --   if string.find(cwd, "Geartrack/web-app/browser-api")
      --   --     return {""}
      --   --
      --   return {
      --     "${workspaceFolder}/apps/browser-api/build/**/*.js",
      --     -- "/Users/carlosflorencio/Projects/Geartrack/web-app/apps/browser-api/build/src/scraper/__tests__/*.js",
      --   }
      -- end,
      outFiles = {
        "${workspaceFolder}/apps/browser-api/build/**/*.js",
      },
    },
    {
      name = "Jest (Node2 with ts-node)",
      type = "node2",
      request = "launch",
      cwd = vim.loop.cwd(),
      runtimeArgs = { "--inspect-brk", "${workspaceFolder}/node_modules/.bin/jest" },
      runtimeExecutable = "node",
      args = { "${file}", "--runInBand", "--coverage", "false" },
      sourceMaps = true,
      port = 9229,
      skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
    {
      name = "Jest 2",
      type = "node2",
      request = "launch",
      program = "${workspaceFolder}/node_modules/jest/bin/jest.js",
      args = {
        "—verbose",
        "—runInBand",
        "—config",
        "—forceExit",
        "jest-unit.config.json",
        "${file}",
      },
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      restart = true,
      protocol = "inspector",
      console = "integratedTerminal",
    },
  }


end
