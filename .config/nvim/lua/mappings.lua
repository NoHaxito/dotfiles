require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map('n', 'nt', ':NvimTreeToggle<CR>', { desc = "NvimTreeToggle command" })
map('n', '<C>z', 'u')
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
