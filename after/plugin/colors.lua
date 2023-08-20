vim.o.background = "dark"

require("gruvbox").setup({
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = true,
		comments = true,
		operators = false,
		folds = true,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = false,
	contrast = "soft",
	palette_overrides = {
		bright_aqua = "#89B482",
		bright_blue = "#83a598",
		bright_green = "#A9B665",
		bright_orange = "#E78A4E",
		bright_purple = "#d3869b",
		bright_red = "#EA6962",
		bright_yellow = "#D8A657",
		dark0 = "#282828",
		dark0_soft = "#1b1b1b",
		gray = "#7C6F64",
		light1 = "#D4BE98",
	},
	dim_inactive = false,
	transparent_mode = true,
})
vim.cmd("colorscheme gruvbox")

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
		"StatusLine",
		"StatusLineNC",
	},
})

-- For transparent bufferline
vim.g.transparent_groups = vim.list_extend(
	vim.g.transparent_groups or {},
	vim.tbl_map(function(v)
		return v.hl_group
	end, vim.tbl_values(require("bufferline.config").highlights))
)
