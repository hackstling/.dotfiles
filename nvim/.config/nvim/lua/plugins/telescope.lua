return {
    {
        'nvim-telescope/telescope.nvim',
        -- tag = '0.1.5',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep'
        },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files"})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep Files"})
            vim.keymap.set('n', '<leader>ld', builtin.lsp_definitions, {desc = "LSP: Go to Definition"})
            vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, {desc = "LSP: Document Symbols"})
            vim.keymap.set('n', '<leader>lw', builtin.lsp_workspace_symbols, {desc = "LSP: Workspace Symbols"})
            vim.keymap.set('n', '<leader>lr', builtin.lsp_references, {desc = "LSP: Find References"})
            -- vim.keymap.set('n', '<leader>lD', builtin.lsp_declarations, {desc = "LSP: Go to Declaration"})

      -- safe_map("<leader>li", "lsp_implementations", "LSP: Go to Implementation")
      -- safe_map("<leader>lr", "lsp_references", "LSP: Find References")
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    }
}
