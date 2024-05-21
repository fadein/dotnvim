vim.cmd('source $HOME/.config/nvim/legacy_vimrc.vim')

-- Load Lua plugins defined in $CWD/lua/packer-plugins.lua
require('packer-plugins')
require('telescope')
require('nvimtree')
require('mason').setup()
