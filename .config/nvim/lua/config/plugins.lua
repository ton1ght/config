vim.pack.add({
    { src = "https://github.com/catppuccin/nvim"},
    { src = "https://github.com/lewis6991/gitsigns.nvim"},
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch="master", build=":TSUpdate" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim",  tag = "0.1.8" },
    { src = "https://github.com/folke/which-key.nvim" },
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/nvim-mini/mini.surround" },
    { src = "https://github.com/latex-lsp/texlab" },
    { src = "https://github.com/ThePrimeagen/harpoon" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    {
      src = "https://github.com/L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
      build = "make install_jsregexp",
      tag = "v2.*"
    },
    { src = "https://github.com/Saghen/blink.cmp", version = 'v1.6.0' },
})

vim.cmd("colorscheme catppuccin")

vim.api.nvim_create_user_command("TodoHere", function()
  require("telescope.builtin").live_grep{
    default_text = [[TODO]],
    search_dirs = { vim.api.nvim_buf_get_name(0) },
  }
end, {})

vim.api.nvim_create_user_command("TodoAll", function()
  require("telescope.builtin").live_grep{
    default_text = [[TODO]],
  }
end, {})

vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Help Tags" })
vim.keymap.set("n", "<leader>fs", require("telescope.builtin").lsp_document_symbols, { desc = "Find Symbols" })
vim.keymap.set("n", "<leader>fth", "<cmd>TodoHere<cr>", { desc = "Find Todos in Buffer" })
vim.keymap.set("n", "<leader>fta", "<cmd>TodoAll<cr>", { desc = "Find Todos" })

require("telescope").setup({
    defaults = {
        path_display = { "smart" },
        mappings = {
            i = {
                ["<C-k>"] = require("telescope.actions").move_selection_previous, -- move to prev result
                ["<C-j>"] = require("telescope.actions").move_selection_next, -- move to next result
            },
        },
    },
})

require('mini.surround').setup({
  custom_surroundings = {
    e = { output = { left = '\\emph{', right = '}' } },
    t = { output = { left = '\\texttt{', right = '}' } },
  },
})

require("blink.cmp").setup({
    completion = {
        documentation = { auto_show = true },
    },
    signature = { enabled = true },
    snippets = { preset = "luasnip" },
})

require("oil").setup()
vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Open Oil" })

require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "c",
        "python",
        "latex",
    },
    highlight = { enable = true },
    indent = { enable = true },
})

require("harpoon").setup({})

vim.keymap.set("n", "<leader>hh", function()
    require("harpoon.ui").toggle_quick_menu()
end, { desc = "Open harpoon window" })

vim.keymap.set("n", "<leader>ha", function()
    require("harpoon.mark").add_file()
end, { desc = "Add to harpoon" })

for i = 1, 10 do
    vim.keymap.set("n", "<A-" .. i .. ">", function()
        require("harpoon.ui").nav_file(i)
    end)
end
vim.keymap.set("n", "<A-0>", function()
    require("harpoon.ui").nav_file(10)
end)

vim.keymap.set("n", "<A-->", function()
    require("harpoon.ui").nav_file(11)
end)

require('gitsigns').setup{
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', '<leader>hn', function()
      if vim.wo.diff then
        vim.cmd.normal({'<leader>hn', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end, { desc = "Next hunk." })

    map('n', '<leader>hp', function()
      if vim.wo.diff then
        vim.cmd.normal({'<leader>hp', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end, { desc = "Previous hunk." })

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk, { desc = "Stage hunk." })
    map('n', '<leader>hr', gitsigns.reset_hunk, { desc = "Reset hunk." })

    map('v', '<leader>hs', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)

    map('v', '<leader>hr', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)

    map('n', '<leader>hS', gitsigns.stage_buffer)
    map('n', '<leader>hR', gitsigns.reset_buffer)
    map('n', '<leader>hP', gitsigns.preview_hunk)
    map('n', '<leader>hi', gitsigns.preview_hunk_inline)

    map('n', '<leader>hb', function()
      gitsigns.blame_line({ full = true })
    end)

    map('n', '<leader>hd', gitsigns.diffthis)

    map('n', '<leader>hD', function()
      gitsigns.diffthis('~')
    end)

    map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
    map('n', '<leader>hq', gitsigns.setqflist)

    -- Toggles
    -- map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    -- map('n', '<leader>tw', gitsigns.toggle_word_diff)

    -- Text object
    map({'o', 'x'}, 'ih', gitsigns.select_hunk)
  end
}
