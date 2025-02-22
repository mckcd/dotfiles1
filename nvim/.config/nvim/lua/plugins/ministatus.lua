-- return {
-- 	"echasnovski/mini.statusline",
-- 	version = false,
-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
-- 	config = function()
-- 		require("mini.statusline").setup()
-- 	end,
-- }
--
--

-- local funcs = require("config.funcs") -- Load custom functions
--
-- return {
-- 	"echasnovski/mini.statusline",
-- 	version = false,
-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
-- 	config = function()
-- 		require("mini.statusline").setup({
-- 			content = {
-- 				active = function()
-- 					local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
-- 					local git = MiniStatusline.section_git({ trunc_width = 75 })
-- 					local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
-- 					local filename = MiniStatusline.section_filename({ trunc_width = 140 })
-- 					local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
-- 					local location = MiniStatusline.section_location({ trunc_width = 75 })
-- 					local recording = funcs.recording_status() -- Show macro recording
--
-- 					return MiniStatusline.combine_groups({
-- 						{ hl = mode_hl, strings = { mode } },
-- 						{ hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
-- 						"%<", -- Ensure truncation works
-- 						{ hl = "MiniStatuslineFilename", strings = { filename } },
-- 						{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
-- 						{ hl = "MiniStatuslineRecording", strings = { recording } }, -- Show recording status
-- 						{ hl = mode_hl, strings = { location } }, -- Show cursor location
-- 					})
-- 				end,
-- 				inactive = function()
-- 					-- Default inactive statusline for when buffer is not active
-- 					return MiniStatusline.combine_groups({
-- 						{ hl = "MiniStatuslineFilename", strings = { "%f" } },
-- 					})
-- 				end,
-- 			},
-- 		})
-- 	end,
-- }
--

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{ "filename" },
					{
						function()
							local reg = vim.fn.reg_recording()
							if reg ~= "" then
								return "Recording @" .. reg
							end
							return ""
						end,
						color = { fg = "#ff9e64", gui = "bold" }, -- Customize color
					},
				},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
