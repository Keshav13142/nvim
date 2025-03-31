return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{
				"ray-x/lsp_signature.nvim", -- Show function signature when you type
				event = "VeryLazy",
				config = function(_, opts)
					require("lsp_signature").setup(opts)
				end,
			},
			"folke/neodev.nvim", -- Better lua lsp stuff
			"nvim-java/nvim-java",
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
				"cssls",
				"gopls",
				"html",
				"jsonls",
				"lua_ls",
				"pyright",
				"rust_analyzer",
				"tailwindcss",
				"ts_ls",
				"yamlls",
				"svelte",
			}

			require("java").setup({
				java_test = {
					enable = true,
				},
				java_debug_adapter = {
					enable = true,
				},
				jdk = {
					auto_install = false,
				},
				notifications = {
					dap = false,
				},
			})

			local is_win = vim.loop.os_uname().sysname:find("Windows") and true or false
			if is_win then
				table.insert(servers, "powershell_es")
				table.remove(servers, 1) -- remove bash lsp in windows
			end

			require("mason-lspconfig").setup({
				ensure_installed = servers,
				automatic_installation = false,
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

			require("lspconfig").fish_lsp.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

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

				jdtls = function()
					require("lspconfig").jdtls.setup({
						on_attach = on_attach,
						settings = {
							java = {
								configuration = {
									runtimes = {
										{
											name = "OpenJDK 21",
											path = os.getenv("JAVA_HOME"),
											default = true,
										},
									},
								},
							},
						},
					})
				end,
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
