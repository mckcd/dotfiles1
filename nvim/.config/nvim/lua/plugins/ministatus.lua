return {
	"echasnovski/mini.statusline",
	version = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("mini.statusline").setup()
	end,
}
