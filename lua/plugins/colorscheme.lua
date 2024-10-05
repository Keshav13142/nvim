return {
	"catppuccin/nvim",
	"folke/tokyonight.nvim",
	"RRethy/base16-nvim",
	"sainnhe/gruvbox-material",

	{
		"gremble0/yellowbeans.nvim",
		config = function()
			vim.cmd("colorscheme yellowbeans")
		end,
	},

	-- Make things transparent
	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({
				extra_groups = {
					"EndOfBuffer",
					"MsgArea",
					"Normal",
					"NormalFloat",
					"NormalNC",
					"SignColumn",
				},
			})

			require("transparent").clear_prefix("telescope")
			require("transparent").clear_prefix("BufferLine")
		end,
	},

	-- View colors in files
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
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
		end,
	},
}
