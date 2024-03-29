local telescope = require("telescope")
local actions = require("telescope.actions")

local function include_hidden()
	return { "--hidden", "--glob", "!**/.git/*" }
end

telescope.setup({
	defaults = {
		file_ignore_patterns = {
			".git/",
			".node_modules/",
		},
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
