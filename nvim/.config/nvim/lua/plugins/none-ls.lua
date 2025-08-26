local function pylint_init_hook()
    local installed, venv_selector = pcall(require, "venv-selector")

    if not installed then
        return ""
    end

    local venv = venv_selector.venv()
    local python = venv_selector.python()

    local cmd = string.format([[%s -c "import sysconfig; print(sysconfig.get_path('purelib'), end='')"]], python)

    local site_packages_path = vim.fn.system(cmd)

    local init_hook =
        string.format([[import sys; sys.prefix = '%s'; sys.path.insert(0, '%s')]], venv, site_packages_path)

    return init_hook
end

return {
    "nvimtools/none-ls.nvim",
    config = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VenvActivated",
            callback = function()
                local null_ls = require("null-ls")

                null_ls.reset_sources()
                null_ls.setup({
                    debug = true,
                    sources = {
                        null_ls.builtins.formatting.stylua,
                        null_ls.builtins.diagnostics.pylint.with({
                            diagnostics_postprocess = function(diagnostic)
                                diagnostic.code = diagnostic.message_id
                            end,
                            args = {
                                "--from-stdin",
                                "$FILENAME",
                                "-f",
                                "json",
                                "--init-hook",
                                pylint_init_hook(),
                            },
                        }),
                        null_ls.builtins.formatting.black,
                        null_ls.builtins.formatting.isort,
                    },
                })
            end,
        })

        vim.keymap.set("n", "<leader>fb", vim.lsp.buf.format)
    end,
}
