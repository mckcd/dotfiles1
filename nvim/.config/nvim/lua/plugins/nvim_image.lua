return {
	"3rd/image.nvim",
	dependencies = { "luarocks.nvim" },
	opts = {},
	config = function()
		require("image").setup({
			integrations = {
				markdown = {
					resolve_image_path = function(document_path, image_path, fallback)
						return fallback(documment_path, image_path)
					end,
				},
			},
		})
	end,
}
