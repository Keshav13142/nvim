local function augroup(name)
	return vim.api.nvim_create_augroup("keshav" .. name, { clear = true })
end
local au = vim.api.nvim_create_autocmd

local reload_group = augroup("reload")
au("BufWritePost", {
	pattern = { "*tmux.conf" },
	command = "execute 'silent !tmux source <afile> --silent'",
	group = reload_group,
})

au("BufWritePost", {
	pattern = { ".skhdrc" },
	command = "!killall -q sxhkd && sxhkd &",
	group = reload_group,
})

local ft_group = augroup("filetype")
au({ "BufRead" }, {
	pattern = { "*.conf" },
	callback = function()
		vim.cmd([[set ft=sh]])
	end,
	group = ft_group,
})
au({ "BufRead" }, {
	pattern = { "*.rasi" },
	callback = function()
		vim.cmd([[set ft=sass]])
	end,
	group = ft_group,
})

-- reduce yank animation
au({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 40 })
	end,
	group = augroup("yank"),
})

-- set some options
local opt_group = augroup("opts")
au("Termopen", {
	desc = "Unclutter terminal",
	group = opt_group,
	pattern = { "*" },
	command = "setlocal nonumber norelativenumber scrolloff=0",
})
au("BufEnter", {
	pattern = { "*" },
	callback = function()
		vim.cmd([[set formatoptions-=cro]])
	end,
	group = opt_group,
})

-- open telescope on startup (Only works when netrw is disabled)
local ts_group = augroup("telescope")
au("VimEnter", {
	callback = function()
		local bufferPath = vim.fn.expand("%:p")
		if vim.fn.isdirectory(bufferPath) ~= 0 then
			local ts_builtin = require("telescope.builtin")
			vim.api.nvim_buf_delete(0, { force = true })
			ts_builtin.find_files()
		end
	end,
	group = ts_group,
})

-- Trim extra stuff
au({ "BufWritePre" }, {
	group = augroup("remove"),
	pattern = { "*" },
	callback = function()
		vim.cmd([[ %s/\s\+$//e ]]) -- trim trailing whitespace
	end,
})
