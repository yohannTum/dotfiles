local cmp = require 'cmp'

cmp.setup {
    ["<tab>"] = cmp.config.disable,
    sources = {
        { name = "gh_issues" },

        -- Youtube: Could enable this only for lua, but nvim_lua handles that already.
        { name = "nvim_lua" },

        { name = "nvim_lsp" },
        {
            name = "path",
            option = { trailing_slash = true }
        },
        { name = "luasnip" },
        { name = "buffer", keyword_length = 5 },
      },
}
