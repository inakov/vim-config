" General Config
" ----------------------------
let mapleader = ","

set shell=zsh " Set bash as the prompt for Vim
set encoding=utf-8
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set noshowmode
set timeoutlen=1000
set ttimeoutlen=0
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab
set scrolloff=3
set list listchars=tab:»·,trail:·  " Display extra whitespace characters
set hidden

" Line numbers
set number
set numberwidth=5

" Highlight search matches
set hlsearch

" Open new split panes to right and bottom, which feels more natural {{{2
set splitbelow
set splitright

" Tab Shortcuts
nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<CR>
"nnoremap tc :CtrlSpaceTabLabel<CR>
nnoremap td :tabclose<CR>

" Buffer Shortcuts
nnoremap bh :bfirst<CR>
nnoremap bj :bnext<CR>
nnoremap bk :bprevious<CR>
nnoremap bl :blast<CR>
nnoremap bd :bdelete<CR>
nnoremap bs :buffers<CR>

" MacVim use clipboard contents
set clipboard=unnamed

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"Netrw config
let g:netrw_banner = 0

" Autocommands
" --------------------------
if has("autocmd")
  " Automatically clean trailing whitespace
  autocmd BufWritePre * :%s/\s\+$//e

  autocmd BufRead,BufNewFile *.md set filetype=markdown

  autocmd BufRead,BufNewFile .eslintrc,.jscsrc,.jshintrc,.babelrc set ft=json

  autocmd BufRead,BufNewFile gitconfig set ft=.gitconfig

  au! BufRead,BufNewFile *.tsx setfiletype typescript

endif

" Specify plugins
" ----------------------------
call plug#begin('~/.vim/plugged')

" UI
Plug 'trevordmiller/nova-vim'
Plug 'vim-airline/vim-airline'            " Handy info
Plug 'retorillo/airline-tablemode.vim'
Plug 'ryanoasis/vim-webdevicons'
Plug 'junegunn/goyo.vim'

" Project Navigation

" File Navigation
Plug 'vim-scripts/matchit.zip'  " More powerful % matching
Plug 'Lokaltog/vim-easymotion'  " Move like the wind!
Plug 'jeffkreeftmeijer/vim-numbertoggle'  " Smarter line numbers
Plug 'wellle/targets.vim'
" Plug 'kshenoy/vim-signature'
Plug 'haya14busa/incsearch.vim'           " Better search highlighting

" Editing
Plug 'tpope/vim-surround'   " Change word surroundings
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'
Plug 'jasonlong/vim-textobj-css'
Plug 'editorconfig/editorconfig-vim'

" Language Support
" 1. JavaScript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" 2. HTML
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'

" 3. CSS
Plug 'hail2u/vim-css3-syntax',  { 'for': 'css' }

" 4. Python
Plug 'klen/python-mode',    { 'for': 'python' }
" Plug 'davidhalter/jedi-vim',              { 'for': 'python' }
" Plug 'alfredodeza/pytest.vim', { 'for': 'python' }

" 5. Go
Plug 'fatih/vim-go'
" Plug 'nsf/gocode',  { 'rtp': 'nvim', 'do': './nvim/symlink.sh' }
" Plug 'zchee/deoplete-go'

" Markdown {{{4
Plug 'reedes/vim-pencil'    " Markdown, Writing
Plug 'godlygeek/tabular',   { 'for': 'markdown' } " Needed for vim-markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

call plug#end()
set nocompatible

" Theme
let g:airline_powerline_fonts = 1 " Enable the patched Powerline fonts

syntax enable
set termguicolors
if has('gui_running')
    set guifont=Hack_Nerd_Font:h13
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
endif

colorscheme nova

set path+=app/**

" emmet-vim
let g:user_emmet_leader_key='<C-E>'

let g:user_emmet_settings = {
  \    'html' : {
  \        'quote_char': "'"
  \    }
\}
