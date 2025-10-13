-- return {
--   'HiPhish/nvim-ts-rainbow2',
--   config = function()
--     require('nvim-treesitter.configs').setup {
--       rainbow = {
--         enable = true,
--         -- Which query to use for finding delimiters
--         query = 'rainbow-parens',
--         -- Highlight the entire buffer all at once
--         strategy = require('ts-rainbow').strategy.global,
--       }
--     }
--   end,
-- }


return {
  "HiPhish/rainbow-delimiters.nvim",
  config = function()
    local rainbow_delimiters = require "rainbow-delimiters"

    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rainbow_delimiters.strategy["global"],
        vim = rainbow_delimiters.strategy["local"],
      },
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
      },
      highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      },
    }
  end,
}
