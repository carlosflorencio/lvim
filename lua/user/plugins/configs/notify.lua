local notify = require("notify")

notify.setup({
  render = "minimal",
  timeout = 3000
})

-- filter deprecated notifications
-- local filter_notify = function(text, level, opts)
--   if type(text) == "string" and string.find(text, "See :h deprecated", 1, true) then
--     return
--   end

--   notify(text, level, opts)
-- end

vim.notify = notify
