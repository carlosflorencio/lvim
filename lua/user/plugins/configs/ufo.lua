require('ufo').setup({
  close_fold_kinds = { 'imports' },
  -- provider_selector = function(bufnr, filetype, buftype)
  --   return { 'treesitter', 'indent' }
  -- end,
  preview = {
    mappings = {
      scrollU = '<C-u>',
      scrollD = '<C-d>'
    }
  },
})
