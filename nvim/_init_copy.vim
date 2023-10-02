set nowritebackup
" ファイルを上書きする前にバックアップを作ることを無効化
set nobackup
" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start
" 全角文字専用の設定
set ambiwidth=double

set tabstop=2
set shiftwidth=2

"--------------------
" 表示
"--------------------
set number
" ヤンクとクリップボードを共有
" set clipboard=unnamed,autoselect
set clipboard=unnamedplus
hi Comment ctermfg=lightblue
" 対応する括弧やブレースを表示
set showmatch matchtime=1
" syntax hightlight
syntax on
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" メッセージ表示欄を2行確保
set cmdheight=2
" ステータス行を常に表示
set laststatus=2
" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd
" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~
" コマンドラインの履歴を10000件保存する
set history=10000
" コメントの色を水色
hi Comment ctermfg=3
" インデント幅
set shiftwidth=2
" 検索にマッチした行以外を折りたたむ(フォールドする)機能
set nofoldenable
" タイトルを表示
set title

"--------------------
" インサートモード
"--------------------
"　改行時に自動インデント
set smartindent

"--------------------
" キーバインドの変更
"--------------------
inoremap <silent> jj <ESC>
noremap <S-h> 0
noremap <S-l> $
tnoremap <Esc> <C-\><C-n>

"----------------------------------------
" 検索
"----------------------------------------
" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索結果をハイライト表示
set hlsearch


"--------------------
" その他
"--------------------
" ステータスラインに自動補完の候補をお表示
set wildmenu
" 対象が一つでも補完ウィンドウを表示、補完ウィンドを表示時に挿入しない
set completeopt=menuone,noinsert
" 補完表示時のEnterで改行をしない
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
" 矢印で補完リストを選択する
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"
" スワップファイルを作成しない
set noswapfile


" auto reload .vimrc
" augroup source-vimrc
"   autocmd!
"   autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
"   autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
" augroup END

" HTML/XML閉じタグ自動補完
" augroup MyXML
"   autocmd!
"   autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
"   autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
" augroup END

" auto reload .vimrc
" augroup source-vimrc
"   autocmd!
"   autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
"   autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
" augroup END

" auto comment off
" augroup auto_comment_off
"   autocmd!
"   autocmd BufEnter * setlocal formatoptions-=r
"   autocmd BufEnter * setlocal formatoptions-=o
" augroup END

"--------------------
"  vim-plug
"-------------------

" call plug#begin('~/.vim/plugged')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes


" LSP(coc.nvimが代替)
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'

" Auto-complete(coc.nvimが代替)
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

" fzf
" Plug '/usr/local/opt/fzf'
" Plug 'junegunn/fzf.vim'
" 置換のプレビュー
" Plug 'https://github.com/markonm/traces.vim.git'

" レイアウト
" Plug 'itchyny/lightline.vim'

" coc.nvim
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
" call plug#end()
" You can revert the settings after the call like so:
""   filetype indent off   " Disable file-type-specific indentation
""   syntax off            " Disable syntax highlighting-

"--------------------
"  dein.nvim
"-------------------
" install dir
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" Required:
" set runtimepath+=/home/asana/.cache/dein/repos/github.com/Shougo/dein.vim
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  " call dein#add('/home/asana/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  """ .toml file
	" for nvim
  let g:rc_dir = expand('~/.config/nvim/dein/toml')
  " for vim
	" let g:rc_dir = expand('~/.vim/dein/toml') 
  
	let s:toml = g:rc_dir . '/dein.toml'
	" There is not dein_lazy.toml at my environment.
	"let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  
	" tomlファイルに記載されているpluginがloadされる
	call dein#load_toml(s:toml, {'lazy': 0})
  "call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('vim-airline/vim-airline-themes')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
