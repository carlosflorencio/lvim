lvim.builtin.telescope.defaults.file_ignore_patterns = { ".git", "node_modules" }
lvim.builtin.telescope.defaults.path_display = { "truncate" }

local layout_config = {
  horizontal = {
    prompt_position = "bottom",
    preview_width = 0.55,
    results_width = 0.8,
  },
  vertical = {
    mirror = false,
  },
  width = 0.87,
  height = 0.87,
  preview_cutoff = 120,
}

lvim.builtin.telescope.pickers.find_files = {
  hidden = true,
  layout_config = layout_config,
  previewer = nil -- show previewer
}

lvim.builtin.telescope.pickers.live_grep = {
  --@usage don't include the filename in the search results
  only_sort_text = true,
  layout_config = layout_config,
  previewer = nil -- show previewer
}

-- lvim.builtin.telescope.extensions.smart_open = {
--   disable_devicons = true,
--   show_scores = true
-- }

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "dap")
  pcall(telescope.load_extension, "notify")
  pcall(telescope.load_extension, "luasnip")
  pcall(telescope.load_extension, "smart_open")
  pcall(telescope.load_extension, "undo")
end
