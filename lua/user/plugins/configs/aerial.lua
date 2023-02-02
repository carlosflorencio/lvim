require('aerial').setup({
  -- backends = { "treesitter", "lsp", "markdown", "man" },
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
    vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
  end,

  filter_kind = {
    "Array",
    "Boolean",
    "Class",
    "Color",
    "Constant",
    "Constructor",
    "Enum",
    "EnumMember",
    "Event",
    -- "Field",
    "File",
    "Folder",
    "Function",
    "Interface",
    "Key",
    "Keyword",
    "Method",
    "Module",
    "Namespace",
    "Null",
    "Number",
    "Object",
    "Operator",
    "Package",
    "Property",
    "Reference",
    "Snippet",
    "String",
    "Struct",
    "Text",
    "TypeParameter",
    "Unit",
    "Value",
    -- "Variable",
  },

  -- List of enum values that configure when to auto-close the aerial window
  --   unfocus       - close aerial when you leave the original source window
  --   switch_buffer - close aerial when you change buffers in the source window
  --   unsupported   - close aerial when attaching to a buffer that has no symbol source
  close_automatic_events = { "switch_buffer" },

  icons = require("lvim.icons").kind
})
