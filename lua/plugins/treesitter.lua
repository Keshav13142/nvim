return {
	{
		"nvim-treesitter/nvim-treesitter", -- Syntax highlighting and much more
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				highlight = { enable = true },
				sync_install = false,
				autopairs = {
					enable = true,
				},
				ignore_install = {},
				modules = {},
				indent = { enable = true },
				ensure_installed = {
					"comment",
					"gitcommit",
					"git_config",
					"gitignore",
					"javascript",
					"json",
					"jsonc",
					"lua",
					"markdown",
					"markdown_inline",
					"toml",
					"typescript",
					"vimdoc",
					"yaml",
				},
			})
		end,
	},
}
