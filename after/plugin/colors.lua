-- For neovim and nvim-tree transparency
require("transparent").setup({
	extra_groups = {
		"EndOfBuffer",
		"MsgArea",
		"Normal",
		"NormalFloat",
		"NormalNC",
		"NvimTreeEndOfBuffer",
		"NvimTreeNormal",
		"NvimTreeNormalFloat",
		"NvimTreeNormalNC",
		"SignColumn",
		"TelescopeBorder",
	},
})

-- For transparent bufferline
vim.g.transparent_groups = vim.list_extend(
	vim.g.transparent_groups or {},
	vim.tbl_map(function(v)
		return v.hl_group
	end, vim.tbl_values(require("bufferline.config").highlights))
)

require("colorizer").setup({
	filetypes = {
		"conf",
		"css",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"jsonc",
		"lua",
		"typescript",
		"typescriptreact",
		"yaml",
		"toml",
	},
	user_default_options = {
		RGB = true,
		RRGGBB = true,
		names = false,
		RRGGBBAA = false,
		AARRGGBB = true,
		rgb_fn = false,
		hsl_fn = false,
		css = false,
		css_fn = false,
		tailwind = true,
		mode = "background",
	},
})
