lsp.tsserver.setup {
    default_config = {
        root_dir = function(fname)
            return util.root_pattern 'tsconfig.json'(fname)
            or util.root_pattern('package.json', 'jsconfig.json', '.git')(fname)
        end,
    },
    on_attach=require'cmp_nvim_lsp'.on_attach,
    root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
}
