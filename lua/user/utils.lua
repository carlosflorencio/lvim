local M = {}


--- Trim string
---@param s string
---@return string
M.trim = function(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

--- Split string to a list
---@param inputstr string to split
---@param sep string Separator
---@return List
M.split = function(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

return M
