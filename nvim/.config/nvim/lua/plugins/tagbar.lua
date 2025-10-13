return {
	"preservim/tagbar",
	config = function()
        vim.keymap.set("n", "<leader>tt", ":TagbarToggle<CR>", { desc = "Toggle Tagbar"})
    end,
}
