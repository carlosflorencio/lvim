local actions = require("diffview.actions")
local nvimTreeApi = require("nvim-tree.api")

require("diffview").setup({
  view = {
    merge_tool = {
      layout = "diff3_mixed",
    }
  },

  keymaps = {
    view = {
      { "n", "<leader>e", actions.toggle_files, { desc = "Toggle the file panel." } },
      { "n", "<leader>l", actions.cycle_layout, { desc = "Cycle through available layouts." } },
    },
    file_panel = {
      { "n", "<space>", actions.toggle_stage_entry, { desc = "Stage / unstage the selected entry." } },
      { "n", "<C-w><C-f>", actions.goto_file_split, { desc = "Open the file in a new split" } },
      { "n", "<C-t>", actions.goto_file_tab, { desc = "Open the file in a new tabpage" } },
    },
  },

  hooks = {
    view_opened = function()
      -- nvimTreeApi.tree.close_in_this_tab()
      nvimTreeApi.tree.close()
      vim.cmd [[ WindowsDisableAutowidth ]]
    end,

    -- view_enter = function()
    --   nvimTreeApi.tree.close_in_this_tab()
    -- end,

    view_closed = function()
      nvimTreeApi.tree.toggle({ focus = false })
      -- nvimTreeApi.tree.open()

      vim.cmd [[ WindowsEnableAutowidth ]]
    end
  }

})
