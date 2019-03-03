set number
set cursorline
set laststatus=2
set cmdheight=2
set showmatch

set whichwrap=b,s,h,l,<,>,[,]
set scrolloff=8 "上下8行で視野確保"

set shellslash
set hlsearch
set incsearch
set ignorecase "大文字小文字の区別なしで検索"
set smartcase "大文字小文字委混合は区別して検索"

set expandtab
set tabstop=4
set shiftwidth=2  "自動でインデントでずれる幅"
set softtabstop=0
set autoindent "改行時に前のインデントを継続する"
set smartindent

set clipboard=unnamed,unnamedplus
set mouse=a
set shellslash

set wildmenu wildmode=list:longest,full "コマンドラインモードでTAB補完"
set history=10000
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
endfor

noremap <S-h> ^
noremap <S-l> $
nnoremap == gg=G''

"ペースト設定
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/noguchi/dotfiles/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/noguchi/dotfiles/.cache/dein')
  call dein#begin('/Users/noguchi/dotfiles/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/noguchi/dotfiles/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('cocopon/iceberg.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('tomtom/tcomment_vim')

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

"End dein Scripts-------------------------


"colorscheme設定
syntax enable
set background=dark
colorscheme iceberg
set t_Co=256

"ステータスライン設定
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""
