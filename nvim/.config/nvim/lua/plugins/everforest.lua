
return {
  "neanias/everforest-nvim",
  version = false,
  lazy = true,
  priority = 1000, -- load before everything else
  config = function()
    require("everforest").setup({
      -- Dark / medium is the classic look
      background = "medium",
 
      -- How much colour the UI gets (soft | medium | hard)
      ui_contrast = "low",
 
      -- Italics for comments & keywords (looks great with JetBrainsMono)
      italics = true,
 
      -- Dimmed inactive windows
      dim_inactive_windows = true,
 
      -- Diagnostic virtual text style: coloured or greyscale
      diagnostic_text_highlight = false,
      diagnostic_line_highlight  = false,
      diagnostic_virtual_text    = "coloured",
 
      -- Sign column blends into background
      sign_column_background = "none",
 
      -- Float border matches the theme
      float_style = "bright",
 
      on_highlights = function(hl, palette)
        -- Slightly more visible line number for current line
        hl.CursorLineNr = { fg = palette.yellow, bold = true }
 
        -- Subtle indent guides (if you use indent-blankline)
        hl.IblIndent  = { fg = palette.bg3 }
        hl.IblScope   = { fg = palette.grey1 }
 
        -- Transparent-friendly: make Normal bg the kitty bg
        -- Uncomment below if you want a fully transparent terminal bg:
        -- hl.Normal     = { fg = palette.fg, bg = "NONE" }
        -- hl.NormalNC   = { fg = palette.fg, bg = "NONE" }
        -- hl.SignColumn  = { bg = "NONE" }
        -- hl.StatusLine  = { bg = "NONE" }
      end,
    })
 
    vim.cmd("colorscheme everforest")
  end,
}
