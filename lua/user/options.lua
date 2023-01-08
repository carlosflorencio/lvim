lvim.colorscheme = 'tokyonight'
lvim.log.level = "warn"
lvim.debug = false
lvim.format_on_save.enabled = true

vim.opt.shell = "/bin/sh" -- fish is slow
vim.opt.smartindent = false -- needs to be false for correct tsx indentation
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.relativenumber = true
vim.opt.scrolloff = 999
vim.opt.cursorline = true

vim.opt.iskeyword:append("-") -- consider string-string as whole word
