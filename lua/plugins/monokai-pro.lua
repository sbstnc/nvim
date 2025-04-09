---@type LazySpec
return {
  "loctvl842/monokai-pro.nvim",
  lazy = true,
  opts = {
    filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
    background_clear = {
      "float_win",
      "toggleterm",
    }, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
    override = function(c)
      local color_helper = require "monokai-pro.color_helper"
      local common_fg = color_helper.lighten(c.sideBar.foreground, 30)
      return {
        SnacksDashboardDir = { fg = c.base.dimmed3 },
        -- SnacksPicker = { bg = c.editor.background, fg = common_fg },
        -- SnacksPickerBorder = { bg = c.editor.background, fg = c.tab.unfocusedActiveBorder },
        SnacksPickerTree = { fg = c.editorLineNumber.foreground },
        SnacksPickerDirectory = { fg = common_fg },
        Directory = { bg = c.editor.background, fg = common_fg },
        SnacksPickerTotals = { fg = c.base.dimmed3 },
        SnacksPickerPathIgnored = { fg = c.base.dimmed3 },
        SnacksPickerPathHidden = { fg = c.base.dimmed3 },
        SnacksPickerDir = { fg = c.base.dimmed3 },
        SnacksPickerUnselected = { fg = c.base.dimmed3 },
        SnacksPickerBufFlags = { fg = c.base.dimmed3 },
        SnacksPickerKeymapRhs = { fg = c.base.dimmed3 },
        SnacksPickerGitStatusUntracked = { fg = c.base.dimmed3 },
        SnacksPickerGitStatusIgnored = { fg = c.base.dimmed3 },
      }
    end,
  },
}
