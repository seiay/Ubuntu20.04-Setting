local options = {
  -- global
	termguicolors = true,-- ターミナルの色を有効にする
  scrolloff = 4,
	ignorecase = true, -- 検索時に大文字小文字を区別しない
	smartcase = true, -- 検索時に大文字小文字が混在している場合は大文字小文字を区別する
	clipboard = "unnamedplus",
  -- local to windows
	number = true,-- 行番号を表示する
	cursorline = true,-- カーソル行をハイライトする
  signcolumn = "yes:1",
	wrap = false,-- 折り返しを無効にする
  -- local to buffer
	tabstop = 2,-- タブ幅
	shiftwidth = 0,-- シフト幅(0の場合はtabstopと同じ値)
	expandtab = true,-- タブをスペースに変換する
  -- not yet
	encoding = "utf-8",
	fileencoding = "utf-8",
	title = false,
	backup = false,
	cmdheight = 2,
	completeopt = { "menuone", "noselect" },
	hlsearch = true,
	mouse = "a",-- マウスを有効にする
	pumheight = 10,
	showmode = true, -- モード表示を非表示にする
	showtabline = 2,
	smartindent = true,-- 自動インデントを有効にする
	swapfile = false, -- スワップファイルを作成しない
	timeoutlen = 300,-- キータイプの待ち時間
	undofile = true, -- アンドゥ情報をファイルに保存する
	updatetime = 300, -- 書き込み時にファイルの変更を検知する間隔
	writebackup = false, -- バックアップファイルを作成しない
	relativenumber = false,-- 相対行番号を表示する
	numberwidth = 4,-- 行番号の桁数
	winblend = 0,-- ウィンドウの透過度
	wildoptions = "pum",-- コマンドライン補完の挙動を変更する
	pumblend = 5,-- ポップアップメニューの透過度
	--background = "dark",-- 背景を暗くする
}

-- setting 方法合ってる?
for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])

-- autocmd example
-- local to buffure options:
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = '*',

  -- groupを追加
  group = vim.api.nvim_create_augroup('buffer_set_options', {} ),

  callback = function()
    -- 10.3.1 節で書いたコードをここに移動する
    vim.api.nvim_buf_set_option(0, 'tabstop', 2)
    vim.api.nvim_buf_set_option(0, 'shiftwidth', 0)
    vim.api.nvim_buf_set_option(0, 'expandtab', true)
  end,
})

