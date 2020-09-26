set encoding=UTF-8
set shell=bash\ -i
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set shell=/usr/local/bin/zsh
" setting terminal
" nnoremap <C-t><C-r> :below term<Space>++rows=10<Space>zsh<CR>
command! -nargs=* -bar -bang -count=0 -complete=dir E Explore <args>
noremap <S-h> ^
noremap <S-l> $
set splitright

set cursorline
set cursorcolumn
set virtualedit=onemore
set smartindent
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest
nnoremap j gj
nnoremap k gk

set list listchars=tab:\▸\-
set expandtab
set tabstop=4
set shiftwidth=4

set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

autocmd Filetype ruby set softtabstop=2
autocmd Filetype ruby set sw=2
autocmd Filetype ruby set ts=2
autocmd Filetype javascript set softtabstop=2
autocmd Filetype javascript set sw=2
autocmd Filetype javascript set ts=2
autocmd Filetype typescript set softtabstop=2
autocmd Filetype typescript set sw=2
autocmd Filetype typescript set ts=2
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

if &compatible
  set nocompatible               " Be iMproved
endif
let mapleader="\<space>"
noremap <leader>w :w<CR>
noremap <leader>wq :wq<CR>
noremap <leader>wq! :wq!<CR>
noremap <leader>q! :q!<CR>

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  let s:toml = '~/.vim/dein.toml'

  "call dein#load_toml(s:toml, {'lazy': 0})

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')


  " Add or remove your plugins here:
  call dein#add('hashivim/vim-terraform')
  call dein#add('posva/vim-vue')
  call dein#add('mattn/emmet-vim')
  call dein#add('godlygeek/tabular')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('w0rp/ale')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('slim-template/vim-slim')

  call dein#add('majutsushi/tagbar')
  call dein#add('vim-airline/vim-airline')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('kablamo/vim-git-log')
  call dein#add('tomlion/vim-solidity')
  call dein#add('jsx/jsx.vim')
  call dein#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
  call dein#add('junegunn/fzf.vim', { 'depends': 'junegunn/fzf' })
  call dein#add('SirVer/ultisnips')
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('tpope/vim-rails')
  call dein#add('honza/vim-snippets')
  call dein#add('fatih/vim-go')
  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })
  call dein#add('Shougo/defx.nvim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('andrewstuart/vim-kubernetes')
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('lighttiger2505/deoplete-vim-lsp')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  " call dein#add('kassio/neoterm')

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


let g:deoplete#enable_at_startup = 1

set tags+=./tags;
" if !has("nvim")
"   autocmd VimEnter * :below term ++rows=10 zsh
" endif
autocmd VimEnter * if @% == '' | execute 'Defx' |endif
nnoremap <silent> <Leader>f :<C-u> Defx <CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <Leader>tab :tabnew<CR><Esc>
nnoremap tn gt
nnoremap tp gT
let g:NERDTreeDirArrows = 1
let NERDTreeWinSize=22
" let NERDTreeShowHidden = 1

"vim-nerdtree-syntax-highlight
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

" dir-icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
" file-icons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:github_access_token="25a223a2b1f1c8a863798958ebe1b6d1e752ebd3"

"snippets
let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<C-f>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"
let g:UltiSnipsEditSplit="vertical"

"fzf setting
set rtp+=/usr/local/opt/fzf
map ; :FZF .<CR>

"terminal
if has('nvim')
  tnoremap <silent> <ESC> <C-\><C-n>
  " let &runtimepath.=',~/.cache/dein/repos/github.com/kassio/neoterm'
  " let g:neoterm_default_mod = 'vertical rightbelow'
endif

"tag bar
set guifont=RictyDiscordForPowerline\ Nerd\ Font:h14

"go setting
let g:go_fmt_command = "goimports"

"ale setting
let g:ale_sign_column_always = 1

"vim-terraform setting
let g:terraform_align=1
let g:terraform_remap_spacebar=1
let g:terraform_commentstring='//%s'
let g:terraform_fmt_on_save=1
"ycm
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_autoclose_preview_window_after_completation = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

"defx
nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('preview')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction

nnoremap <C-e> :Defx `expand('%:p:h')` -search=`expand('%:p')<CR>
call defx#custom#option('_', {
      \ 'show_ignored_files': 1,
      \ 'buffer_name': 'exlorer',
      \ 'toggle': 1,
      \ 'resume': 1,
      \ })

"terminal cmd"
"tig
let $GIT_EDITOR="nvr"
let $VISUAL="nvr"
nnoremap <silent><leader>term :vsplit term://zsh<CR>
nnoremap <silent><leader>g :vsplit term://tig status<CR>

"rails
nnoremap <silent><leader>rt :vsplit term://bundle exec rspec spec %<CR>
nnoremap <silent><leader>rs :vsplit term://bundle exec rails server<CR>
nnoremap <silent><leader>rc :vsplit term://bundle exec rails c<CR>
"make
nnoremap <silent><leader>test :vsplit term://make test FILE=%<CR>
"python
nnoremap <silent><leader>py :vsplit term://python %<CR>

"QuickFix
let QFix_CopenCmd = 'vertical botright'
set winwidth=60

"ruby lsp"
if executable('solargraph')
    " gem install solargraph
    au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'whitelist': ['ruby'],
        \ })
endif
