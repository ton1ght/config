return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Open harpoon window" })

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "Add file to harpoon" })

		for i = 1, 10 do
			vim.keymap.set("n", "<A-" .. i .. ">", function()
				harpoon:list():select(i)
			end)
		end
		vim.keymap.set("n", "<A-0>", function()
			harpoon:list():select(10)
		end)
	end,
}
