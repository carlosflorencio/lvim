-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
-- lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
-- use c-e & c-y for scrolling
lvim.keys.normal_mode["zj"] = "o<ESC>k"
lvim.keys.normal_mode["zk"] = "O<ESC>j"
-- lvim.keys.normal_mode["<C-c>"] = ":BufferKill<CR>" -- close buffer
-- lvim.keys.normal_mode["<C-c>"] = ":bn|bd #<CR>" -- close buffer
lvim.keys.normal_mode["<C-c>"] = ":bn|sp|bp|bd<CR>" -- close buffer
lvim.keys.normal_mode["<S-l>"] = "<cmd>BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<S-h>"] = "<cmd>BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["gb"] = ":ls<CR>:b<Space>"

-- switch buffers with tab
-- lvim.keys.normal_mode["<tab>"] = ":bn!<cr>"
-- lvim.keys.normal_mode["<s-tab>"] = ":bp!<cr>"

-- Search and replace word under cursor using <F2>
vim.cmd [[ nnoremap <F2> :%s/<C-r><C-w>//<Left>]]
vim.keymap.set({ "n" }, "<F3>", function()
  local path = vim.fn.fnameescape(vim.fn.expand('%:p:.'))
  require('spectre').open_visual({ select_word = true, path = path })
end)

lvim.keys.visual_mode["<C-p>"] = "y'>p"

-- Regex explainer hide
vim.keymap.set('n', '<esc>', '<cmd>RegexplainerHide<cr>')

-- yanky ring
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")
vim.keymap.set({ "n", "i" }, "<c-v>", "<esc><cmd>Telescope yank_history initial_mode=normal<cr>")
vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)") -- prevent going up when yanking

-- jumps / cycles
lvim.keys.normal_mode["]e"] = vim.diagnostic.goto_next
lvim.keys.normal_mode["[e"] = vim.diagnostic.goto_prev
lvim.keys.normal_mode["]c"] = "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>"
lvim.keys.normal_mode["[c"] = "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>"
lvim.keys.normal_mode["]b"] = require('goto-breakpoints').next
lvim.keys.normal_mode["[b"] = require('goto-breakpoints').prev

-- fuzzy search current buffer
vim.keymap.set('n', '<c-/>', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })



-- harpoon
-- lvim.keys.normal_mode["<s-tab>"] = "<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>"

-- folds
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)

-- lSP
-- lvim.lsp.buffer_mappings.normal_mode["gi"] = { vim.lsp.buf.implementation, "Go to implementation" }
lvim.lsp.buffer_mappings.normal_mode["gd"] = { "<cmd>Glance definitions<cr>", "Preview Definitions" }
lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>Glance references<cr>", "Preview References" }
lvim.lsp.buffer_mappings.normal_mode["gt"] = { "<cmd>Glance type_definitions<cr>", "Preview Type Definitions" }
lvim.lsp.buffer_mappings.normal_mode["gi"] = { "<cmd>Glance implementations<cr>", "Preview implementations" }
lvim.lsp.buffer_mappings.normal_mode["K"] = { function()
  local winid = require('ufo').peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end, "Hover LSP or UFO peek" }

-- move the cursor without leaving insert mode
lvim.keys.insert_mode["<A-h>"] = "<Left>"
lvim.keys.insert_mode["<A-l>"] = "<Right>"

lvim.builtin.which_key.mappings["h"] = {
  name = "misc",
  a = { '<cmd>lua require("ts-node-action").node_action()<cr>', "Toggle node action under cursor" },
  s = { '<cmd>TSJToggle<cr>', "Toggle node split" },
  c = { '<cmd>lua require("neogen").generate()<cr>', "Generate Comment Annotation" }
}

lvim.builtin.which_key.mappings["q"] = { "<cmd>qa<cr>", "Quit All" }
-- lvim.builtin.which_key.mappings["x"] = { "<cmd>BufferKill<CR>", "Close Buffer" }
lvim.builtin.which_key.mappings["v"] = { "<cmd>vsplit<cr>", "vsplit" }
lvim.builtin.which_key.mappings["gy"] = "Github Link" -- git linker plugin

