-- local utils = require("lualine.utils.utils")
-- local highlight = require("lualine.highlight")

-- local diagnostics_message = require("lualine.component"):extend()

-- https://www.reddit.com/r/neovim/comments/znb8z3/show_diagnostic_message_in_lualine/
-- diagnostics_message.default = {
--   colors = {
--     error = utils.extract_color_from_hllist(
--       { "fg", "sp" },
--       { "DiagnosticError", "LspDiagnosticsDefaultError", "DiffDelete" },
--       "#e32636"
--     ),
--     warning = utils.extract_color_from_hllist(
--       { "fg", "sp" },
--       { "DiagnosticWarn", "LspDiagnosticsDefaultWarning", "DiffText" },
--       "#ffa500"
--     ),
--     info = utils.extract_color_from_hllist(
--       { "fg", "sp" },
--       { "DiagnosticInfo", "LspDiagnosticsDefaultInformation", "DiffChange" },
--       "#ffffff"
--     ),
--     hint = utils.extract_color_from_hllist(
--       { "fg", "sp" },
--       { "DiagnosticHint", "LspDiagnosticsDefaultHint", "DiffAdd" },
--       "#273faf"
--     ),
--   },
-- }

-- function diagnostics_message:init(options)
--   diagnostics_message.super:init(options)
--   self.options.colors = vim.tbl_extend("force", diagnostics_message.default.colors, self.options.colors or {})
--   self.highlights = { error = "", warn = "", info = "", hint = "" }
--   self.highlights.error = highlight.create_component_highlight_group(
--     { fg = self.options.colors.error },
--     "diagnostics_message_error",
--     self.options
--   )
--   self.highlights.warn = highlight.create_component_highlight_group(
--     { fg = self.options.colors.warn },
--     "diagnostics_message_warn",
--     self.options
--   )
--   self.highlights.info = highlight.create_component_highlight_group(
--     { fg = self.options.colors.info },
--     "diagnostics_message_info",
--     self.options
--   )
--   self.highlights.hint = highlight.create_component_highlight_group(
--     { fg = self.options.colors.hint },
--     "diagnostics_message_hint",
--     self.options
--   )
-- end

-- function diagnostics_message:update_status(is_focused)
--   local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
--   local diagnostics = vim.diagnostic.get(0, { lnum = r - 1 })
--   if #diagnostics > 0 then
--     local diag = diagnostics[1]
--     for _, d in ipairs(diagnostics) do
--       if d.severity < diag.severity then
--         diagnostics = d
--       end
--     end
--     local icons = { " ", " ", " ", " " }
--     local hl = { self.highlights.error, self.highlights.warn, self.highlights.info, self.highlights.hint }
--     return highlight.component_format_highlight(hl[diag.severity]) .. icons[diag.severity] .. " " .. diag.message
--   else
--     return ""
--   end
-- end

--- @param trunc_len number truncates component to trunc_len number of chars
--- return function that can format the component accordingly
local function trunc(trunc_len)
  return function(str)
    if str:len() < trunc_len then
      return str
    end

    if str:match("%d$") ~= nil then
      -- could be a stacked pr, lets show the last chars
      local lastChars = 3
      local len = string.len(str)
      return str:sub(1, trunc_len - lastChars) .. "..." .. str:sub(len - lastChars + 1)
    else
      return str:sub(1, trunc_len) .. "..."
    end
  end
end

local components = require("lvim.core.lualine.components")
local package_info = require("package-info") -- package.json
require("user.plugins.configs.lualine.wakatime")

lvim.builtin.lualine.sections.lualine_c = {
  -- components.filename,
  -- {
  -- diagnostics_message,
  --   colors = {
  --     error = "#BF616A",
  --     warn = "#EBCB8B",
  --     info = "#A3BE8C",
  --     hint = "#88C0D0",
  --   },
  -- },
  "lsp_progress",
  package_info.get_status,
  require("recorder").recordingStatus
}

components.branch.fmt = trunc(30)
lvim.builtin.lualine.sections.lualine_b = {
  components.branch,
}


lvim.builtin.lualine.sections.lualine_x = {
  components.lsp,
  components.filetype,
  "searchcount",
  Lualine_get_wakatime
}


lvim.builtin.lualine.sections.lualine_y = {
  "overseer",
  components.diagnostics,
}


lvim.builtin.lualine.sections.lualine_z = {}
