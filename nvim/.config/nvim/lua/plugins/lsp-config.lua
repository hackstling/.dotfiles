return {
    {
        "williamboman/mason.nvim",
        config = function()
            require('mason').setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { "lua_ls", "clangd", "bashls", "pyright", "jedi_language_server", "pyre", "pylsp", "jdtls", "rust_analyzer" } -- find the list on github page of mason-lpsconfig
                -- ensure_installed = { "lua_ls", "clangd", "jedi_language_server", "pyre", "pylsp", "jdtls" } -- find the list on github page of mason-lpsconfig
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup({})
--            lspconfig.bashls.setup({})
            lspconfig.clangd.setup({})
--            lspconfig.pyright.setup({})
            lspconfig.pyre.setup({})
            lspconfig.jedi_language_server.setup({})
            lspconfig.pylsp.setup({})
            lspconfig.jdtls.setup({})
            lspconfig.rust_analyzer.setup({})

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "See documentation"})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition"})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = "Code action"})
            vim.keymap.set('n', '<leader>ra', vim.lsp.buf.rename, { desc = "Rename"})
        end
    }
}
