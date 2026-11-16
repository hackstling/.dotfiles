return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        variant = "default",  -- "muted" gives a softer dark variant
    },
    config = function(_, opts)
        require("cyberdream").setup(opts)
        vim.cmd.colorscheme("cyberdream")
    end,
}
