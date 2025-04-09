return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  event = "User AstroFile",
  config = function()
    local mc = require "multicursor-nvim"
    mc.setup()

    -- Mappings defined in a keymap layer only apply when there are
    -- multiple cursors. This lets you have overlapping mappings.
    mc.addKeymapLayer(function(layerSet)
      -- Select a different cursor as the main one.
      layerSet({ "n", "x" }, "<left>", mc.prevCursor)
      layerSet({ "n", "x" }, "<right>", mc.nextCursor)

      -- Delete the main cursor.
      layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

      -- Rotate the text contained in each visual selection between cursors.
      layerSet("x", "<leader>t", function() mc.transposeCursors(1) end)
      layerSet("x", "<leader>T", function() mc.transposeCursors(-1) end)

      -- Enable and clear cursors using escape.
      layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end)
    end)

    local hl = vim.api.nvim_set_hl
    hl(0, "MultiCursorCursor", { link = "Cursor" })
    hl(0, "MultiCursorVisual", { link = "Visual" })
    hl(0, "MultiCursorSign", { link = "SignColumn" })
    hl(0, "MultiCursorMatchPreview", { link = "Search" })
    hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
    hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
  end,
  dependencies = {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      local maps = opts.mappings
      local prefix = "<Leader>m"

      for lhs, map in pairs {
        [prefix] = { desc = "Multicursor" },

        ["<Up>"] = { function() require("multicursor-nvim").lineAddCursor(-1) end, desc = "Add cursor above" },
        ["<Down>"] = {
          function() require("multicursor-nvim").lineAddCursor(1) end,
          desc = "Add cursor below",
        },
        ["<Leader><Up>"] = {
          function() require("multicursor-nvim").lineSkipCursor(-1) end,
          desc = "Skip cursor above",
        },
        ["<Leader><Down>"] = {
          function() require("multicursor-nvim").lineSkipCursor(1) end,
          desc = "Skip cursor below",
        },
        [prefix .. "n"] = {
          function() require("multicursor-nvim").matchAddCursor(1) end,
          desc = "Add cursor for next word match",
        },
        [prefix .. "s"] = {
          function() require("multicursor-nvim").matchSkipCursor(1) end,
          desc = "Skip cursor for next word match",
        },
        [prefix .. "N"] = {
          function() require("multicursor-nvim").matchAddCursor(-1) end,
          desc = "Add cursor for previous word match",
        },
        [prefix .. "S"] = {
          function() require("multicursor-nvim").matchSkipCursor(-1) end,
          desc = "Skip cursor for previous word match",
        },
        [prefix .. "A"] = {
          require("multicursor-nvim").matchAllAddCursors,
          desc = "Add cursors for all matches of cursor word or selection",
        },

        ["<C-q>"] = { require("multicursor-nvim").toggleCursor, desc = "Toggle cursor" },
        [prefix .. "m"] = { require("multicursor-nvim").operator, desc = "Perform multicursor operation" },
      } do
        maps.n[lhs] = map
        maps.x[lhs] = map
      end

      -- mouse actions
      maps.n["<C-leftmouse>"] = { require("multicursor-nvim").handleMouse, desc = "Toggle cursor at mouse location" }
      maps.n["<C-leftdrag>"] = { require("multicursor-nvim").handleMouseDrag }
      maps.n["<C-leftrelease>"] = { require("multicursor-nvim").handleMouseRelease }

      -- normal mode actions
      maps.n[prefix .. "gv"] = { require("multicursor-nvim").restoreCursors, desc = "Restore cursors" }
      maps.n[prefix .. "a"] = { require("multicursor-nvim").alignCursors, desc = "Align cursor columns" }

      maps.n[prefix .. "/"] = { desc = "Search result actions" }
      maps.n[prefix .. "/n"] = {
        function() require("multicursor-nvim").searchAddCursor(1) end,
        desc = "Add cursor and jump to next search result",
      }
      maps.n[prefix .. "/N"] = {
        function() require("multicursor-nvim").searchAddCursor(-1) end,
        desc = "Add cursor and jump to previous search result",
      }
      maps.n[prefix .. "/s"] = {
        function() require("multicursor-nvim").searchSkipCursor(1) end,
        desc = "Jump to next search result",
      }
      maps.n[prefix .. "/S"] = {
        function() require("multicursor-nvim").searchSkipCursor(-1) end,
        desc = "Jump to previous search result",
      }
      maps.n[prefix .. "/A"] =
        { require("multicursor-nvim").searchAllAddCursors, desc = "Add a cursor to every search result in the buffer" }

      -- visual mode actions
      maps.x[prefix .. "S"] = { require("multicursor-nvim").splitCursors, desc = "Split visual selection by RegEx" }
      maps.x[prefix .. "i"] = { require("multicursor-nvim").insertVisual, desc = "Insert for each line of selection" }
      maps.x[prefix .. "a"] = { require("multicursor-nvim").appendVisual, desc = "Append for each line of selection" }
      maps.x[prefix .. "M"] =
        { require("multicursor-nvim").matchCursors, desc = "Create cursors within selection by RegEx" }
    end,
  },
  opts = {},
}
