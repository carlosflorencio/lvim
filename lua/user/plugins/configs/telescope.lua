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

lvim.builtin.telescope.pickers = {
  find_files = {
    layout_config = layout_config,
    previewer = nil -- show previewer
  },
  live_grep = {
    layout_config = layout_config,
    previewer = nil
  },
}

lvim.builtin.telescope.defaults.file_ignore_patterns = { ".git", "node_modules" }


lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "ui-select")
  pcall(telescope.load_extension, "dap")
end

lvim.builtin.telescope.extensions = {
  ["ui-select"] = {
    require("telescope.themes").get_cursor({}),
  },
}
