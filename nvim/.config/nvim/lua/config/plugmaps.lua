-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find Files" })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Live Grep"})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Buffers"})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Help Tags"})






-- Keymaps for tree using vim.keymap.set

-- keymap prefix for tree plugin whatever i am using 
vim.keymap.set('n', '<leader>t', '', { noremap = true, silent = true, desc = "file_tree" })
--
-- -- Toggle the nvim-tree file explorer
-- vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>', { silent = true, desc = "Toggle nvim-tree" })
--
-- -- Refresh the nvim-tree file explorer to reflect changes in the filesystem
-- vim.keymap.set('n', '<leader>tr', ':NvimTreeRefresh<CR>', { silent = true, desc = "Refresh nvim-tree" })
--
-- -- Find and focus the current file in the nvim-tree explorer
-- vim.keymap.set('n', '<leader>tf', ':NvimTreeFindFile<CR>', { silent = true, desc = "Find current file in nvim-tree" })

-- keymap for mini.files
vim.keymap.set('n', '<leader>tt', function()
	MiniFiles.open()
end, { silent = true, desc = "mt" })
