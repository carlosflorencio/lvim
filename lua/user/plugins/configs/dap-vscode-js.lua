require("dap-vscode-js").setup({
  -- TODO: fix wrong vim.fn.stdpath("data") paths because of lvim
  debugger_path = vim.fn.expand "~/.local/share/lunarvim/site/pack/packer/opt/vscode-js-debug",
  adapters = { 'pwa-node', 'node-terminal' }
})
