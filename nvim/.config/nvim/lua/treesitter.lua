-- print('treesitter config')
require'nvim-treesitter.configs'.setup {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,
        -- disable = { "php", "css" },  -- list of language that will be disabled
        disable = {
            -- "vim"
            -- "html",
            -- "css",
            -- "javascript",
            -- "typescript",
            -- "tsx"
            -- "blade",
            -- "vue"
        },
    },
    incremental_selection = {
        enable = true
    },
    indent = {
        enable = false
    },
    playground = {
        enable = true
    },
    query_linter = {
        enable = true
    }
}
