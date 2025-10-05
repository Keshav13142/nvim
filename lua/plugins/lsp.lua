return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{
				"ray-x/lsp_signature.nvim", -- Show function signature when you type
				event = "VeryLazy",
				config = function(_, opts)
					require("lsp_signature").setup(opts)
				end,
			},
		},
		config = function()
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
				"clangd",
				"cssls",
				"gopls",
				"html",
				"jsonls",
				"lua_ls",
				"pyright",
				"rust_analyzer",
				"svelte",
				"tailwindcss",
				"ts_ls",
				"yamlls",
				"fish_lsp",
			}

			local is_win = jit.os == "Windows"
			if is_win then
				table.insert(servers, "powershell_es")
				table.remove(servers, 1) -- remove bash lsp in windows
			end

			require("mason-lspconfig").setup({
				ensure_installed = servers,
				automatic_installation = false,
			})

			vim.lsp.config("lua_ls", {
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

			local on_attach = function(client, bufnr)
				if client.name == "ts_ls" then
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
				bufmap("<leader>lr", vim.lsp.buf.references)
				bufmap("<leader>ld", vim.diagnostic.open_float)
				bufmap("<leader>lf", function()
					vim.lsp.buf.format({ async = true })
				end)
				bufmap("<leader>li", "<cmd>LspInfo<cr>")
				bufmap("<leader>lq", vim.diagnostic.setloclist)
				bufmap("<leader>ls", vim.lsp.buf.signature_help)

				bufmap("K", vim.lsp.buf.hover)

				vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
					vim.lsp.buf.format()
				end, {})
			end

			vim.lsp.config("fish_lsp", {
				cmd = { "fish-lsp", "start" },
				on_attach = on_attach,
				capabilities = capabilities,
			})

			vim.diagnostic.config({
				virtual_text = true,
				signs = {
					text = {
						[vim.diagnostic.severity.HINT] = "",
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.INFO] = "",
						[vim.diagnostic.severity.WARN] = "",
					},
				},
				update_in_insert = true,
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = "if_many",
					header = "",
					prefix = "",
				},
			})

			local mason_tool_installer = require("mason-tool-installer")
			mason_tool_installer.setup({
				ensure_installed = {
					"black",
					"eslint_d",
					"isort",
					"prettierd",
					"pylint",
					"shellcheck",
					"stylua",
				},
			})
		end,
	},
}
