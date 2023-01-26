require("auto-session").setup {
  log_level = "error",
  auto_session_suppress_dirs = {
    "~/",
    "~/Projects",
    "~/Downloads",
    "/",
  },

  auto_session_use_git_branch = true

  -- postrestore_cmds = {
  --   function()
  --     return [[echo "hello world"]]
  --   end
  -- }
}
