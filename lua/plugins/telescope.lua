return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			local function include_hidden()
				return { "--hidden", "--glob", "!**/.git/*" }
			end

			telescope.setup({
				defaults = {
					file_ignore_patterns = { "node_modules", ".git" },
				},
				pickers = {
					find_files = {
						theme = "dropdown",
						previewer = false,
						hidden = true,
					},
					live_grep = {
						additional_args = include_hidden,
					},
					grep_string = {
						additional_args = include_hidden,
					},
					git_files = {
						theme = "dropdown",
						previewer = false,
					},
					buffers = {
						sort_mru = true,
						theme = "dropdown",
						previewer = false,
						mappings = {
							i = { ["<c-d>"] = actions.delete_buffer },
						},
					},
					man_pages = { sections = { "2", "3" } },
					lsp_references = { path_display = { "shorten" } },
					lsp_code_actions = { theme = "dropdown" },
					current_buffer_fuzzy_find = { theme = "dropdown" },
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")

			local lnmap = require("keshav.keymaps").lnmap
			local builtins = require("telescope.builtin")

			lnmap("gf", builtins.git_files)
			lnmap("sf", builtins.find_files)
			lnmap("sh", builtins.help_tags)
			lnmap("sg", builtins.live_grep)
			lnmap("sd", builtins.diagnostics)
			lnmap("sb", builtins.git_branches)
			lnmap("ss", builtins.colorscheme)
			lnmap("sv", builtins.lsp_dynamic_workspace_symbols)
			lnmap("sc", function()
				builtins.find_files({ cmd = vim.fn.stdpath("config") })
			end)
			lnmap("/", function()
				builtins.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					previewer = false,
				}))
			end)
		end,
	},
}
