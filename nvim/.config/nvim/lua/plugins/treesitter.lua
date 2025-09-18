return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "python", "c", "cpp" },
			highlight = { enabled = true },
			indent = { enable = true },
		})
	end,
}
