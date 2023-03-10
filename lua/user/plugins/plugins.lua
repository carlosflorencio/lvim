lvim.plugins = {
  -- { "olimorris/onedarkpro.nvim" }, -- theme
  -- { "EdenEast/nightfox.nvim" }, -- theme
  -- { "Yazeed1s/oh-lucy.nvim" }, -- theme
  -- { "AlexvZyl/nordic.nvim" }, -- theme
  -- { "ellisonleao/gruvbox.nvim" }, -- theme
  -- { "rebelot/kanagawa.nvim" }, -- theme
  -- { "Shatur/neovim-ayu" }, -- theme
  -- {
  --   'rose-pine/neovim',
  --   as = 'rose-pine',
  --   config = function()
  --     require("rose-pine").setup()
  --     -- vim.cmd('colorscheme rose-pine')
  --   end
  -- },
  -- { 'tiagovla/tokyodark.nvim' },
  {
    -- theme
    'uloco/bluloco.nvim',
    requires = { 'rktjmp/lush.nvim' }
  },
  -- { "catppuccin/nvim", as = "catppuccin" }, -- theme

  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  -- { 'hrsh7th/cmp-path' }, -- already in use by lunarvim

  {
    -- improved marks
    "chentoast/marks.nvim",
    config = function()
      require 'marks'.setup()
    end
  },
  { "wellle/targets.vim" }, -- motions for arguments, di, etc
  { "RRethy/nvim-treesitter-textsubjects",         after = "nvim-treesitter" },
  { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
  { "ethanholz/nvim-lastplace",
    config = function()
      require("nvim-lastplace").setup()
    end
  },
  {
    -- bettter quickfix with preview
    -- <c-b>, <c-f> to scroll the preview window
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
  },
  {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" }
    },
    config = function()
      require('refactoring').setup({})
    end

  },
  {
    -- show colorcolumn when line is too long
    "m4xshen/smartcolumn.nvim",
    config = function()
      require("user.plugins.configs.smartcolumn")
    end
  },
  {
    -- live grep certain dirs <c-k>
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  {
    -- package.json update actions, <leader>pv to change version
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
    config = function()
      require("user.plugins.configs.package-info")
    end
  },
  {
    -- hide cursorline in split windows
    'tummetott/reticle.nvim',
    config = function()
      require("user.plugins.configs.reticle")
    end
  },
  {
    -- expand windows
    "anuvyklack/windows.nvim",
    requires = {
      "anuvyklack/middleclass",
      -- "anuvyklack/animation.nvim"
    },
    config = function()
      require("user.plugins.configs.windows")
    end
  },
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("user.plugins.configs.scrollbar")
    end
  },
  -- { "PatschD/zippy.nvim", module = "zippy" }, -- log variables under cursor
  {
    "stevearc/dressing.nvim",
    config = function()
      require("user.plugins.configs.dressing")
    end
  }, -- improve vim ui's
  { "nvim-telescope/telescope-dap.nvim" },
  {
    -- smart telescope file searcher
    "danielfalk/smart-open.nvim",
    requires = { "kkharji/sqlite.lua" }
  },
  {
    -- regex explainer, gR (:TSInstall regex)
    'bennypowers/nvim-regexplainer',
    config = function() require 'regexplainer'.setup() end,
    requires = { 'nvim-treesitter/nvim-treesitter', 'MunifTanjim/nui.nvim' }
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
    -- when renaming files on nvim-tree, update imports through the LSP
    'antosha417/nvim-lsp-file-operations',
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "kyazdani42/nvim-tree.lua" },
    },
    config = function()
      require("lsp-file-operations").setup()
    end
  },
  -- {
  --   -- session management
  --   "gennaro-tedesco/nvim-possession",
  --   requires = {
  --     "ibhagwan/fzf-lua",
  --   },
  --   config = function()
  --     require("user.plugins.configs.possession")
  --   end
  -- },
  {
    'rmagatti/auto-session',
    config = function()
      require("user.plugins.configs.auto-session")
    end
  },
  {
    -- buffers separated per tab
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup()
    end
  },
  { "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("user.plugins.configs.copilot")
    end,
  },
  { "benfowler/telescope-luasnip.nvim" },
  {
    -- scratch files
    "metakirby5/codi.vim",
    cmd = { "Codi", "CodiNew", "CodiSelect", "CodiExpand" }
  },
  {
    -- generate docblocks
    "danymat/neogen",
    config = function()
      require('neogen').setup({ snippet_engine = "luasnip" })
    end,
    requires = "nvim-treesitter/nvim-treesitter",
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
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "dnlhc/glance.nvim",
    cmd = { "Glance" },
    config = function()
      require("user.plugins.configs.glance")
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
      require("user.plugins.configs.octo")
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
  {
    -- sticky function name when scrolling down
    'nvim-treesitter/nvim-treesitter-context'
  },
  {
    -- jq / yq to json/yaml files, X query items under the cursor
    "gennaro-tedesco/nvim-jqx",
    -- ft = { "json", "yaml" },
    cmd = { "JqxList", "JqxQuery" },
    -- config = function()
    --   require("nvim-jqx.config").setup({})
    -- end
  },
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
    -- some typescript useful commands, e.g add missing imports
    -- config on the tssserver.lua
    "jose-elias-alvarez/typescript.nvim",
  },
  {
    -- better macros, q, Q, cq (edit), ## breakpoint
    "chrisgrieser/nvim-recorder",
    config = function()
      require("user.plugins.configs.recorder")
    end,
  },
  {
    -- rename react hooks args :RenameState
    "olrtg/nvim-rename-state",
    cmd = { "RenameState" },
    ft = {
      "typescriptreact",
      "javascriptreact",
    }
  },
  {
    -- expand <C-a>/<C-x> toggles increments
    "nat-418/boole.nvim",
    config = function()
      require("user.plugins.configs.boole")
    end
  },
  {
    -- edit fs as a buffer
    "elihunter173/dirbuf.nvim",
    cmd = { "Dirbuf" },
  },
  {
    -- folds
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    config = function()
      require("user.plugins.configs.ufo")
    end
  },
  {
    "nvim-treesitter/playground"
  },
  {
    -- % match ifs, etc
    "andymass/vim-matchup",
    setup = function()
      require("user.plugins.configs.matchup")
    end,
  },
  {
    -- detect correct tab width between files, e.g prettier 3 spaces
    'nmac427/guess-indent.nvim',
    config = function() require('guess-indent').setup {} end,
  },
  {
    -- task runner
    'stevearc/overseer.nvim',
    config = function()
      require("user.plugins.configs.overseer")
    end
  },
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
  {
    "jackMort/ChatGPT.nvim",
    -- cmd = { "ChatGPT", "ChatGPTActAs" },
    -- module = "chatgpt",
    config = function()
      require("chatgpt").setup({})
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  {
    -- lsp symbols table
    'stevearc/aerial.nvim',
    -- cmd = { "AerialToggle" },
    config = function()
      require("user.plugins.configs.aerial")
    end
  },
  -- {
  --   -- better looking lsp virtual text
  --   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  --   config = function()
  --     require("lsp_lines").setup()
  --   end,
  -- },
  {
    -- statuslune lsp progress
    "arkav/lualine-lsp-progress"
  },
  {
    -- dap adapter for the newer vscode-js debugger
    "mxsdev/nvim-dap-vscode-js",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("user.plugins.configs.dap-vscode-js")
    end
  },
  {
    -- vscode debug adapter install
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npm run compile",
    -- https://github.com/mxsdev/nvim-dap-vscode-js/issues/23
    tag = 'v1.74.1'
  },
  {
    'Weissle/persistent-breakpoints.nvim',
    config = function()
      require('persistent-breakpoints').setup {
        load_breakpoints_event = { "BufReadPost" }
      }
    end
  },
  { 'ofirgall/goto-breakpoints.nvim' },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  },
  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    config = function()
      require("user.plugins.configs.zen-mode")
    end
  },
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
      require("user.plugins.configs.commit-reminder")
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
    cmd = { "DiffviewOpen" },
    module = "diffview",
    config = function()
      require("user.plugins.configs.diffview")
    end
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
    -- telescope undo
    "debugloop/telescope-undo.nvim",
    requires = {
      "nvim-telescope/telescope.nvim"
    },
  },
  -- {
  --   "ThePrimeagen/harpoon",
  --   requires = {
  --     "nvim-telescope/telescope.nvim"
  --   },
  --   module = "harpoon",
  --   config = function()
  --     require("telescope").load_extension "harpoon"
  --   end
  -- },
  {
    "simrat39/inlay-hints.nvim",
    module = "inlay-hints",
    config = function()
      require("user.plugins.configs.inlay-hints")
    end
  },
  {
    -- code screenshots
    "narutoxy/silicon.lua",
    requires = { "nvim-lua/plenary.nvim" },
    module = "silicon",
    config = function()
      require("user.plugins.configs.silicon")
    end
  },
  -- {
  --   -- improved autocomplete on functions
  --   "ray-x/lsp_signature.nvim",
  --   config = function()
  --     require("user.plugins.configs.lsp_signature")
  --   end,
  -- },
  {
    -- highlight colors
    'NvChad/nvim-colorizer.lua',
    config = function()
      require("user.plugins.configs.colorizer")
    end
  },
  {
    -- smart lists on text files, needs to be at the end to avoid plugin clashes
    "gaoDean/autolist.nvim",
    ft = {
      "markdown",
      "text",
      "tex",
      "plaintex",
    },
    config = function()
      require("user.plugins.configs.autolist")
    end,
  },
}
