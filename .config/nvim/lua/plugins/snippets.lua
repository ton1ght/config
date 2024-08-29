return {
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",

		dependencies = { "rafamadriz/friendly-snippets" },

		config = function()
			local ls = require("luasnip")

			-- Function to handle tab mappings
			local function expand_or_jump()
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				end
			end

			-- Function to handle shift-tab mappings
			local function jump_back()
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end

			-- Set up key mappings
			vim.keymap.set({ "i", "s" }, "<Tab>", expand_or_jump, { noremap = true, silent = true })
			vim.keymap.set({ "i", "s" }, "<S-Tab>", jump_back, { noremap = true, silent = true })

			-- Define LaTeX snippets
			ls.add_snippets(
				-- Define snippets for LaTeX
				"tex",
				{
					-- \texttt{}
					ls.snippet("tt", {
						ls.t("\\texttt{"),
						ls.i(1), -- Placeholder for user input
						ls.t("}"),
					}),

					-- \textit{}
					ls.snippet("it", {
						ls.t("\\textit{"),
						ls.i(1), -- Placeholder for user input
						ls.t("}"),
					}),

					-- \textbf{}
					ls.snippet("bf", {
						ls.t("\\textbf{"),
						ls.i(1), -- Placeholder for user input
						ls.t("}"),
					}),
				},
				{
					key = "tex",
				}
			)
			-- load friendly-snippets
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
