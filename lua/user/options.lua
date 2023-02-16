lvim.colorscheme            = 'bluloco'
lvim.log.level              = "warn"
lvim.debug                  = false

-- Tab set to two spaces
-- vim.opt.tabstop = 3
-- vim.opt.shiftwidth = 3
-- vim.opt.softtabstop = 3

-- Toggle via :LvimToggleFormatOnSave
lvim.format_on_save.enabled = true
-- lvim.format_on_save.pattern = "*/web/*"

vim.opt.shell               = "/bin/sh" -- fish is slow
vim.opt.smartindent         = false -- needs to be false for correct tsx indentation
vim.opt.swapfile            = false
vim.opt.wrap                = true
vim.opt.hlsearch            = false
vim.opt.relativenumber      = true
vim.opt.scrolloff           = 10
vim.opt.cursorline          = true
vim.o.breakindent           = true

vim.opt.iskeyword:append("-") -- consider string-string as whole word

vim.opt.cmdheight = 0 -- hide command line unless needed

-- folds ufo
vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

lvim.builtin.alpha.enabled = false
lvim.builtin.terminal.active = true
lvim.builtin.project.patterns = { ".git" }

-- disable navic plugin, we use nvim-treesitter-context instead
lvim.builtin.breadcrumbs.active = false

-- disable errors on the same line, floating window should appear
-- https://github.com/LunarVim/LunarVim/blob/ddc86f3a8aaa1afd36cf8f1a46a29a57922efc8a/lua/lvim/lsp/handlers.lua#L7
lvim.lsp.diagnostics.virtual_text = false
