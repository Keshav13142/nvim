return {
	"ThePrimeagen/vim-be-good",
	"akinsho/toggleterm.nvim",
	"folke/neodev.nvim",
	"folke/zen-mode.nvim",
	"kosayoda/nvim-lightbulb",
	"mg979/vim-visual-multi",
	"mrjones2014/smart-splits.nvim",
	"nvim-lua/plenary.nvim",
	"tpope/vim-repeat",
	"tpope/vim-sleuth",
	"tpope/vim-unimpaired",
	"nvim-tree/nvim-tree.lua",
	"xiyaowong/transparent.nvim",
	"wellle/targets.vim",
	"nvim-tree/nvim-web-devicons",

	-- Themes
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				inverse = true,
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
				dim_inactive = true,
				transparent_mode = true,
			})
			vim.cmd("colorscheme gruvbox")
		end,
	},

	-- Sync-edit html/jsx tags
	{ "windwp/nvim-ts-autotag", opts = {} },

	-- Comment stuff in jsx/tsx correctly
	{ "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead" },

	-- Show function signature when you type
	{ "ray-x/lsp_signature.nvim", event = "BufRead", opts = {} },

	-- Play with delimiters
	{ "kylechui/nvim-surround", event = "VeryLazy", opts = {} },

	-- Use Ctrl + h,j,k,l to navigate across vim and tmux
	{ "christoomey/vim-tmux-navigator", lazy = false },

	-- Dashboard
	{ "mhinz/vim-startify", lazy = false },

	-- open url with gx
	{ "felipec/vim-sanegx", event = "BufRead" },

	-- Smart comments
	{ "numToStr/Comment.nvim", opts = {} },

	-- Git indication
	{ "lewis6991/gitsigns.nvim", opts = {} },

	--- Syntax highlighting and much more
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	--- autocomplete pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},

	-- nvim-lsp progress
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		opts = {},
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
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			-- Show tailwind colors
			{
				"roobert/tailwindcss-colorizer-cmp.nvim",
				config = function()
					require("tailwindcss-colorizer-cmp").setup({
						color_square_width = 2,
					})
				end,
			},
		},
	},

	-- Snipppets
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
	},

	-- Visualize indenting
	{
		"echasnovski/mini.indentscope",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},

	-- Additional typescript functionalities
	{
		"jose-elias-alvarez/typescript.nvim",
		config = function()
			require("typescript").setup({
				disable_commands = false,
				debug = false,
				go_to_source_definition = {},
				fallback = true,
				server = {},
			})
		end,
	},

	-- Better code navigation
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump({
						search = {
							mode = function(str)
								return "\\<" .. str
							end,
						},
					})
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Flash Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},

	-- View nicer diagnostics
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
		config = function()
			require("trouble").setup({
				height = 5,
				padding = false,
			})
		end,
	},

	-- View colors in files
	{
		"NvChad/nvim-colorizer.lua",
		opts = {
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
		},
	},

	-- Highlight todo"s and other markers
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
