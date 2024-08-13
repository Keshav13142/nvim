return {
	{
		"nvim-tree/nvim-tree.lua", -- File tree
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- Icons for stuff
		},
		config = function()
			local nvim_tree = require("nvim-tree")

			local function on_attach(bufnr)
				local api = require("nvim-tree.api")

				local function map(key, action, desc)
					vim.keymap.set(
						"n",
						key,
						action,
						{ desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
					)
				end

				map("-", api.tree.change_root_to_parent, "Up")
				map(".", api.node.run.cmd, "Run Command")
				map("<C-t>", api.node.open.tab, "Open: New Tab")
				map("g?", api.tree.toggle_help, "Help")
				map("h", api.node.navigate.parent_close, "Close Directory")
				map("m", api.marks.toggle, "Toggle Bookmark")
				map("o", api.node.run.system, "Run System")
				map("a", api.fs.create, "Create")
				map("q", api.tree.close, "Close")
				map("<CR>", api.node.open.edit, "Open")
				map("<Tab>", api.node.open.preview, "Open Preview")

				map("C", api.tree.collapse_all, "Collapse")
				map("E", api.tree.expand_all, "Expand All")

				map("K", api.node.show_info_popup, "Info")
				map("O", api.node.open.no_window_picker, "Open: No Window Picker")
				map("S", api.tree.search_node, "Search")

				map("d[", api.node.navigate.diagnostics.prev, "Prev Diagnostic")
				map("d]", api.node.navigate.diagnostics.next, "Next Diagnostic")

				map("[", api.node.navigate.git.prev, "Prev Git")
				map("]", api.node.navigate.git.next, "Next Git")

				map("dd", api.fs.trash, "Trash")
				map("D", api.fs.remove, "Delete")
				map("bd", api.marks.bulk.delete, "Delete Bookmarked")
				map("bmv", api.marks.bulk.move, "Move Bookmarked")
				map("x", api.fs.cut, "Cut")
				map("c", api.fs.copy.node, "Copy")
				map("p", api.fs.paste, "Paste")

				map("f", api.live_filter.start, "Filter")
				map("F", api.live_filter.clear, "Clean Filter")
				map("B", api.tree.toggle_no_buffer_filter, "Toggle No Buffer")
				map("H", api.tree.toggle_hidden_filter, "Toggle Dotfiles")
				map("I", api.tree.toggle_gitignore_filter, "Toggle Git Ignore")
				map("U", api.tree.toggle_custom_filter, "Toggle Hidden")

				map("r", api.fs.rename_basename, "Rename: Basename")
				map("e", api.fs.rename_sub, "Rename: Omit Filename")
				map("R", api.fs.rename, "Rename")

				map("v", api.node.open.vertical, "Open: Vertical Split")
				map("V", api.node.open.horizontal, "Open: Horizontal Split")

				map("ya", api.fs.copy.absolute_path, "Copy Absolute Path")
				map("yr", api.fs.copy.relative_path, "Copy Relative Path")
				map("yy", api.fs.copy.filename, "Copy Name")

				map("<2-LeftMouse>", api.node.open.edit, "Open")
				map("<2-RightMouse>", api.tree.change_root_to_node, "CD")
			end

			nvim_tree.setup({
				on_attach = on_attach,
				update_focused_file = {
					enable = true,
					update_cwd = false,
				},
				filters = {
					dotfiles = false,
					git_clean = false,
					git_ignored = false,
					no_buffer = false,
					custom = { "^.git$" },
				},
				renderer = {
					root_folder_modifier = ":t",
					icons = {
						glyphs = {
							default = "",
							symlink = "",
							folder = {
								arrow_open = "",
								arrow_closed = "",
								default = "",
								open = "",
								empty = "",
								empty_open = "",
								symlink = "",
								symlink_open = "",
							},
							git = {
								unstaged = "",
								staged = "S",
								unmerged = "",
								renamed = "➜",
								untracked = "U",
								deleted = "",
								ignored = "◌",
							},
						},
					},
				},
				diagnostics = {
					enable = true,
					show_on_dirs = true,
					icons = {
						hint = "",
						info = "",
						warning = "",
						error = "",
					},
				},
				view = {
					side = "right",
				},
			})
		end,
	},
}
