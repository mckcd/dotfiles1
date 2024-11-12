-- return {
-- 	"stevearc/conform.nvim",
-- 	opts = {
-- 		formatters_by_ft = {
-- 			lua = { "stylua" },
-- 			python = { "isort", "black" },
-- 		},
-- 		formatter_on_save = {
-- 			lua = true,
-- 			python = true,
-- 		},
-- 	},
-- }

return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)

		-- Enable format on save for specific filetypes (Lua and Python)
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = { "*.lua", "*.py" }, -- Adjust patterns to match your desired filetypes
			callback = function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
		})
	end,
}
