return {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    -- priority = 1000,
    config = function()
        vim.cmd.colorscheme "catppuccin"
    end
}

