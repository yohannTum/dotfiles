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

setup_diags()

vim.o.completeopt = "menu,menuone,noselect"

-- Settups
require('coc')
-- require('coc_languages/python')

-- require('lsp')
-- require('lsp_languages/python')
-- require('lsp_languages/typescript')
-- require('lsp_languages/vue')

-- require('treesitter')

