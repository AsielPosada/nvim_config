-- Bootstrap essential configuration
require 'core.options' -- Editor options
require 'core.keymaps' -- Key mappings
require 'core.autocmds' -- Autocommands
require 'core.lazy' -- Plugin manager setup
require 'core.lsp' -- LSP config outside Lazy

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
