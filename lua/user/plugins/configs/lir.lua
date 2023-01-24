local actions = require "lir.actions"
local clipboard_actions = require 'lir.clipboard.actions'

lvim.builtin.lir.mappings["<C-x>"] = actions.split
lvim.builtin.lir.mappings["<C-v>"] = actions.vsplit
lvim.builtin.lir.mappings["<esc>"] = actions.quit
lvim.builtin.lir.mappings["a"] = actions.newfile
lvim.builtin.lir.mappings["r"] = actions.rename
lvim.builtin.lir.mappings["I"] = actions.toggle_show_hidden

lvim.builtin.lir.mappings["c"] = clipboard_actions.copy
lvim.builtin.lir.mappings["x"] = clipboard_actions.cut
lvim.builtin.lir.mappings["p"] = clipboard_actions.paste
