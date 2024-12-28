return -- Lazy
{
  "vague2k/vague.nvim",
  config = function()
    require("vague").setup({
        transparent = not vim.g.neovide,
      -- optional configuration here
        style = {
                    comments = "italic",
                    headings = "bold",
                }
    })

    vim.cmd("colorscheme vague")
  end
}
