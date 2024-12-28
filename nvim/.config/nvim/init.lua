require('config.keymaps')
require('config.options')
require('config.lazy')
require('config.plugmaps')
require('config.funcs')
require('plugins.mason')


-- annoying shit 
-- require("mason").setup()  -- Ensure Mason is setup first
-- require("mason-lspconfig").setup()

-- Setup LSP servers (example)
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- require("lspconfig").pyright.setup {}


vim.g.python3_host_prog = os.getenv("HOME") .. "/.nvim-venv/bin/python"


-- neovide_background_image
local home_dir = os.getenv("HOME") or os.getenv("USERPROFILE")
if home_dir then
    vim.g.neovide_background_image = home_dir .. "/dotfiles1/wezterm/.config/wezterm/assets/bg-blurred-darker.png"
else
    print("Error: Unable to determine home directory.")
end
