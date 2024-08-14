local utils = {}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

local function nmap(key, map)
	keymap("n", key, map, opts)
end

local function lnmap(key, map)
	keymap("n", "<leader>" .. key, map, opts)
end

local function vmap(key, map)
	keymap("v", key, map, opts)
end

local function imap(key, map)
	keymap("i", key, map, opts)
end

-- Fix bug with  vim-visual-multi
vim.g.VM_maps = {
	["I BS"] = "", -- disable backspace mapping
}

-- move lines up and down
vmap("J", ":m '>+1<CR>gv=gv")
vmap("K", ":m '<-2<CR>gv=gv")

-- move by line on the screen rather than by line in the file
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Center cursor
nmap("<C-u>", "<C-u>zz")
nmap("<C-d>", "<C-d>zz")
nmap("n", "nzz")
nmap("N", "Nzz")
nmap("*", "*zz")
nmap("#", "#zz")
nmap("g*", "g*zz")
nmap("g#", "g#zz")

-- source file
nmap("<leader><leader>", ":so<CR>")

-- Fix issues with multi line insert and <C-c>
imap("<C-c>", "<ESC>")

-- save file
keymap({ "i", "v", "n", "s" }, "<C-s>", "<ESC>:w<CR>", opts)
lnmap("w", ":w<CR>")

-- Don't go to next char after ~
nmap("~", "~h")

-- some shortcuts for copy/paste
nmap("dp", "ddp")
nmap("dP", "ddkP")
nmap("yp", "yyp")
nmap("yP", "yyP")

-- paste and delete register stuff
vmap("p", '"_dP')
vmap("<leader>d", '"_d')
nmap("Y", "0y$")
-- Do not copy on x
nmap("x", '"_x')

-- Increment/decrement
nmap("+", "<C-a>")
nmap("-", "<C-x>")

-- set Shift+u as redo
nmap("<S-u>", "<C-r>")

-- Clear search with <ESC>
lnmap("h", ":noh<CR>")
nmap("<ESC>", ":noh<CR>")

-- better indenting
vmap("<", "<gv")
vmap(">", ">gv")

-- Search for word under cursor
keymap({ "n", "x" }, "gw", "*N", opts)

-- remap ^ and $
keymap({ "n", "v", "x", "o" }, "gh", "^", opts)
keymap({ "n", "v", "x", "o" }, "gl", "$", opts)

-- quit
nmap("<C-q>", ":qa!<CR>")
-- Close  current buffer
lnmap("q", ":Bdelete<CR>")
lnmap("Q", ":q<CR>")

-- Make current file executable
lnmap("x", ":!chmod +x %<CR>")

-- Sort lines
vmap("f", ":'<,'>!sort<CR>")

lnmap("v", ":vsp<CR>")
lnmap("V", ":sp<CR>")

--  Diagnostics
lnmap("od", ":Trouble diagnostics<CR>") -- open diagnostics
lnmap("st", ":Trouble<CR>") -- Trouble menu

-- save without formatting
lnmap("W", ":noautocmd w<CR>")

-- Lazy Git
lnmap("gg", ":lua _LAZYGIT_TOGGLE()<CR>")

-- Traverse diagnostics
nmap("[d", vim.diagnostic.goto_next)
nmap("]d", vim.diagnostic.goto_prev)

utils.keymap = keymap
utils.opts = opts
utils.nmap = nmap
utils.imap = imap
utils.vmap = vmap
utils.lnmap = lnmap

return utils
