-- vim.cmd 'packadd paq-nvim'

vim.cmd('source ~/.config/nvim/vimrc.vim')

-- vim.cmd('colorscheme base16-material-darker')


-- Load all the plugins
require('mypacker')

local function setup_diags()
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics,
        {
            virtual_text = true,
            signs = false,
            update_in_insert = false,
            underline = false,
        }
    )
end

--

setup_diags()

vim.opt.laststatus = 3

-- Settups

require('lsp')
require('completion')
require('lsp_installer_settings')
require('lsp_languages/python')
require('lsp_languages/typescript')
require('lsp_languages/vue')
require('lsp_languages/css')
require('lsp_languages/ccls')

vim.o.completeopt = "menu,menuone,noselect"

require('treesitter')

require('_prettier')

require('nvim_tree')
