require("config.keymaps")
require("config.options")
require("config.lazy")

vim.api.nvim_create_autocmd("User", {
    pattern = "CustomEvent",
    callback = function()
        print("My custom event was triggered!")
    end,
})
