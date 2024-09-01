-- File: plugins/lsp_mason.lua
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            -- Ensure mason is set up
            require("mason").setup()
            -- Ensure mason-lspconfig is set up
            require("mason-lspconfig").setup({
                -- List of servers to automatically install
                ensure_installed = { "lua_ls", "rust_analyzer", "pylyzer", "html" },
            })
            -- Set up LSP servers
            local lspconfig = require("lspconfig")

            -- Example setups
            lspconfig.lua_ls.setup({
			settings  = {
				Lua = {
					diagnostics = {
						global = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file(" ", true),
						checkThirdParty = false,
						},
				}
			}
	    })
            lspconfig.rust_analyzer.setup {
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
                	command = "clippy"
            	},
            		procMacro = {
                	enable = true
            	},
            	completion = {
                	postfix = {
                    	enable = true
                			}
            			}
        		}
    		}
	}
            -- lspconfig.pyright.setup {}
            lspconfig.html.setup {}
            lspconfig.pylyzer.setup {}
        end
    }
}
