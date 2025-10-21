---@type LazySpec
return {
  "svampkorg/moody.nvim",
  event = { "ModeChanged", "BufWinEnter", "WinEnter" },
  dependencies = {
    -- or whatever "colorscheme" you use to setup your HL groups :)
    -- Colours can also be set within setup, in which case this is redundant.
    "loctvl842/monokai-pro.nvim",
  },
  opts = {
    blends = {
      normal = 0.2,
      insert = 0.25,
      visual = 0.3,
      command = 0.25,
      operator = 0.25,
      replace = 0.25,
      select = 0.25,
      terminal = 0.25,
      terminal_n = 0.25,
    },
    disabled_filetypes = { "TelescopePrompt", "snacks_picker_input", "snacks_dashboard" },
  },
}
