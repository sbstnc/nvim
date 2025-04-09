---@type LazySpec
return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
                               __                
  ___     ___    ___   __  __ /\_\    ___ ___    
 / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  
/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ 
\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\
 \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
      },
      sections = {
        function()
          local mona = require "mona"
          mona.setup()
          return mona.header
        end,
        {
          pane = 2,
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
