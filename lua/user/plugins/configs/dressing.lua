require('dressing').setup({
  select = {
    get_config = function(opts)
      -- https://github.com/stevearc/dressing.nvim/issues/22#issuecomment-1067211863
      -- for codeaction, we want null-ls to be last
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/630
      if opts.kind == 'codeaction' then
        return {
          telescope = {
            -- sorter = require 'telescope.sorters'.Sorter:new {
            --   scoring_function = function(_, _, line)
            --     if string.match(line, 'null-ls') then
            --       return 1
            --     else
            --       return 0
            --     end
            --   end,
            -- },
            initial_mode = "normal",
            -- copied from the telescope dropdown theme
            sorting_strategy = "ascending",
            layout_strategy = "center",
            layout_config = {
              preview_cutoff = 1, -- Preview should always show (unless previewer = false)
              width = 80,
              height = 15,
            },
            borderchars = {
              prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
              results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
              preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            },
          }
        }
      end
    end,
  },
})
