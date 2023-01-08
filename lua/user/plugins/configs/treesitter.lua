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

-- important for correct tsx indentation
lvim.builtin.treesitter.highlight.additional_vim_regex_highlighting = true
lvim.builtin.treesitter.indent.enable = false

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
    lookahead = true,

    keymaps = {
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",

      ["ac"] = "@conditional.outer",
      ["ic"] = "@conditional.inner",

    },
    include_surrounding_whitespace = true,
  },
}
