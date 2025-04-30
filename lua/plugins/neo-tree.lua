return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        always_show = {
          ".github",
          ".gitignore",
          ".release-please-manifest.json",
        },
        always_show_by_pattern = { -- uses glob style patterns
          ".env*",
          ".mise.*",
        },
      },
    },
  },
}
