lvim.builtin.nvimtree.setup.ignore_ft_on_setup = {}
lvim.builtin.nvimtree.setup.ignore_buffer_on_setup = true
lvim.builtin.nvimtree.setup.open_on_setup_file = true
-- lvim.builtin.nvimtree.setup.view.adaptive_size = true
lvim.builtin.nvimtree.setup.view.width = {
  min = 30,
  max = 40
}

lvim.builtin.nvimtree.setup.view.centralize_selection = true

lvim.builtin.nvimtree.setup.renderer.highlight_opened_files = "all"
lvim.builtin.nvimtree.setup.git.ignore = true
lvim.builtin.nvimtree.setup.git.show_on_dirs = false
lvim.builtin.nvimtree.setup.renderer.symlink_destination = false

lvim.builtin.nvimtree.setup.tab = {
  sync = {
    open = true,
    close = true,
    ignore = {},
  },
}

-- lvim.builtin.nvimtree.setup.hijack_directories = {
--   enable = false,
--   auto_open = true,
-- }
-- lvim.builtin.nvimtree.setup.update_to_buf_dir = { enable = false }
-- lvim.builtin.nvimtree.setup.update_cwd = false

-- local function open_nvim_tree(data)
--   -- require("nvim-tree.api").tree.open()
--   require("nvim-tree.api").tree.toggle({ focus = false })
--   -- -- buffer is a real file on the disk
--   -- local real_file = vim.fn.filereadable(data.file) == 1

--   -- -- buffer is a [No Name]
--   -- local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

--   -- -- only files please
--   -- if not real_file and not no_name then
--   --   return
--   -- end

--   -- -- open the tree but don't focus it
--   -- require("nvim-tree.api").tree.toggle({ focus = false })
-- end

-- -- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
