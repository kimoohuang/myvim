vim.g.mapleader  = ","
vim.g.maplocalleader = ""

require "user.plugins"
require "user.keymaps"
require "user.lspconfig"
require "user.cmp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.gitsigns"
require "user.neo-tree"
-- require("symbols-outline").setup(opts)
require("user.symbolsoutline")
require "user.lualine"
require "user.bufferline"
-- require "user.fzf"
require "user.vgit"
require "user.toggleterm"
require "user.neovide"
require "user.windows"
require "user.trouble"

require "myself.options"
require "myself.buildsystem"
require "myself.filetype"
require "myself.format"

vim.cmd [[colorscheme gruvbox]]

print("Hello Jianmeng!")
