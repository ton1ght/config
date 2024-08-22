return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	}, -- use if prefer nvim-web-devicons
	config = function()
		require("oil").setup()
		vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Open Oil" })
	end,
}
