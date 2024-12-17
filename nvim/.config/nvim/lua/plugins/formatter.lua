return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
		},
	},
	config = function(_, opts)
		-- Setup conform.nvim with the provided options
		require("conform").setup(opts)

		-- Enable formatting on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("ConformFormatOnSave", {}),
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}