lvim.builtin.which_key.mappings["f"] = {
  name = "Find",
  b = { "<cmd>Telescope git_branches initial_mode=normal<cr>", "Checkout branch" },
  d = { "<cmd>Telescope diagnostics<cr>", "LSP Diagnostics" },
  g = { "<cmd>Telescope git_status<cr>", "Git changed files" },
  c = { "<cmd>Telescope command_history initial_mode=normal<cr>", "Command History" },
  a = { "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>", "Find All Files" },
  -- f = { "<cmd>Telescope find_files<cr>", "Find Project File" },
  f = { "<Cmd>lua require('telescope').extensions.smart_open.smart_open()<CR>", "Find Project File" },
  i = { "<Cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Find workspace symbols" },
  h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
  M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
  m = { require("lvim.lsp.utils").format, "Format" },
  r = { "<cmd>Telescope oldfiles initial_mode=normal only_cwd=true<cr>", "Open Recent Files" },
  R = { "<cmd>Telescope registers initial_mode=normal<cr>", "Registers" },
  w = { "<cmd>Telescope live_grep_args<cr>", "Grep Text" },
  -- w = { "<cmd>Telescope live_grep<cr>", "Grep Text" },
  k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  C = { "<cmd>Telescope commands<cr>", "Commands" },
  s = { "<cmd>Telescope aerial<cr>", "Document Symbols by Aerial" },
  p = { "<cmd>Telescope projects<cr>", "Projects" },
  S = { "<cmd>Telescope luasnip theme=dropdown<cr>", "Snippets" },
  u = { "<cmd>Telescope undo<cr>", "Undo list" },
  t = {
    "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
    "Colorscheme with Preview",
  },
}

lvim.builtin.which_key.mappings["s"] = {
  name = "Splits",
  t    = { "<cmd>AerialToggle!<CR>", "Toggle AerialToggle Symbols" },
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
      ":%bd|e#|bd#<cr>|'\"<cmd>NvimTreeOpen<cr><c-w><c-l>",
      "Close all buffers but the current one",
    }
  },
  w = { "<cmd>q<cr>", "Close Window" }
}

lvim.builtin.which_key.mappings["t"] = {
  name = "Toggle/Diagnostics",
  t = {
    "<cmd>ZenMode<cr>",
    "Center Buffer - Zen Mode",
  },
  g = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
  n = { "<cmd>tabnew<cr>", "New Tab" },
  c = { "<cmd>tabclose<cr>", "Close Tab" },
}

lvim.builtin.which_key.mappings["d"] = {
  name = "Debug",
  d = { "<cmd>lua require('refactoring').debug.printf({below = false})<CR>", "Debug statement using print" },
  v = { "<cmd>lua require('refactoring').debug.print_var({})<CR>", "Debug variable - print" },
  D = { "<cmd>lua require('refactoring').debug.cleanup({})<CR>", "Clean variable debugs" },
  r = { "<cmd>SnipRun<CR>", "Run the current line using Snip" },
  s = { "<cmd>CodiNew<CR>", "Creates a new Scratch buffer" }
}

lvim.builtin.which_key.vmappings["d"] = {
  name = "Debug",
  r = { "<cmd>SnipRun<CR>", "Run the current block using Snip" }
}

lvim.builtin.which_key.vmappings["s"] = {
  name = "Snippet",
  p = { function() require("silicon").visualise_api({ to_clip = true }) end, "Silicon code screenshot" }
}

lvim.builtin.which_key.vmappings["i"] = { '<esc>`<i', "Insert at beginning selection" }
lvim.builtin.which_key.vmappings["a"] = { '<esc>`>a', "Insert at end selection" }

lvim.builtin.which_key.mappings["o"] = {
  name = "Organize",
  i = { "<cmd>TypescriptOrganizeImports<cr>", "TS Organize Imports" },
  a = { "<cmd>TypescriptAddMissingImports<cr>", "TS Add missing Imports" },
  p = { "<cmd>Octo pr list<cr>", "Octo PR list" },
  r = { "<cmd>Octo review resume<cr>", "Octo Review Resume" },
  s = { "<cmd>Octo review submit<cr>", "Octo Review Submit" },
  R = { "<cmd>Octo review start<cr>", "Octo Review Start" },
  D = { "<cmd>Octo review discard<cr>", "Octo Review Discard" },
}

