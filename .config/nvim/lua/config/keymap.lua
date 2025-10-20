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
vim.keymap.set("n", "<leader>tb", ":LspTexlabBuild<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tf", ":LspTexlabForward<CR>", { noremap = true, silent = true })

-- select
vim.keymap.set("n", "gp", "`[v`]", { desc = "Select pasted text" })

-- yank
vim.keymap.set("n", "yp", ':let @+ = expand("%:p")<cr>', { desc = "Yank current filepath" })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- misc
vim.keymap.set('x', '<C-l>', "<cmd>lua print(vim.fn.wordcount().visual_words)<CR>")
vim.keymap.set("n", "gq", "vapgq", { desc = "Format paragraph" })

vim.keymap.set({ "n", "v", "x" }, "<leader>fr", [[:s/\V]], { desc = "Enter substitue mode in selection" })

local function dec_to_hex(dec)
  dec = tonumber(dec)
  if not dec then return nil end
  return string.format("0x%X", dec)
end

local function convert_word_to_hex()
  local word = vim.fn.expand("<cword>")
  local hex = dec_to_hex(word)
  if hex then
    vim.cmd("normal! ciw" .. hex)
  end
end

vim.keymap.set("n", "<leader>x", convert_word_to_hex, { desc = "Convert word to hex" })
