require("zen-mode").setup {
  width = 150,

  plugins = {
    options = {
      enabled = false,
      ruler = true, -- disables the ruler text in the cmd line area
      showcmd = true, -- disables the command in the last line of the screen
    },
    gitsigns = { enabled = true }, -- disables git signs
  },
}
