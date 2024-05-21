-- After updating this file, run one of
--   :PackerInstall
--   :PackerUpdate

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Debugging - Debug Adapter Protocol (DAP)
    -- Requires the Java Debug Server https://github.com/microsoft/java-debug
    -- as well as some special config in ~/.config/nvim/ftplugin/java.lua
    -- https://sookocheff.com/post/vim/neovim-java-ide/#debugging--nvim-dap
    use 'mfussenegger/nvim-dap'

    -- JDT LSP
    use 'mfussenegger/nvim-jdtls'
    use 'nvim-lua/plenary.nvim'

    -- Code Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- Telescope
    use 'nvim-telescope/telescope.nvim'

    -- nvim-tree
    use 'nvim-tree/nvim-tree.lua'

    -- Python LSP, etc.

    -- Mason external dependency manager, used for pyright
    use 'williamboman/mason.nvim'  -- :MasonInstall pyright
    use { 'neovim/nvim-lspconfig', opt = false }
end)
