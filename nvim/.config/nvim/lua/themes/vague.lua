return -- Lazy
{
  "vague2k/vague.nvim",
  config = function()
    require("vague").setup({
		vim.cmd("colorscheme vague")
      -- optional configuration here
    })
  end
}
