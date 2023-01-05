lvim.colorscheme = 'tokyonight'
lvim.log.level = "warn"
lvim.debug = false
lvim.format_on_save.enabled = true

vim.opt.shell = "/bin/sh" -- fish is slow
vim.opt.smartindent = false -- needs to be false for correct tsx indentation
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.hlsearch = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.cursorline = true

vim.opt.iskeyword:append("-") -- consider string-string as whole word
