-- Packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

-- Autocompile when there's changes
vim.cmd 'autocmd BufwritePost plugins.lua PackerCompile'

local packer = require 'packer'

packer.init {
    opt_default = false,
    plugin_package = 'packer',
}


return packer.startup(function(use)
    use {
        'wbthomason/packer.nvim',
        opt = false
    }
    -- Colorscheme :
    use {'rrethy/nvim-base16'}

    -- Plugins :
    use {'neoclide/coc.nvim', branch = 'release'}
    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/nvim-compe'}
    use {'williamboman/nvim-lsp-installer'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-cmdline'}
    use {'hrsh7th/nvim-cmp'}

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        opt = false,
        run = ':TSUpdate',
        -- confip = print('treesitter is loaded'),
    }
    use {'nvim-treesitter/playground'}
    use {'posva/vim-vue'}
end)

