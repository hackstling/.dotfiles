return {
   "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set('n', '<leader>ee', ':Neotree toggle<CR>', { desc = "Toggle File Explorer"})
        vim.keymap.set('n', '<leader>ef', ':Neotree filesystem reveal left<CR>', { desc = "Show File Explorer on the Left"})
    end
}
