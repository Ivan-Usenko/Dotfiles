return {
    {
        "mason-org/mason.nvim",
        opts = {},
        config = function()
            require("mason").setup()
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright", "clangd" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })
            lspconfig.clangd.setup({
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--query-driver=/home/ivan/.platformio/packages/toolchain-xtensa-esp32s3/bin/xtensa-esp32s3-elf-*,/home/ivan/.platformio/packages/toolchain-atmelavr/bin/avr-*",
                    "--header-insertion=never"
                }
            })

            vim.keymap.set("n", "I", vim.lsp.buf.hover)
            vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
        end,
    },
}
