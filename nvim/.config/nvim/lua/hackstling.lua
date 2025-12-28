---@class Hackstling
---@field config HackstlingConfig
---@field palette HackstlingPalette
local Hackstling = {}
---@alias Contrast "hard" | "soft" | ""
---@class ItalicConfig
---@field strings boolean
---@field comments boolean
---@field operators boolean
---@field folds boolean
---@field emphasis boolean
---@class HighlightDefinition
---@field fg string?
---@field bg string?
---@field sp string?
---@field blend integer?
---@field bold boolean?
---@field standout boolean?
---@field underline boolean?
---@field undercurl boolean?
---@field underdouble boolean?
---@field underdotted boolean?
---@field strikethrough boolean?
---@field italic boolean?
---@field reverse boolean?
---@field nocombine boolean?
---@class HackstlingConfig
---@field bold boolean?
---@field contrast Contrast?
---@field dim_inactive boolean?
---@field inverse boolean?
---@field invert_selection boolean?
---@field invert_signs boolean?
---@field invert_tabline boolean?
---@field italic ItalicConfig?
---@field overrides table<string, HighlightDefinition>?
---@field palette_overrides table<string, string>?
---@field strikethrough boolean?
---@field terminal_colors boolean?
---@field transparent_mode boolean?
---@field undercurl boolean?
---@field underline boolean?
local default_config = {
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = false,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  inverse = true,
  contrast = "",
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
}
Hackstling.config = vim.deepcopy(default_config)

-- Main palette (your extended Mocha-inspired colors)
---@class HackstlingPalette
Hackstling.palette = {
  -- Neutrals/Bases (dark variants)
  base = "#2C2C36",
  mantle = "#24242E",
  crust = "#1A1A24",
  surface0 = "#48485A",
  surface1 = "#5C5C70",
  surface2 = "#6C6C84",
  overlay0 = "#707088",
  overlay1 = "#8484A0",
  overlay2 = "#9898B8",
  text = "#D9D0E2",
  subtext1 = "#B8B0C8",
  subtext0 = "#A8A0B8",
  -- Accents (neon pops)
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
}

-- Get colors based on bg and contrast
local function get_colors()
  local p = Hackstling.palette
  local config = Hackstling.config
  for color, hex in pairs(config.palette_overrides) do
    p[color] = hex
  end
  local bg = vim.o.background
  local contrast = config.contrast
  local color_groups = {
    dark = {
      bg0 = p.base,
      bg1 = p.mantle,
      bg2 = p.surface0,
      bg3 = p.surface1,
      bg4 = p.surface2,
      fg0 = p.text,
      fg1 = p.subtext1,
      fg2 = p.subtext0,
      fg3 = p.overlay2,
      fg4 = p.overlay1,
      red = p.red,
      green = p.green,
      yellow = p.yellow,
      blue = p.blue,
      purple = p.mauve,
      aqua = p.teal,
      orange = p.peach,
      neutral_red = p.maroon,
      neutral_green = p.overlay0,
      neutral_yellow = p.overlay1,
      neutral_blue = p.overlay2,
      neutral_purple = p.lavender,
      neutral_aqua = p.sky,
      dark_red = p.maroon,
      dark_green = p.overlay0,
      dark_aqua = p.overlay1,
      gray = p.overlay0,
    },
  }
  if contrast ~= nil and contrast ~= "" then
    -- Adjust for contrast (e.g., harder bg0 for "hard")
    if contrast == "hard" then
      color_groups.dark.bg0 = p.crust
      color_groups.dark.bg1 = p.base
    elseif contrast == "soft" then
      color_groups.dark.bg0 = p.surface0
      color_groups.dark.bg1 = p.surface1
    end
  end
  return color_groups[bg]
end

