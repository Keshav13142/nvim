return {
	{
		"akinsho/toggleterm.nvim", -- Open terminals inside nvim
		config = function()
			local toggleterm = require("toggleterm")

			toggleterm.setup({
				open_mapping = [[<c-t>]],
				hide_numbers = true,
				shade_filetypes = {},
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				direction = "float",
				close_on_exit = true,
				shell = vim.o.shell,
			})

			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({
				cmd = "lazygit",
				hidden = true,
				float_opts = {
					width = vim.api.nvim_win_get_width(0),
					height = vim.api.nvim_win_get_height(0),
					border = "none",
					winblend = 0,
				},
			})

			function _LAZYGIT_TOGGLE()
				lazygit:toggle()
			end
		end,
	},
}
