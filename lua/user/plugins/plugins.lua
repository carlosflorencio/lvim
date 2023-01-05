lvim.plugins = {
  { "olimorris/onedarkpro.nvim" },
  { "tomasiser/vim-code-dark" },
  { "rebelot/kanagawa.nvim" },
  { "vim-scripts/argtextobj.vim" },
  { "szw/vim-maximizer" },
  { "ethanholz/nvim-lastplace",
    config = function()
      require("nvim-lastplace").setup()
    end
  },
  { "nvim-telescope/telescope-ui-select.nvim" },
  { "nvim-telescope/telescope-dap.nvim" },
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
    "ahmedkhalf/lsp-rooter.nvim",
    event = "BufRead",
    config = function()
      require("lsp-rooter").setup()
    end,
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
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup()
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
  }
}

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.terminal.active = true
lvim.builtin.project.patterns = { ".git" }
