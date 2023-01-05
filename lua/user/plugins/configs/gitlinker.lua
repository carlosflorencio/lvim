require("gitlinker").setup {
  opts = {
    add_current_line_on_normal_mode = true,
    action_callback = require("gitlinker.actions").open_in_browser,
    print_url = true,
    mappings = "<leader>gy",
  },
}
