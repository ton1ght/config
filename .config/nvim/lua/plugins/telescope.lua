return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
		vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find Symbols" })

		require("telescope").setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
					},
				},
			},
		})
	end,
}
