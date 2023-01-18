lvim.plugins = {
  { "olimorris/onedarkpro.nvim" }, -- theme
  { "Yazeed1s/oh-lucy.nvim" }, -- theme
  { "catppuccin/nvim", as = "catppuccin" }, -- theme
  { "wellle/targets.vim" }, -- motions for arguments, di, etc
  { "szw/vim-maximizer", cmd = { "MaximizerToggle" } }, -- toggle maximise split
  { "RRethy/nvim-treesitter-textsubjects", after = "nvim-treesitter" },
  { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
  { "ethanholz/nvim-lastplace",
    config = function()
      require("nvim-lastplace").setup()
    end
  },
  { "PatschD/zippy.nvim", module = "zippy" }, -- log variables under cursor
  { "stevearc/dressing.nvim" }, -- improve vim ui's
  { "nvim-telescope/telescope-dap.nvim" },
  {
    -- smart telescope file searcher
    "danielfalk/smart-open.nvim",
    requires = { "kkharji/sqlite.lua" }
  },
  {
    -- past images from clipboard into md files :PasteImage
    "ekickx/clipboard-image.nvim",
    ft = { "markdown" },
    config = function()
      require("user.plugins.configs.clipboard-image")
    end
  },
  {
    -- Image asci previewer
    'samodostal/image.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('image').setup()
    end
  },
  {
    -- session management
    "gennaro-tedesco/nvim-possession",
    branch = "post_hooks", -- TODO: change back to main after merging
    requires = {
      "ibhagwan/fzf-lua",
    },
    config = function()
      require("nvim-possession").setup({
        post_hook = function()
          require('nvim-tree').toggle(false, true)
        end
      })
    end
  },
  { "benfowler/telescope-luasnip.nvim" },
  {
    -- scratch files
    "metakirby5/codi.vim",
    cmd = { "Codi", "CodiNew", "CodiSelect", "CodiExpand" }
  },
  {
    -- inline run code
    'michaelb/sniprun',
    cmd = { "SnipRun" },
    run = 'bash ./install.sh',
  },
  { "wakatime/vim-wakatime" },
  {
    "asiryk/auto-hlsearch.nvim",
    event = "BufRead",
    config = function()
      require("auto-hlsearch").setup()
    end
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    -- auto close tags <div| => <div></div>
    "windwp/nvim-ts-autotag",
    -- event = "BufRead",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "ggandor/leap.nvim",
    event = "BufRead",
    config = function()
      require("leap").set_default_keymaps()
    end
  },
  {
    -- powerful search & replace
    "windwp/nvim-spectre",
    module = "spectre",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = { "SymbolsOutline" },
    config = function()
      require('symbols-outline').setup()
    end
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "dnlhc/glance.nvim",
    cmd = { "Glance" },
    config = function()
      require("glance").setup()
    end
  },
  {
    -- surround with selection highlight
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end
  },
  {
    -- floating window with registers when pressing ""
    "gennaro-tedesco/nvim-peekup",
    event = "BufRead",
    config = function()
      require('nvim-peekup.config').on_keystroke["delay"] = ''
    end
  },
  { "delphinus/vim-firestore", ft = { "firestore" } },
  {
    -- preview markdown, glow needs to be installed globally
    "npxbr/glow.nvim",
    ft = { "markdown" },
    config = function()
      require("user.plugins.configs.glow")
    end
    -- run = "yay -S glow"
  },
  {
    -- generate github links
    "ruifm/gitlinker.nvim",
    event = "BufRead",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("user.plugins.configs.gitlinker")
    end
  },
  {
    -- "pwntester/octo.nvim",
    "NWVi/octo.nvim", -- todo: use original when local fs is merged
    branch = "config-review-use-local-fs",
    cmd = { "Octo" },
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require("octo").setup({
        use_local_fs = true -- use local files on right side of reviews, enables LSP
      })
    end,
  },
  {
    "rest-nvim/rest.nvim",
    ft = { "http" },
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("user.plugins.configs.rest")
    end
  },
  -- {
  --   "folke/zen-mode.nvim",
  --   config = function()
  --     require("zen-mode").setup({
  --       plugins = {
  --         options = {
  --           enabled = true,
  --           ruler = true, -- disables the ruler text in the cmd line area
  --           showcmd = true, -- disables the command in the last line of the screen
  --         },
  --         gitsigns = { enabled = true }
  --       }
  --     })
  --   end
  -- },
  {
    -- require("notify")("My super important message"), overrides vim.notify
    "rcarriga/nvim-notify",
    config = function()
      require("user.plugins.configs.notify")
    end,
  },
  {
    -- convert "${}" to `${}`
    "axelvc/template-string.nvim",
    event = "BufRead",
    ft = {
      "javascriptreact",
      "typescriptreact"
    },
    config = function()
      require("template-string").setup()
    end
  },
  {
    -- rename react hooks args :RenameState
    "olrtg/nvim-rename-state",
    cmd = { "RenameState" },
    ft = {
      "typescriptreact",
      "javascriptreact",
    },
    config = function()
      require('nvim-rename-state').setup()
    end
  },
  {
    -- autocomplete lists
    "dkarter/bullets.vim",
    ft = {
      "markdown",
      "text",
      "tex",
      "plaintex",
    },
  },
  {
    -- expand <C-a>/<C-x> toggles increments
    "nat-418/boole.nvim",
    config = function()
      require("user.plugins.configs.boole")
    end
  },
  { "elihunter173/dirbuf.nvim", cmd = { "Dirbuf" } }, -- edit fs as a buffer
  { "smithbm2316/centerpad.nvim", module = "centerpad" },
  {
    "nvim-neotest/neotest",
    module = "neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      'haydenmeade/neotest-jest'
    },
    config = function()
      require("user.plugins.configs.neotest")
    end
  },
  -- {
  --   -- center buffer
  --   "shortcuts/no-neck-pain.nvim",
  --   -- tag = "*",
  --   config = function()
  --     require("no-neck-pain").setup({
  --       toggleMapping = false,
  --       width = 120,
  --       integrations = {
  --         NvimTree = {
  --           -- Paired with the `close` parameter, when `false` we don't re-open the side tree.
  --           reopen = false,
  --         },
  --       },
  --     })
  --   end
  -- },

  {
    -- insert mode navigation on tab
    "abecodes/tabout.nvim",
    event = "InsertEnter",
    wants = "nvim-treesitter",
    after = "nvim-cmp",
    config = function()
      require("tabout").setup()
    end,
  },
  {
    -- reminder to commit more frequently
    "redve-dev/neovim-git-reminder",
    requires = { "rcarriga/nvim-notify" },
    event = "BufRead",
    config = function()
      require("CommitReminder").setup({
        delay = 5,
        required_changes = 20,
        remind_on_save_only = true
      })
    end
  },
  { "karb94/neoscroll.nvim",
    event = "BufRead",
    config = function()
      require("neoscroll").setup({
        mappings = { '<C-u>', '<C-d>' },
      })
    end
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen" }
  },
  {
    -- split/join code
    'Wansmer/treesj',
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    requires = { 'nvim-treesitter' },
    config = function()
      require('treesj').setup({
        use_default_keymaps = false,
      })
    end,
  },
  {
    -- split code, toggle variables, etc
    'ckolkey/ts-node-action',
    module = "ts-node-action",
    requires = { 'nvim-treesitter' },
    config = function() -- Optional
      require("user.plugins.configs.ts-node-action")
    end
  },
  {
    -- yank ring
    "gbprod/yanky.nvim",
    config = function()
      require("user.plugins.configs.yanky")
    end
  },
  {
    "ThePrimeagen/harpoon",
    requires = {
      "nvim-telescope/telescope.nvim"
    },
    module = "harpoon",
    config = function()
      require("telescope").load_extension "harpoon"
    end
  },
  {
    "simrat39/inlay-hints.nvim",
    module = "inlay-hints",
    config = function()
      require("user.plugins.configs.inlay-hints")
    end
  },
  {
    -- improved autocomplete on functions
    "ray-x/lsp_signature.nvim",
    config = function()
      require("user.plugins.configs.lsp_signature")
    end,
  },
  -- {
  --   -- needs to be the last one, otherwise PackerSync fails on the first setup install
  --   "ahmedkhalf/lsp-rooter.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp-rooter").setup()
  --   end,
  -- },
}

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.terminal.active = true
lvim.builtin.project.patterns = { ".git" }
