lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

local dashboard = require('alpha.themes.dashboard')

lvim.builtin.alpha.dashboard.section.buttons.val = {
  dashboard.button("f", lvim.icons.ui.FindFile .. "  Find File",
    "<CMD>Telescope find_files follow=true no_ignore=true hidden=true<CR>"),
  dashboard.button("n", lvim.icons.ui.NewFile .. "  New File", "<CMD>ene!<CR>"),
  dashboard.button("p", lvim.icons.ui.Project .. "  Projects", "<CMD>Telescope projects<CR>"),
  dashboard.button("r", lvim.icons.ui.History .. "  Recent files", ":Telescope oldfiles only_cwd=true<CR>"),
  dashboard.button("t", lvim.icons.ui.FindText .. "  Find Text", "<CMD>Telescope live_grep<CR>"),
  dashboard.button("c",
    lvim.icons.ui.Gear .. "  Configuration",
    "<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>")
}
