return {
	{
		"lewis6991/gitsigns.nvim", -- Git indication
		config = function()
			local keys = require("keshav.keymaps")
			local gs = require("gitsigns")

			gs.setup({})

			keys.nmap("[g", function()
				gs.next_hunk({ navigation_message = false })
			end)
			keys.nmap("]g", function()
				gs.prev_hunk({ navigation_message = false })
			end)
			keys.lnmap("gb", gs.blame_line)
		end,
	},
}
