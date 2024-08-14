return {
	{
		"mrjones2014/smart-splits.nvim", -- Navigate between splits (mainly for wezterm, and tmux)
		config = function()
			local nmap = require("keshav.keymaps").nmap
			local ss = require("smart-splits")
			ss.setup({})

			-- Navigate splits
			nmap("<C-h>", ss.move_cursor_left)
			nmap("<C-j>", ss.move_cursor_down)
			nmap("<C-k>", ss.move_cursor_up)
			nmap("<C-l>", ss.move_cursor_right)
			-- Resize splits
			nmap("<S-Left>", ss.resize_left)
			nmap("<S-Down>", ss.resize_down)
			nmap("<S-Up>", ss.resize_up)
			nmap("<S-Right>", ss.resize_right)
		end,
	},
}
