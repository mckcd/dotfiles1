return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({})
        vim.keymap.set('n', '<leader>sf', require('fzf-lua').files, { desc = "Fzf Files" })
        vim.keymap.set('n', '<leader><leader>', require('fzf-lua').buffers, { desc = "Open Buffers" })
        vim.keymap.set('n', '<leader>.', require('fzf-lua').oldfiles, { desc = "Recent" })
        vim.keymap.set("n",  '<leader>sn', function() require('fzf-lua').files({ cwd = '~/.config/nvim' }) end, { desc = "Config" })
        vim.keymap.set("n",  '<leader>sd', function() require('fzf-lua').files({ cwd = '~/dotfiles1/' }) end, { desc = "dotfiles" })

  end
}
