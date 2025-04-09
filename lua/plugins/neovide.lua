if not vim.g.neovide then
  return {} -- do nothing if not in a Neovide session
end

-- if vim.g.neovide then
--   vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
--   vim.keymap.set("v", "<D-c>", '"+y') -- Copy
--   vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
--   vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
--   vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
--   vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
-- end
--
-- -- Allow clipboard copy paste in neovim
-- vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

vim.g.neovide_floating_shadow = false

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      opt = { -- configure vim.opt options
        -- configure font
        guifont = "BlexMono Nerd Font Mono:h13",
      },
    },
    mappings = {
      n = {
        ["<D-n>"] = { ":silent exec '!open --new -b com.neovide.neovide'<cr>" },
      },
    },
  },
}
