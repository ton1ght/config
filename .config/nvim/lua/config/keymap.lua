-- set leader to space
vim.g.mapleader = " "

-- better window movement
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

-- buffer management
vim.keymap.set("n", "<leader>bc", "<cmd>bd<cr>", { desc = "Close buffer" })

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- move lines up or down
vim.keymap.set("n", "<S-j>", "<cmd>m+<CR>", { desc = "Move line up" })
vim.keymap.set("n", "<S-k>", "<cmd>m-2<CR>", { desc = "Move line down" })

-- buffer management
vim.keymap.set("n", "<leader>bca", "<cmd>%bd<cr>", { desc = "Buffer close all" })
vim.keymap.set("n", "<leader>bco", "<cmd>%bd|#e|bd#<cr>", { desc = "Buffer close others" })
vim.keymap.set("n", "<leader>bcc", "<cmd>bd<cr>", { desc = "Buffer close" })

--- texlab
vim.keymap.set("n", "<F12>", ":TexlabBuild<CR>", { noremap = true, silent = true })
