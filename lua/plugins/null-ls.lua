return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"jay-babu/mason-null-ls.nvim",
				event = { "BufReadPre", "BufNewFile" },
			},
		},
		config = function()
			local null_ls = require("null-ls")
			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics
			local code_actions = null_ls.builtins.code_actions

			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			local formatters = {
				"eslint_d",
				"prettierd",
				"shellcheck",
				"stylua",
			}

			local is_win = vim.loop.os_uname().sysname:find("Windows") and true or false
			if not is_win then
				table.insert(formatters, "shfmt")
				table.insert(formatters, "nixpkgs-fmt")
			end

			require("mason-null-ls").setup({
				ensure_installed = formatters,
				automatic_installation = false,
			})

			null_ls.setup({
				root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
				sources = {
					formatting.stylua,
					formatting.black,
					formatting.shfmt,
					formatting.nixpkgs_fmt,
					formatting.prettierd,
					formatting.rustfmt,

					code_actions.statix,
					code_actions.eslint_d,

					-- diagnostics.eslint_d,
					diagnostics.shellcheck,
					diagnostics.flake8,
					diagnostics.deadnix,
				},

				-- you can reuse a shared lspconfig on_attach callback here
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ async = false })
							end,
						})
					end
				end,
			})
		end,
	},
}
