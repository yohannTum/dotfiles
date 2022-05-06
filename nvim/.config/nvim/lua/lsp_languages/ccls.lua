-- local util = require 'lspconfig.util'

lsp.ccls.setup {
  default_config = {
    cmd = { 'ccls' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
    root_dir = util.root_pattern('compile_commands.json', '.ccls', '.git'),
    offset_encoding = 'utf-32',
    -- ccls does not support sending a null root directory
    single_file_support = false,
  },
  init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "-frounding-math"} ;
    };
  },
  docs = {
    default_config = {
      root_dir = [[root_pattern("compile_commands.json", ".ccls", ".git")]],
    },
  }
}