-- Define all groups (comprehensive like gruvbox)
local function get_groups()
  local colors = get_colors()
  local config = Hackstling.config
  if config.terminal_colors then
    local term_colors = {
      colors.bg0, colors.neutral_red, colors.neutral_green, colors.neutral_yellow,
      colors.neutral_blue, colors.neutral_purple, colors.neutral_aqua, colors.fg4,
      colors.gray, colors.red, colors.green, colors.yellow, colors.blue,
      colors.purple, colors.aqua, colors.fg1,
    }
    for index, value in ipairs(term_colors) do
      vim.g["terminal_color_" .. index - 1] = value
    end
  end
  local groups = {
    -- Core Text/UI
    Normal = config.transparent_mode and { fg = colors.fg1, bg = nil } or { fg = colors.fg1, bg = colors.bg0 },
    NormalFloat = config.transparent_mode and { fg = colors.fg1, bg = nil } or { fg = colors.fg1, bg = colors.bg1 },
    NormalNC = config.dim_inactive and { fg = colors.fg0, bg = colors.bg1 } or { link = "Normal" },
    CursorLine = { bg = colors.bg1 },
    CursorColumn = { link = "CursorLine" },
    TabLineFill = { fg = colors.bg4, bg = colors.bg1, reverse = config.invert_tabline },
    TabLineSel = { fg = colors.green, bg = colors.bg1, reverse = config.invert_tabline },
    TabLine = { link = "TabLineFill" },
    MatchParen = { bg = colors.bg3, bold = config.bold },
    ColorColumn = { bg = colors.bg1 },
    Conceal = { fg = colors.blue },
    CursorLineNr = { fg = colors.yellow, bg = colors.bg1 },
    NonText = { link = "overlay2" },
    SpecialKey = { link = "fg4" },
    Visual = { bg = colors.bg3, reverse = config.invert_selection },
    VisualNOS = { link = "Visual" },
    Search = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    IncSearch = { fg = colors.orange, bg = colors.bg0, reverse = config.inverse },
    CurSearch = { link = "IncSearch" },
    QuickFixLine = { link = "mauve" },
    Underlined = { fg = colors.blue, underline = config.underline },
    StatusLine = { fg = colors.fg1, bg = colors.bg2 },
    StatusLineNC = { fg = colors.fg4, bg = colors.bg1 },
    WinBar = { fg = colors.fg4, bg = colors.bg0 },
    WinBarNC = { fg = colors.fg3, bg = colors.bg1 },
    WinSeparator = config.transparent_mode and { fg = colors.bg3, bg = nil } or { fg = colors.bg3, bg = colors.bg0 },
    WildMenu = { fg = colors.blue, bg = colors.bg2, bold = config.bold },
    Directory = { link = "green" },
    Title = { link = "green" },
    ErrorMsg = { fg = colors.bg0, bg = colors.red, bold = config.bold },
    MoreMsg = { link = "yellow" },
    ModeMsg = { link = "yellow" },
    Question = { link = "orange" },
    WarningMsg = { link = "red" },
    LineNr = { fg = colors.bg4 },
    SignColumn = config.transparent_mode and { bg = nil } or { bg = colors.bg1 },
    Folded = { fg = colors.gray, bg = colors.bg1, italic = config.italic.folds },
    FoldColumn = config.transparent_mode and { fg = colors.gray, bg = nil } or { fg = colors.gray, bg = colors.bg1 },
    Cursor = { reverse = config.inverse },
    vCursor = { link = "Cursor" },
    iCursor = { link = "Cursor" },
    lCursor = { link = "Cursor" },
    Special = { link = "orange" },
    Comment = { fg = colors.gray, italic = config.italic.comments },
    Todo = { fg = colors.bg0, bg = colors.yellow, bold = config.bold, italic = config.italic.comments },
    Done = { fg = colors.orange, bold = config.bold, italic = config.italic.comments },
    Error = { fg = colors.red, bold = config.bold, reverse = config.inverse },
    -- Syntax Groups (enhanced for Bash distinction)
    Statement = { fg = colors.lavender },  -- Fallback
    Conditional = { fg = colors.sky, bold = true },  -- Legacy if/else
    Repeat = { fg = colors.sky, bold = true },  -- Legacy for/while
    Exception = { fg = colors.sapphire, bold = true },
    Operator = { fg = colors.sapphire },
    PreProc = { fg = colors.teal },
    Include = { fg = colors.teal },
    Define = { fg = colors.mauve },
    Type = { fg = colors.sky },
    Typedef = { fg = colors.lavender },
    Structure = { fg = colors.lavender },
    Constant = { fg = colors.green },
    String = { fg = colors.green, italic = config.italic.strings },
    Character = { fg = colors.peach },
    Boolean = { fg = colors.peach },
    Number = { fg = colors.yellow },
    Float = { fg = colors.yellow },
    Function = { fg = colors.blue },
    Identifier = { fg = colors.text, italic = true },
    Keyword = { fg = colors.mauve, bold = true },
    SpecialChar = { fg = colors.peach },
    Tag = { fg = colors.blue },
    Delimiter = { fg = colors.overlay2 },
    -- Bash Legacy (direct)
    shDeref = { fg = colors.text, italic = true },
    shFunction = { fg = colors.blue },
    shStatement = { fg = colors.teal, bold = true },
    shConditional = { fg = colors.sky, bold = true },
    shLoop = { fg = colors.sky, bold = true },
    shRepeat = { fg = colors.sapphire, bold = true },
    shQuote = { fg = colors.green },
    shArith = { fg = colors.yellow },
    -- Treesitter (direct overrides for bash - no chaining)
    ["@keyword.conditional.bash"] = { fg = colors.sky, bold = true },
    ["@keyword.repeat.bash"] = { fg = colors.sky, bold = true },
    ["@keyword.directive.bash"] = { fg = colors.sapphire, bold = true },
    ["@keyword.function.bash"] = { fg = colors.teal, bold = true },
    ["@variable.bash"] = { fg = colors.text, italic = true },
    ["@function.bash"] = { fg = colors.blue },
    ["@string.shell"] = { fg = colors.green },
    -- General TS
    ["@constant"] = { fg = colors.green },
    ["@constant.builtin"] = { fg = colors.peach },
    ["@constant.macro"] = { fg = colors.teal },
    ["@string"] = { fg = colors.green },
    ["@string.escape"] = { fg = colors.peach },
    ["@string.regex"] = { fg = colors.yellow },
    ["@comment"] = { fg = colors.overlay0, italic = true },
    ["@keyword"] = { fg = colors.mauve, bold = true },
    ["@function"] = { fg = colors.blue },
    ["@type"] = { fg = colors.sky },
    ["@parameter"] = { fg = colors.text, italic = true },
    ["@variable"] = { fg = colors.text, italic = true },
    ["@operator"] = { fg = colors.sapphire },
    -- Diffs & Diagnostics
    DiffDelete = { bg = colors.maroon },
    DiffAdd = { bg = colors.overlay0 },
    DiffChange = { bg = colors.overlay1 },
    DiffText = { bg = colors.yellow, fg = colors.base },
    DiagnosticError = { fg = colors.red },
    DiagnosticWarn = { fg = colors.yellow },
    DiagnosticInfo = { fg = colors.teal },
    DiagnosticHint = { fg = colors.lavender },
    DiagnosticVirtualTextError = { fg = colors.maroon },
    DiagnosticVirtualTextWarn = { fg = colors.peach },
    DiagnosticVirtualTextInfo = { fg = colors.teal },
    DiagnosticVirtualTextHint = { fg = colors.mauve },
    DiagnosticUnderlineError = { sp = colors.red, undercurl = true },
    DiagnosticUnderlineWarn = { sp = colors.yellow, undercurl = true },
    DiagnosticUnderlineInfo = { sp = colors.teal, undercurl = true },
    DiagnosticUnderlineHint = { sp = colors.lavender, undercurl = true },
    -- Plugin Groups (minimal, extend as needed)
    SpellCap = { link = "blue" },
    SpellBad = { link = "red" },
    SpellLocal = { link = "teal" },
    SpellRare = { link = "mauve" },
    Whitespace = { fg = colors.bg2 },
    EndOfBuffer = { link = "NonText" },
    DiagnosticSignError = { fg = colors.red, bg = colors.bg1 },
    DiagnosticSignWarn = { fg = colors.yellow, bg = colors.bg1 },
    DiagnosticSignInfo = { fg = colors.teal, bg = colors.bg1 },
    DiagnosticSignHint = { fg = colors.lavender, bg = colors.bg1 },
    DiagnosticFloatingError = { link = "red" },
    DiagnosticFloatingWarn = { link = "orange" },
    DiagnosticFloatingInfo = { link = "teal" },
    DiagnosticFloatingHint = { link = "lavender" },
    LspReferenceRead = { link = "yellow" },
    LspReferenceTarget = { link = "Visual" },
    LspReferenceText = { link = "yellow" },
    LspReferenceWrite = { link = "orange" },
    LspCodeLens = { link = "gray" },
    LspSignatureActiveParameter = { link = "Search" },
    -- Rainbow Delimiters (6 levels)
    RainbowDelimiterRed = { fg = colors.red },
    RainbowDelimiterOrange = { fg = colors.peach },
    RainbowDelimiterYellow = { fg = colors.yellow },
    RainbowDelimiterGreen = { fg = colors.green },
    RainbowDelimiterBlue = { fg = colors.blue },
    RainbowDelimiterViolet = { fg = colors.mauve },
    RainbowDelimiterCyan = { fg = colors.teal },
  }
  -- Apply overrides
  for group, hl in pairs(config.overrides) do
    if groups[group] then groups[group].link = nil end
    groups[group] = vim.tbl_extend("force", groups[group] or {}, hl)
  end
  return groups
end

---@param config HackstlingConfig?
Hackstling.setup = function(config)
  Hackstling.config = vim.deepcopy(default_config)
  Hackstling.config = vim.tbl_deep_extend("force", Hackstling.config, config or {})
end

--- Load the colorscheme
Hackstling.load = function()
  if vim.version().minor < 8 then
    vim.notify_once("hackstling: requires Neovim 0.8+")
    return
  end
  -- Clear all
  if vim.g.colors_name then vim.cmd.hi("clear") end
  vim.g.colors_name = "hackstling"
  vim.o.termguicolors = true
  local groups = get_groups()
  -- Set highlights
  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return Hackstling
