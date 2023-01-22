-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
-- lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
-- use c-e & c-y for scrolling
lvim.keys.normal_mode["zj"] = "o<ESC>k"
lvim.keys.normal_mode["zk"] = "O<ESC>j"
lvim.keys.normal_mode["<C-c>"] = ":BufferKill<CR>" -- close buffer
lvim.keys.normal_mode["<S-l>"] = "<cmd>BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<S-h>"] = "<cmd>BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["gb"] = ":ls<CR>:b<Space>"

-- Search and replace word under cursor using <F2>
vim.cmd [[ nnoremap <F2> :%s/<c-r><c-w>/<c-r><c-w>/gc<c-f>$F/i ]]

lvim.keys.visual_mode["<C-p>"] = "y'>p"
lvim.keys.visual_mode["y"] = "y`]" -- prevent going up when yanking

-- yanky ring
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")

-- jumps
lvim.keys.normal_mode["]e"] = vim.diagnostic.goto_next
lvim.keys.normal_mode["[e"] = vim.diagnostic.goto_prev
lvim.keys.normal_mode["]c"] = "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>"
lvim.keys.normal_mode["[c"] = "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>"

-- harpoon
lvim.keys.normal_mode["<s-tab>"] = "<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>"

-- folds
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
vim.keymap.set('n', 'K', function()
  local winid = require('ufo').peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end)

-- lSP
lvim.lsp.buffer_mappings.normal_mode["gi"] = { vim.lsp.buf.implementation, "Go to implementation" }
lvim.lsp.buffer_mappings.normal_mode["gpd"] = { "<cmd>Glance definitions<cr>", "Preview Definitions" }
lvim.lsp.buffer_mappings.normal_mode["gpr"] = { "<cmd>Glance references<cr>", "Preview References" }
lvim.lsp.buffer_mappings.normal_mode["gpt"] = { "<cmd>Glance type_definitions<cr>", "Preview Type Definitions" }
lvim.lsp.buffer_mappings.normal_mode["gpi"] = { "<cmd>Glance implementations<cr>", "Preview implementations" }

-- move the cursor without leaving insert mode
lvim.keys.insert_mode["<A-h>"] = "<Left>"
lvim.keys.insert_mode["<A-l>"] = "<Right>"
lvim.keys.insert_mode["<c-p>"] = "<ESC>p" -- paste in insert mode


lvim.builtin.which_key.mappings["h"] = {
  name = "misc",
  a = { '<cmd>lua require("ts-node-action").node_action()<cr>', "Toggle node action under cursor" },
  s = { '<cmd>TSJToggle<cr>', "Toggle node split" },
  c = { '<cmd>lua require("neogen").generate()<cr>', "Generate Comment Annotation" }
}

lvim.builtin.which_key.mappings["q"] = { "<cmd>qa<cr>", "Quit All" }
lvim.builtin.which_key.mappings["x"] = { "<cmd>BufferKill<CR>", "Close Buffer" }
lvim.builtin.which_key.mappings["v"] = { "<cmd>vsplit<cr>", "vsplit" }
lvim.builtin.which_key.mappings["gy"] = "Github Link" -- git linker plugin

lvim.builtin.which_key.mappings["f"] = {
  name = "Find",
  b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  d = { "<cmd>Telescope diagnostics<cr>", "LSP Diagnostics" },
  g = { "<cmd>Telescope git_status<cr>", "Git changed files" },
  c = { "<cmd>Telescope command_history initial_mode=normal<cr>", "Command History" },
  a = { "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>", "Find All Files" },
  -- f = { "<cmd>Telescope find_files<cr>", "Find Project File" },
  f = { "<Cmd>lua require('telescope').extensions.smart_open.smart_open()<CR>", "Find Project File" },
  h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
  M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
  m = { require("lvim.lsp.utils").format, "Format" },
  r = { "<cmd>Telescope oldfiles initial_mode=normal only_cwd=true<cr>", "Open Recent Files" },
  R = { "<cmd>Telescope registers initial_mode=normal<cr>", "Registers" },
  w = { "<cmd>Telescope live_grep<cr>", "Grep Text" },
  k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  C = { "<cmd>Telescope commands<cr>", "Commands" },
  s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
  p = { "<cmd>Telescope projects<cr>", "Projects" },
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
  m    = { "<cmd>WindowsMaximize<CR>", "Toggle Maximize" },
  c    = { "<cmd>close<CR>", "Close split" },
  l    = { '<cmd>lua require("nvim-possession").list()<cr>', "Session List (<c-x> to delete)" },
  n    = { '<cmd>lua require("nvim-possession").new()<cr>', "Session New" },
  u    = { '<cmd>lua require("nvim-possession").update()<cr>', "Session Update" },
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
  -- t = {
  --   "<cmd>NvimTreeToggle<cr><cmd>lua require'centerpad'.toggle{ leftpad = 40, rightpad = 40 }<cr>",
  --   "Center Buffer",
  -- },
  t = {
    "<cmd>NoNeckPain<cr>",
    "Center Buffer",
  },
  g = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
  n = { "<cmd>tabnew<cr>", "New Tab" },
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
  p = { "<cmd>Octo pr list<cr>", "Octo PR list" },
  r = { "<cmd>Octo review resume<cr>", "Octo Review Resume" },
  R = { "<cmd>Octo review start<cr>", "Octo Review Start" },
}

lvim.builtin.which_key.mappings["r"] = {
  name = "Refactor / Rollback",
  l = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Git Rollback Line" },
  f = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Git File" },
}

lvim.builtin.which_key.mappings["l"]["R"] = { "<cmd>RenameState<cr>", "Rename React Hooks args" }

lvim.builtin.which_key.mappings["p"]["p"] = { "<cmd>Glow<cr>", "Preview" }
lvim.builtin.which_key.mappings[";"] = { "<cmd>lua require'lir.float'.toggle()<cr>", "Floating file explorer Lir" }
lvim.builtin.which_key.mappings["'"] = { "<cmd>Dirbuf<cr>", "DirBuf" }
lvim.builtin.which_key.mappings["j"] = { "<cmd>Telescope buffers previewer=false ignore_current_buffer=true sort_mru=true<cr>",
  "Find" }


lvim.builtin.which_key.on_config_done = function(wk)
  -- Debug / Test
  wk.register({
    name = "Test / Debug",
    t = {
      name = "Test",
      u = { function()
        require("user.cmds").buildProjectBefore(function()
          require("neotest").run.run()
        end)
      end, "Run nearest test under cursor" },
      t = { function()
        require("user.cmds").buildProjectBefore(function()
          require("neotest").run.run(vim.fn.expand("%"))
        end)
      end, "Test file" },
      o = { '<cmd>lua require("neotest").output.open({ enter = true })<cr>', "Test Output Dialog" }
    },
    d = {
      name = "Debug",
      u = { function()
        require("user.cmds").buildProjectBefore(function()
          require("neotest").run.run({ strategy = "dap" })
        end)
      end, "Debug nearest test under cursor" },
      d = { function()

        require("user.cmds").buildProjectBefore(function()
          require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
        end)
      end, "Debug File" },
    },
    b = { "<cmd> lua require'dap'.toggle_breakpoint()<CR>", "DAP Toggle Breakpoint" }
  }, {
    mode = "n", -- NORMAL mode
    prefix = ",",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  })
end
