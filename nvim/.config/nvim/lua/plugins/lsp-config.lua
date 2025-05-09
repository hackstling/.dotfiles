return {
    {
        "williamboman/mason.nvim",
        version = "1.8.3",
        config = function()
            require('mason').setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        version = "1.29.0",
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { "lua_ls", "clangd", "bashls", "pyright", "jedi_language_server", "pyre", "pylsp", "jdtls", "rust_analyzer" }, -- find the list on github page of mason-lpsconfig
                automatic_installation = false
                -- ensure_installed = { "lua_ls", "clangd", "jedi_language_server", "pyre", "pylsp", "jdtls" } -- find the list on github page of mason-lpsconfig
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup({ capabilities = capabilities })
--            lspconfig.bashls.setup({})
            lspconfig.clangd.setup({ capabilities = capabilities })
--            lspconfig.pyright.setup({})
            lspconfig.pyre.setup({ capabilities = capabilities })
            lspconfig.jedi_language_server.setup({ capabilities = capabilities })
            lspconfig.pylsp.setup({ capabilities = capabilities })
            lspconfig.jdtls.setup({ capabilities = capabilities })
            lspconfig.rust_analyzer.setup({
              capabilities = capabilities,
              settings = {
                ["rust-analyzer"] = {
                  cargo = {
                    allFeatures = true,
                  },
                  checkOnSave = {
                    command = "clippy",
                  },
                },
              }
            })

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "See documentation"})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition"})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = "Code action"})
            vim.keymap.set('n', '<leader>ra', vim.lsp.buf.rename, { desc = "Rename"})
        end
    },
    {
        "simrat39/rust-tools.nvim",
        config = function()
            local rt = require("rust-tools")

            rt.setup({
                server = {
                    capabilities = require('cmp_nvim_lsp').default_capabilities(),
                    on_attach = function(_, bufnr)
                        vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                        vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                    end,
                },
            })
        end
    }
}
