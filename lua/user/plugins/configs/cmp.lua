lvim.builtin.cmp.experimental.ghost_text = false

lvim.builtin.cmp.sources = {
  { name = "buffer" },
  { name = 'nvim_lsp_signature_help' },
  {
    name = "nvim_lsp",
    entry_filter = function(entry, ctx)
      local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
      if kind == "Snippet" and ctx.prev_context.filetype == "java" then
        return false
      end
      if kind == "Text" then
        return false
      end
      return true
    end,
    -- max_item_count = 5
  },
  { name = "luasnip" },
  { name = "path" },
  { name = "cmp_tabnine" },
  { name = "nvim_lua" },
  { name = "calc" },
  { name = "emoji" },
  { name = "treesitter" },
  { name = "crates" },
  { name = "tmux" },
}


lvim.builtin.cmp.cmdline = {
  enable = true,
  options = {
    {
      type = ":",
      sources = {
        { name = "path" },
        { name = "cmdline" },
      },
    },
    -- {
    --   type = { "/", "?" },
    --   sources = {
    --     { name = "buffer" },
    --   },
    -- },
  },
}

lvim.builtin.cmp.on_config_done = function(cmp)
  -- hide the copilot inline suggestion when the menu is open
  cmp.event:on("menu_opened", function()
    vim.b.copilot_suggestion_hidden = true
  end)

  cmp.event:on("menu_closed", function()
    vim.b.copilot_suggestion_hidden = false
  end)
end


-- lvim.builtin.cmp.sorting = {
--   priority_weight = 2,
--   comparators = {
--     require("copilot_cmp.comparators").prioritize,

--     cmp.config.compare.offset,
--     -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
--     cmp.config.compare.exact,
--     cmp.config.compare.score,
--     cmp.config.compare.recently_used,
--     cmp.config.compare.locality,
--     cmp.config.compare.kind,
--     -- cmp.config.compare.sort_text,
--     cmp.config.compare.length,
--     cmp.config.compare.order,
--   },
-- }


-- Sorting tweaks
-- https://github.com/hrsh7th/nvim-cmp/issues/156#issuecomment-916338617
