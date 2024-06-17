return {
	"ThePrimeagen/vim-be-good", -- Get good at vim. Duh!
	"akinsho/toggleterm.nvim", -- Open terminals inside nvim
	"folke/neodev.nvim", -- Better lua lsp stuff
	"folke/zen-mode.nvim", -- Zen mode
	"kosayoda/nvim-lightbulb", -- Highlight code actions
	"mg979/vim-visual-multi", -- Better multi line editing
	"mrjones2014/smart-splits.nvim", -- Navigate between splits (mainly for wezterm, and tmux)
	"nvim-lua/plenary.nvim", -- dependency for many plugins
	"tpope/vim-repeat", -- Better repeat motions
	"tpope/vim-sleuth", -- Set buffer options automatically
	"nvim-tree/nvim-tree.lua", -- File tree
	"wellle/targets.vim", -- Additional text objects
	"nvim-tree/nvim-web-devicons", -- Icons for stuff
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

	-- Better code folds
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
			"luukvbaal/statuscol.nvim",
		},
	},

	-- Highlight line indents
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
