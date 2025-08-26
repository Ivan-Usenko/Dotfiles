return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    keys = {
        { ",v", "<cmd>VenvSelect<cr>" },
    },
    lazy = false,
    opts = {
        options = {
            debug = true,
            on_venv_activate_callback = function()
                vim.cmd("doautocmd User VenvActivated")
            end,
        },
    },
}
