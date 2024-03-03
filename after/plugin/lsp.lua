local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- mason
require("mason").setup({
	ui = {
		border = "none",
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "✗",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
})

local servers = {
	"bashls",
	"cssls",
	"gopls",
	"html",
	"jsonls",
	"lua_ls",
	"powershell_es",
	"pyright",
	"rust_analyzer",
	"tailwindcss",
	"tsserver",
	"yamlls",
}

require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = false,
})

local on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "sumneko_lua" then
		client.server_capabilities.documentFormattingProvider = false
	end

	local bufmap = function(keys, func)
		vim.keymap.set("n", keys, func, { buffer = bufnr, silent = true })
	end

	local builtins = require("telescope.builtin")

	bufmap("<leader>r", vim.lsp.buf.rename)
	bufmap("<leader>ca", vim.lsp.buf.code_action)

	bufmap("gd", vim.lsp.buf.definition)
	bufmap("gD", vim.lsp.buf.declaration)
	bufmap("gI", vim.lsp.buf.implementation)
	bufmap("<leader>D", vim.lsp.buf.type_definition)
	bufmap("gr", builtins.lsp_references)
	bufmap("<leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>")
	bufmap("<leader>ld", "<cmd>lua vim.diagnostic.open_float()<CR>")
	bufmap("<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>")
	bufmap("<leader>li", "<cmd>LspInfo<cr>")
	bufmap("<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>")
	bufmap("<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>")
	bufmap("<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	bufmap("<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>")

	bufmap("K", vim.lsp.buf.hover)

	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, {})
end

require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,

	["lua_ls"] = function()
		require("neodev").setup()
		require("lspconfig").lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					telemetry = { enable = false },
					format = {
						enable = false,
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						checkThirdParty = false,
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
})

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = true,
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})
