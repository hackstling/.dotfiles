return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "java", "javascript", "html", "bash", "asm", "yuck"},
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true }
        })
    end
}

