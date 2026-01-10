
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load custom colorscheme (after plugins)
-- local hackstling = require('hackstling')
-- hackstling.setup({
--   contrast = "soft",  -- Optional: "hard", "soft", or "" for default
--   italic = {
--     strings = false,
--     comments = true,
--     operators = false,
--     folds = true,
--   },
-- })
-- hackstling.load()

-- vim.o.background = "dark"  -- Or "light" if you want a variant


require("vim-options")
require("lazy").setup("plugins")

vim.opt.termguicolors = true -- bufferline
require("bufferline").setup{} -- bufferline
