return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.goimports,       -- formats & fixes imports
                null_ls.builtins.diagnostics.golangci_lint,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format code"})

        -- Diagnostic display configuration
        vim.diagnostic.config({
            virtual_text = {
                prefix = "●",  -- could be "■", "●", "▎" to match your style
                spacing = 2,
            },
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })

        -- Keymap: open a floating window with diagnostics under cursor
        vim.keymap.set("n", "<leader>ed", vim.diagnostic.open_float, { desc = "Show diagnostics" })

	end,
}
