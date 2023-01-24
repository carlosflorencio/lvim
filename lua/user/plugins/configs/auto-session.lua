require("auto-session").setup {
  log_level = "error",
  auto_session_suppress_dirs = {
    "~/",
    "~/Projects",
    "~/Downloads",
    "/",
  },

  -- postrestore_cmds = {
  --   function()
  --     return [[echo "hello world"]]
  --   end
  -- }
}
