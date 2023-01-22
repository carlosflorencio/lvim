# Neovim Config

Always a work in progress.

## First setup

- `:checkhealth`
- `:Mason`, install:
  - prettierd
  - node-debug2-adapter

## Reset the state

`rm -rf ~/.local/share/lunarvim`

## Notes to self

- Disable iterm2 font ligatures (might affect buffer scrolling performance)
- Fix Neovim >= 0.8 treesitter issues
  ```
  Since 0.8.0, Neovim bundles parsers and queries for c, lua, vim, and help. If you use nvim-treesitter, you must make sure these parsers are installed via nvim-treesitter so that both parser and queries (which are always installed) are taken from nvim-treesitter. (It's important for this that your nvim-treesitter plugin directory comes before both /usr/local/share/nvim/\* and /usr/lib/nvim in your runtimepath.)
  ```
  - `TSInstall help` - install languages again
  - Remove neovim included parsers from the filesystem (rename folder)
    - `/opt/homebrew/Cellar/neovim/0.8.2/share/nvim/runtime/queries`
- Update LunarVim core plugins:
  - Update plugin commit hash at `~/.local/share/lunarvim/lvim/snapshots`
