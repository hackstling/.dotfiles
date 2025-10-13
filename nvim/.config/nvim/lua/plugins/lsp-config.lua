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
                ensure_installed = { "lua_ls", "clangd", "bashls", "pyright", "jedi_language_server", "pyre", "pylsp", "jdtls", "rust_analyzer", "gopls" }, -- find the list on github page of mason-lpsconfig
                -- ensure_installed = { "lua_ls", "clangd", "jedi_language_server", "pyre", "pylsp", "jdtls" } -- find the list on github page of mason-lpsconfig
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- Define configs
            vim.lsp.config("lua_ls", { capabilities = capabilities })
            vim.lsp.config("bashls", {})
            vim.lsp.config("clangd", { capabilities = capabilities })
            -- vim.lsp.config("pyright", {})
            vim.lsp.config("pyre", { capabilities = capabilities })
            vim.lsp.config("jedi_language_server", { capabilities = capabilities })
            vim.lsp.config("pylsp", { capabilities = capabilities })
            vim.lsp.config("jdtls", { capabilities = capabilities })
            vim.lsp.config("rust_analyzer", {
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

            vim.lsp.config("gopls", {
              capabilities = capabilities,
              settings = {
                gopls = {
                  analyses = {
                    unusedparams = true,
                    shadow = true,
                  },
                  staticcheck = true,
                },
              },
            })

            -- Enable servers
            vim.lsp.enable({ "lua_ls", "bashls", "clangd", "pyre", "jedi_language_server", "pylsp", "jdtls", "rust_analyzer", "gopls" })

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
            local util = require("lspconfig.util")
            rt.setup({
                server = {
                  root_dir = util.root_pattern("Cargo.toml", ".git"), -- ⬅ prioritize Cargo.toml
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
