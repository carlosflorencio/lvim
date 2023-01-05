-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-c>"] = ":BufferKill<CR>" -- close buffer
lvim.keys.normal_mode["<S-l>"] = "<cmd>BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<S-h>"] = "<cmd>BufferLineCyclePrev<cr>"

-- jumps
lvim.keys.normal_mode["[e"] = vim.diagnostic.goto_next
lvim.keys.normal_mode["]e"] = vim.diagnostic.goto_prev
lvim.keys.normal_mode["]c"] = "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>"
lvim.keys.normal_mode["[c"] = "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>"

-- harpoon
lvim.keys.normal_mode["<tab>"] = "<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>"
lvim.keys.normal_mode["<s-tab>"] = "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>"

-- lSP
lvim.lsp.buffer_mappings.normal_mode["gi"] = { vim.lsp.buf.implementation, "Go to implementation" }
lvim.lsp.buffer_mappings.normal_mode["gpd"] = { "<cmd>Glance definitions<cr>", "Preview Definitions" }
lvim.lsp.buffer_mappings.normal_mode["gpr"] = { "<cmd>Glance references<cr>", "Preview References" }
lvim.lsp.buffer_mappings.normal_mode["gpt"] = { "<cmd>Glance type_definitions<cr>", "Preview Type Definitions" }
lvim.lsp.buffer_mappings.normal_mode["gpi"] = { "<cmd>Glance implementations<cr>", "Preview implementations" }

-- move the cursor without leaving insert mode
lvim.keys.insert_mode["<A-h>"] = "<Left>"
lvim.keys.insert_mode["<A-l>"] = "<Right>"

-- paste most recent yank
lvim.keys.visual_mode["p"] = '"0p'
lvim.keys.visual_mode["P"] = '"0P'

lvim.builtin.which_key.mappings["x"] = { "<cmd>BufferKill<CR>", "Close Buffer" }
lvim.builtin.which_key.mappings["v"] = { "<cmd>vsplit<cr>", "vsplit" }
lvim.builtin.which_key.mappings["gy"] = "Github Link" -- git linker plugin

lvim.builtin.which_key.mappings["f"] = {
  name = "Find",
  b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
  a = { "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>", "Find All Files" },
  f = { "<cmd>Telescope find_files<cr>", "Find Project File" },
  h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
  H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
  M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
  m = { require("lvim.lsp.utils").format, "Format" },
  r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  R = { "<cmd>Telescope registers<cr>", "Registers" },
  w = { "<cmd>Telescope live_grep<cr>", "Text" },
  k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  C = { "<cmd>Telescope commands<cr>", "Commands" },
  s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
  t = {
    "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
    "Colorscheme with Preview",
  },
}

lvim.builtin.which_key.mappings["s"]["t"] = { "<cmd>SymbolsOutline<CR>", "Toggle SymbolsOutline" }

lvim.builtin.which_key.mappings["m"] = {
  name = "Marks",
  m = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon", },
  s = { "<cmd>Telescope harpoon marks<cr>", "Search Files" },
  ["."] = { '<cmd>lua require("harpoon.ui").nav_next()<cr>', "Harpoon Next" },
  [","] = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>', "Harpoon Prev" },
}

lvim.builtin.which_key.mappings["c"] = {
  name = "+Close",
  a = {
    name = "+All",
    b = {
      ":%bd|e#|bd#<cr>|'\"",
      "Close all buffers but the current one",
    }
  },
}

lvim.builtin.which_key.mappings["t"] = {
  name = "+Toggle/Diagnostics",
  t = {
    require("zen-mode").toggle,
    "Zen Mode",
  },
  g = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

lvim.builtin.which_key.mappings["o"] = {
  name = "+Organize",
  i = { "<cmd>TypescriptOrganizeImports<cr>", "TS Organize Imports" },
  a = { "<cmd>TypescriptAddMissingImports<cr>", "TS Add missing Imports" },
}
