local create_aucmd = vim.api.nvim_create_autocmd

create_aucmd("TextYankPost", {
  group = "_general_settings",
  pattern = "*",
  desc = "Highlight text on yank",
  callback = function()
    require("vim.highlight").on_yank { higroup = (
        vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout = 300 }
  end,
})
