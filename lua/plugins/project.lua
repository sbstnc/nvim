---@type LazySpec
return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        projects = {
          finder = "recent_projects",
          format = "file",
          dev = {
            "~/repos/paymenttools/",
            "~/repos/private/",
            "~/.config/nvim/",
          },
        },
      },
    },
  },
}
