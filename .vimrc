set encoding=UTF-8
set shell=bash\ -i
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
nnoremap <C-t><C-r> :below term<Space>++rows=10<Space>zsh<CR>
command! -nargs=* -bar -bang -count=0 -complete=dir E Explore <args>
noremap <S-h> ^
noremap <S-l> $


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest
nnoremap j gj
nnoremap k gk


set list listchars=tab:\▸\-
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
set shiftwidth=4


set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
nmap st :tabnew<CR><Esc>
nmap sn gt
nmap sp gT


set clipboard=unnamed,autoselect
autocmd Filetype ruby set softtabstop=2
autocmd Filetype ruby set sw=2
autocmd Filetype ruby set ts=2
autocmd Filetype javascript set softtabstop=2
autocmd Filetype javascript set sw=2
autocmd Filetype javascript set ts=2
autocmd Filetype yaml set softtabstop=2
autocmd Filetype yaml set sw=2
autocmd Filetype yaml set ts=2
autocmd Filetype html set softtabstop=2
autocmd Filetype html set sw=2
autocmd Filetype html set ts=2
autocmd FileType vue syntax sync fromstart
autocmd Filetype vue set softtabstop=2
autocmd Filetype vue set sw=2
autocmd Filetype vue set ts=2
filetyp plugin indent on
autocmd BufWritePre * :%s/\s\+$//ge

syntax enable
colorscheme lucario

" dein.vim の導入のためのボイラープレート
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/yamad07/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/yamad07/.cache/dein')
  call dein#begin('/Users/yamad07/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/yamad07/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('hashivim/vim-terraform')
  call dein#add('posva/vim-vue')
  call dein#add('mattn/emmet-vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('w0rp/ale')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('tidalcycles/vim-tidal')

  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('scrooloose/nerdtree')
  call dein#add('majutsushi/tagbar')
  call dein#add('vim-airline/vim-airline')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
  call dein#add('kablamo/vim-git-log')
  call dein#add('fatih/vim-go')
  call dein#add('Townk/vim-autoclose')
  call dein#add('jsx/jsx.vim')
  call dein#add('suan/vim-instant-markdown')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
  call dein#add('junegunn/fzf.vim', { 'depends': 'junegunn/fzf' })
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif


  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif


set tags+=./tags;
autocmd VimEnter * :below term ++rows=10 zsh
autocmd VimEnter * execute 'NERDTreeToggle'
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-n> gt
nnoremap <C-p> gT
let g:NERDTreeDirArrows = 1
let NERDTreeWinSize=22
" let NERDTreeShowHidden = 1

"vim-nerdtree-syntax-highlight
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files
let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

" vim-devicons
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" dir-icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
" file-icons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:github_access_token="25a223a2b1f1c8a863798958ebe1b6d1e752ebd3"

"tag bar
set guifont=RictyDiscordForPowerline\ Nerd\ Font:h14

"go setting
let g:go_fmt_command = "goimports"

"ale setting
let g:ale_sign_column_always = 1

"fzf setting
set rtp+=/usr/local/opt/fzf
map ; :Files .<CR>

"vim-terraform setting
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=1
let g:terraform_commentstring='//%s'
let g:terraform_fmt_on_save=1
