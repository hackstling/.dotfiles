return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,  -- Load on startup
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            contrast = "soft",         -- or "soft", or "" for default
            italic = {
                strings = false,
                comments = true,
                operators = false,
                folds = true,
            },
            overrides = {},
        })

        vim.o.background = "dark"       -- or "light" for gruvbox light mode
        vim.cmd.colorscheme("gruvbox")  -- Set the actual colorscheme
    end,
}
