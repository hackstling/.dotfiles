-- Logo Pastel Neon Colorscheme (Bash-Fixed Links - Mocha-Inspired)
-- Fixes: Direct @keyword.conditional.bash to sky/bold; clears Statement link for TS priority.

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
  sky = "#80C0FF",  -- For conditionals/loops
  sapphire = "#40A0FF",  -- For do/done
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

-- Syntax (core groups - Statement kept neutral for non-TS fallback)
hi("Constant", { fg = colors.green })
hi("String", { fg = colors.green })
hi("Character", { fg = colors.peach })
hi("Number", { fg = colors.yellow })
hi("Boolean", { fg = colors.peach })
hi("Float", { fg = colors.yellow })

hi("Function", { fg = colors.blue })
hi("Identifier", { fg = colors.text, italic = true })  -- Italic vars
hi("Statement", { fg = colors.lavender })  -- Neutral fallback
hi("Keyword", { fg = colors.mauve, bold = true })
hi("Conditional", { fg = colors.sky, bold = true })  -- Legacy if/else
hi("Repeat", { fg = colors.sky, bold = true })  -- Legacy for/while
hi("Exception", { fg = colors.sapphire, bold = true })
hi("Operator", { fg = colors.sapphire })
hi("PreProc", { fg = colors.teal })
hi("Include", { fg = colors.teal })
hi("Define", { fg = colors.mauve })
hi("Type", { fg = colors.sky })
hi("Typedef", { fg = colors.lavender })
hi("Structure", { fg = colors.lavender })
hi("Special", { fg = colors.pink })
hi("SpecialChar", { fg = colors.peach })
hi("Tag", { fg = colors.blue })
hi("Delimiter", { fg = colors.overlay2 })
hi("Error", { fg = colors.red, bold = true })
hi("WarningMsg", { fg = colors.maroon })
hi("Todo", { fg = colors.peach, bg = colors.mantle })

-- Bash/Shell Legacy (direct for bashls fallback)
hi("shDeref", { fg = colors.text, italic = true })  -- $var
hi("shFunction", { fg = colors.blue })
hi("shStatement", { fg = colors.teal, bold = true })  -- local/export
hi("shConditional", { fg = colors.sky, bold = true })  -- if/elif/else/fi
hi("shLoop", { fg = colors.sky, bold = true })  -- for/while
hi("shRepeat", { fg = colors.sapphire, bold = true })  -- do/done
hi("shQuote", { fg = colors.green })
hi("shArith", { fg = colors.yellow })
-- Clear problematic links and re-link explicitly
vim.cmd("hi! clear shIf shWhile shFor shDo shDone shLocal")
vim.cmd("hi! link shIf shConditional")
vim.cmd("hi! link shWhile shLoop")
vim.cmd("hi! link shFor shLoop")
vim.cmd("hi! link shDo shRepeat")
vim.cmd("hi! link shDone shRepeat")
vim.cmd("hi! link shLocal shStatement")

-- UI Elements (unchanged)
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

-- Diffs (unchanged)
hi("DiffAdd", { fg = colors.green, bg = colors.surface1 })
hi("DiffChange", { fg = colors.yellow, bg = colors.surface1 })
hi("DiffDelete", { fg = colors.red, bg = colors.surface1 })
hi("DiffText", { fg = colors.blue, bg = colors.surface1 })

-- LSP/Diagnostics (unchanged)
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

-- Treesitter (Bash-focused - direct set for @keyword.conditional.bash to break link)
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
hi("@variable", { fg = colors.text, italic = true })
hi("@variable.builtin", { fg = colors.pink })
hi("@property", { fg = colors.text })
hi("@field", { fg = colors.teal })
hi("@punctuation.delimiter", { fg = colors.overlay2 })
hi("@punctuation.bracket", { fg = colors.overlay1 })
hi("@punctuation.special", { fg = colors.pink })
-- Bash TS - Direct overrides to break Statement link
hi("@keyword.conditional.bash", { fg = colors.sky, bold = true })
hi("@keyword.repeat.bash", { fg = colors.sky, bold = true })
hi("@keyword.directive.bash", { fg = colors.sapphire, bold = true })
hi("@keyword.function.bash", { fg = colors.teal, bold = true })
hi("@variable.bash", { fg = colors.text, italic = true })
hi("@function.bash", { fg = colors.blue })
hi("@string.shell", { fg = colors.green })
-- Clear TS links to Statement
vim.cmd("hi! clear @keyword.conditional.bash @keyword.repeat.bash @keyword.directive.bash @keyword.function.bash")
vim.cmd("hi! link @keyword.conditional.bash Conditional")
vim.cmd("hi! link @keyword.repeat.bash Repeat")
vim.cmd("hi! link @keyword.directive.bash shRepeat")
vim.cmd("hi! link @keyword.function.bash shStatement")

-- Rainbow Delimiters (6 levels with accents)
for i = 1, 6 do
  local rainbow_fg = ({
    colors.sapphire, colors.teal, colors.yellow, colors.peach, colors.pink, colors.mauve
  })[i]
  hi("RainbowDelimiter" .. i, { fg = rainbow_fg })
end

-- Clear & Set
vim.cmd("highlight clear")
vim.cmd("set background=dark")
vim.cmd("hi! link DiagnosticInfo Comment")
vim.cmd("hi! link DiagnosticHint Comment")
vim.cmd("hi! link LspInfoList NormalFloat")
