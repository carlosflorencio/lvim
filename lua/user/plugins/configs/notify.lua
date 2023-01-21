local notify = require("notify")

notify.setup({
  render = "minimal",
  timeout = 3000
})

vim.notify = notify
