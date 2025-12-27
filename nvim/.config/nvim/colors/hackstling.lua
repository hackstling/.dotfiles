-- Logo Pastel Neon Colorscheme (Enhanced Syntax - Mocha-Inspired)
-- Save as ~/.config/nvim/colors/logo-pastel-neon.lua
-- Usage: vim.cmd.colorscheme 'logo-pastel-neon'
-- Enhancements: More colorful syntax with palette accents for keywords/loops/functions.
-- Bash-specific: if/while/do/done in sky/sapphire, local in teal, functions in blue, vars in text (italic).
-- General: Expanded TS/legacy groups for vibrancy without overload.

local colors = {
  -- Accents (neon pops from logo)
  rosewater = "#E8D0E0",
  flamingo = "#D8A8B8",
  pink = "#E0B8E0",
  mauve = "#C8A0D0",
  red = "#FF6A6A",
  maroon = "#D08090",
  peach = "#FFA080",
  yellow = "#FFD080",
  green = "#00FF41",
  teal = "#80E0E0",
  sky = "#80C0FF",
  sapphire = "#40A0FF",
  blue = "#00BFFF",
  lavender = "#D0B8E8",

  -- Text & Neutrals (pastel gradients)
  text = "#D9D0E2",
  subtext1 = "#B8B0C8",
  subtext0 = "#A8A0B8",
  overlay2 = "#9898B8",
  overlay1 = "#8484A0",
  overlay0 = "#707088",
  surface2 = "#6C6C84",
  surface1 = "#5C5C70",
  surface0 = "#48485A",

  -- Backgrounds (dark pastel base)
  base = "#2C2C36",
  mantle = "#24242E",
  crust = "#1A1A24",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Base
hi("Normal", { fg = colors.text, bg = colors.base })
hi("NormalFloat", { fg = colors.text, bg = colors.mantle })
hi("Comment", { fg = colors.overlay0, italic = true })
hi("LineNr", { fg = colors.overlay1 })
hi("CursorLineNr", { fg = colors.text, bg = colors.mantle })
hi("VertSplit", { fg = colors.surface0 })
hi("SignColumn", { bg = nil })
hi("EndOfBuffer", { fg = colors.base })

-- Syntax (enhanced with more accents for variety)
hi("Constant", { fg = colors.green })  -- Strings, literals
hi("String", { fg = colors.green })
hi("Character", { fg = colors.peach })
hi("Number", { fg = colors.yellow })
hi("Boolean", { fg = colors.peach })
hi("Float", { fg = colors.yellow })

hi("Function", { fg = colors.blue })  -- Functions, methods
hi("Identifier", { fg = colors.text, italic = true })  -- Variables
hi("Statement", { fg = colors.lavender })  -- Keywords, control flow
hi("Keyword", { fg = colors.mauve, bold = true })
hi("Conditional", { fg = colors.sky })  -- if/else/fi (more vibrant)
hi("Repeat", { fg = colors.sky })  -- for/while (loop keywords)
hi("Exception", { fg = colors.sapphire })  -- try/catch
hi("Operator", { fg = colors.sapphire })
hi("PreProc", { fg = colors.teal })  -- Macros, includes
hi("Include", { fg = colors.teal })
hi("Define", { fg = colors.mauve })
hi("Type", { fg = colors.sky })  -- Types, classes
hi("Typedef", { fg = colors.lavender })
hi("Structure", { fg = colors.lavender })
hi("Special", { fg = colors.pink })  -- Special chars
hi("SpecialChar", { fg = colors.peach })
hi("Tag", { fg = colors.blue })
hi("Delimiter", { fg = colors.overlay2 })
hi("Error", { fg = colors.red, bold = true })
hi("WarningMsg", { fg = colors.maroon })
hi("Todo", { fg = colors.peach, bg = colors.mantle })

-- Bash/Shell Specific (legacy groups for keywords like local/if/while/do/done)
hi("shDeref", { fg = colors.text, italic = true })  -- Variables ($var)
hi("shFunction", { fg = colors.blue })  -- Function names
hi("shStatement", { fg = colors.teal })  -- local, export
hi("shConditional", { fg = colors.sky })  -- if, elif, else, fi
hi("shLoop", { fg = colors.sky })  -- for, while
hi("shRepeat", { fg = colors.sapphire })  -- do, done
hi("shQuote", { fg = colors.green })  -- Strings
hi("shArith", { fg = colors.yellow })  -- Arithmetic

-- UI Elements
hi("StatusLine", { fg = colors.text, bg = colors.mantle })
hi("StatusLineNC", { fg = colors.overlay1, bg = colors.base })
hi("TabLine", { fg = colors.subtext1, bg = colors.surface0 })
hi("TabLineSel", { fg = colors.blue, bg = colors.base })
hi("TabLineFill", { bg = colors.base })
hi("Pmenu", { fg = colors.text, bg = colors.surface0 })
hi("PmenuSel", { fg = colors.base, bg = colors.blue })
hi("PmenuSbar", { bg = colors.surface1 })
hi("PmenuThumb", { bg = colors.overlay1 })
hi("WinSeparator", { fg = colors.surface1 })
hi("WildMenu", { fg = colors.base, bg = colors.lavender })

-- Diffs
hi("DiffAdd", { fg = colors.green, bg = colors.surface1 })
hi("DiffChange", { fg = colors.yellow, bg = colors.surface1 })
hi("DiffDelete", { fg = colors.red, bg = colors.surface1 })
hi("DiffText", { fg = colors.blue, bg = colors.surface1 })

-- LSP/Diagnostics (Catppuccin-style)
hi("DiagnosticError", { fg = colors.red })
hi("DiagnosticWarn", { fg = colors.yellow })
hi("DiagnosticInfo", { fg = colors.teal })
hi("DiagnosticHint", { fg = colors.lavender })
hi("DiagnosticVirtualTextError", { fg = colors.maroon })
hi("DiagnosticVirtualTextWarn", { fg = colors.peach })
hi("DiagnosticVirtualTextInfo", { fg = colors.teal })
hi("DiagnosticVirtualTextHint", { fg = colors.mauve })
hi("DiagnosticUnderlineError", { sp = colors.red, undercurl = true })
hi("DiagnosticUnderlineWarn", { sp = colors.yellow, undercurl = true })
hi("DiagnosticUnderlineInfo", { sp = colors.teal, undercurl = true })
hi("DiagnosticUnderlineHint", { sp = colors.lavender, undercurl = true })

-- Treesitter (expanded for more colorful captures)
hi("@constant", { fg = colors.green })
hi("@constant.builtin", { fg = colors.peach })
hi("@constant.macro", { fg = colors.teal })
hi("@string", { fg = colors.green })
hi("@string.escape", { fg = colors.peach })
hi("@string.regex", { fg = colors.yellow })
hi("@comment", { fg = colors.overlay0, italic = true })
hi("@comment.documentation", { fg = colors.overlay1, italic = true })
hi("@keyword", { fg = colors.mauve, bold = true })
hi("@keyword.function", { fg = colors.lavender })
hi("@keyword.return", { fg = colors.sapphire })
hi("@keyword.operator", { fg = colors.sapphire })
hi("@operator", { fg = colors.sapphire })
hi("@function", { fg = colors.blue })
hi("@function.builtin", { fg = colors.sky })
hi("@function.macro", { fg = colors.teal })
hi("@function.method", { fg = colors.blue })
hi("@type", { fg = colors.sky })
hi("@type.builtin", { fg = colors.lavender })
hi("@constructor", { fg = colors.lavender })
hi("@parameter", { fg = colors.text, italic = true })
hi("@variable", { fg = colors.text })
hi("@variable.builtin", { fg = colors.pink })
hi("@property", { fg = colors.text })
hi("@field", { fg = colors.teal })
hi("@punctuation.delimiter", { fg = colors.overlay2 })
hi("@punctuation.bracket", { fg = colors.overlay1 })
hi("@punctuation.special", { fg = colors.pink })
-- Bash/Shell TS enhancements
hi("@keyword.conditional.sh", { fg = colors.sky })  -- if/elif/else/fi
hi("@keyword.repeat.sh", { fg = colors.sky })  -- for/while
hi("@keyword.directive.sh", { fg = colors.sapphire })  -- do/done
hi("@keyword.function.sh", { fg = colors.teal })  -- local/export
hi("@variable.sh", { fg = colors.text, italic = true })

-- Links (Gruvbox nod)
hi("htmlLink", { fg = colors.blue, underline = true })
hi("helpHeader", { fg = colors.lavender, bold = true })

-- Terminal
hi("TermCursor", { fg = colors.base, bg = colors.text })
hi("TermCursorNC", { fg = colors.base, bg = colors.overlay1 })

-- Clear existing highlights (optional, for purity)
vim.cmd("highlight clear")

-- Set the colorscheme name
vim.cmd("set background=dark")

-- Links for compatibility
vim.cmd("hi! link DiagnosticInfo Comment")
vim.cmd("hi! link DiagnosticHint Comment")
vim.cmd("hi! link LspInfoList NormalFloat")
