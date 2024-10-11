require("base")
require("autocmds")
require("options")
require("keymaps")
require("colorscheme")
require("plugins")
require("evil_lualine")

-- 設定ファイル(plugins.lua)を更新した際に自動にコンパイル.
vim.api.nvim_create_autocmd("BufWritePost", {
 pattern = { "plugins.lua" },
 command = "PackerCompile",
})
