--print('hi')
require("base")
require("autocmds")
require("options")
require("keymaps")
require("colorscheme")
require("plugins")
require("statusline")

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "plugins.lua" },
  command = "PackerCompile",
})
