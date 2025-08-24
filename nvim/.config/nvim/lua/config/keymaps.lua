vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set({ "v", "n", "x" }, "<leader>y", '"+y')
vim.keymap.set({ "v", "n", "x" }, "<leader>d", '"+d')
vim.keymap.set("n", "K", "i<Cr><Esc>")

vim.keymap.set("n", "<leader>p", function()
    vim.diagnostic.config({ virtual_lines = true })
    vim.api.nvim_create_autocmd("CursorMoved", {
        once = true,
        callback = function()
            vim.diagnostic.config({ virtual_lines = false })
        end,
    })
end)
