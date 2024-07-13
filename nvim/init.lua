-- Disabling additional providers can speed up loading.
vim.api.nvim_set_var('loaded_python3_provider', 0)
vim.api.nvim_set_var('loaded_ruby_provider', 0)
vim.api.nvim_set_var('loaded_perl_provider', 0)
vim.api.nvim_set_var('loaded_node_provider', 0)

require("base")
require("autocmds")
require("options")
require('extensions')
require("keybinds")
--require("colorscheme_catppuccin") -- previous colorscheme
