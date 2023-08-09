local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local ss = require("smart-splits")

local function nmap(key, map)
	keymap("n", key, map, opts)
end

local function vmap(key, map)
	keymap("v", key, map, opts)
end

local function imap(key, map)
	keymap("i", key, map, opts)
end

keymap({ "n", "v" }, "<Space>", "<Nop>", { noremap = true, expr = true, silent = true })

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
imap("<C-c>", "<Esc>")

-- Open netrw
nmap("<leader>e", ":NvimTreeToggle<CR>")

-- Ctrl+s to save
keymap({ "i", "v", "n", "s" }, "<C-s>", ":w<CR><esc>")

-- paste and delete register stuff
vmap("<leader>P", '"_dP')
vmap("<leader>D", '"_x')
nmap("Y", "0y$")
-- Do not copy on x
nmap("x", '"_x')

-- Increment/decrement
nmap("+", "<C-a>")
nmap("-", "<C-x>")

-- set Shift+u as redo
nmap("<S-u>", "<C-r>")

-- Clear search with <esc>
keymap({ "i", "n" }, "<leader>h", ":noh<CR><esc>")
keymap({ "i", "n" }, "<esc>", ":noh<CR><esc>")

-- better indenting
vmap("<", "<gv")
vmap(">", ">gv")

-- Search for word under cursor
keymap({ "n", "x" }, "gw", "*N")

-- remap ^ and $
keymap({ "n", "v", "x", "o" }, "gh", "^", opts)
keymap({ "n", "v", "x", "o" }, "gl", "$", opts)

-- quit
nmap("<C-q>", ":q!<CR>")
-- Close  current buffer
nmap("<leader>q", ":bd<CR>")

-- Navigate splits
nmap("<C-h>", ss.move_cursor_left)
nmap("<C-j>", ss.move_cursor_down)
nmap("<C-k>", ss.move_cursor_up)
nmap("<C-l>", ss.move_cursor_right)
--
nmap("<C-Left>", ss.move_cursor_left)
nmap("<C-Down>", ss.move_cursor_down)
nmap("<C-Up>", ss.move_cursor_up)
nmap("<C-Right>", ss.move_cursor_right)

-- Resize splits
nmap("<S-Left>", ss.resize_left)
nmap("<S-Down>", ss.resize_down)
nmap("<S-Up>", ss.resize_up)
nmap("<S-Right>", ss.resize_right)

-- Make current file executable
nmap("<leader>x", ":!chmod +x %<CR>")

-- Sort lines
vmap("f", ":'<,'>!sort<CR>")

nmap("<leader>v", ":vsp<CR>")
nmap("<leader>V", ":sp<CR>")

-- Telescope
local telescope = require("telescope.builtin")
nmap("<leader>gf", telescope.git_files)
nmap("<leader>sf", telescope.find_files)
nmap("<leader>sh", telescope.help_tags)
nmap("<leader>sg", telescope.live_grep)
nmap("<leader>sd", telescope.diagnostics)

-- Lsp
local dg = vim.diagnostic
local lbuf = vim.lsp.buf
nmap("<leader>ca", lbuf.code_action)
nmap("<leader>[d", dg.goto_prev)
nmap("<leader>]d", dg.goto_next)
nmap("<leader>lr", lbuf.rename)

--  Diagnostics
nmap("<leader>tt", ":TroubleToggle<CR>")
nmap("<leader>tw", ":TroubleToggle workspace_diagnostics<CR>")

-- save without formatting
nmap("<leader>W", ":noautocmd w<CR>")

-- Git
local gs = require("gitsigns")
nmap("<leader>gj", function()
	gs.next_hunk({ navigation_message = false })
end)
nmap("<leader>gk", function()
	gs.prev_hunk({ navigation_message = false })
end)
nmap("<leader>gl", gs.blame_line)
nmap("<leader>gb", telescope.git_branches)

-- Bufferline
nmap("<S-h>", ":BufferLineCyclePrev<CR>")
nmap("<S-l>", ":BufferLineCycleNext<CR>")
nmap("<leader>bb", ":BufferLinePick<CR>")
nmap("<leader>bc", ":BufferLinePickClose<CR>")
nmap("<leader>bh", ":BufferLineCloseLeft<CR>")
nmap("<leader>bl", ":BufferLineCloseRight<CR>")
nmap("<leader>bf", ":Telescope buffers previewer=false<CR>")
