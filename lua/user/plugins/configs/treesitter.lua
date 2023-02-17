lvim.builtin.treesitter.ensure_installed = {
  "lua",
  "vim",
  "query",
  "c",
  "css",
  "go",
  "markdown",
  "php",
  "python",
  "ruby",
  "scss",
  "sql",
  "svelte",
  "toml",
  "vue",
  "rust",
  "yaml",
  "jsdoc",
  "hcl",
  "cpp",
  "typescript",
  "javascript",
  "tsx",
  "jsonc",
  "json",
  "http",
  "gitignore",
  "fish",
  "dockerfile",
  "bash",
  "help"
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.playground.enable = true

lvim.builtin.treesitter.autotag = true

-- important for correct tsx indentation
lvim.builtin.treesitter.highlight.additional_vim_regex_highlighting = true
lvim.builtin.treesitter.indent.enable = true

lvim.builtin.treesitter.incremental_selection = {
  enable = true,
  keymaps = {
    init_selection = "<CR>", -- maps in normal mode to init the node/scope selection
    scope_incremental = "<S-TAB>", -- increment to the upper scope (as defined in locals.scm)
    node_incremental = "<CR>", -- increment to the upper named parent
    node_decremental = "<TAB>", -- decrement to the previous node
  },
}

-- increment selection on .
lvim.builtin.treesitter.textsubjects.enable = true

lvim.builtin.treesitter.textobjects = {
  select = {
    enable = true,
    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = false,

    keymaps = {
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",

      ["ac"] = "@conditional.outer",
      ["ic"] = "@conditional.inner",

      -- ["aa"] = "@parameter.outer",
      -- ["ia"] = "@parameter.inner",

    },
    include_surrounding_whitespace = false,
  },
  move = {
    enable = true,
    set_jumps = true, -- whether to set jumps in the jumplist
    goto_next_start = {
      [']]'] = '@function.outer',
      -- [']]'] = '@class.outer',
    },
    goto_next_end = {
      [']M'] = '@function.outer',
      -- [']['] = '@class.outer',
    },
    goto_previous_start = {
      ['[['] = '@function.outer',
      -- ['[['] = '@class.outer',
    },
    goto_previous_end = {
      ['[M'] = '@function.outer',
      -- ['[]'] = '@class.outer',
    },
  },
}
