return {
	{
		"akinsho/bufferline.nvim",
		config = function()
			local bufferline = require("bufferline")
			local keys = require("keshav.keymaps")

			bufferline.setup({
				options = {
					show_buffer_icons = false,
					show_buffer_close_icons = false,
				},
			})

			keys.nmap("<S-h>", ":BufferLineCyclePrev<CR>")
			keys.nmap("<S-l>", ":BufferLineCycleNext<CR>")
			keys.lnmap("bb", ":BufferLinePick<CR>")
			keys.lnmap("bc", ":BufferLinePickClose<CR>")
			keys.lnmap("bh", ":BufferLineCloseLeft<CR>")
			keys.lnmap("bl", ":BufferLineCloseRight<CR>")
			keys.lnmap("bf", ":Telescope buffers previewer=false<CR>")
		end,
	},
}
