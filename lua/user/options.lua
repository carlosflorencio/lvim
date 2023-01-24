lvim.colorscheme = 'bluloco'
lvim.log.level = "warn"
lvim.debug = false

-- Toggle via :LvimToggleFormatOnSave
lvim.format_on_save.enabled = true
-- lvim.format_on_save.pattern = "*/web/*"

vim.opt.shell          = "/bin/sh" -- fish is slow
vim.opt.smartindent    = false -- needs to be false for correct tsx indentation
vim.opt.swapfile       = false
vim.opt.wrap           = false
vim.opt.hlsearch       = false
vim.opt.relativenumber = true
vim.opt.scrolloff      = 999
vim.opt.cursorline     = true

vim.opt.iskeyword:append("-") -- consider string-string as whole word

vim.opt.cmdheight = 0 -- hide command line unless needed

-- folds ufo
vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

lvim.builtin.alpha.enabled = false