lvim.builtin.which_key.mappings["r"] = {
  name = "Refactor / Rollback",
  l = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Git Rollback Line" },
  f = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Git File" },
}

lvim.builtin.which_key.mappings["l"]["m"] = { "<cmd>RenameState<cr>", "Rename React Hooks args" }
lvim.builtin.which_key.mappings["l"]["e"] = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Open Diagnostic Float" }

lvim.builtin.which_key.vmappings["l"] = {
  ["r"] = {
    "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", "Refactoring"
  },
  ["a"] = {
    "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action"
  }
}

lvim.builtin.which_key.mappings["p"]["p"] = { "<cmd>Glow<cr>", "Preview" }
lvim.builtin.which_key.mappings["p"]["v"] = { "<cmd>lua require('package-info').change_version()<cr>",
  "Package.json Change Version Dep" }
lvim.builtin.which_key.mappings[";"] = { "<cmd>lua require'lir.float'.toggle()<cr>", "Floating file explorer Lir" }
lvim.builtin.which_key.mappings["'"] = { "<cmd>Dirbuf<cr>", "DirBuf" }
lvim.builtin.which_key.mappings["j"] = {
  "<cmd>Telescope buffers show_all_buffers=true previewer=false ignore_current_buffer=true sort_mru=true<cr>",
  "Open Buffers" }


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
      d = { function()
        require("user.cmds").buildProjectBefore(function()
          require("neotest").run.run({ strategy = "dap" })
        end)
      end, "Debug nearest test under cursor" },
      o = { '<cmd>lua require("neotest").output.open({ enter = true })<cr>', "Test Output Dialog" }
    },
    d = {
      name = "Debug",
      t = { function()
        require("user.cmds").buildProjectBefore(function()
          require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
        end)
      end, "Debug Test File" },
      d = { function()
        require("user.cmds").buildProjectBefore(function()
          require("dap").continue()
        end)
      end, "Debug File" },

    },
    h = {
      name = "HTTP",
      h = { "<Plug>RestNvim", "Run request under cursor" },
      p = { "<Plug>RestNvimPreview", "Preview the curl command under cursor" },
      l = { "<Plug>RestNvimLast", "Run last http request" },
    },
    b = {
      name = "Breakpoints",
      b = {
        "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<CR>",
        "Toggle Breakpoint",
      },
      c = {
        "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<CR>",
        "Conditional Breakpoint",
      },
      d = { "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>", "Delete all breakpoints" },
    },
    U = { "<cmd>lua require('dapui').toggle()<CR>", "DAP UI Toggle" },
    C = { "<cmd>lua require('dapui').close()<CR>", "DAP UI Close" },
    o = {
      name = "Overseer Tasks",
      o = { "<cmd>OverseerRun<cr>", "Run a Task" },
      t = { "<cmd>OverseerToggle<cr>", "Toggle Task List" },
      e = { "<cmd>OverseerQuickAction<cr>", "Edit the current Task" }
    }
  }, {
    mode = "n", -- NORMAL mode
    prefix = ",",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  })
end

function DiffviewToggle()
  local lib = require("diffview.lib")

  local view = lib.get_current_view()
  if view then
    -- Current tabpage is a Diffview; close it
    vim.cmd(":DiffviewClose")
    -- vim.cmd(":WindowsEnableAutowidth")
  else
    -- No open Diffview exists: open a new one
    -- vim.cmd(":WindowsDisableAutowidth")
    vim.cmd(":DiffviewOpen")
  end
end

lvim.builtin.which_key.mappings["g"]["D"] = { "<cmd>lua DiffviewToggle()<cr>", "DiffView Toggle" }
lvim.builtin.which_key.mappings["<space>"] = { "<c-^>", "Cycle between Previous Buffer" }
