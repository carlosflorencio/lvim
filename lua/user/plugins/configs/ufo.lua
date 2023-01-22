require('ufo').setup({
  close_fold_kinds = { 'imports', 'comment' },
  provider_selector = function(bufnr, filetype, buftype)
    return { 'treesitter', 'indent' }
  end
})
