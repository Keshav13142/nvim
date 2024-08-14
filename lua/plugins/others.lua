return {
	"ThePrimeagen/vim-be-good", -- Get good at vim. Duh!
	"folke/zen-mode.nvim", -- Zen mode
	"kosayoda/nvim-lightbulb", -- Highlight code actions
	"mg979/vim-visual-multi", -- Better multi line editing
	"nvim-lua/plenary.nvim", -- dependency for many plugins
	"tpope/vim-repeat", -- Better repeat motions
	"tpope/vim-sleuth", -- Set buffer options automatically
	"wellle/targets.vim", -- Additional text objects
	"famiu/bufdelete.nvim", -- Delete buffers peacefully

	-- Sync-edit html/jsx tags
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					-- Defaults
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false, -- Auto close on trailing </
				},
			})
		end,
	},

	-- Highlight line indents
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		event = { "BufReadPre", "BufNewFile" },
		enabled = true,
	},

	-- Comment stuff in jsx/tsx correctly
	{ "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead" },

	-- Play with delimiters
	{ "kylechui/nvim-surround", event = "VeryLazy", opts = {} },

	-- Dashboard
	{ "mhinz/vim-startify", lazy = false },

	-- Smart comments
	{ "numToStr/Comment.nvim", opts = {} },

	-- Better inc/dec using C-a and C-x
	{
		"nat-418/boole.nvim",
		opts = {
			mappings = {
				increment = "<C-a>",
				decrement = "<C-x>",
			},
		},
	},

	-- Additional typescript functionalities
	{
		"jose-elias-alvarez/typescript.nvim",
		opts = {
			disable_commands = false,
			debug = false,
			go_to_source_definition = {},
			fallback = true,
			server = {},
		},
	},

	-- View nicer diagnostics
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
		opts = {
			height = 5,
			padding = false,
		},
	},

	-- Highlight todos and other markers
	{
		"folke/todo-comments.nvim",
		opts = {
			colors = {
				error = { "DiagnosticError", "ErrorMsg", "#EA6962" },
				warning = { "DiagnosticWarn", "WarningMsg", "#D8A657" },
				info = { "DiagnosticInfo", "#7DAEA3" },
				hint = { "DiagnosticHint", "#89B482" },
				default = { "Identifier", "#D3869B" },
				test = { "Identifier", "#E78A4E" },
			},
		},
	},

	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			"mfussenegger/nvim-dap-python", --optional
		},
		lazy = false,
		branch = "regexp", -- This is the regexp branch, use this for the new version
		config = function()
			require("venv-selector").setup()
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
}
