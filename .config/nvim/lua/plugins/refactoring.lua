return {
  "ThePrimeagen/refactoring.nvim",
  event = "User AstroFile",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        local get_icon = require("astroui").get_icon
        return require("astrocore").extend_tbl(opts, {
          mappings = {
            n = {
              ["<Leader>r"] = { desc = get_icon("Refactoring", 1, true) .. "Refactor" },
              ["<Leader>rb"] = {
                function() return require("refactoring").refactor "Extract Block" end,
                desc = "Extract Block",
                expr = true
              },
              ["<Leader>ri"] = {
                function() return require("refactoring").refactor("Inline Variable") end,
                desc = "Inline Variable",
                expr = true
              },
              ["<Leader>rp"] = {
                function() return require("refactoring").debug.printf { below = false } end,
                desc = "Debug: Print Function",
                expr = true
              },
              ["<Leader>rc"] = {
                function() return require("refactoring").debug.cleanup {} end,
                desc = "Debug: Clean Up",
                expr = true
              },
              ["<Leader>rd"] = {
                function() return require("refactoring").debug.print_var { below = false } end,
                desc = "Debug: Print Variable",
                expr = true
              },
              ["<Leader>rbf"] = {
                function() return require("refactoring").refactor "Extract Block To File" end,
                desc = "Extract Block To File",
                expr = true
              },
            },
            x = {
              ["<Leader>r"] = { desc = get_icon("Refactoring", 1, true) .. "Refactor" },
              ["<Leader>re"] = {
                function() return require("refactoring").refactor "Extract Function" end,
                desc = "Extract Function",
                expr = true
              },
              ["<Leader>rf"] = {
                function() return require("refactoring").refactor "Extract Function To File" end,
                desc = "Extract Function To File",
                expr = true
              },
              ["<Leader>rv"] = {
                function() return require("refactoring").refactor "Extract Variable" end,
                desc = "Extract Variable",
                expr = true
              },
              ["<Leader>ri"] = {
                function() return require("refactoring").refactor "Inline Variable" end,
                desc = "Inline Variable",
                expr = true
              },
            },
            v = {
              ["<Leader>r"] = { desc = get_icon("Refactoring", 1, true) .. "Refactor" },
              ["<Leader>re"] = {
                function() return require("refactoring").refactor "Extract Function" end,
                desc = "Extract Function",
                expr = true
              },
              ["<Leader>rf"] = {
                function() return require("refactoring").refactor "Extract Function To File" end,
                desc = "Extract Function To File",
                expr = true
              },
              ["<Leader>rv"] = {
                function() return require("refactoring").refactor "Extract Variable" end,
                desc = "Extract Variable",
                expr = true
              },
              ["<Leader>ri"] = {
                function() return require("refactoring").refactor "Inline Variable" end,
                desc = "Inline Variable",
                expr = true
              },
              ["<Leader>rb"] = {
                function() return require("refactoring").refactor "Extract Block" end,
                desc = "Extract Block",
                expr = true
              },
              ["<Leader>rbf"] = {
                function() return require("refactoring").refactor "Extract Block To File" end,
                desc = "Extract Block To File",
                expr = true
              },
              ["<Leader>rr"] = {
                function() return require("refactoring").select_refactor() end,
                desc = "Select Refactor",
                expr = true
              },
              ["<Leader>rp"] = {
                function() return require("refactoring").debug.printf { below = false } end,
                desc = "Debug: Print Function",
                expr = true
              },
              ["<Leader>rc"] = {
                function() return require("refactoring").debug.cleanup {} end,
                desc = "Debug: Clean Up",
                expr = true
              },
              ["<Leader>rd"] = {
                function() return require("refactoring").debug.print_var { below = false } end,
                desc = "Debug: Print Variable",
                expr = true
              },
            },
          },
        } --[[@as AstroCoreOpts]])
      end,
    },
    {
      "AstroNvim/astroui",
      ---@type AstroUIOpts
      opts = {
        icons = {
          Refactoring = "󰣪",
        },
      },
    },
  },
  opts = {},
}
