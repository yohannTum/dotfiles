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
    -- use {
    --     'chipsenkbeil/distant.nvim',
    --     config = function()
    --         require('distant').setup {
    --             -- Applies Chip's personal settings to every machine you connect to
    --             -- 1. Ensures that distant servers terminate with no connections
    --             -- 2. Provides navigation bindings for remote directories
    --             -- 3. Provides keybinding to jump into a remote file's parent directory
    --             ['*'] = require('distant.settings').chip_default()
    --         }
    --     end
    -- }
    -- Plugins :

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

    -- Prettier
    use{'jose-elias-alvarez/null-ls.nvim'}
    use{'MunifTanjim/prettier.nvim'}
    use{'mhartington/formatter.nvim'}
    use{'nvim-lua/plenary.nvim'}

    -- Rofi settup
    use {'Fymyte/rasi.vim',ft = 'rasi'}
end)

