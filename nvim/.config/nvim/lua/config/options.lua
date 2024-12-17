-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
vim.opt.number = true

vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
-- vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 350
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
-- vim.opt.cursorline = f
vim.opt.scrolloff = 999
vim.opt.hlsearch = true
vim.g.have_nerd_font = true
-- Set tab width to 4 spaces
vim.opt.tabstop = 4 -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 4 -- Number of spaces used for each step of (auto)indent
vim.opt.softtabstop = 4 -- Number of spaces a <Tab> counts for while editing
vim.opt.expandtab = true -- Converts tabs to spaces
vim.opt.colorcolumn = "80"
vim.opt.laststatus = 3

ui = {
	-- If you are using a Nerd Font: set icons to an empty table which will use the
	-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
	icons = vim.g.have_nerd_font and {} or {
		cmd = "⌘",
		config = "🛠",
		event = "📅",
		ft = "📂",
		init = "⚙",
		keys = "🗝",
		plugin = "🔌",
		runtime = "💻",
		require = "🌙",
		source = "📄",
		start = "🚀",
		task = "📌",
		lazy = "💤 ",
	},
}
