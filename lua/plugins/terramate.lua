---@type LazySpec
return {
  {
    "terramate-io/vim-terramate",
    name = "terramate",
    lazy = true,
    ft = { "terramate" },
    dependencies = {
      {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
          filetypes = {
            pattern = {
              [".*%.tm"] = "terramate",
              [".*%.tm%.hcl"] = "terramate",
            },
          },
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    optional = true,
    opts = function(_, opts)
      opts.config.terramate = {
        cmd = { "terramate-ls" },
        filetypes = { "terramate" },
        root_dir = function(fname) return vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1]) end,
      }

      if vim.fn.executable "terramate-ls" == 1 then
        opts.servers = require("astrocore").list_insert_unique(opts.servers, { "terramate" })
      end
    end,
  },
}
