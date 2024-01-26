return {
	-- Get good at vim. Duh!
	"ThePrimeagen/vim-be-good",
	-- Open terminals inside nvim
	"akinsho/toggleterm.nvim",
	-- Better lua lsp stuff
	"folke/neodev.nvim",
	-- Zen mode
	"folke/zen-mode.nvim",
	-- Highlight code actions
	"kosayoda/nvim-lightbulb",
	-- Better multi line editing
	"mg979/vim-visual-multi",
	-- Navigate between splits (mainly for wezterm, and tmux)
	"mrjones2014/smart-splits.nvim",
	-- dependency for many plugins
	"nvim-lua/plenary.nvim",
	-- Better repeat motions
	"tpope/vim-repeat",
	-- Set buffer options automatically
	"tpope/vim-sleuth",
	-- File tree
	"nvim-tree/nvim-tree.lua",
	-- Make things transparent
	"xiyaowong/transparent.nvim",
	-- Additional text objects
	"wellle/targets.vim",
	-- Icons for stuff
	"nvim-tree/nvim-web-devicons",
	-- Delete buffers peacefully
	"famiu/bufdelete.nvim",
	-- View colors in files
	"NvChad/nvim-colorizer.lua",

	-- Theme (have to setup at start)
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
	-- Gruvbox theme
	{
		"sainnhe/gruvbox-material",
		priority = 1000,
		lazy = false,
		config = function()
			vim.g.gruvbox_material_transparent_background = 0
			vim.g.gruvbox_material_foreground = "mix"
			vim.g.gruvbox_material_background = "medium"
			vim.g.gruvbox_material_ui_contrast = "high"
			vim.g.gruvbox_material_float_style = "bright"
			vim.g.gruvbox_material_statusline_style = "material"
			vim.g.gruvbox_material_better_performance = 1

			vim.cmd.colorscheme("gruvbox-material")
		end,
	},

	-- Sync-edit html/jsx tags
	{
		"windwp/nvim-ts-autotag",
		opts = {
			enable = true,
			enable_rename = true,
			enable_close = true,
			enable_close_on_slash = true,
		},
	},

	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
			"luukvbaal/statuscol.nvim",
		},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		event = { "BufReadPre", "BufNewFile" },
		enabled = false,
	},

	-- Comment stuff in jsx/tsx correctly
	{ "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead" },

	-- Play with delimiters
	{ "kylechui/nvim-surround", event = "VeryLazy", opts = {} },

	-- Dashboard
	{ "mhinz/vim-startify", lazy = false },

	-- Smart comments
	{ "numToStr/Comment.nvim", opts = {} },

	-- Git indication
	{ "lewis6991/gitsigns.nvim", opts = {} },

	--- Syntax highlighting and much more
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
	},

	--- autocomplete pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},

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

	-- Show function signature when you type
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},

	-- Noice UI for buffers
	{
		"akinsho/bufferline.nvim",
		opts = {
			options = {
				show_buffer_icons = false,
				show_buffer_close_icons = false,
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

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			"nvim-telescope/telescope-ui-select.nvim",
		},
	},

	-- Lsp/linters
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{
				"jose-elias-alvarez/null-ls.nvim",
				event = { "BufReadPre", "BufNewFile" },
			},
			{
				"jay-babu/mason-null-ls.nvim",
				event = { "BufReadPre", "BufNewFile" },
			},
		},
	},

	-- Cmp
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		event = "InsertEnter",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"roobert/tailwindcss-colorizer-cmp.nvim",
		},
	},

	-- Snipppets
	{
		"L3MON4D3/LuaSnip",
		dependencies = "rafamadriz/friendly-snippets",
		event = "InsertEnter",
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
}
