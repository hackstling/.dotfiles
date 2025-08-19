vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set relativenumber")

vim.opt.conceallevel = 2
vim.g.vim_markdown_folding_disabled = 1

-- Set leader to space
vim.g.mapleader = " "

-- tmux-like navigation between buffers
vim.keymap.set("n","<leader>n",":bn<CR>")
vim.keymap.set("n","<leader>p",":bp<CR>")
vim.keymap.set("n","<leader>x",":bd<CR>")

-- markdown preview
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>")

-- autocompletiong in insert mode
-- vim.keymap.set('i', '<C-x><C-o>', '<C-n>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-c>c', '<C-n>', { noremap = true, silent = true })

-- yank to clipboard
vim.keymap.set({"n","v"}, "<leader>y", [["+yy]])

--
