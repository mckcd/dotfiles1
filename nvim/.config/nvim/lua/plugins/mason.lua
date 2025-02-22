-- File: plugins/lsp_mason.lua
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		opts = {
			document_highlight = {
				enable = false,
			},
		},
		config = function()
			vim.cmd([[autocmd BufRead,BufNewFile */templates/*.html set filetype=html]])
			-- Ensure mason is set up
			require("mason").setup()
			-- Ensure mason-lspconfig is set up
			require("mason-lspconfig").setup({
				-- List of servers to automatically install
				ensure_installed = {
					"gopls",
					"lua_ls",
					"rust_analyzer",
					-- "pyright",
					"html",
					"marksman",
					"bashls",
					-- "jinja_lsp",
					"zls",
					-- "emmet_ls",
					"basedpyright",
					"ruff",
					"ts_ls",
					"jdtls",
					"clangd",
					"ols",
				},
			})
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- Set up LSP servers
			local lspconfig = require("lspconfig")
			local util = require("lspconfig.util")

			-- Example setups
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				documentHighlightProvider = false,
				settings = {
					Lua = {
						diagnostics = {
							global = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file(" ", true),
							checkThirdParty = false,
						},
					},
				},
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						assist = {
							importGranularity = "module",
							importPrefix = "by_self",
						},
						cargo = {
							allFeatures = true,
							loadOutDirsFromCheck = true,
						},
						checkOnSave = {
							command = "clippy",
						},
						procMacro = {
							enable = true,
						},
						completion = {
							postfix = {
								enable = true,
							},
						},
						inlayHints = {
							typeHints = false, -- Explicitly disable type hints
							parameterHints = false,
							chainingHints = false,
						},
					},
				},
			})
			-- lspconfig.emmet_ls.setup({
			-- 	-- on_attach = on_attach,
			-- 	capabilities = capabilities,
			-- 	filetypes = {
			-- 		"css",
			-- 		"eruby",
			-- 		"html",
			-- 		"javascript",
			-- 		"javascriptreact",
			-- 		"less",
			-- 		"sass",
			-- 		"scss",
			-- 		"svelte",
			-- 		"pug",
			-- 		"typescriptreact",
			-- 		"vue",
			-- 	},
			-- 	init_options = {
			-- 		html = {
			-- 			options = {
			-- 				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
			-- 				["bem.enabled"] = true,
			-- 			},
			-- 		},
			-- 	},
			-- })
			-- lspconfig.html.setup {}
			lspconfig.html.setup({
				capabilities = capabilities,
				cmd = { "vscode-html-language-server", "--stdio" },
				filetypes = { "html", "templ" },
				root_dir = util.root_pattern("package.json", ".git"),
				single_file_support = true,
				settings = {},
				init_options = {
					provideFormatter = true,
					embeddedLanguages = { css = true, javascript = true, jinja = true },
					configurationSection = { "html", "css", "javascript" },
				},
			})
			-- lspconfig.jinja_lsp.setup({
			-- 	name = "jinja_lsp",
			-- 	cmd = { "jinja-lsp" },
			-- 	single_file_support = true,
			-- 	filetypes = { "jinja-html", "jinja" },
			-- 	capabilities = capabilities,
			-- 	root_dir = function(fname)
			-- 		return require("lspconfig.util").find_git_ancestor(fname)
			-- 			or require("lspconfig.util").root_pattern("templates", "jinja", "config.yaml", "project.toml")(
			-- 				fname
			-- 			)
			-- 			or require("lspconfig.util").path.dirname(fname)
			-- 	end,
			-- })
			-- lspconfig.pyright.setup({})
			lspconfig.basedpyright.setup({
				capabilities = capabilities,
				settings = {
					basedpyright = {
						analysis = {
							typeCheckingMode = "standard",
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
						},
					},
				},
			})
			lspconfig.marksman.setup({
				capabilities = capabilities,
				filetypes = { "markdown", "md" },
				single_file_support = true,
			})

			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.ols.setup({ capabilities = capabilities })

			lspconfig.bashls.setup({
				capabilities = capabilities,
				filetypes = { "sh" },
				-- root_dir = util.find_git_ancestor,
				single_file_support = true,
				settings = {
					bashIde = {
						globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
						shellcheckAguments = { "--extened-analysis=false" },
					},
				},
			})

			lspconfig.gopls.setup({ capabilities = capabilities })
			lspconfig.zls.setup({ capabilities = capabilities })
			lspconfig.jdtls.setup({ capabilities = capabilities })
			-- lspconfig.ruff.setup({ capabilities = capabilities},
			--          single_file_support = true,)
		end,
	},
}
