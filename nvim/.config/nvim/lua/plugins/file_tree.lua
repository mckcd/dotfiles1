-- mini files tree
return { 'echasnovski/mini.files', version = false,
	config = function ()
		require('mini.files').setup()
		-- vim.keymap.set('n', '<leader>tt', mini_files.open, {desc = "open tree" })
	end
}








-- nvim tree 
-- return {
--   "nvim-tree/nvim-tree.lua",
--   version = "*",
--   lazy = false,
--   dependencies = {
--     "nvim-tree/nvim-web-devicons",
--   },
--   config = function()
--     require("nvim-tree").setup {}
--   end,
-- }

