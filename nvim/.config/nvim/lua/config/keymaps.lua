vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set({"v", "n", "x"}, "<leader>y", '"+y')
vim.keymap.set({"v", "n", "x"}, "<leader>d", '"+d')
