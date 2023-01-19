require("nvim-possession").setup({
  post_hook = function()
    require('nvim-tree').toggle(false, true)
  end,

  -- autoload = true
})
