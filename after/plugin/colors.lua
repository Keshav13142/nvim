vim.cmd("colorscheme gruvbox-material")

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
