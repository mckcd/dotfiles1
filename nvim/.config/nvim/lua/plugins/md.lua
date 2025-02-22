return {
	"MeanderingProgrammer/render-markdown.nvim",
	-- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {},
	config = function()
		require("render-markdown").setup({
			pipe_table = {
				enabled = true,
				render_modes = false,
				preset = "none",
				style = "full",
				cell = "padded",
				padding = 1,
				min_width = 0,
				border = {
					"┌",
					"┬",
					"┐",
					"├",
					"┼",
					"┤",
					"└",
					"┴",
					"┘",
					"│",
					"─",
				},
				alignment_indicator = "━",
				head = "", -- Set to empty string to disable head highlighting
				row = "", -- Set to empty string to disable row highlighting
				filler = "", -- Keep filler if needed for padding visibility
			},
		})
	end,
}

-- For `plugins/markview.lua` users.
-- return {
-- 	"OXY2DEV/markview.nvim",
-- 	lazy = false,
-- }
