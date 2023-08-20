return {
	"ThePrimeagen/vim-be-good",
	"akinsho/toggleterm.nvim",
	"folke/neodev.nvim",
	"folke/zen-mode.nvim",
	"kosayoda/nvim-lightbulb",
	"mg979/vim-visual-multi",
	"mhinz/vim-startify",
	"mrjones2014/smart-splits.nvim",
	"nvim-lua/plenary.nvim",
	"sainnhe/gruvbox-material",
	"tpope/vim-repeat",
	"tpope/vim-sleuth",
	"tpope/vim-speeddating",
	"tpope/vim-unimpaired",
	"nvim-tree/nvim-tree.lua",
	"xiyaowong/transparent.nvim",
	"wellle/targets.vim",
	"nvim-tree/nvim-web-devicons",

	-- Lsp/linters
	"williamboman/mason.nvim",
	"neovim/nvim-lspconfig",
	"williamboman/mason-lspconfig.nvim",
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
	},

	-- Cmp
	"hrsh7th/nvim-cmp",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",

	-- Snipppets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	{
		"akinsho/bufferline.nvim",
		opts = {},
	},

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

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},

	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		opts = {},
	},

	{
		"numToStr/Comment.nvim",
		opts = {},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	-- Telescope
	"nvim-telescope/telescope.nvim",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	"nvim-telescope/telescope-ui-select.nvim",

	-- Play with delimiters
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		opts = {},
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

	-- Use Ctrl + h,j,k,l to navigate across vim and tmux
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
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
				"css",
				"html",
				"lua",
				"javascriptreact",
				"typescriptreact",
			},
			user_default_options = {
				tailwind = true,
			},
		},
	},

	-- Show tailwind colors
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
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

	-- Sync-edit html/jsx tags
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},

	-- Comment stuff in jsx/tsx correctly
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = "BufRead",
	},

	-- Show function signature when you type
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		opts = {},
	},

	-- open url with gx
	{ "felipec/vim-sanegx", event = "BufRead" },
}
