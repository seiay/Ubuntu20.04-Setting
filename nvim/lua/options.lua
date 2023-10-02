local options = {
	encoding = "utf-8",
	fileencoding = "utf-8",
	title = false,
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 2,
	completeopt = { "menuone", "noselect" },
	hlsearch = true,
	ignorecase = true, -- 検索時に大文字小文字を区別しない
	mouse = "a",-- マウスを有効にする
	pumheight = 10,
	showmode = true, -- モード表示を非表示にする
	showtabline = 2,
	smartcase = true, -- 検索時に大文字小文字が混在している場合は大文字小文字を区別する
	smartindent = true,-- 自動インデントを有効にする
	swapfile = false, -- スワップファイルを作成しない
	termguicolors = true,-- ターミナルの色を有効にする
	timeoutlen = 300,-- キータイプの待ち時間
	undofile = true, -- アンドゥ情報をファイルに保存する
	updatetime = 300, -- 書き込み時にファイルの変更を検知する間隔
	writebackup = false, -- バックアップファイルを作成しない
	expandtab = true,-- タブをスペースに変換する
	shiftwidth = 2,-- シフト幅
	tabstop = 2,-- タブ幅
	cursorline = false,-- カーソル行をハイライトする
	number = true,-- 行番号を表示する
	relativenumber = false,-- 相対行番号を表示する
	numberwidth = 4,-- 行番号の桁数
	signcolumn = "yes",-- 行番号の領域を常に表示する
	wrap = false,-- 折り返しを無効にする
	winblend = 0,-- ウィンドウの透過度
	wildoptions = "pum",-- コマンドライン補完の挙動を変更する
	pumblend = 5,-- ポップアップメニューの透過度
	--background = "dark",-- 背景を暗くする
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
