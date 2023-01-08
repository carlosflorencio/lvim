-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
-- use c-e & c-y for scrolling
lvim.keys.normal_mode["zj"] = "o<ESC>k"
lvim.keys.normal_mode["zk"] = "O<ESC>j"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.normal_mode["<C-c>"] = ":BufferKill<CR>" -- close buffer
lvim.keys.normal_mode["<S-l>"] = "<cmd>BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<S-h>"] = "<cmd>BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["gb"] = ":ls<CR>:b<Space>"

-- Search and replace word under cursor using <F2>
vim.cmd [[ nnoremap <F2> :%s/<c-r><c-w>/<c-r><c-w>/gc<c-f>$F/i ]]

-- vim.cmd [[
-- function! JumpBackAndClose()
--     let startBuffer = bufname('%')
--     execute "normal \<C-O>"
--     let nowBuffer = bufname('%')
--     if nowBuffer != startBuffer
--         execute "bd " . startBuffer
--     endif
-- endfunction
-- ]]

-- lvim.keys.normal_mode["<C-p>"] = "<cmd>call JumpBackAndClose()<CR>"

lvim.keys.visual_mode["<C-p>"] = "y'>p"

-- jumps
lvim.keys.normal_mode["[e"] = vim.diagnostic.goto_next
lvim.keys.normal_mode["]e"] = vim.diagnostic.goto_prev
lvim.keys.normal_mode["]c"] = "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>"
lvim.keys.normal_mode["[c"] = "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>"

-- harpoon
lvim.keys.normal_mode["<s-tab>"] = "<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>"

-- lSP
lvim.lsp.buffer_mappings.normal_mode["gi"] = { vim.lsp.buf.implementation, "Go to implementation" }
lvim.lsp.buffer_mappings.normal_mode["gpd"] = { "<cmd>Glance definitions<cr>", "Preview Definitions" }
lvim.lsp.buffer_mappings.normal_mode["gpr"] = { "<cmd>Glance references<cr>", "Preview References" }
lvim.lsp.buffer_mappings.normal_mode["gpt"] = { "<cmd>Glance type_definitions<cr>", "Preview Type Definitions" }
lvim.lsp.buffer_mappings.normal_mode["gpi"] = { "<cmd>Glance implementations<cr>", "Preview implementations" }

-- move the cursor without leaving insert mode
lvim.keys.insert_mode["<A-h>"] = "<Left>"
lvim.keys.insert_mode["<A-l>"] = "<Right>"
lvim.keys.insert_mode["<s-tab>"] = "<C-d>" -- make shift-tab work normally
lvim.keys.insert_mode["<c-p>"] = "p"

-- paste most recent yank
-- lvim.keys.visual_mode["p"] = '"0p'
-- lvim.keys.visual_mode["P"] = '"0P'

lvim.builtin.which_key.mappings["q"] = { "<cmd>qa<cr>", "Quit All" }
lvim.builtin.which_key.mappings["x"] = { "<cmd>BufferKill<CR>", "Close Buffer" }
lvim.builtin.which_key.mappings["v"] = { "<cmd>vsplit<cr>", "vsplit" }
lvim.builtin.which_key.mappings["gy"] = "Github Link" -- git linker plugin

lvim.builtin.which_key.mappings["f"] = {
  name = "Find",
  b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  c = { "<cmd>Telescope command_history initial_mode=normal<cr>", "Command History" },
  a = { "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>", "Find All Files" },
  f = { "<cmd>Telescope find_files<cr>", "Find Project File" },
  h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
  M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
  m = { require("lvim.lsp.utils").format, "Format" },
  r = { "<cmd>Telescope oldfiles initial_mode=normal<cr>", "Open Recent File" },
  R = { "<cmd>Telescope registers initial_mode=normal<cr>", "Registers" },
  w = { "<cmd>Telescope live_grep<cr>", "Text" },
  k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  C = { "<cmd>Telescope commands<cr>", "Commands" },
  s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
  S = { "<cmd>Telescope luasnip theme=dropdown<cr>", "Snippets" },
  t = {
    "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
    "Colorscheme with Preview",
  },
}

lvim.builtin.which_key.mappings["s"] = {
  name = "Splits",
  t    = { "<cmd>SymbolsOutline<CR>", "Toggle SymbolsOutline" },
  v    = { "<cmd>vsplit<cr>", "Split Vertically" },
  h    = { "<cmd>split<cr>", "Split Horizontally" },
  m    = { "<cmd>MaximizerToggle<CR>", "Toggle Maximize" },
  c    = { "<cmd>close<CR>", "Close split" },
}

lvim.builtin.which_key.mappings["m"] = {
  name = "Marks",
  m = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon", },
  s = { "<cmd>Telescope harpoon marks<cr>", "Search Files" },
  ["."] = { '<cmd>lua require("harpoon.ui").nav_next()<cr>', "Harpoon Next" },
  [","] = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>', "Harpoon Prev" },
}

lvim.builtin.which_key.mappings["c"] = {
  name = "Close",
  a = {
    name = "All",
    b = {
      ":%bd|e#|bd#<cr>|'\"",
      "Close all buffers but the current one",
    }
  },
}

lvim.builtin.which_key.mappings["t"] = {
  name = "Toggle/Diagnostics",
  t = {
    "<cmd>NvimTreeToggle<cr><cmd>lua require'centerpad'.toggle{ leftpad = 40, rightpad = 40 }<cr>",
    "Center Buffer",
  },
  g = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

lvim.builtin.which_key.mappings["d"] = {
  name = "Debug",
  d = { "<cmd>lua require('zippy').insert_print()<CR>", "Add log to current variable" },
  r = { "<cmd>SnipRun<CR>", "Run the current line using Snip" },
  s = { "<cmd>CodiNew<CR>", "Creates a new Scratch buffer" }
}

lvim.builtin.which_key.vmappings["d"] = {
  name = "Debug",
  r = { "<cmd>SnipRun<CR>", "Run the current block using Snip" }
}

lvim.builtin.which_key.mappings["o"] = {
  name = "Organize",
  i = { "<cmd>TypescriptOrganizeImports<cr>", "TS Organize Imports" },
  a = { "<cmd>TypescriptAddMissingImports<cr>", "TS Add missing Imports" },
}

lvim.builtin.which_key.mappings["r"] = {
  name = "Refactor / Rollback",
  l = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Git Rollback Line" },
  f = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Git File" },
}

lvim.builtin.which_key.mappings["p"]["p"] = { "<cmd>Glow<cr>", "Preview" }
lvim.builtin.which_key.mappings[";"] = { "<cmd>lua require'lir.float'.toggle()<cr>", "Floating file explorer Lir" }
lvim.builtin.which_key.mappings["'"] = { "<cmd>Dirbuf<cr>", "DirBuf" }
lvim.builtin.which_key.mappings["j"] = { "<cmd>Telescope buffers previewer=false ignore_current_buffer=true sort_mru=true<cr>",
  "Find" }
