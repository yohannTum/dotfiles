-- paq {'FuDesign2008/vim-lsp-vue'}

local capabilities = vim.lsp.protocol.make_client_capabilities()

require'lspconfig'.vls.setup{on_attach=require'compe'.on_attach}

lsp.vuels.setup {
    on_attach = require'compe'.on_attach,
    capabilities = capabilities,
    settings = {
        vetur = {
            completion = {
                useScaffoldSnippets
                },
            format = {
                defaultFormatter = {
                    html = "none",
                    js = "prettier",
                    ts = "prettier"
                    }
                },
            validation = {
                template = true,
                script = true,
                style = true,
                templateProps = true,
                interpolation = true
                }
            }
        },
    root_dir = util.root_pattern("header.php", "package.json", "style.css", "webpack.config.js")
}

vim.g['LanguageClient_serverCommands'] = {vue = {'vls'}}
vim.g['vim_vue_plugin_config'] = {
    sytax = {
        template = {'html'},
        script = {'javascript'},
        style = {'css'},
    },
    full_syntax = {},
    initial_indent = {},
    attribute = 0,
    keyword = 0,
    foldexpr = 0,
    debug = 0,
}

