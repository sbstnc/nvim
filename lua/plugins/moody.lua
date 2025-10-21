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
    disabled_filetypes = { "TelescopePrompt", "snacks_picker_input", "snacks_dashboard" },
  },
}
