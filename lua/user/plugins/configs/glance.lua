-- Lua configuration
local glance = require('glance')
local actions = glance.actions

glance.setup({
  mappings = {
    list = {
      ['j'] = actions.next_location,
      ['k'] = actions.previous_location,
      ['x'] = actions.jump_split,
    },
  },
})
