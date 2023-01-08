lvim.plugins = {
  { "olimorris/onedarkpro.nvim" }, -- theme
  { "tomasiser/vim-code-dark" }, -- theme
  { "rebelot/kanagawa.nvim" }, -- theme
  { "Yazeed1s/oh-lucy.nvim" }, -- theme
  { "vim-scripts/argtextobj.vim" }, -- motions for arguments
  { "szw/vim-maximizer" }, -- toggle maximise split
  { "RRethy/nvim-treesitter-textsubjects" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "ethanholz/nvim-lastplace",
    config = function()
      require("nvim-lastplace").setup()
    end
  },
  { "PatschD/zippy.nvim", event = "BufRead" }, -- log variables under cursor
  { "stevearc/dressing.nvim" }, -- improve vim ui's
  { "nvim-telescope/telescope-dap.nvim" },
  { "benfowler/telescope-luasnip.nvim" },
  { "metakirby5/codi.vim" }, -- scratch files
  { 'michaelb/sniprun', run = 'bash ./install.sh' }, -- inline run code
  { "wakatime/vim-wakatime" },
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
    -- powerfull search & replace
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
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
    config = function()
      require("glance").setup()
    end
  },
  {
    -- improved autocomplete on functions
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require "lsp_signature".on_attach() end,
  },
  {
    -- surround with selection hightlight
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end
  },
  {
    -- panel with info about the registers contents
    "junegunn/vim-peekaboo"
  },
  { "delphinus/vim-firestore" },
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
    "pwntester/octo.nvim",
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require("octo").setup()
    end,
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
    -- require("notify")("My super important message")
    "rcarriga/nvim-notify"
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
  { "elihunter173/dirbuf.nvim" }, -- edit fs as a buffer
  { "smithbm2316/centerpad.nvim", event = "BufRead" },
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
    config = function()
      require("neoscroll").setup({
        mappings = { '<C-u>', '<C-d>' },
      })
    end
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  { "ThePrimeagen/harpoon",
    requires = {
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require("telescope").load_extension "harpoon"
    end
  },
  {
    "simrat39/inlay-hints.nvim",
    config = function()
      require("user.plugins.configs.inlay-hints")
    end
  },
  {
    -- needs to be the last one, otherwise PackerSync fails on the first setup install
    "ahmedkhalf/lsp-rooter.nvim",
    event = "BufRead",
    config = function()
      require("lsp-rooter").setup()
    end,
  },
}

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.terminal.active = true
lvim.builtin.project.patterns = { ".git" }
