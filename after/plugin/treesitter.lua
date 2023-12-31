require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = { enable = true },
	sync_install = false,
	autopairs = {
		enable = true,
	},
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
